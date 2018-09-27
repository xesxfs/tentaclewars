module com {
	export module google {
		export module analytics {
			export module debug {
				export class Align extends egret.HashObject {
					public static bottomRight:com.google.analytics.debug.Align;
					public static right:com.google.analytics.debug.Align;
					public static left:com.google.analytics.debug.Align;
					public static topRight:com.google.analytics.debug.Align;
					public static bottom:com.google.analytics.debug.Align;
					public static bottomLeft:com.google.analytics.debug.Align;
					public static topLeft:com.google.analytics.debug.Align;
					public static center:com.google.analytics.debug.Align;
					public static none:com.google.analytics.debug.Align;
					public static top:com.google.analytics.debug.Align;
					private _value:number = 0;
					private _name:string;

					public constructor(value:number = 0,name:string = "")
					{
						super();
						super();
						this._value = flash.checkInt(value);
						this._name = name;
					}

					public valueOf():number
					{
						return this._value;
					}

					public toString():string
					{
						return this._name;
					}

				}
			}
		}
	}
}

com.google.analytics.debug.Align.bottomRight = new com.google.analytics.debug.Align(18,"bottomRight");
com.google.analytics.debug.Align.right = new com.google.analytics.debug.Align(16,"right");
com.google.analytics.debug.Align.left = new com.google.analytics.debug.Align(32,"left");
com.google.analytics.debug.Align.topRight = new com.google.analytics.debug.Align(17,"topRight");
com.google.analytics.debug.Align.bottom = new com.google.analytics.debug.Align(2,"bottom");
com.google.analytics.debug.Align.bottomLeft = new com.google.analytics.debug.Align(34,"bottomLeft");
com.google.analytics.debug.Align.topLeft = new com.google.analytics.debug.Align(33,"topLeft");
com.google.analytics.debug.Align.center = new com.google.analytics.debug.Align(256,"center");
com.google.analytics.debug.Align.none = new com.google.analytics.debug.Align(0,"none");
com.google.analytics.debug.Align.top = new com.google.analytics.debug.Align(1,"top");
