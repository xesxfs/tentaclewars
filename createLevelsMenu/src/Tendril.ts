/*
 * @Author: chenwei
 * @Date: 2018-09-28 12:19:50
 * @LastEditors: chenwei
 * @LastEditTime: 2018-09-28 12:19:50
 * @Description: 
 * @Email: chenweicon@gmail.com
 */

module Game {

	export class Tendril extends Game.Node {

		public static TYPE_WITH_SPOT: number = 1;

		public static TYPE_WITHOUT_SPOT: number = 0;

		public static OUTLINE_COLOR: number = 0x000000;

		private moveDir: number = 1;

		private moveSize: number = 0;

		private type: number = 0;

		private sync: Sync = null;

		private color: number = 16777215;

		private size: number = 0;

		private moveOffset: number = 0;

		private isSync: boolean = false;

		public constructor(type: number, baseRadius: number, angle: number, size: number, moveSize: number, moveOffset: number = 0, moveDir: boolean = false, sync: Sync = null) {
			super(baseRadius, angle);
			this.isSync = sync == null ? true : false;
			this.type = type;
			this.size = size;
			this.moveSize = moveSize;
			this.moveOffset = moveOffset;
			this.moveDir = !!moveDir ? (1) : (-1);
			this.addEventListener(egret.Event.ENTER_FRAME, this.onEnterFrame, this);
		}

		public setColor(color: number): void {
			this.color = color;
		}

		public setSize(size: number): void {
			this.size = size;
		}

		private method_57(): void {
			var g: egret.Graphics = this.graphics;
			var centerRadius: number = this.radius + this.size / 2;

			var endRadius: number = this.radius + this.size;
			
			var endAngle: number = this.angle + this.moveDir * this.moveSize * (this.moveOffset);

			var beginX: number = Math.cos(this.angle) * this.radius;

			var midX: number = Math.cos(this.angle) * centerRadius;
			var midY: number = Math.sin(this.angle) * centerRadius;

			var endX: number = Math.cos(endAngle) * endRadius;
			var endY: number = Math.sin(endAngle) * endRadius;

			g.clear();
			g.lineStyle(10, Tendril.OUTLINE_COLOR);
			g.moveTo(beginX, 0);
			g.curveTo(midX, midY, endX, endY);
			// §§push(true);
			// §§push(Math.sin(this.angle) * this.radius);
			if (this.type == Tendril.TYPE_WITH_SPOT) {
				g.lineStyle(1, Tendril.OUTLINE_COLOR);
				g.beginFill(this.color);
				g.drawCircle(endX, endY, 3);
				g.endFill();
			}
		}

		protected onEnterFrame(event: egret.Event): void {
			// if (this.isSync) {
			// 	// §§push(true);
			// 	this.isSync = !this.isSync;
			// }
			this.angle += 1 * this.moveDir;
			if (this.angle <= -15 || this.angle >= 15) {
				this.moveDir = -this.moveDir;
			}
			// this.moveDir = -this.moveDir;
			this.method_57();
		}

		public destruct(): void {
			super.destruct();
		}
	}
}
