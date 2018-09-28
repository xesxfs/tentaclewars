/*
 * @Author: chenwei
 * @Date: 2018-09-28 12:18:06
 * @LastEditors: chenwei
 * @LastEditTime: 2018-09-28 12:18:06
 * @Description: 
 * @Email: chenweicon@gmail.com
 */

class Rendril2 extends egret.Sprite {
	public constructor() {
		super();
		this.addEventListener(egret.Event.ENTER_FRAME, this.tick, this);
		// egret.setInterval(this.tick,this,50);
	}

	public step: number = Math.PI / 5 / 20;
	public ang = -Math.PI / 10;
	public angOffsize = Math.PI / 4;
	public r: number = 50;

	public tick() {

		let g = this.graphics;
		g.clear();
		g.lineStyle(2, 0xFFFFFF);
		this.ang += this.step;
		let bX = 0;
		let bY = 0;
		g.moveTo(bX, bY);
		let r = this.r;

		let midX = Math.cos(this.angOffsize) * r / 2;
		let midY = Math.sin(this.angOffsize) * r / 2;

		let endX = Math.cos(this.ang + this.angOffsize) * r + bX;
		let endY = Math.sin(this.ang + this.angOffsize) * r + bY;
		g.curveTo(midX, midY, endX, endY);
		// g.lineTo(endX, endY);

		g.beginFill(0x000000)
		g.drawCircle(endX, endY, 5);
		g.endFill();

		if (this.ang < -Math.PI / 10 || this.ang > Math.PI / 10) {
			this.step = -this.step;
		}

	}
}