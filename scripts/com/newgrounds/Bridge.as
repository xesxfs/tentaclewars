package com.newgrounds
{
   import flash.events.Event;
   import flash.events.StatusEvent;
   import flash.net.LocalConnection;
   
   public class Bridge
   {
       
      
      private var var_319:LocalConnection;
      
      private var var_164:LocalConnection;
      
      private var var_232:String;
      
      public function Bridge(id:String)
      {
         super();
         this.var_232 = id;
         this.var_319 = new LocalConnection();
         this.var_164 = new LocalConnection();
         this.var_319.client = this;
         this.var_319.connect("rec_" + this.var_232);
         this.var_164.addEventListener(StatusEvent.STATUS,this.method_283);
      }
      
      public function sendCommand(command:String, parameters:Object) : void
      {
         if(this.var_164)
         {
            this.var_164.send(this.var_232,"sendCommand",command,this.scrubParameters(parameters));
         }
      }
      
      public function sendEvent(command:String, parameters:Object) : void
      {
         if(this.var_164)
         {
            this.var_164.send(this.var_232,"sendEvent",command,this.scrubParameters(parameters));
         }
      }
      
      public function receiveEvent(event:String, parameters:Object) : void
      {
         API.callListener(event,parameters.success,parameters.data);
      }
      
      public function scrubParameters(parameters:Object) : Object
      {
         var key:* = null;
         var outParameters:Object = new Object();
         for(key in parameters)
         {
            if(parameters[key] is String || parameters[key] is Number || parameters[key] is uint || parameters[key] is int || parameters[key] is Boolean)
            {
               outParameters[key] = parameters[key];
            }
         }
         return outParameters;
      }
      
      private function method_283(event:Event) : void
      {
      }
   }
}
