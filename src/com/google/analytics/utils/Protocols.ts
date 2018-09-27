module com {
	export module google {
		export module analytics {
			export module utils {
				export class Protocols extends egret.HashObject {
					public static none:com.google.analytics.utils.Protocols;
					public static HTTPS:com.google.analytics.utils.Protocols;
					public static file:com.google.analytics.utils.Protocols;
					public static HTTP:com.google.analytics.utils.Protocols;
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

com.google.analytics.utils.Protocols.none = new com.google.analytics.utils.Protocols(0,"none");
com.google.analytics.utils.Protocols.HTTPS = new com.google.analytics.utils.Protocols(3,"HTTPS");
com.google.analytics.utils.Protocols.file = new com.google.analytics.utils.Protocols(1,"file");
com.google.analytics.utils.Protocols.HTTP = new com.google.analytics.utils.Protocols(2,"HTTP");
