module com {
	export module gameallianz {
		export module api {
			export module as3 {
				export class GameAllianzApi extends egret.HashObject {
					public static f_preloader_continue:Function;
					public static f_language_change:Array<any>;
					public static f_music_change:Array<any>;
					public static f_sound_change:Array<any>;
					public static f_pause:Array<any>;
					public static f_error:Array<any>;
					public static f_send_set:Function;
					public static f_set_on_data:Function;
					public static f_level_on_data:Function;
					public static f_avatar_on_data:Function;
					public static f_view_score:Function;
					public static f_submit_score:Function;
					public static f_send_gallery:Function;
					public static f_save_avatar:Function;

					public constructor()
					{
						super();
						super();
					}

					private static method_26():number
					{
						var flashPlayerVersion:string = flash.Capabilities.version;
						var osArray:Array<any> = flashPlayerVersion.split(" ");
						var versionArray:Array<any> = <any>osArray[1].split(",");
						var majorVersion:number = <any>flash.tranint(versionArray[0]);
						return majorVersion;
					}

					private static method_39(_stage:egret.Stage,_site_id:string,_game_name:string):boolean
					{
						var sp_bg:com.gameallianz.api.as3.gui.Background = <any>null;
						var tf:flash.TextField = <any>null;
						var txtF:flash.TextFormat = <any>null;
						var b_how:boolean = <any>true;
						var st_version:number = com.gameallianz.api.as3.GameAllianzApi.method_26();
						if(st_version < 10)
						{
							b_how = false;
						}
						if(b_how == false)
						{
							try 
							{
								sp_bg = new Background(_stage);
								sp_bg["active"] = true;
								tf = new flash.TextField();
								tf.textAlign = "left";
								tf.multiline = true;
								_stage.addChild(tf);
								txtF = new flash.TextFormat();
								txtF.color = 16777215;
								txtF.font = "arial";
								txtF.align = "center";
								tf.htmlText = "<a href=\'http://get.adobe.com/flashplayer/\' target=\'_blank\'>Flash Player: " + flash.Capabilities.version + "\n" + GameAllianzApiLocalization.getTranslationById(134) + "</a>";
								tf.setTextFormat(txtF);
								tf.x = (_stage.stageWidth - tf.width) / 2;
								tf.y = (_stage.stageHeight - tf.height) / 2;
							}
							catch(e)
							{}
						}
						return b_how;
					}

					public static ini(_stage:egret.Stage,_portal_name:string,_partner_name:string,_game_name:string = null,_multilanguage_enable:boolean = true,_play_button_enable:boolean = true,_debug_mode_enable:boolean = false,_other_params:any = null)
					{
						GameAllianzApiGlobal.ini();
					}

					public static get print_image_button():egret.SwfMovie
					{
						return GameAllianzApiExtended.action(com.gameallianz.api.as3.classes.GameAllianzApiActions.GET_PRINT_IMAGE_BUTTON);
					}

					public static get save_image_button():egret.SwfMovie
					{
						return GameAllianzApiExtended.action(com.gameallianz.api.as3.classes.GameAllianzApiActions.GET_SAVE_IMAGE_BUTTON);
					}

					public static get send_set_button():egret.SwfMovie
					{
						return GameAllianzApiExtended.action(com.gameallianz.api.as3.classes.GameAllianzApiActions.GET_SEND_SET_BUTTON);
					}

					public static get send_image_gallery_button():egret.SwfMovie
					{
						return GameAllianzApiExtended.action(com.gameallianz.api.as3.classes.GameAllianzApiActions.GET_SEND_IMAGE_GALLERY_BUTTON);
					}

					public static get apple_app_store_logo():egret.SwfMovie
					{
						return GameAllianzApiExtended.action(com.gameallianz.api.as3.classes.GameAllianzApiActions.GET_APPLE_APP_STORE_LOGO);
					}

					public static get android_app_store_logo():egret.SwfMovie
					{
						return GameAllianzApiExtended.action(com.gameallianz.api.as3.classes.GameAllianzApiActions.GET_ANDROID_APP_STORE_LOGO);
					}

					public static get blackberry_app_store_logo():egret.SwfMovie
					{
						return GameAllianzApiExtended.action(com.gameallianz.api.as3.classes.GameAllianzApiActions.GET_BLACKBERRY_APP_STORE_LOGO);
					}

					public static get facebook_logo():egret.SwfMovie
					{
						return GameAllianzApiExtended.action(com.gameallianz.api.as3.classes.GameAllianzApiActions.GET_FACEBOOK_LOGO);
					}

					public static get twitter_logo():egret.SwfMovie
					{
						return GameAllianzApiExtended.action(com.gameallianz.api.as3.classes.GameAllianzApiActions.GET_TWITTER_LOGO);
					}

					public static get partner_logo():egret.SwfMovie
					{
						return GameAllianzApiExtended.action(com.gameallianz.api.as3.classes.GameAllianzApiActions.GET_PARTNER_LOGO);
					}

					public static get portal_logo():egret.SwfMovie
					{
						return GameAllianzApiExtended.action(com.gameallianz.api.as3.classes.GameAllianzApiActions.GET_PORTAL_LOGO);
					}

					public static get partner_link():string
					{
						return GameAllianzApiExtended.action(com.gameallianz.api.as3.classes.GameAllianzApiActions.GET_PARTNER_LINK);
					}

					public static get partner_name():string
					{
						return GameAllianzApiExtended.action(com.gameallianz.api.as3.classes.GameAllianzApiActions.GET_PARTNER_NAME);
					}

					public static get context_menu():flash.ContextMenu
					{
						return GameAllianzApiExtended.action(com.gameallianz.api.as3.classes.GameAllianzApiActions.GET_CONTEXT_MENU);
					}

					public static pause()
					{
						GameAllianzApiExtended.action(com.gameallianz.api.as3.classes.GameAllianzApiActions.PAUSE);
					}

					public static set music(_value:boolean)
					{
						GameAllianzApiExtended.action(com.gameallianz.api.as3.classes.GameAllianzApiActions.SET_MUSIC,_value);
					}

					public static get music():boolean
					{
						return GameAllianzApiExtended.action(com.gameallianz.api.as3.classes.GameAllianzApiActions.GET_MUSIC);
					}

					public static set sound(_value:boolean)
					{
						GameAllianzApiExtended.action(com.gameallianz.api.as3.classes.GameAllianzApiActions.SET_SOUND,_value);
					}

					public static get sound():boolean
					{
						return GameAllianzApiExtended.action(com.gameallianz.api.as3.classes.GameAllianzApiActions.GET_SOUND);
					}

					public static get language():string
					{
						return GameAllianzApiExtended.action(com.gameallianz.api.as3.classes.GameAllianzApiActions.GET_LANGUAGE);
					}

					public static set language(_language:string)
					{
						GameAllianzApiExtended.action(com.gameallianz.api.as3.classes.GameAllianzApiActions.SET_LANGUAGE,_language);
					}

					public static sendSet(_set:any)
					{
						GameAllianzApiExtended.action(com.gameallianz.api.as3.classes.GameAllianzApiActions.SEND_SET,_set);
					}

					public static get current_set():any
					{
						return GameAllianzApiExtended.action(com.gameallianz.api.as3.classes.GameAllianzApiActions.GET_CURRENT_SET);
					}

					public static get current_level():any
					{
						return GameAllianzApiExtended.action(com.gameallianz.api.as3.classes.GameAllianzApiActions.GET_CURRENT_LEVEL);
					}

					public static get current_avatar():any
					{
						return GameAllianzApiExtended.action(com.gameallianz.api.as3.classes.GameAllianzApiActions.GET_CURRENT_AVATAR);
					}

					public static sendAvatar(_avatar:any,_image:egret.Sprite)
					{
						GameAllianzApiExtended.action(com.gameallianz.api.as3.classes.GameAllianzApiActions.SEND_AVATAR,_avatar,_image);
					}

					public static viewScore(_leader_board_id:string)
					{
					}

					public static sendScore(_leader_board_id:string,_leader_board_name:string,_score:com.gameallianz.api.as3.utils.NumberCrypto,_score_data:any = null)
					{
						GameAllianzApiExtended.action(com.gameallianz.api.as3.classes.GameAllianzApiActions.SUBMIT_SCORE,_leader_board_id,_leader_board_name,_score,_score_data);
					}

					public static sendTemporaryScore(_leader_board_id:string,_leader_board_name:string,_score:com.gameallianz.api.as3.utils.NumberCrypto,_score_data:any = null)
					{
						GameAllianzApiExtended.action(com.gameallianz.api.as3.classes.GameAllianzApiActions.SUBMIT_TEMPORARY_SCORE,_leader_board_id,_leader_board_name,_score,_score_data);
					}

					public static sendImageGallery(_image:egret.Sprite,_width:number = 640,_height:number = 480)
					{
						GameAllianzApiExtended.action(com.gameallianz.api.as3.classes.GameAllianzApiActions.SEND_GALLERY,_image,_width,_height);
					}

					public static sendLevel(_level:any,_bitmap:flash.BitmapData = null)
					{
						GameAllianzApiExtended.action(com.gameallianz.api.as3.classes.GameAllianzApiActions.SEND_LEVEL,_level,_bitmap);
					}

					public static rateLevel()
					{
						GameAllianzApiExtended.action(com.gameallianz.api.as3.classes.GameAllianzApiActions.RATE_LEVEL);
					}

					public static printImage(_image:egret.Sprite,_width:number = 640,_height:number = 480)
					{
						GameAllianzApiExtended.action(com.gameallianz.api.as3.classes.GameAllianzApiActions.PRINT_IMAGE,_image,_width,_height);
					}

					public static saveImage(_image:egret.Sprite,_width:number = 640,_height:number = 480,_scale:number = 1)
					{
						GameAllianzApiExtended.action(com.gameallianz.api.as3.classes.GameAllianzApiActions.SAVE_IMAGE,_image,_width,_height,_scale);
					}

					public static navigateTo(_to:string)
					{
						GameAllianzApiExtended.action(com.gameallianz.api.as3.classes.GameAllianzApiActions.NAVIGATE,_to);
					}

					public static getUrl(_to:string,_window:string = "_blank",_from:string = null)
					{
						GameAllianzApiExtended.action(com.gameallianz.api.as3.classes.GameAllianzApiActions.GETURL,_to,_window,_from);
					}

					public static trackEvent(_action:string,_level:string,_value:number = NaN)
					{
						GameAllianzApiExtended.action(com.gameallianz.api.as3.classes.GameAllianzApiActions.TRACK_EVENT,_action,_level,_value);
					}

					public static unlockMedal(_medal:string,_medal_name:string,_medal_value:any = 0)
					{
						GameAllianzApiExtended.action(com.gameallianz.api.as3.classes.GameAllianzApiActions.UNLOCK_MEDAL,_medal,_medal_name,_medal_value);
					}

					public static viewMedals()
					{
						GameAllianzApiExtended.action(com.gameallianz.api.as3.classes.GameAllianzApiActions.VIEW_MEDALS);
					}

					public static get medals():Array<any>
					{
						var arr:Array<any> = <any>GameAllianzApiExtended.action(com.gameallianz.api.as3.classes.GameAllianzApiActions.GET_MEDALS);
						return arr;
					}

					public static addEventListener(type:string,listener:Function,thisObject:any,useCapture:boolean = false,priority:number = 0,useWeakReference:boolean = false)
					{
						GameAllianzApiExtended.addEventListener(type,listener,useCapture,priority,useWeakReference);
					}

					public static removeEventListener(type:string,listener:Function,thisObject:any,useCapture:boolean = false)
					{
						GameAllianzApiExtended.removeEventListener(type,listener,useCapture);
					}

					public static cache(_sp:any,_b:boolean = true)
					{
						if(flash.Security["sandboxType"] == flash.Security.APPLICATION)
						{
							try 
							{
								if(_b)
								{
									_sp["cacheAsBitmapMatrix"] = new egret.Matrix();
									_sp["cacheAsBitmap"] = true;
								}
								else
								{
									_sp["cacheAsBitmapMatrix"] = null;
									_sp["cacheAsBitmap"] = false;
								}
								return ;
							}
							catch(e)
							{
								console.log("Error cache",_sp,e);
								return ;
							}
						}
					}

				}
			}
		}
	}
}

com.gameallianz.api.as3.GameAllianzApi.f_language_change = [];
com.gameallianz.api.as3.GameAllianzApi.f_music_change = [];
com.gameallianz.api.as3.GameAllianzApi.f_sound_change = [];
com.gameallianz.api.as3.GameAllianzApi.f_pause = [];
com.gameallianz.api.as3.GameAllianzApi.f_error = [];
