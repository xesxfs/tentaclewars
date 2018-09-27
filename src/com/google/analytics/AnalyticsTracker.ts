module com {
	export module google {
		export module analytics {
			export interface AnalyticsTracker extends egret.IEventDispatcher {
				account:string;
				config:com.google.analytics.v4.Configuration;
				mode:string;
				debug:com.google.analytics.debug.DebugConfiguration;
				visualDebug:boolean;
				isReady():boolean;
			}
		}
	}
}

flash.extendsClass("com.google.analytics.AnalyticsTracker","egret.IEventDispatcher")
