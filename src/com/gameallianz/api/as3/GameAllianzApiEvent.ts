module com {
	export module gameallianz {
		export module api {
			export module as3 {
				export class GameAllianzApiEvent extends egret.Event {
					public static API_INITIALISED:string;
					public static API_ACCESS_DENIED:string;
					public static LANGUAGE_ON_CHANGE:string;
					public static MUSIC_ON_CHANGE:string;
					public static SOUND_ON_CHANGE:string;
					public static MEDALS_ON_CHANGE:string;
					public static CURRENT_SET_ON_DATA:string;
					public static CURRENT_LEVEL_ON_DATA:string;
					public static CURRENT_AVATAR_ON_DATA:string;
					public static MEDALS_ON_DATA:string;
					public static SEND_AVATAR_DONE:string;
					public static SEND_AVATAR_CANCELED:string;
					public static SEND_SET_DONE:string;
					public static SEND_SET_CANCELED:string;
					public static SEND_GALLERY_DONE:string;
					public static SEND_GALLERY_CANCELED:string;
					public static SEND_LEVEL_DONE:string;
					public static SEND_LEVEL_CANCELED:string;
					public static RATE_LEVEL_DONE:string;
					public static RATE_LEVEL_CANCELED:string;
					public static SEND_SCORE_DONE:string;
					public static SEND_SCORE_CANCELED:string;
					public static VIEW_SCORE_DONE:string;
					public static VIEW_MEDALS_DONE:string;
					public static PAUSE_OFF:string;
					public static PAUSE_ON:string;
					public static ERROR:string;
					private _message:com.gameallianz.api.as3.classes.GameAllianzApiMessage;
					private _value:any;

					public constructor(type:string)
					{
						super(type);
					}

					public set message_1(_val:com.gameallianz.api.as3.classes.GameAllianzApiMessage)
					{
						this._message = _val;
					}

					public get message_1():com.gameallianz.api.as3.classes.GameAllianzApiMessage
					{
						return this._message;
					}

					public set value_1(_val:any)
					{
						this._value = _val;
					}

					public get value_1():any
					{
						return this._value;
					}

					public toString():string
					{
						var _self__:any = this;
						return _self__.formatToString("GameAllianzApiEvent");
					}

				}
			}
		}
	}
}

com.gameallianz.api.as3.GameAllianzApiEvent.API_INITIALISED = "event_api_initialised";
com.gameallianz.api.as3.GameAllianzApiEvent.API_ACCESS_DENIED = "event_api_access_denied";
com.gameallianz.api.as3.GameAllianzApiEvent.LANGUAGE_ON_CHANGE = "event_language_on_change";
com.gameallianz.api.as3.GameAllianzApiEvent.MUSIC_ON_CHANGE = "event_music_on_change";
com.gameallianz.api.as3.GameAllianzApiEvent.SOUND_ON_CHANGE = "event_sound_on_change";
com.gameallianz.api.as3.GameAllianzApiEvent.MEDALS_ON_CHANGE = "event_medals_on_change";
com.gameallianz.api.as3.GameAllianzApiEvent.CURRENT_SET_ON_DATA = "event_current_set_on_data";
com.gameallianz.api.as3.GameAllianzApiEvent.CURRENT_LEVEL_ON_DATA = "event_current_level_on_data";
com.gameallianz.api.as3.GameAllianzApiEvent.CURRENT_AVATAR_ON_DATA = "event_current_avatar_on_data";
com.gameallianz.api.as3.GameAllianzApiEvent.MEDALS_ON_DATA = "event_medals_on_data";
com.gameallianz.api.as3.GameAllianzApiEvent.SEND_AVATAR_DONE = "event_send_avatar_done";
com.gameallianz.api.as3.GameAllianzApiEvent.SEND_AVATAR_CANCELED = "event_send_avatar_canceled";
com.gameallianz.api.as3.GameAllianzApiEvent.SEND_SET_DONE = "event_send_set_done";
com.gameallianz.api.as3.GameAllianzApiEvent.SEND_SET_CANCELED = "event_send_set_canceled";
com.gameallianz.api.as3.GameAllianzApiEvent.SEND_GALLERY_DONE = "event_send_gallery_done";
com.gameallianz.api.as3.GameAllianzApiEvent.SEND_GALLERY_CANCELED = "event_send_gallery_canceled";
com.gameallianz.api.as3.GameAllianzApiEvent.SEND_LEVEL_DONE = "event_send_level_done";
com.gameallianz.api.as3.GameAllianzApiEvent.SEND_LEVEL_CANCELED = "event_send_level_canceled";
com.gameallianz.api.as3.GameAllianzApiEvent.RATE_LEVEL_DONE = "event_rate_level_done";
com.gameallianz.api.as3.GameAllianzApiEvent.RATE_LEVEL_CANCELED = "event_rate_level_canceled";
com.gameallianz.api.as3.GameAllianzApiEvent.SEND_SCORE_DONE = "event_send_score_done";
com.gameallianz.api.as3.GameAllianzApiEvent.SEND_SCORE_CANCELED = "event_send_score_canceled";
com.gameallianz.api.as3.GameAllianzApiEvent.VIEW_SCORE_DONE = "event_view_score_done";
com.gameallianz.api.as3.GameAllianzApiEvent.VIEW_MEDALS_DONE = "event_view_medals_done";
com.gameallianz.api.as3.GameAllianzApiEvent.PAUSE_OFF = "event_pause_off";
com.gameallianz.api.as3.GameAllianzApiEvent.PAUSE_ON = "event_pause_on";
com.gameallianz.api.as3.GameAllianzApiEvent.ERROR = "event_error";
flash.extendsClass("com.gameallianz.api.as3.GameAllianzApiEvent","egret.Event")
