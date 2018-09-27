module com {
	export module gameallianz {
		export module api {
			export module as3 {
				export module classes {
					export class GameAllianzApiInternalEvent extends com.gameallianz.api.as3.GameAllianzApiEvent {
						public static INI_ENGINE_COMPLETED:string;
						public static ENGINE_SEND_MESSAGE:string;
						public static ENGINE_MODAL_FORM:string;
						public static ENGINE_INI_EXTERNAL_DISPLAY_OBJECT:string;
						public static GET_GAME_INFO:string;

						public constructor(type:string)
						{
							super(type);
						}

					}
				}
			}
		}
	}
}

com.gameallianz.api.as3.classes.GameAllianzApiInternalEvent.INI_ENGINE_COMPLETED = "api_ini_engine";
com.gameallianz.api.as3.classes.GameAllianzApiInternalEvent.ENGINE_SEND_MESSAGE = "api_engine_message";
com.gameallianz.api.as3.classes.GameAllianzApiInternalEvent.ENGINE_MODAL_FORM = "api_engine_modal";
com.gameallianz.api.as3.classes.GameAllianzApiInternalEvent.ENGINE_INI_EXTERNAL_DISPLAY_OBJECT = "api_external_display_object";
com.gameallianz.api.as3.classes.GameAllianzApiInternalEvent.GET_GAME_INFO = "api_get_game_info";
flash.extendsClass("com.gameallianz.api.as3.classes.GameAllianzApiInternalEvent","com.gameallianz.api.as3.GameAllianzApiEvent")
