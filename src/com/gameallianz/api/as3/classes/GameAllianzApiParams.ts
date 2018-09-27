module com {
	export module gameallianz {
		export module api {
			export module as3 {
				export module classes {
					export class GameAllianzApiParams extends egret.HashObject {
						public static SCORE_FILTER_TOP:string;
						public static SCORE_FILTER_RECENT:string;
						public static SCORE_FILTER_WEEKLY:string;
						public static SCORE_FILTER_MONTHLY:string;
						public static SCORE_FILTER_MY_FRIENDS:string;
						public static SCORE_FILTERS:Array<any>;

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
}

com.gameallianz.api.as3.classes.GameAllianzApiParams.SCORE_FILTER_TOP = "filter_top";
com.gameallianz.api.as3.classes.GameAllianzApiParams.SCORE_FILTER_RECENT = "filter_recent";
com.gameallianz.api.as3.classes.GameAllianzApiParams.SCORE_FILTER_WEEKLY = "filter_weekly";
com.gameallianz.api.as3.classes.GameAllianzApiParams.SCORE_FILTER_MONTHLY = "filter_monthly";
com.gameallianz.api.as3.classes.GameAllianzApiParams.SCORE_FILTER_MY_FRIENDS = "filter_my_friends";
