module com {
	export module google {
		export module analytics {
			export module data {
				export class UTMZ extends com.google.analytics.data.UTMCookie {
					public static defaultTimespan:number;
					private _campaignTracking:string;
					private _campaignCreation:number = NaN;
					private _responseCount:number = NaN;
					private _domainHash:number = NaN;
					private _campaignSessions:number = NaN;

					public constructor(domainHash:number = NaN,campaignCreation:number = NaN,campaignSessions:number = NaN,responseCount:number = NaN,campaignTracking:string = "")
					{
						super("utmz","__utmz",["domainHash","campaignCreation","campaignSessions","responseCount","campaignTracking"],com.google.analytics.data.UTMZ.defaultTimespan * 1000);
						this.domainHash = domainHash;
						this.campaignCreation = campaignCreation;
						this.campaignSessions = campaignSessions;
						this.responseCount = responseCount;
						this.campaignTracking = campaignTracking;
					}

					public set responseCount(value:number)
					{
						this._responseCount = value;
						this.update();
					}

					public set domainHash(value:number)
					{
						this._domainHash = value;
						this.update();
					}

					public set campaignCreation(value:number)
					{
						this._campaignCreation = value;
						this.update();
					}

					public get campaignTracking():string
					{
						return this._campaignTracking;
					}

					public get campaignSessions():number
					{
						return this._campaignSessions;
					}

					public get domainHash():number
					{
						return this._domainHash;
					}

					public get responseCount():number
					{
						return this._responseCount;
					}

					public get campaignCreation():number
					{
						return this._campaignCreation;
					}

					public set campaignSessions(value:number)
					{
						this._campaignSessions = value;
						this.update();
					}

					public set campaignTracking(value:string)
					{
						this._campaignTracking = value;
						this.update();
					}

				}
			}
		}
	}
}

com.google.analytics.data.UTMZ.defaultTimespan = com.google.analytics.utils.Timespan.sixmonths;
flash.extendsClass("com.google.analytics.data.UTMZ","com.google.analytics.data.UTMCookie")
