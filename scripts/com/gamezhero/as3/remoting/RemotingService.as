package com.gamezhero.as3.remoting
{
   import flash.net.NetConnection;
   import flash.net.ObjectEncoding;
   
   public class RemotingService extends NetConnection
   {
       
      
      public function RemotingService(url:String)
      {
         super();
         objectEncoding = ObjectEncoding.AMF3;
         connect(url);
      }
   }
}
