module com {
	export module google {
		export module analytics {
			export module data {
				export class UTMV extends com.google.analytics.data.UTMCookie {
					private _domainHash:number = NaN;
					private _value:string;

					public constructor(domainHash:number = NaN,value:string = "")
					{
						super("utmv","__utmv",["domainHash","value"],com.google.analytics.utils.Timespan.twoyears * 1000);
						this.domainHash = domainHash;
						this.value = value;
					}

					public get value():string
					{
						return this._value;
					}

					public get domainHash():number
					{
						return this._domainHash;
					}

					public set domainHash(value:number)
					{
						this._domainHash = value;
						this.update();
					}

					public set value(value:string)
					{
						this._value = value;
						this.update();
					}

				}
			}
		}
	}
}

flash.extendsClass("com.google.analytics.data.UTMV","com.google.analytics.data.UTMCookie")
