module com {
	export module google {
		export module analytics {
			export module data {
				export class UTMK extends com.google.analytics.data.UTMCookie {
					private _hash:number = NaN;

					public constructor(hash:number = NaN)
					{
						super("utmk","__utmk",["hash"]);
						this.hash = hash;
					}

					public set hash(value:number)
					{
						this._hash = value;
						this.update();
					}

					public get hash():number
					{
						return this._hash;
					}

				}
			}
		}
	}
}

flash.extendsClass("com.google.analytics.data.UTMK","com.google.analytics.data.UTMCookie")
