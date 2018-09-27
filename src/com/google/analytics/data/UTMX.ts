module com {
	export module google {
		export module analytics {
			export module data {
				export class UTMX extends com.google.analytics.data.UTMCookie {
					private _value:string;

					public constructor()
					{
						super("utmx","__utmx",["value"],0);
						this._value = "-";
					}

					public get value():string
					{
						return this._value;
					}

					public set value(value:string)
					{
						this._value = value;
					}

				}
			}
		}
	}
}

flash.extendsClass("com.google.analytics.data.UTMX","com.google.analytics.data.UTMCookie")
