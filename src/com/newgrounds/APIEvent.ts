module com {
	export module newgrounds {
		export class APIEvent extends egret.Event {
			public static API_CONNECTED:string;
			public static ADS_APPROVED:string;
			public static AD_ATTACHED:string;
			public static HOST_BLOCKED:string;
			public static NEW_VERSION_AVAILABLE:string;
			public static EVENT_LOGGED:string;
			public static SCORE_POSTED:string;
			public static SCORES_LOADED:string;
			public static UNLOCK_MEDAL:string;
			public static MEDAL_UNLOCKED:string;
			public static MEDALS_LOADED:string;
			public static METADATA_LOADED:string;
			public static FILE_PRIVS_LOADED:string;
			public static FILE_SAVED:string;
			public static FILE_LOADED:string;
			public static FILE_INITIALIZED:string;
			public static FILE_REQUESTED:string;
			public static QUERY_COMPLETE:string;
			public static VOTE_COMPLETE:string;
			private _data:any;
			private var_365:boolean = false;
			private var_56:any;
			private var_398:APIError;

			public constructor(type:string,success:boolean = true,data:any = undefined)
			{
				super();
				this.var_365 = success;
			}

			public get success():boolean
			{
				return this.var_365;
			}

			public get data():any
			{
				return this._data;
			}

		}
	}
}

com.newgrounds.APIEvent.API_CONNECTED = "movieConnected";
com.newgrounds.APIEvent.ADS_APPROVED = "adsApproved";
com.newgrounds.APIEvent.AD_ATTACHED = "adAttached";
com.newgrounds.APIEvent.HOST_BLOCKED = "hostBlocked";
com.newgrounds.APIEvent.NEW_VERSION_AVAILABLE = "newVersionAvailable";
com.newgrounds.APIEvent.EVENT_LOGGED = "eventLogged";
com.newgrounds.APIEvent.SCORE_POSTED = "scorePosted";
com.newgrounds.APIEvent.SCORES_LOADED = "scoresLoaded";
com.newgrounds.APIEvent.UNLOCK_MEDAL = "unlockMedal";
com.newgrounds.APIEvent.MEDAL_UNLOCKED = "medalUnlocked";
com.newgrounds.APIEvent.MEDALS_LOADED = "medalsLoaded";
com.newgrounds.APIEvent.METADATA_LOADED = "metadataLoaded";
com.newgrounds.APIEvent.FILE_PRIVS_LOADED = "filePrivsLoaded";
com.newgrounds.APIEvent.FILE_SAVED = "fileSaved";
com.newgrounds.APIEvent.FILE_LOADED = "fileLoaded";
com.newgrounds.APIEvent.FILE_INITIALIZED = "fileInitialized";
com.newgrounds.APIEvent.FILE_REQUESTED = "fileRequested";
com.newgrounds.APIEvent.QUERY_COMPLETE = "queryComplete";
com.newgrounds.APIEvent.VOTE_COMPLETE = "voteComplete";
flash.extendsClass("com.newgrounds.APIEvent","egret.Event")
