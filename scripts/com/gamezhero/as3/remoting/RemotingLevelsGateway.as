package com.gamezhero.as3.remoting
{
   import com.gamezhero.as3.crypto.MD5;
   import com.gamezhero.as3.remoting.events.RemotingLevelsEvent;
   import com.gamezhero.as3.remoting.structure.LevelStructure;
   import flash.events.NetStatusEvent;
   import flash.net.Responder;
   
   public class RemotingLevelsGateway
   {
      
      public static const SORT_BY_RATE:uint = 2;
      
      public static const ERROR:String = "REMOTING_LEVEL_ERROR";
      
      public static const SORT_BY_RATE_DEC:uint = 3;
      
      public static const SORT_BY_DATE:uint = 6;
      
      public static const SORT_BY_NAME:uint = 0;
      
      public static const SORT_BY_NAME_DEC:uint = 1;
      
      public static const SORT_BY_DATE_DEC:uint = 7;
      
      public static const SORT_BY_AUTHOR:uint = 4;
      
      public static const SORT_BY_AUTHOR_DEC:uint = 5;
       
      
      private var var_150:RemotingService;
      
      private var var_375:String;
      
      private var var_176:RemotingEventDispatcher;
      
      public function RemotingLevelsGateway(strServicePath:String = null)
      {
         super();
         trace("Init remoting, path = " + strServicePath);
         try
         {
            this.var_176 = new RemotingEventDispatcher();
            return;
         }
         catch(e:Error)
         {
            trace("Init remoting error");
            return;
         }
      }
      
      public function getPageList(gameID:Number, pageIndex:Number, amountInPage:Number, sortFlag:Number) : void
      {
         var responder:RemotingLevelResponder = new RemotingLevelResponder(RemotingLevelsEvent.GET_PAGE_LIST,this.method_77,this.method_78);
         this.var_150.call("levels.getPageList",responder as Responder,gameID,pageIndex,amountInPage,sortFlag);
      }
      
      public function getPagesAmount(gameID:Number, amountInPage:Number) : void
      {
         var responder:RemotingLevelResponder = new RemotingLevelResponder(RemotingLevelsEvent.GET_PAGE_AMOUNT,this.method_77,this.method_78);
         this.var_150.call("levels.getPagesAmount",responder as Responder,gameID,amountInPage);
      }
      
      public function setLevel(gameID:Number, levelID:Number, levelData:LevelStructure) : void
      {
         var responder:RemotingLevelResponder = new RemotingLevelResponder(RemotingLevelsEvent.SET_LEVEL,this.method_77,this.method_78);
         var code:String = new MD5().hash(gameID + levelData.level_name + levelData.level_value);
         var arr:Array = levelData.getArray();
         this.var_150.call("levels.setLevel",responder as Responder,gameID,levelID,arr,code);
      }
      
      public function removeEventListener(action:String, func:Function) : void
      {
         this.var_176.removeEventListener(action,func);
      }
      
      private function method_326(event:NetStatusEvent = null) : void
      {
         var evt:RemotingLevelsEvent = new RemotingLevelsEvent(RemotingLevelsEvent.ERROR);
         this.var_176.dispatchEvent(evt);
      }
      
      public function addEventListener(action:String, func:Function) : void
      {
         this.var_176.addEventListener(action,func);
      }
      
      public function getLevel(gameID:Number, levelID:String) : void
      {
         var responder:RemotingLevelResponder = new RemotingLevelResponder(RemotingLevelsEvent.GET_LEVEL,this.method_77,this.method_78);
         this.var_150.call("levels.getLevel",responder as Responder,gameID,levelID);
      }
      
      private function init(strServicePath:String = null) : void
      {
         this.var_375 = strServicePath;
         this.var_150 = new RemotingService(this.var_375);
         this.var_150.addEventListener(NetStatusEvent.NET_STATUS,this.method_326);
      }
      
      public function setLevelRate(gameID:Number, levelID:String, rate:Number) : void
      {
         var responder:RemotingLevelResponder = new RemotingLevelResponder(RemotingLevelsEvent.SET_LEVEL_RATE,this.method_77,this.method_78);
         var code:String = new MD5().hash(String(gameID + levelID + rate));
         this.var_150.call("levels.setLevelRate",responder as Responder,gameID,levelID,rate,code);
      }
      
      private function method_78(name:String, fault:Object) : void
      {
         var evt:RemotingLevelsEvent = new RemotingLevelsEvent(RemotingLevelsEvent.ERROR);
         evt.value = name;
         this.var_176.dispatchEvent(evt);
      }
      
      private function method_77(name:String, result:*) : void
      {
         var evt:RemotingLevelsEvent = new RemotingLevelsEvent(name);
         evt.value = result;
         this.var_176.dispatchEvent(evt);
      }
   }
}
