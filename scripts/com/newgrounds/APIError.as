package com.newgrounds
{
   import flash.utils.Dictionary;
   
   public class APIError
   {
      
      public static const aliases:Array = new Array("UNKNOWN_ERROR","INVALID_API_ID","MISSING_PARAM","INVALID_STAT_ID","INVALID_COMMAND_ID","FLASH_ADS_NOT_APPROVED","PERMISSION_DENIED","IDENTIFICATION_REQUIRED","INVALID_EMAIL_ADDRESS","BANNED_USER","SESSION_EXPIRED","INVALID_SCORE","INVALID_MEDAL","INVALID_FOLDER","FILE_NOT_FOUND","SITE_ID_REQUIRED","UPLOAD_IN_PROGRESS","USER_CANCELLED","CONFIRM_REQUEST","CONNECTION_FAILED");
      
      private static const always_caps:Array = new Array("API","URL","ID");
      
      public static const error_codes:Object = init_codes();
      
      public static const error_names:Object = method_161();
       
      
      public var code:Number = 0;
      
      public var message:String;
      
      public var name:String;
      
      public var alias:String;
      
      public function APIError(error:*, msg:String)
      {
         super();
         if(error is String)
         {
            error = error_codes[error];
         }
         else if(!(error is uint))
         {
            error = 0;
            §§push(false);
         }
         this.code = error;
         this.message = msg;
         this.name = error_names[error];
         this.alias = aliases[error];
      }
      
      public static function init_codes() : Dictionary
      {
         var result:Dictionary = new Dictionary();
         for(var i:uint = 0; i < aliases.length; i++)
         {
            result[aliases[i]] = i;
         }
         return result;
      }
      
      private static function method_161() : Array
      {
         var result:Array = new Array();
         if(0 < aliases.length)
         {
            §§push(true);
         }
         return result;
      }
      
      public function isError() : Boolean
      {
         return true;
      }
   }
}
