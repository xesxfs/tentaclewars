module com {
	export module google {
		export module analytics {
			export module events {
				export class AnalyticsEvent extends egret.Event {
					public static READY:string;
					public tracker:com.google.analytics.AnalyticsTracker;

					public constructor(type:string,tracker:com.google.analytics.AnalyticsTracker,bubbles:boolean = false,cancelable:boolean = false)
					{
						super(type,bubbles,cancelable);
						this.tracker = tracker;
					}

					public clone():egret.Event
					{
						return new com.google.analytics.events.AnalyticsEvent(this.type,this.tracker,this.bubbles,this.cancelable);
					}

				}
			}
		}
	}
}

com.google.analytics.events.AnalyticsEvent.READY = "ready";
flash.extendsClass("com.google.analytics.events.AnalyticsEvent","egret.Event")
