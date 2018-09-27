package com.gameallianz.api.as3.utils
{
   import flash.external.ExternalInterface;
   import flash.text.Font;
   import flash.utils.describeType;
   
   public class FireBugConsole
   {
      
      public static var enabled:Boolean = true;
      
      public static var _isExternalInterfaceAvailable:Boolean;
      
      public static var isInit:Boolean;
       
      
      public function FireBugConsole()
      {
         super();
      }
      
      public static function get isExternalInterfaceAvailable() : Boolean
      {
         if(!isInit)
         {
            _isExternalInterfaceAvailable = ExternalInterface.available;
            isInit = true;
         }
         return _isExternalInterfaceAvailable;
      }
      
      public static function log(... rest) : void
      {
         send("log",rest);
      }
      
      public static function debug(... rest) : void
      {
         send("debug",rest);
      }
      
      public static function warn(... rest) : void
      {
      }
      
      public static function info(... rest) : void
      {
      }
      
      public static function error_1(... rest) : void
      {
      }
      
      public static function assert(... rest) : void
      {
         send("assert",rest);
      }
      
      public static function dir(object:Object) : void
      {
      }
      
      public static function dirxml(object:XML) : void
      {
         send("dirxml",[object]);
      }
      
      public static function traceStack() : void
      {
         send("trace");
      }
      
      public static function group(... rest) : void
      {
      }
      
      public static function groupEnd() : void
      {
         send("groupEnd",[]);
      }
      
      public static function time(name:String) : void
      {
         send("time",[name]);
      }
      
      public static function timeEnd(name:String) : void
      {
         send("timeEnd",[name]);
      }
      
      public static function profile(title:String) : void
      {
      }
      
      public static function profileEnd() : void
      {
      }
      
      public static function count(name:String = null) : void
      {
         send("count",!!name?[name]:[]);
      }
      
      public static function dumpAvailableFonts() : void
      {
         var f:Font = null;
         debug("--- < Available Fonts > ---");
         var embeddedFonts:Array = Font.enumerateFonts(false);
         for(var i:uint = 0; i < embeddedFonts.length; i++)
         {
            f = embeddedFonts[i];
            debug(f.fontName);
         }
         debug("--- </Available Fonts > ---");
      }
      
      private static function send(level:String, ... rest) : void
      {
         if(enabled)
         {
            if(isExternalInterfaceAvailable)
            {
               try
               {
                  ExternalInterface.call("console." + level,rest[0]);
                  return;
               }
               catch(e:Error)
               {
                  return;
               }
            }
         }
      }
      
      public static function describeObject(obj:Object) : String
      {
         return describeType(obj).@name.toString();
      }
      
      public static function logDescribe(obj:Object, ... rest) : void
      {
         log(describeObject(obj),rest);
      }
      
      public static function disable() : void
      {
         enabled = false;
      }
      
      public static function enable() : void
      {
         enabled = true;
      }
      
      private static function method_17(o:Object) : Object
      {
         var n:* = undefined;
         if(o is XML)
         {
            o = o.toString();
         }
         else
         {
            for(n in o)
            {
               return method_17(o[n]);
            }
         }
         return o;
      }
   }
}
