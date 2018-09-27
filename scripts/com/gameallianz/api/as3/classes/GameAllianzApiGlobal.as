package com.gameallianz.api.as3.classes
{
   import com.gameallianz.api.as3.GameAllianzApiLocalization;
   import com.gameallianz.api.as3.interfaces.IProtectMetodsInterface;
   import com.gameallianz.api.as3.utils.Base64;
   import com.gameallianz.api.as3.utils.URL;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.display.Stage;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import flash.system.Capabilities;
   import flash.utils.ByteArray;
   
   public class GameAllianzApiGlobal
   {
      
      public static var local_debug:Boolean = false;
      
      public static var st_api_version:String = "1.0.40";
      
      private static var st_game_name:String = "unset";
      
      private static var st_site_name:String = "unset";
      
      private static var st_partner_name:String = "unset";
      
      private static var st_host:String = "error";
      
      private static var sp_engine:Sprite;
      
      private static var st_app_stage:Stage = null;
      
      private static var st_app_root:DisplayObject;
      
      private static var b_app_multilanguage:Boolean = false;
      
      private static var b_music:Boolean = true;
      
      private static var b_sound:Boolean = true;
      
      private static var mc_crypt:IProtectMetodsInterface;
      
      public static const ENGINE_ACTION:String = "action";
      
      public static var st_url:String = "http://assets.gameallianz.com/api/engine/engine.swf";
      
      public static var st_securi_url:String = "http://assets.gameallianz.com/api/engine/engine.dat";
      
      public static var secury:Boolean = true;
       
      
      public function GameAllianzApiGlobal()
      {
         super();
      }
      
      public static function ini() : void
      {
         if(local_debug == true)
         {
            st_api_version = st_api_version + "-dbg";
            st_url = "http://gameallianz.com/api/engine/engine.swf" + new Date().getTime();
            st_securi_url = "http://gameallianz.com/api/engine/engine.dat";
         }
         else
         {
            st_url = "http://assets.gameallianz.com/api/engine/engine.swf";
            st_securi_url = "http://assets.gameallianz.com/api/engine/engine.dat";
         }
         trace("API ",st_api_version);
      }
      
      public static function getCashDay(_value:Number = 1) : String
      {
         if(local_debug == true)
         {
            return getCashSecond();
         }
         var cash:String = String(Math.round(new Date().getTime() / (_value * 24 * 60 * 60 * 1000)));
         return cash;
      }
      
      public static function getCashYear(_value:Number = 1) : String
      {
         var cash:String = String(Math.round(new Date().getTime() / (_value * 365 * 24 * 60 * 60 * 1000)));
         return cash;
      }
      
      public static function getCashMonth(_value:Number = 1) : String
      {
         var cash:String = String(Math.round(new Date().getTime() / (_value * 30 * 24 * 60 * 60 * 1000)));
         return cash;
      }
      
      public static function getCashWeek(_value:Number = 1) : String
      {
         var cash:String = String(Math.round(new Date().getTime() / (_value * 7 * 24 * 60 * 60 * 1000)));
         return cash;
      }
      
      public static function getCashHour(_value:Number = 1) : String
      {
         var cash:String = String(Math.round(new Date().getTime() / (_value * 60 * 60 * 1000)));
         return cash;
      }
      
      public static function getCashMinute(_value:Number = 1) : String
      {
         var cash:String = String(Math.round(new Date().getTime() / (_value * 60 * 1000)));
         return cash;
      }
      
      public static function getCashSecond(_value:Number = 1) : String
      {
         var cash:String = String(Math.round(new Date().getTime() / (_value * 1000)));
         return cash;
      }
      
      public static function get domain() : String
      {
         var url:URL = null;
         if(st_host != "error")
         {
            return st_host;
         }
         try
         {
            url = new URL(stage.loaderInfo.url);
         }
         catch(e:Error)
         {
            st_host = "error";
         }
         return st_host;
      }
      
      public static function set game_name(_name:String) : void
      {
         st_game_name = _name;
      }
      
      public static function get game_name() : String
      {
         return st_game_name;
      }
      
      public static function set engine(_engine:Sprite) : void
      {
         sp_engine = _engine;
      }
      
      public static function get engine() : Sprite
      {
         return sp_engine;
      }
      
      public static function set stage(_sp_r:Stage) : void
      {
         var par:Stage = _sp_r;
         try
         {
            if(par == null)
            {
               st_app_stage = null;
            }
            else
            {
               st_app_stage = par;
               st_app_root = st_app_stage.root;
            }
            return;
         }
         catch(e:Error)
         {
            st_app_stage = null;
            st_app_root = null;
            return;
         }
      }
      
      public static function get stage() : Stage
      {
         return st_app_stage;
      }
      
      public static function set root(_sp_r:DisplayObject) : void
      {
      }
      
      public static function get root() : DisplayObject
      {
         return st_app_root;
      }
      
      public static function get flashvars() : Object
      {
         try
         {
            return GameAllianzApiGlobal.stage.loaderInfo.parameters;
         }
         catch(e:Error)
         {
         }
         return {};
      }
      
      public static function get multilanguage() : Boolean
      {
         return b_app_multilanguage;
      }
      
      public static function set multilanguage(_value:Boolean) : void
      {
      }
      
      public static function get site_name() : String
      {
         var site_name:String = st_site_name;
         try
         {
            site_name = GameAllianzApiGlobal.engine[GameAllianzApiGlobal.ENGINE_ACTION].apply(null,[GameAllianzApiActions.GET_SITE_NAME]);
         }
         catch(e:Error)
         {
         }
         return site_name;
      }
      
      public static function set site_name(_value:String) : void
      {
      }
      
      public static function get partner_name() : String
      {
         var partner_name:String = st_partner_name;
         try
         {
            partner_name = GameAllianzApiGlobal.engine[GameAllianzApiGlobal.ENGINE_ACTION].apply(null,[GameAllianzApiActions.GET_PARTNER_NAME]);
         }
         catch(e:Error)
         {
         }
         return partner_name;
      }
      
      public static function set partner_name(_value:String) : void
      {
         st_partner_name = _value;
      }
      
      public static function get language() : String
      {
         return GameAllianzApiLocalization.language;
      }
      
      public static function set language(_value:String) : void
      {
         GameAllianzApiLocalization.language = _value;
      }
      
      public static function get music() : Boolean
      {
         return b_music;
      }
      
      public static function set music(_value:Boolean) : void
      {
         b_music = _value;
      }
      
      public static function get sound() : Boolean
      {
         return b_sound;
      }
      
      public static function set sound(_value:Boolean) : void
      {
         b_sound = _value;
      }
      
      public static function getURL(_url:String, _window:String = "_blank") : void
      {
         var url_req:URLRequest = new URLRequest(_url);
         navigateToURL(url_req,_window);
      }
      
      public static function toText(_arr:Array) : String
      {
         var st_url:String = "";
         for(var i:Number = 0; i < _arr.length; i++)
         {
            st_url = st_url + String.fromCharCode(_arr[i]);
         }
         return st_url;
      }
      
      public static function fromText(_txt:String) : Array
      {
         var arr:Array = new Array();
         §§push(true);
         if(0 >= _txt.length)
         {
            §§push(true);
         }
         else
         {
            arr.push(_txt.charCodeAt(0));
            §§push(true);
         }
         return arr;
      }
      
      public static function getGameInfo() : GameAllianzApiGameInfo
      {
         var info:GameAllianzApiGameInfo = new GameAllianzApiGameInfo();
         info.ini(site_name,partner_name,game_name,multilanguage,GameAllianzApiLocalization.languages,GameAllianzApiLocalization.language,st_api_version,Capabilities.serverString,stage.loaderInfo.url);
         return info;
      }
      
      public static function cryptObj(obj:Object) : String
      {
         var ba:ByteArray = new ByteArray();
         ba.writeObject(obj);
         return Base64.encodeByteArray(ba);
      }
      
      public static function uncryptObj(str:String) : Object
      {
         var ba:ByteArray = Base64.decodeToByteArray(str);
         ba.uncompress();
         ba.position = 0;
         return ba.readObject();
      }
      
      public static function cryptByteArray(_ba:ByteArray) : String
      {
         _ba.compress();
         return Base64.encodeByteArray(_ba);
      }
      
      public static function uncrypByteArray(_str:String) : ByteArray
      {
         var ba:ByteArray = null;
         try
         {
            ba = Base64.decodeToByteArray(_str);
            ba.uncompress();
            return ba;
         }
         catch(e:Error)
         {
         }
         return new ByteArray();
      }
   }
}
