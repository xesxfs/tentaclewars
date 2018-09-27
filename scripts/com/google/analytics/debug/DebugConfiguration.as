package com.google.analytics.debug
{
   import com.google.analytics.core.GIFRequest;
   import flash.net.URLRequest;
   import flash.utils.getTimer;
   
   public class DebugConfiguration
   {
       
      
      public var showHideKey:Number = 32.0;
      
      private var _mode:VisualDebugMode;
      
      private var _verbose:Boolean = false;
      
      public var destroyKey:Number = 8.0;
      
      public var GIFRequests:Boolean = false;
      
      public var showInfos:Boolean = true;
      
      public var infoTimeout:Number = 1000;
      
      public var minimizedOnStart:Boolean = false;
      
      private var _active:Boolean = false;
      
      public var traceOutput:Boolean = false;
      
      public var layout:ILayout;
      
      public var warningTimeout:Number = 1500;
      
      public var javascript:Boolean = false;
      
      public var showWarnings:Boolean = true;
      
      private var _visualInitialized:Boolean = false;
      
      public function DebugConfiguration()
      {
         this._mode = VisualDebugMode.basic;
         super();
      }
      
      public function get verbose() : Boolean
      {
         return this._verbose;
      }
      
      public function set verbose(value:Boolean) : void
      {
         this._verbose = value;
      }
      
      public function set mode(value:*) : void
      {
         if(value is String)
         {
            switch(value)
            {
               case "geek":
                  value = VisualDebugMode.geek;
                  break;
               case "advanced":
                  value = VisualDebugMode.advanced;
                  break;
               default:
               case "basic":
                  value = VisualDebugMode.basic;
            }
         }
         this._mode = value;
      }
      
      public function success(message:String) : void
      {
         if(this.layout)
         {
            this.layout.createSuccessAlert(message);
         }
         if(this.traceOutput)
         {
            this.trace("[+] " + message + " !!");
         }
      }
      
      public function get active() : Boolean
      {
         return this._active;
      }
      
      private function _initializeVisual() : void
      {
         if(this.layout)
         {
            this.layout.init();
            this._visualInitialized = true;
         }
      }
      
      private function _destroyVisual() : void
      {
         if(this.layout && this._visualInitialized)
         {
            this.layout.destroy();
         }
      }
      
      public function warning(message:String, mode:VisualDebugMode = null) : void
      {
         if(this._filter(mode))
         {
            return;
         }
         if(this.layout && this.showWarnings)
         {
            this.layout.createWarning(message);
         }
         if(this.traceOutput)
         {
            this.trace("## " + message + " ##");
         }
      }
      
      private function _filter(mode:VisualDebugMode = null) : Boolean
      {
         return mode && int(mode) >= int(this.mode);
      }
      
      public function failure(message:String) : void
      {
         if(this.layout)
         {
            this.layout.createFailureAlert(message);
         }
         if(this.traceOutput)
         {
            this.trace("[-] " + message + " !!");
         }
      }
      
      public function get mode() : *
      {
         return this._mode;
      }
      
      public function set active(value:Boolean) : void
      {
         this._active = value;
         if(this._active)
         {
            this._initializeVisual();
         }
         else
         {
            this._destroyVisual();
         }
      }
      
      protected function trace(message:String) : void
      {
         var msgs:Array = null;
         var j:int = 0;
         var messages:Array = [];
         var pre0:* = "";
         var pre1:* = "";
         if(this.mode == VisualDebugMode.geek)
         {
            pre0 = getTimer() + " - ";
            pre1 = new Array(pre0.length).join(" ") + " ";
         }
         if(message.indexOf("\n") > -1)
         {
            msgs = message.split("\n");
            for(j = 0; j < msgs.length; j++)
            {
               if(msgs[j] != "")
               {
                  if(j == 0)
                  {
                     messages.push(pre0 + msgs[j]);
                  }
                  else
                  {
                     messages.push(pre1 + msgs[j]);
                  }
               }
            }
         }
         else
         {
            messages.push(pre0 + message);
         }
         var len:int = messages.length;
         for(var i:int = 0; i < len; i++)
         {
            trace(messages[i]);
         }
      }
      
      public function alert(message:String) : void
      {
         if(this.layout)
         {
            this.layout.createAlert(message);
         }
         if(this.traceOutput)
         {
            this.trace("!! " + message + " !!");
         }
      }
      
      public function info(message:String, mode:VisualDebugMode = null) : void
      {
         if(this._filter(mode))
         {
            return;
         }
         if(this.layout && this.showInfos)
         {
            this.layout.createInfo(message);
         }
         if(this.traceOutput)
         {
            this.trace(message);
         }
      }
      
      public function alertGifRequest(message:String, request:URLRequest, ref:GIFRequest) : void
      {
         if(this.layout)
         {
            this.layout.createGIFRequestAlert(message,request,ref);
         }
         if(this.traceOutput)
         {
            this.trace(">> " + message + " <<");
         }
      }
   }
}
