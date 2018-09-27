module com {
	export module google {
		export module analytics {
			export module data {
				export class UTMA extends com.google.analytics.data.UTMCookie {
					private _sessionId:number = NaN;
					private _domainHash:number = NaN;
					private _firstTime:number = NaN;
					private _currentTime:number = NaN;
					private _lastTime:number = NaN;
					private _sessionCount:number = NaN;

					public constructor(domainHash:number = NaN,sessionId:number = NaN,firstTime:number = NaN,lastTime:number = NaN,currentTime:number = NaN,sessionCount:number = NaN)
					{
						super("utma","__utma",["domainHash","sessionId","firstTime","lastTime","currentTime","sessionCount"],com.google.analytics.utils.Timespan.twoyears * 1000);
						this.domainHash = domainHash;
						this.sessionId = sessionId;
						this.firstTime = firstTime;
						this.lastTime = lastTime;
						this.currentTime = currentTime;
						this.sessionCount = sessionCount;
					}

					public get lastTime():number
					{
						return this._lastTime;
					}

					public set lastTime(value:number)
					{
						this._lastTime = value;
						this.update();
					}

					public set currentTime(value:number)
					{
						this._currentTime = value;
						this.update();
					}

					public get sessionId():number
					{
						return this._sessionId;
					}

					public get sessionCount():number
					{
						return this._sessionCount;
					}

					public get firstTime():number
					{
						return this._firstTime;
					}

					public get currentTime():number
					{
						return this._currentTime;
					}

					public set domainHash(value:number)
					{
						this._domainHash = value;
						this.update();
					}

					public set sessionId(value:number)
					{
						this._sessionId = value;
						this.update();
					}

					public set sessionCount(value:number)
					{
						this._sessionCount = value;
						this.update();
					}

					public get domainHash():number
					{
						return this._domainHash;
					}

					public set firstTime(value:number)
					{
						this._firstTime = value;
						this.update();
					}

				}
			}
		}
	}
}

flash.extendsClass("com.google.analytics.data.UTMA","com.google.analytics.data.UTMCookie")
