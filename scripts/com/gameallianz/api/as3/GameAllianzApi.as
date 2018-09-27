package com.gameallianz.api.as3
{
   import com.gameallianz.api.as3.classes.GameAllianzApiActions;
   import com.gameallianz.api.as3.classes.GameAllianzApiExtended;
   import com.gameallianz.api.as3.classes.GameAllianzApiGlobal;
   import com.gameallianz.api.as3.classes.GameAllianzApiParams;
   import com.gameallianz.api.as3.gui.Background;
   import com.gameallianz.api.as3.utils.GlobalTrace;
   import com.gameallianz.api.as3.utils.NumberCrypto;
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.display.Stage;
   import flash.geom.Matrix;
   import flash.system.Capabilities;
   import flash.system.Security;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import flash.ui.ContextMenu;
   
   public class GameAllianzApi
   {
      
      private static var f_preloader_continue:Function;
      
      private static var f_language_change:Array = [];
      
      private static var f_music_change:Array = [];
      
      private static var f_sound_change:Array = [];
      
      private static var f_pause:Array = [];
      
      private static var f_error:Array = [];
      
      private static var f_send_set:Function;
      
      private static var f_set_on_data:Function;
      
      private static var f_level_on_data:Function;
      
      private static var f_avatar_on_data:Function;
      
      private static var f_view_score:Function;
      
      private static var f_submit_score:Function;
      
      private static var f_send_gallery:Function;
      
      private static var f_save_avatar:Function;
       
      
      public function GameAllianzApi()
      {
         super();
      }
      
      private static function method_26() : Number
      {
         var flashPlayerVersion:String = Capabilities.version;
         var osArray:Array = flashPlayerVersion.split(" ");
         var versionArray:Array = osArray[1].split(",");
         var majorVersion:Number = parseInt(versionArray[0]);
         return majorVersion;
      }
      
      private static function method_39(_stage:Stage, _site_id:String, _game_name:String) : Boolean
      {
         var sp_bg:Background = null;
         var tf:TextField = null;
         var txtF:TextFormat = null;
         var b_how:Boolean = true;
         var st_version:Number = method_26();
         if(st_version < 10)
         {
            b_how = false;
         }
         if(b_how == false)
         {
            try
            {
               sp_bg = new Background(_stage);
               sp_bg.active = true;
               tf = new TextField();
               tf.autoSize = "left";
               tf.multiline = true;
               _stage.addChild(tf);
               txtF = new TextFormat();
               txtF.color = 16777215;
               txtF.font = "arial";
               txtF.align = "center";
               tf.htmlText = "<a href=\'http://get.adobe.com/flashplayer/\' target=\'_blank\'>Flash Player: " + Capabilities.version + "\n" + GameAllianzApiLocalization.getTranslationById(134) + "</a>";
               tf.setTextFormat(txtF);
               tf.x = (_stage.stageWidth - tf.width) / 2;
               tf.y = (_stage.stageHeight - tf.height) / 2;
            }
            catch(e:Error)
            {
            }
         }
         return b_how;
      }
      
      public static function ini(_stage:Stage, _portal_name:String, _partner_name:String, _game_name:String = null, _multilanguage_enable:Boolean = true, _play_button_enable:Boolean = true, _debug_mode_enable:Boolean = false, _other_params:* = null) : void
      {
         GameAllianzApiGlobal.ini();
      }
      
      public static function get print_image_button() : MovieClip
      {
         return GameAllianzApiExtended.action(GameAllianzApiActions.GET_PRINT_IMAGE_BUTTON);
      }
      
      public static function get save_image_button() : MovieClip
      {
         return GameAllianzApiExtended.action(GameAllianzApiActions.GET_SAVE_IMAGE_BUTTON);
      }
      
      public static function get send_set_button() : MovieClip
      {
         return GameAllianzApiExtended.action(GameAllianzApiActions.GET_SEND_SET_BUTTON);
      }
      
      public static function get send_image_gallery_button() : MovieClip
      {
         return GameAllianzApiExtended.action(GameAllianzApiActions.GET_SEND_IMAGE_GALLERY_BUTTON);
      }
      
      public static function get apple_app_store_logo() : MovieClip
      {
         return GameAllianzApiExtended.action(GameAllianzApiActions.GET_APPLE_APP_STORE_LOGO);
      }
      
      public static function get android_app_store_logo() : MovieClip
      {
         return GameAllianzApiExtended.action(GameAllianzApiActions.GET_ANDROID_APP_STORE_LOGO);
      }
      
      public static function get blackberry_app_store_logo() : MovieClip
      {
         return GameAllianzApiExtended.action(GameAllianzApiActions.GET_BLACKBERRY_APP_STORE_LOGO);
      }
      
      public static function get facebook_logo() : MovieClip
      {
         return GameAllianzApiExtended.action(GameAllianzApiActions.GET_FACEBOOK_LOGO);
      }
      
      public static function get twitter_logo() : MovieClip
      {
         return GameAllianzApiExtended.action(GameAllianzApiActions.GET_TWITTER_LOGO);
      }
      
      public static function get partner_logo() : MovieClip
      {
         return GameAllianzApiExtended.action(GameAllianzApiActions.GET_PARTNER_LOGO);
      }
      
      public static function get portal_logo() : MovieClip
      {
         return GameAllianzApiExtended.action(GameAllianzApiActions.GET_PORTAL_LOGO);
      }
      
      public static function get partner_link() : String
      {
         return GameAllianzApiExtended.action(GameAllianzApiActions.GET_PARTNER_LINK);
      }
      
      public static function get partner_name() : String
      {
         return GameAllianzApiExtended.action(GameAllianzApiActions.GET_PARTNER_NAME);
      }
      
      public static function get context_menu() : ContextMenu
      {
         return GameAllianzApiExtended.action(GameAllianzApiActions.GET_CONTEXT_MENU);
      }
      
      public static function pause() : void
      {
         GameAllianzApiExtended.action(GameAllianzApiActions.PAUSE);
      }
      
      public static function set music(_value:Boolean) : void
      {
         GameAllianzApiExtended.action(GameAllianzApiActions.SET_MUSIC,_value);
      }
      
      public static function get music() : Boolean
      {
         return GameAllianzApiExtended.action(GameAllianzApiActions.GET_MUSIC);
      }
      
      public static function set sound(_value:Boolean) : void
      {
         GameAllianzApiExtended.action(GameAllianzApiActions.SET_SOUND,_value);
      }
      
      public static function get sound() : Boolean
      {
         return GameAllianzApiExtended.action(GameAllianzApiActions.GET_SOUND);
      }
      
      public static function get language() : String
      {
         return GameAllianzApiExtended.action(GameAllianzApiActions.GET_LANGUAGE);
      }
      
      public static function set language(_language:String) : void
      {
         GameAllianzApiExtended.action(GameAllianzApiActions.SET_LANGUAGE,_language);
      }
      
      public static function sendSet(_set:*) : void
      {
         GameAllianzApiExtended.action(GameAllianzApiActions.SEND_SET,_set);
      }
      
      public static function get current_set() : *
      {
         return GameAllianzApiExtended.action(GameAllianzApiActions.GET_CURRENT_SET);
      }
      
      public static function get current_level() : *
      {
         return GameAllianzApiExtended.action(GameAllianzApiActions.GET_CURRENT_LEVEL);
      }
      
      public static function get current_avatar() : *
      {
         return GameAllianzApiExtended.action(GameAllianzApiActions.GET_CURRENT_AVATAR);
      }
      
      public static function sendAvatar(_avatar:*, _image:Sprite) : void
      {
         GameAllianzApiExtended.action(GameAllianzApiActions.SEND_AVATAR,_avatar,_image);
      }
      
      public static function viewScore(_leader_board_id:String) : void
      {
      }
      
      public static function sendScore(_leader_board_id:String, _leader_board_name:String, _score:NumberCrypto, _score_data:* = null) : void
      {
         GameAllianzApiExtended.action(GameAllianzApiActions.SUBMIT_SCORE,_leader_board_id,_leader_board_name,_score,_score_data);
      }
      
      public static function sendTemporaryScore(_leader_board_id:String, _leader_board_name:String, _score:NumberCrypto, _score_data:* = null) : void
      {
         GameAllianzApiExtended.action(GameAllianzApiActions.SUBMIT_TEMPORARY_SCORE,_leader_board_id,_leader_board_name,_score,_score_data);
      }
      
      public static function sendImageGallery(_image:Sprite, _width:Number = 640, _height:Number = 480) : void
      {
         GameAllianzApiExtended.action(GameAllianzApiActions.SEND_GALLERY,_image,_width,_height);
      }
      
      public static function sendLevel(_level:*, _bitmap:BitmapData = null) : void
      {
         GameAllianzApiExtended.action(GameAllianzApiActions.SEND_LEVEL,_level,_bitmap);
      }
      
      public static function rateLevel() : void
      {
         GameAllianzApiExtended.action(GameAllianzApiActions.RATE_LEVEL);
      }
      
      public static function printImage(_image:Sprite, _width:Number = 640, _height:Number = 480) : void
      {
         GameAllianzApiExtended.action(GameAllianzApiActions.PRINT_IMAGE,_image,_width,_height);
      }
      
      public static function saveImage(_image:Sprite, _width:Number = 640, _height:Number = 480, _scale:Number = 1) : void
      {
         GameAllianzApiExtended.action(GameAllianzApiActions.SAVE_IMAGE,_image,_width,_height,_scale);
      }
      
      public static function navigateTo(_to:String) : void
      {
         GameAllianzApiExtended.action(GameAllianzApiActions.NAVIGATE,_to);
      }
      
      public static function getUrl(_to:String, _window:String = "_blank", _from:String = null) : void
      {
         GameAllianzApiExtended.action(GameAllianzApiActions.GETURL,_to,_window,_from);
      }
      
      public static function trackEvent(_action:String, _level:String, _value:Number = NaN) : void
      {
         GameAllianzApiExtended.action(GameAllianzApiActions.TRACK_EVENT,_action,_level,_value);
      }
      
      public static function unlockMedal(_medal:String, _medal_name:String, _medal_value:* = 0) : void
      {
         GameAllianzApiExtended.action(GameAllianzApiActions.UNLOCK_MEDAL,_medal,_medal_name,_medal_value);
      }
      
      public static function viewMedals() : void
      {
         GameAllianzApiExtended.action(GameAllianzApiActions.VIEW_MEDALS);
      }
      
      public static function get medals() : Array
      {
         var arr:Array = GameAllianzApiExtended.action(GameAllianzApiActions.GET_MEDALS);
         return arr;
      }
      
      public static function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:uint = 0, useWeakReference:Boolean = false) : void
      {
         GameAllianzApiExtended.addEventListener(type,listener,useCapture,priority,useWeakReference);
      }
      
      public static function removeEventListener(type:String, listener:Function, useCapture:Boolean = false) : void
      {
         GameAllianzApiExtended.removeEventListener(type,listener,useCapture);
      }
      
      public static function cache(_sp:*, _b:Boolean = true) : void
      {
         if(Security.sandboxType == Security.APPLICATION)
         {
            try
            {
               if(_b)
               {
                  _sp["cacheAsBitmapMatrix"] = new Matrix();
                  _sp["cacheAsBitmap"] = true;
               }
               else
               {
                  _sp["cacheAsBitmapMatrix"] = null;
                  _sp["cacheAsBitmap"] = false;
               }
               return;
            }
            catch(e:Error)
            {
               trace("Error cache",_sp,e);
               return;
            }
         }
      }
   }
}
