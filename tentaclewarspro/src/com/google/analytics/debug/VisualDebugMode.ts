module com {
	export module google {
		export module analytics {
			export module debug {
				export class VisualDebugMode extends egret.HashObject {
					public static advanced:com.google.analytics.debug.VisualDebugMode;
					public static geek:com.google.analytics.debug.VisualDebugMode;
					public static basic:com.google.analytics.debug.VisualDebugMode;
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

com.google.analytics.debug.VisualDebugMode.advanced = new com.google.analytics.debug.VisualDebugMode(1,"advanced");
com.google.analytics.debug.VisualDebugMode.geek = new com.google.analytics.debug.VisualDebugMode(2,"geek");
com.google.analytics.debug.VisualDebugMode.basic = new com.google.analytics.debug.VisualDebugMode(0,"basic");
