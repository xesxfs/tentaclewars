package com.gameallianz.api.as3.classes
{
   public class GameAllianzApiGameInfo
   {
       
      
      private var obj:Object;
      
      public function GameAllianzApiGameInfo(... arguments)
      {
         super();
         this.obj = new Object();
      }
      
      public function ini(... arguments) : void
      {
         this.obj = new Object();
         this.obj["site_name"] = arguments[0] as String;
         this.obj["partner_name"] = arguments[1] as String;
      }
      
      public function toObject() : Object
      {
         return this.obj;
      }
      
      public function fromObject(_obj:Object) : void
      {
         this.obj = new Object();
         this.obj["site_name"] = _obj["site_name"] as String;
         this.obj["partner_name"] = _obj["partner_name"] as String;
         this.obj["game_name"] = _obj["game_name"] as String;
         this.obj["game_multilanguage"] = _obj["game_multilanguage"] as Boolean;
         this.obj["game_languages"] = _obj["game_languages"] as Array;
         this.obj["game_language"] = _obj["game_language"] as String;
         this.obj["api_version"] = _obj["api_version"] as String;
         this.obj["capabilities"] = _obj["capabilities"] as String;
         this.obj["url"] = _obj["url"] as String;
      }
      
      public function get site_name() : String
      {
         return this.obj["site_name"];
      }
      
      public function get partner_name() : String
      {
         return this.obj["partner_name"];
      }
      
      public function get game_name() : String
      {
         return this.obj["game_name"];
      }
      
      public function get language() : String
      {
         return this.obj["game_language"];
      }
      
      public function set language(_value:String) : void
      {
         this.obj["game_language"] = _value;
      }
      
      public function get multilanguage() : Boolean
      {
         return this.obj["game_multilanguage"];
      }
      
      public function get languages() : Array
      {
         return this.obj["game_languages"];
      }
      
      public function get version() : String
      {
         return this.obj["api_version"];
      }
      
      public function get capabilities() : String
      {
         return this.obj["capabilities"];
      }
      
      public function get url() : String
      {
         return this.obj["url"];
      }
      
      public function get object() : Object
      {
         return this.obj;
      }
   }
}
