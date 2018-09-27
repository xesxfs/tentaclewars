package com.newgrounds.components
{
   import com.newgrounds.API;
   import com.newgrounds.APIError;
   import com.newgrounds.APIEvent;
   import flash.display.DisplayObject;
   import flash.display.Loader;
   import flash.display.MovieClip;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.MouseEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.system.ApplicationDomain;
   import flash.system.LoaderContext;
   import flash.system.Security;
   import flash.utils.getQualifiedClassName;
   import flash.utils.getTimer;
   
   public class FlashAd extends Sprite
   {
      
      private static const DEBUG_AD_URL:String = "http://www.ngads.com/adtest.php";
      
      private static var _adResetTime:uint = 0;
      
      private static var _adURL:URLRequest;
      
      private static const REMOVED_FROM_STAGE:String = "removedFromStage";
       
      
      public var background:MovieClip;
      
      private var var_278:Boolean;
      
      private var var_154:URLLoader;
      
      private var var_45:Sprite;
      
      private var _mask:Shape;
      
      private var var_47:Loader;
      
      public function FlashAd(showBackground:Boolean = true)
      {
         this.var_45.graphics.endFill();
         this._mask = new Shape();
         this._mask.graphics.beginFill(0);
         this._mask.graphics.moveTo(0,0);
         §§push(true);
         §§push(true);
         if(this.background)
         {
            if(this.background.ngLinkButton)
            {
               this.background.ngLinkButton.addEventListener(MouseEvent.CLICK,this.method_255);
            }
            if(this.background.loadingClip)
            {
               this.background.loadingClip.visible = false;
            }
         }
         if(API.isFlashVersion(9,0,28))
         {
            addEventListener(REMOVED_FROM_STAGE,this.method_192);
         }
         this.method_131(API.adFeedURL);
         this.showBackground = showBackground;
      }
      
      public function get showBackground() : Boolean
      {
         return this.var_278;
      }
      
      public function set showBackground(value:Boolean) : void
      {
         this.var_278 = value;
         §§push(true);
         if(this.background)
         {
            this.background.visible = value;
            this.var_45.mask = !!value?this.background.adMask:null;
         }
      }
      
      public function removeAd() : void
      {
         removeEventListener(REMOVED_FROM_STAGE,this.method_192);
         §§push(Boolean(this.background));
         if(Boolean(this.background))
         {
            §§push(true);
         }
         this.background.loadingClip.visible = false;
         if(this.var_154)
         {
            try
            {
               this.var_154.close();
            }
            catch(e:Error)
            {
            }
         }
         if(this.var_45)
         {
            this.var_45.visible = false;
         }
         if(this.var_47)
         {
            trace("[NewgroundsAPI] :: Ad removed");
            try
            {
               this.var_47.close();
            }
            catch(e:Error)
            {
            }
            try
            {
               Object(this.var_47).unloadAndStop(true);
            }
            catch(e:Error)
            {
               var_47.unload();
            }
            if(this.var_47.parent)
            {
               this.var_47.parent.removeChild(this.var_47);
            }
         }
         this.var_47 = null;
      }
      
      private function method_152(e:APIEvent) : void
      {
         API.removeEventListener(APIEvent.ADS_APPROVED,this.method_152,false);
         if(e.success)
         {
            this.method_131(API.adFeedURL);
            §§push(false);
         }
         else
         {
            trace("[NewgroundsAPI] :: No ad feed URL supplied to Newgrounds API ad!");
         }
      }
      
      private function method_131(adFeedURL:String) : void
      {
         this.var_154 = new URLLoader();
         this.var_154.addEventListener(Event.COMPLETE,this.method_253);
         this.var_154.addEventListener(IOErrorEvent.IO_ERROR,this.method_74);
         this.var_154.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.method_74);
         if(!adFeedURL)
         {
            trace("[Newgrounds API] :: Invalid feed URL!");
            return;
         }
         if(this.method_246)
         {
            if(adFeedURL.indexOf("?") > -1)
            {
               _adURL = new URLRequest(adFeedURL + "&random=" + Math.random());
            }
            else
            {
               _adURL = new URLRequest(adFeedURL + "?random=" + Math.random());
            }
         }
         try
         {
            this.var_154.load(_adURL);
         }
         catch(e:Error)
         {
            method_74(null);
         }
      }
      
      private function method_272(url:String) : void
      {
         if(this.var_47)
         {
            this.removeAd();
         }
         this.var_47 = new Loader();
         this.var_47.contentLoaderInfo.addEventListener(Event.COMPLETE,this.method_279);
         this.var_47.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this.method_74);
         try
         {
            Object(this.var_47.contentLoaderInfo).uncaughtErrorEvents.addEventListener("uncaughtError",function(event:Event):void
            {
            });
         }
         catch(error:Error)
         {
         }
         this.var_47.load(new URLRequest(url),new LoaderContext(false,new ApplicationDomain(null)));
         if(this.background && this.background.loadingClip)
         {
            this.background.loadingClip.visible = true;
         }
      }
      
      private function method_253(e:Event) : void
      {
         var loader:URLLoader = URLLoader(e.target);
      }
      
      private function method_329(e:Event) : void
      {
         this.background.loadingClip.visible = false;
      }
      
      private function method_74(e:Event) : void
      {
         dispatchEvent(new APIEvent(APIEvent.AD_ATTACHED,false,new APIError("FLASH_ADS_NOT_APPROVED","Unable to render ad")));
      }
      
      private function method_279(e:Event) : void
      {
         this.var_45.addChild(this.var_47);
         this.var_47.mask = this._mask;
         this.var_45.visible = true;
         if(this.background)
         {
            if(this.var_278)
            {
               this.var_45.mask = this.background.adMask;
            }
            if(this.background.loadingClip)
            {
               this.background.loadingClip.visible = false;
            }
         }
         trace("[NewgroundsAPI] :: Ad loaded!");
         dispatchEvent(new APIEvent(APIEvent.AD_ATTACHED,true));
      }
      
      private function method_192(e:Event) : void
      {
         this.removeAd();
      }
      
      private function get method_246() : Boolean
      {
         if(getTimer() >= _adResetTime)
         {
            _adResetTime = getTimer() + 1000 * 60 * 5;
            return true;
         }
         return false;
      }
      
      private function method_255(event:MouseEvent) : void
      {
         API.loadNewgrounds();
      }
   }
}
