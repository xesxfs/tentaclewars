package com.gamezhero.api.as3
{
   import com.gamezhero.api.as3.events.GamePreloaderEvent;
   import com.gamezhero.api.as3.gui.Background;
   import com.gamezhero.api.as3.gui.Indicator;
   import com.google.analytics.GATracker;
   import flash.display.Loader;
   import flash.display.MovieClip;
   import flash.display.StageAlign;
   import flash.display.StageQuality;
   import flash.display.StageScaleMode;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.TimerEvent;
   import flash.net.URLRequest;
   import flash.utils.Dictionary;
   import flash.utils.Timer;
   
   public class GamePreloader extends MovieClip
   {
       
      
      private var _tracker:GATracker;
      
      private var var_249:uint = 2;
      
      private var var_206:Indicator;
      
      private var var_372:Number = 24;
      
      private var updatePosition:Function;
      
      private var setTarget:Function;
      
      private var updateProgress:Function;
      
      private var var_63:MovieClip;
      
      private var var_331:String;
      
      private var var_165:Number = 0;
      
      private var _obj:Object;
      
      private var var_370:String;
      
      private var var_389:Dictionary;
      
      private var var_103:MovieClip;
      
      private var _timer:Timer;
      
      private var var_143:Loader;
      
      private var var_291:Background;
      
      private var var_400:String;
      
      private var var_350:String;
      
      private var iniPreloader:Function;
      
      private var var_394:String = "null";
      
      private var var_255:Boolean = false;
      
      private var var_337:Number;
      
      private var getParams:Function;
      
      private var var_234:uint = 5;
      
      public function GamePreloader(par:MovieClip, iniObject:Object = null)
      {
         try
         {
            this.var_255 = this._obj["debug"];
         }
         catch(e:Error)
         {
            var_255 = false;
         }
         this.var_291 = new Background(this);
         this.var_206 = new Indicator(this);
         this.var_165 = this.var_63.loaderInfo.bytesLoaded / this.var_63.loaderInfo.bytesTotal;
         this.method_14();
         this.method_95();
         this.method_164();
      }
      
      private function method_324() : void
      {
         this.method_90();
         this._timer.addEventListener(TimerEvent.TIMER,this.method_183);
         this._timer.start();
         this.method_81();
      }
      
      private function method_54() : void
      {
         this.method_90();
         this._timer.addEventListener(TimerEvent.TIMER,this.method_116);
         this._timer.start();
      }
      
      private function method_95(event:Event = null) : void
      {
         this.removeEventListener(Event.ENTER_FRAME,this.method_95);
         try
         {
            this.method_208();
            this.method_108();
            this.method_293();
            if(this.var_255 == false)
            {
               this.method_187();
            }
            else
            {
               this.method_54();
            }
            return;
         }
         catch(e:Error)
         {
            var_234--;
            if(var_234 <= 0)
            {
               method_54();
            }
            else
            {
               this.addEventListener(Event.ENTER_FRAME,method_95);
            }
            return;
         }
      }
      
      private function method_208() : void
      {
         this.var_370 = stage.scaleMode;
      }
      
      public function trackClick() : void
      {
         this._tracker.trackEvent(GamezheroGlobal.gameName,"click","preloader");
      }
      
      private function method_81(event:Event = null) : void
      {
         var obj:Object = null;
         obj = new Object();
         try
         {
            obj.width = stage.stageWidth;
            obj.height = stage.stageHeight;
         }
         catch(e:Error)
         {
            obj.width = 550;
            obj.height = 400;
         }
         try
         {
            this.updatePosition(obj);
         }
         catch(e:Error)
         {
         }
         this.var_206.update(obj.width,obj.height);
         this.var_291.update(obj.width,obj.height);
      }
      
      private function method_14() : void
      {
         this.var_63.loaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this.method_147);
         this.var_63.loaderInfo.addEventListener(ProgressEvent.PROGRESS,this.method_141);
         this.var_143.contentLoaderInfo.addEventListener(Event.INIT,this.method_197);
         this.var_143.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this.method_148);
      }
      
      private function method_116(event:TimerEvent = null) : void
      {
         var proc:Number = NaN;
         this.method_108();
         proc = this.var_165;
         if(proc >= 1 && this.var_63.totalFrames != this.var_63.framesLoaded)
         {
            proc = 0.99;
         }
         this.var_206.setVal(Math.round(proc * 100) + " %");
         if(proc >= 1)
         {
            this._timer.removeEventListener(TimerEvent.TIMER,this.method_116);
            this.action();
         }
         event.updateAfterEvent();
      }
      
      private function method_252() : void
      {
         try
         {
            stage.removeEventListener(Event.RESIZE,this.method_81);
            return;
         }
         catch(e:Error)
         {
            return;
         }
      }
      
      private function method_284() : Object
      {
         var obj:UserInfo = new UserInfo(this.var_63);
         return obj as Object;
      }
      
      public function changeLanguage(value:String) : void
      {
      }
      
      public function action(evt:Event = null) : void
      {
         this.method_90();
         this._timer.addEventListener(TimerEvent.TIMER,this.method_156);
         this._timer.start();
      }
      
      private function method_164() : void
      {
         try
         {
            this._tracker = new GATracker(this,"UA-262190-1","AS3",false);
            return;
         }
         catch(e:Error)
         {
            return;
         }
      }
      
      private function method_183(event:TimerEvent = null) : void
      {
         var proc:Number = NaN;
         this.method_108();
         proc = this.var_165;
         proc = 0.99;
         try
         {
            this.updateProgress({"loaded":proc});
         }
         catch(e:Error)
         {
            trace("Error Update Progress of Preloader.");
            method_54();
         }
         event.updateAfterEvent();
      }
      
      private function method_108() : void
      {
         stage.scaleMode = StageScaleMode.NO_SCALE;
         stage.align = StageAlign.TOP_LEFT;
         stage.frameRate = this.var_372;
      }
      
      private function method_293() : void
      {
         stage.addEventListener(Event.RESIZE,this.method_81);
      }
      
      private function method_141(event:ProgressEvent = null) : void
      {
         try
         {
            this.var_165 = event.bytesLoaded / event.bytesTotal;
            return;
         }
         catch(e:Error)
         {
            var_165 = 0;
            return;
         }
      }
      
      private function method_30() : void
      {
         this.var_143.contentLoaderInfo.removeEventListener(Event.INIT,this.method_197);
         this.var_143.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,this.method_148);
         try
         {
            removeChild(this.var_103);
            return;
         }
         catch(e:Error)
         {
            return;
         }
      }
      
      private function method_187() : void
      {
         var url:String = GamezheroGlobal.toText([104,116,116,112,58,47,47,102,105,108,101,115,46,103,97,109,101,122,104,101,114,111,46,99,111,109,47,112,114,101,108,111,97,100,101,114,47,97,115,51,47,112,114,101,108,111,97,100,101,114,46,115,119,102,63]) + String(new Date().getTime());
         var request:URLRequest = new URLRequest(url);
         try
         {
            this.var_143.load(request);
            return;
         }
         catch(e:Error)
         {
            method_54();
            return;
         }
      }
      
      private function method_197(event:Event = null) : void
      {
         var /*UnknownSlot*/:* = true;
         this.var_103 = this.var_143.content as MovieClip;
         addChild(this.var_103);
         this.iniPreloader = this.var_103["iniPreloader"] as Function;
         this.updateProgress = this.var_103["updateProgress"] as Function;
         this.updatePosition = this.var_103["updatePosition"] as Function;
         this.getParams = this.var_103["getParams"] as Function;
         this.setTarget = this.var_103["setTarget"] as Function;
         var infoObj:Object = this.method_284();
         try
         {
            this.setTarget(this);
         }
         catch(e:Error)
         {
            trace("Error Set Target.");
         }
         try
         {
            var paramsObj:Object = this.getParams(infoObj);
            var evnt:GamePreloaderEvent = new GamePreloaderEvent(GamePreloaderEvent.PARAMS);
            evnt.value = paramsObj;
            return;
         }
         catch(e:Error)
         {
            trace("Error Get Params.");
         }
         try
         {
            this.iniPreloader(infoObj);
            this.method_324();
            return;
         }
         catch(e:Error)
         {
            trace("Error Ini Preloader.");
            method_54();
            return;
         }
      }
      
      private function method_148(IOErrorEvent:Event = null) : void
      {
         try
         {
            "preloader".trackEvent("loading_error_",true,GamezheroGlobal.gameName);
         }
         catch(e:Error)
         {
         }
         if(this.var_249 <= 0)
         {
            this.method_54();
         }
         else
         {
            this.method_187();
            §§push(true);
         }
      }
      
      private function method_156(event:TimerEvent = null) : void
      {
         var evnt:GamePreloaderEvent = null;
         this.alpha = this.alpha - 1;
         if(this.alpha <= 1)
         {
            this.alpha = 0;
            this.method_30();
            this.method_252();
            this.method_90();
            this.method_298();
            evnt = new GamePreloaderEvent(GamePreloaderEvent.FINISH);
            this.dispatchEvent(evnt);
            this.var_206.remove();
            this.var_291.remove();
            this.var_63.removeChild(this);
            §§push(true);
         }
         event.updateAfterEvent();
      }
      
      private function method_147(event:IOErrorEvent = null) : void
      {
         this.method_54();
      }
      
      private function method_90() : void
      {
         this._timer.removeEventListener(TimerEvent.TIMER,this.method_183);
         this._timer.removeEventListener(TimerEvent.TIMER,this.method_116);
         this._timer.removeEventListener(TimerEvent.TIMER,this.method_156);
      }
      
      private function method_298() : void
      {
         stage.align = this.var_350;
         stage.quality = this.var_331;
      }
   }
}
