module com {
	export module google {
		export module analytics {
			export module data {
				export class UTMB extends com.google.analytics.data.UTMCookie {
					public static defaultTimespan:number;
					private _trackCount:number = NaN;
					private _lastTime:number = NaN;
					private _domainHash:number = NaN;
					private _token:number = NaN;

					public constructor(domainHash:number = NaN,trackCount:number = NaN,token:number = NaN,lastTime:number = NaN)
					{
						super("utmb","__utmb",["domainHash","trackCount","token","lastTime"],com.google.analytics.data.UTMB.defaultTimespan * 1000);
						this.domainHash = domainHash;
						this.trackCount = trackCount;
						this.token = token;
						this.lastTime = lastTime;
					}

					public set token(value:number)
					{
						this._token = value;
						this.update();
					}

					public set trackCount(value:number)
					{
						this._trackCount = value;
						this.update();
					}

					public get lastTime():number
					{
						return this._lastTime;
					}

					public set domainHash(value:number)
					{
						this._domainHash = value;
						this.update();
					}

					public set lastTime(value:number)
					{
						this._lastTime = value;
						this.update();
					}

					public get domainHash():number
					{
						return this._domainHash;
					}

					public get token():number
					{
						return this._token;
					}

					public get trackCount():number
					{
						return this._trackCount;
					}

				}
			}
		}
	}
}

com.google.analytics.data.UTMB.defaultTimespan = com.google.analytics.utils.Timespan.thirtyminutes;
flash.extendsClass("com.google.analytics.data.UTMB","com.google.analytics.data.UTMCookie")
