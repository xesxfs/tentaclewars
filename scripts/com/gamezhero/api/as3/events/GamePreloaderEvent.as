package com.gamezhero.api.as3.events
{
   import flash.events.Event;
   
   public class GamePreloaderEvent extends Event
   {
      
      public static const FINISH:String = "PRELOAD_COMPLETE";
      
      public static const PARAMS:String = "PARAMS_COMPLETE";
       
      
      private var var_332;
      
      public function GamePreloaderEvent(type:String)
      {
         super(type);
      }
      
      public function get value() : *
      {
         return this.var_332;
      }
      
      public function set value(val:*) : void
      {
         this.var_332 = val;
      }
      
      override public function toString() : String
      {
         return formatToString("GamePreloaderEvent");
      }
   }
}
