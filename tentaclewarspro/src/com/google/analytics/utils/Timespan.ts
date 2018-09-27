module com {
	export module google {
		export module analytics {
			export module utils {
				export class Timespan extends egret.HashObject {
					public static sixmonths:number;
					public static twoyears:number;
					public static thirtyminutes:number;

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

com.google.analytics.utils.Timespan.sixmonths = 15768000;
com.google.analytics.utils.Timespan.twoyears = 63072000;
com.google.analytics.utils.Timespan.thirtyminutes = 1800;
