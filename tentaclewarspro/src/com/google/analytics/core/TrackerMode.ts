module com {
	export module google {
		export module analytics {
			export module core {
				export class TrackerMode extends egret.HashObject {
					public static BRIDGE:string;
					public static AS3:string;

					public constructor()
					{
						super();
						super();
					}

				}
			}
		}
	}
}

com.google.analytics.core.TrackerMode.BRIDGE = "Bridge";
com.google.analytics.core.TrackerMode.AS3 = "AS3";
