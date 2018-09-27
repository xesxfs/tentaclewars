module com {
	export module newgrounds {
		export class ScoreBoardPeriod extends egret.HashObject {
			public static TODAY:string;
			public static WEEK:string;
			public static MONTH:string;
			public static YEAR:string;
			public static ALL_TIME:string;

			public constructor()
			{
				super();
				super();
			}

		}
	}
}

com.newgrounds.ScoreBoardPeriod.TODAY = "Today";
com.newgrounds.ScoreBoardPeriod.WEEK = "This Week";
com.newgrounds.ScoreBoardPeriod.MONTH = "This Month";
com.newgrounds.ScoreBoardPeriod.YEAR = "This Year";
com.newgrounds.ScoreBoardPeriod.ALL_TIME = "All-Time";
