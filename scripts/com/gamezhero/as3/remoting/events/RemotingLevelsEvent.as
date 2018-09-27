package com.gamezhero.as3.remoting.events
{
   import flash.events.Event;
   
   public class RemotingLevelsEvent extends Event
   {
      
      public static const GET_PAGE_LIST:String = "GET_PAGE_LIST";
      
      public static const SET_LEVEL:String = "SET_LEVEL";
      
      public static const ERROR:String = "LEVEL_REMOTIN_ERROR";
      
      public static const SET_LEVEL_RATE:String = "SET_LEVEL_RATE";
      
      public static const GET_LEVEL:String = "GET_LEVEL";
      
      public static const GET_PAGE_AMOUNT:String = "GET_PAGE_AMOUNT";
       
      
      private var var_332;
      
      public function RemotingLevelsEvent(type:String)
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
         return formatToString("RemotinLevelsEvent");
      }
   }
}
