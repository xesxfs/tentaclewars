module com {
	export module google {
		export module analytics {
			export module debug {
				export class Margin extends egret.HashObject {
					public top:number = 0;
					public left:number = 0;
					public bottom:number = 0;
					public right:number = 0;

					public constructor(top:number = 0,bottom:number = 0,left:number = 0,right:number = 0)
					{
						super();
						super();
						this.top = flash.checkInt(top);
						this.bottom = flash.checkInt(bottom);
						this.left = flash.checkInt(left);
						this.right = flash.checkInt(right);
					}

				}
			}
		}
	}
}

