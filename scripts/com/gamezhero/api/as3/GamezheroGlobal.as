package com.gamezhero.api.as3
{
   import com.gamezhero.api.as3.utils.URL;
   import flash.display.MovieClip;
   import flash.external.ExternalInterface;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   
   public class GamezheroGlobal
   {
      
      public static var _host:String = "error";
      
      public static var _game_name:String = "unset";
      
      public static const SAFARI:String = "safari";
      
      public static var _game_code:String = "unset";
      
      public static const IE:String = "ie";
      
      private static var _app_root:MovieClip;
      
      public static var _browser:String = "unset";
      
      public static const OPERA:String = "opera";
      
      public static const FIREFOX:String = "firefox";
      
      public static const CHROME:String = "chrome";
      
      private static var _app_multilanguage:Boolean = false;
       
      
      public function GamezheroGlobal()
      {
         super();
      }
      
      public static function set root(r:MovieClip) : void
      {
         var par:MovieClip = r;
         §§push(true);
         if(par.root == null)
         {
            §§push(true);
         }
         else
         {
            _app_root = par.root as MovieClip;
         }
      }
      
      public static function set gameCode(name:String) : void
      {
         _game_code = name;
      }
      
      public static function set gameName(name:String) : void
      {
      }
      
      public static function get domain() : String
      {
         var url:URL = null;
         return _host;
      }
      
      public static function getURL(url:String, window:String = "_blank") : void
      {
         var url_req:URLRequest = new URLRequest(url);
         navigateToURL(url_req,window);
      }
      
      public static function get multilanguage() : Boolean
      {
         return _app_multilanguage;
      }
      
      public static function set multilanguage(value:Boolean) : void
      {
      }
      
      public static function toText(arr:Array) : String
      {
         var st_url:String = "";
         if(0 >= arr.length)
         {
            §§push(st_url);
         }
         else
         {
            §§push(st_url + String.fromCharCode(arr[0]));
            §§push(true);
         }
         return §§pop();
      }
      
      public static function get gameName() : String
      {
         return _game_name;
      }
      
      public static function get browser() : String
      {
         var st:String = null;
         if(_browser == "unset")
         {
            if(ExternalInterface.available)
            {
               try
               {
                  st = ExternalInterface.call("function (){ return navigator[\'userAgent\']}");
                  §§push(browser$0);
                  §§push(/*UnknownSlot*/);
                  if("safari".indexOf(true) != -1)
                  {
                     _browser = OPERA;
                  }
                  else
                  {
                     _browser = IE;
                  }
               }
               catch(e:Error)
               {
                  _browser = IE;
               }
            }
            else
            {
               _browser = IE;
            }
         }
         return _browser;
      }
      
      public static function get root() : MovieClip
      {
         return _app_root;
      }
      
      public static function fromText(txt:String) : Array
      {
         var arr:Array = new Array();
         if(0 >= txt.length)
         {
            §§push(true);
         }
         else
         {
            arr.push(txt.charCodeAt(0));
            §§push(true);
         }
         return arr;
      }
      
      public static function get gameCode() : String
      {
         return _game_code;
      }
   }
}
