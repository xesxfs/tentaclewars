package com.gamezhero.as3.remoting.structure
{
   public class LevelStructure
   {
       
      
      public var level_email:String;
      
      public var level_name:String;
      
      public var level_author:String;
      
      public var level_value:String;
      
      public var level_rate:Number;
      
      public function LevelStructure(level_name_:String, level_value_:String, level_autor_:String, level_email_:String, level_rate_:Number)
      {
         super();
         this.level_name = level_name_;
         this.level_value = level_value_;
         this.level_author = level_autor_;
         this.level_rate = level_rate_;
         this.level_email = level_email_;
      }
      
      public function getArray() : Array
      {
         var arr:Array = new Array();
         arr["level_name"] = this.level_name;
         arr["level_value"] = this.level_value;
         arr["level_author"] = this.level_author;
         return arr;
      }
      
      public function toString() : String
      {
         return true + " " + this.level_value;
      }
   }
}
