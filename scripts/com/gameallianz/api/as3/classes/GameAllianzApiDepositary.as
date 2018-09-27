package com.gameallianz.api.as3.classes
{
   import flash.utils.ByteArray;
   
   public class GameAllianzApiDepositary
   {
      
      private static var engineClass:Class = GameAllianzApiDepositary_engineClass;
       
      
      public function GameAllianzApiDepositary()
      {
         super();
      }
      
      public static function engineByteArray() : ByteArray
      {
         var byteArrayContent:ByteArray = null;
         try
         {
            byteArrayContent = new engineClass() as ByteArray;
         }
         catch(e:Error)
         {
         }
         return byteArrayContent;
      }
   }
}
