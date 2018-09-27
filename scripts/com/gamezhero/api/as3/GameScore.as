package com.gamezhero.api.as3
{
   import com.gamezhero.api.as3.events.GamePreloaderEvent;
   import com.gamezhero.api.as3.gui.Background;
   import com.gamezhero.api.as3.gui.Indicator;
   import flash.display.Loader;
   import flash.display.MovieClip;
   import flash.display.StageAlign;
   import flash.display.StageQuality;
   import flash.display.StageScaleMode;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.net.URLRequest;
   import flash.net.URLVariables;
   
   public class GameScore extends MovieClip
   {
      
      private static var FLAG_CLOSE:Number = 0;
      
      public static const SUBMIT_MODE:String = "submit_mode";
      
      private static var FLAG_ERROR:Number = 2;
      
      public static const CLOSE:String = "gamezhero_close";
      
      private static var FLAG_SEND:Number = 1;
      
      public static const VIEW_MODE:String = "view_mode";
       
      
      private var var_63:MovieClip;
      
      private var var_337:Number;
      
      private var var_206:Indicator;
      
      private var var_372:Number = 24;
      
      private var var_320:Number = 2;
      
      private var var_331:String;
      
      private var var_368:Function;
      
      private var var_373:Function;
      
      private var _loader:URLVariables;
      
      private var var_370:String;
      
      private var var_114:MovieClip;
      
      private var var_334:Function;
      
      private var iniEngineForSkin:Function;
      
      private var var_277:Number = 2;
      
      private var var_141:UserInfo;
      
      private var var_369:Number = 0;
      
      private var var_348:String = "submit_mode";
      
      private var var_94:MovieClip;
      
      private var var_387:Object;
      
      private var var_399:String = "null";
      
      private var var_291:Background;
      
      private var var_385:Object;
      
      private var var_138:Loader;
      
      private var var_350:String;
      
      private var var_152:Loader;
      
      private var iniSkinForEngine:Function;
      
      public function GameScore(g:MovieClip, mode:String, score:Number = 0)
      {
         this.var_138 = new Loader();
         this.var_152 = new Loader();
         this.var_387 = new Object();
         this.var_385 = new Object();
         this._loader = new URLVariables();
         super();
         this.var_63 = g;
         this.var_63.addChild(this);
         this.var_369 = score;
         this.var_348 = mode;
         this.method_108();
         this.var_291 = new Background(this);
         this.var_206 = new Indicator(this);
         this.method_14();
         this.method_160();
      }
      
      private function method_160() : void
      {
         var url:String = GamezheroGlobal.toText([104,116,116,112,58,47,47,102,105,108,101,115,46,103,97,109,101,122,104,101,114,111,46,99,111,109,47,115,99,111,114,101,47,115,107,105,110,47,97,115,51,47,115,107,105,110,46,115,119,102,63]) + String(new Date().getTime());
         var request:URLRequest = new URLRequest(url);
         try
         {
            this.var_138.load(request);
            return;
         }
         catch(e:Error)
         {
            method_65(FLAG_ERROR);
            return;
         }
      }
      
      public function close(val:Number) : void
      {
         this.method_65(val);
      }
      
      private function method_132(IOErrorEvent:Event = null) : void
      {
         this.var_320--;
         if(this.var_320 <= 0)
         {
            this.method_65(FLAG_ERROR);
         }
         else
         {
            this.method_10();
         }
      }
      
      private function method_65(val:Number) : void
      {
         try
         {
            this.removeChild(this.var_94);
         }
         catch(e:Error)
         {
         }
         try
         {
            this.removeChild(this.var_114);
         }
         catch(e:Error)
         {
         }
         try
         {
            this.var_206.remove();
         }
         catch(e:Error)
         {
         }
         this.method_237();
         this.method_30();
         evt.value = val;
         dispatchEvent(evt);
         try
         {
            this.var_63.removeChild(this);
            return;
         }
         catch(e:Error)
         {
            return;
         }
      }
      
      private function method_14() : void
      {
         stage.addEventListener(Event.RESIZE,this.method_81);
         this.method_81();
         this.var_138.contentLoaderInfo.addEventListener(Event.INIT,this.method_178);
         this.var_138.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this.method_181);
         this.var_152.contentLoaderInfo.addEventListener(Event.INIT,this.method_151);
         this.var_152.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this.method_132);
      }
      
      private function method_331() : void
      {
      }
      
      private function method_284() : UserInfo
      {
         var obj:UserInfo = new UserInfo(this.var_63);
         return obj;
      }
      
      private function method_178(event:Event = null) : void
      {
      }
      
      private function method_81(event:Event = null) : void
      {
         var obj:Object = null;
         obj = new Object();
         try
         {
            /*UnknownSlot*/.height = stage.stageHeight;
         }
         catch(e:Error)
         {
            obj.height = 400;
         }
         try
         {
            this.var_368.call(null,obj);
         }
         catch(e:Error)
         {
         }
         this.var_291.update(obj.width,obj.height);
         this.var_206.update(obj.width,obj.height);
      }
      
      private function method_108() : void
      {
         this.var_370 = stage.scaleMode;
         this.var_350 = stage.align;
         stage.quality = StageQuality.HIGH;
      }
      
      private function method_30() : void
      {
         try
         {
            stage.removeEventListener(Event.RESIZE,this.method_81);
         }
         catch(e:Error)
         {
         }
         this.var_138.contentLoaderInfo.removeEventListener(Event.INIT,this.method_178);
         this.var_138.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,this.method_181);
         this.var_152.contentLoaderInfo.removeEventListener(Event.INIT,this.method_151);
      }
      
      private function method_151(event:Event = null) : void
      {
         this.var_114 = this.var_152.content as MovieClip;
         addChild(this.var_114);
         this.method_309();
      }
      
      private function method_237() : void
      {
         stage.scaleMode = this.var_370;
         stage.align = this.var_350;
         stage.frameRate = this.var_337;
         stage.quality = this.var_331;
      }
      
      private function method_10() : void
      {
         var d:Date = null;
         var url:String = GamezheroGlobal.toText([104,116,116,112,58,47,47,102,105,108,101,115,46,103,97,109,101,122,104,101,114,111,46,99,111,109,47,115,99,111,114,101,47,101,110,103,105,110,101,47,97,115,51,47,101,110,103,105,110,101,46,115,119,102,63]) + String(new Date().getTime());
         var request:URLRequest = new URLRequest(url);
         try
         {
            this.var_152.load(request);
            return;
         }
         catch(e:Error)
         {
            method_65(FLAG_ERROR);
            return;
         }
      }
      
      private function method_181(IOErrorEvent:Event = null) : void
      {
         this.var_277--;
         if(this.var_277 <= 0)
         {
            this.method_65(FLAG_ERROR);
            §§push(true);
         }
         else
         {
            this.method_160();
         }
      }
      
      private function method_309() : void
      {
         this.var_373 = this.var_94["setTarget"];
         this.iniEngineForSkin = this.var_94["iniEngineForSkin"];
         this.var_368 = this.var_94["updatePosition"];
         this.var_334 = this.var_114["setTarget"];
         this.iniSkinForEngine = this.var_114["iniSkinForEngine"];
         this.var_141 = this.method_284();
         this.var_141["score"] = this.var_369;
         "mode"[true] = this.var_94;
         this.var_141["engine"] = this.var_114;
         try
         {
            this.var_373.call(this.var_94,this);
            true.call(this.var_114,this);
            this.iniSkinForEngine.call(this.var_114,Object(this.var_141));
            this.method_81();
            return;
         }
         catch(e:Error)
         {
            trace("Error. GameScore. Error Set Target For Skin");
         }
         try
         {
            this.var_334.call(this.var_114,this);
            this.iniSkinForEngine.call(this.var_114,Object(this.var_141));
         }
         catch(e:Error)
         {
            trace("Error. GameScore. Error Set Target For Engine");
         }
         this.method_81();
      }
   }
}
