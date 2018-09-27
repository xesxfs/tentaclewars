module com {
	export module google {
		export module analytics {
			export module core {
				export class EventTracker extends egret.HashObject {
					private _parent:com.google.analytics.v4.GoogleAnalyticsAPI;
					public name:string;

					public constructor(name:string,parent:com.google.analytics.v4.GoogleAnalyticsAPI)
					{
						super();
						super();
						this.name = name;
						this._parent = parent;
					}

					public trackEvent(action:string,label:string = null,value:number = NaN):boolean
					{
						return this._parent.trackEvent(this.name,action,label,value);
					}

				}
			}
		}
	}
}

