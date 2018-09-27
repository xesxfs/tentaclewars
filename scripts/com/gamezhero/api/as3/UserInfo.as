package com.gamezhero.api.as3
{
   import flash.display.MovieClip;
   import flash.display.Stage;
   import flash.external.ExternalInterface;
   import flash.system.Capabilities;
   
   public class UserInfo
   {
       
      
      public var engine:MovieClip;
      
      public var game_multilanguage:Boolean;
      
      public var game_language:String;
      
      public var skin:MovieClip;
      
      public var game_languages:Array;
      
      public var ad_zone:String = "preloader";
      
      public var score:Number;
      
      public var game_code:String;
      
      public var flash_vars:Object;
      
      public var flash_height:Number;
      
      public var referrer:String;
      
      public var flash_url:String;
      
      public var mode:String;
      
      public var browser:String;
      
      public var href:String;
      
      public var game_domain:String;
      
      private var var_63:MovieClip;
      
      public var api_version:String = "AS3 - v4.0";
      
      public var capabilities:String;
      
      public var flash_width:Number;
      
      public var flash_domain:String;
      
      public var publisher:String = "gamezhero";
      
      public var game_name:String;
      
      public function UserInfo(g:MovieClip)
      {
         super();
         this.method_277();
      }
      
      private function method_277() : void
      {
         var i:String = null;
         this["publisher"] = "gamezhero";
         this["ad_zone"] = "preloader";
         this["api_version"] = "AS3 - v4.0";
         this["flash_vars"] = new Object();
         this["capabilities"] = Capabilities.serverString;
         §§push(true);
         if(ExternalInterface.available)
         {
            try
            {
               this["href"] = ExternalInterface.call("function (){return document.location.href}");
            }
            catch(e:Error)
            {
            }
            try
            {
               this["browser"] = ExternalInterface.call("function (){var st = \'\'; for (i in navigator){ if (typeof(navigator[i])!=\'function\'){ st+=i+\'=\'+navigator[i]+\'&\'; }} return st}");
            }
            catch(e:Error)
            {
            }
            try
            {
               this["referrer"] = ExternalInterface.call("function (){return document.referrer}");
            }
            catch(e:Error)
            {
               this["referrer"] = "-1";
            }
         }
         else
         {
            this["href"] = "-1";
            this["browser"] = "-1";
            this["referrer"] = "-1";
            §§push(true);
         }
         this["flash_domain"] = GamezheroGlobal.domain;
         var _stage:Stage = GamezheroGlobal.root.stage;
         try
         {
            this["flash_width"] = _stage.stageWidth;
            this["flash_height"] = _stage.stageHeight;
            this["flash_url"] = _stage.root.loaderInfo.url;
         }
         catch(e:Error)
         {
         }
         try
         {
            for(i in _stage.root.loaderInfo.parameters)
            {
               this["flash_vars"][i] = _stage.root.loaderInfo.parameters[i];
            }
         }
         catch(e:Error)
         {
         }
         this["game_name"] = GamezheroGlobal.gameName;
         this["game_code"] = GamezheroGlobal.gameCode;
         this["game_domain"] = GamezheroGlobal.domain;
         this["game_language"] = GamezheroDictionary.language;
         this["game_languages"] = GamezheroDictionary.languages;
         this["game_multilanguage"] = GamezheroGlobal.multilanguage;
      }
   }
}
