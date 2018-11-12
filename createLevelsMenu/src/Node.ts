/*
 * @Author: chenwei
 * @Date: 2018-09-28 12:18:32
 * @LastEditors: chenwei
 * @LastEditTime: 2018-09-28 12:19:23
 * @Description: 
 * @Email: chenweicon@gmail.com
 */

module Game {

	export class Node extends egret.Sprite {

		protected angle: number = 0;

		protected radius: number = 0;

		protected children: Array<NodeChild> = null;

		protected mouseEnabled: boolean = true;

		public constructor(baseRadius: number, baseAngle: number) {
			super();
			this.radius = baseRadius;
			this.angle = baseAngle * Math.PI / 180;
			this.children = new Array();
			this.mouseEnabled = false;
		}
	
		
		protected method_153(radius: number): void {
			for (var child: NodeChild = null, i = 0; i < this.children.length;) {
				child = this.children[i];
				child.node.setBaseRadius(radius + child.baseRadiusOffset);
				i++;
			}
		}

		protected onEnterFrame(event: egret.Event): void {
		}

		public destruct(): void {
			this.graphics.clear();
			if (this.children.length > 0) {
				this.children = [];
			}
		}

		public setBaseRadius(radius: number): void {

		}

		public addChildNode(node: Node, baseRadiusOffset: number = 0): void {
		}
	}


	class NodeChild {

		public node: Node;
		public baseRadiusOffset: number;
		public NodeChild(node: Node, baseRadiusOffset: number) {
			this.node = node;
			this.baseRadiusOffset = baseRadiusOffset;
		}
	}
}
