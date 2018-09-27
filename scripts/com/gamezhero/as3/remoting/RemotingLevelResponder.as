package com.gamezhero.as3.remoting
{
   import flash.net.Responder;
   
   public class RemotingLevelResponder extends Responder
   {
       
      
      public var func_res:Function;
      
      public var name:String = null;
      
      public var func_status:Function;
      
      public function RemotingLevelResponder(n:String, result:Function, status:Function = null)
      {
         this.name = n;
         this.func_res = result;
         this.func_status = status;
         super(this.method_263,this.method_281);
      }
      
      private function method_263(value:*) : void
      {
      }
      
      private function method_281(value:*) : void
      {
      }
   }
}
