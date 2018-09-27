package com.gameallianz.api.as3.interfaces
{
   import flash.display.Stage;
   
   public interface IProtectMetodsInterface
   {
       
      
      function toText(param1:Array) : String;
      
      function fromText(param1:String) : Array;
      
      function checkApp(param1:Stage) : void;
   }
}
