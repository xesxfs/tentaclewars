module com {
	export module google {
		export module analytics {
			export module data {
				export class UTMC extends com.google.analytics.data.UTMCookie {
					private _domainHash:number = NaN;

					public constructor(domainHash:number = NaN)
					{
						super("utmc","__utmc",["domainHash"]);
						this.domainHash = domainHash;
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

				}
			}
		}
	}
}

flash.extendsClass("com.google.analytics.data.UTMC","com.google.analytics.data.UTMCookie")
