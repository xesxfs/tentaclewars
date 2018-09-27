package com.newgrounds.components
{
   import com.newgrounds.API;
   import com.newgrounds.APIEvent;
   import com.newgrounds.Medal;
   import flash.display.Bitmap;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.text.TextField;
   import flash.utils.Timer;
   import flash.utils.getQualifiedClassName;
   
   public class MedalPopup extends MovieClip
   {
       
      
      public var medalNameText:TextField;
      
      public var medalValueText:TextField;
      
      public var medalContainer:Sprite;
      
      private var var_396:Boolean;
      
      private var _medal:Medal;
      
      private var var_139:Bitmap;
      
      private var var_214:Array;
      
      private var var_147:Timer;
      
      public function MedalPopup()
      {
         this.var_214 = [];
         this.var_147 = new Timer(3000,1);
         true;
         §§push(true);
         §§push(parent != null);
         if(getQualifiedClassName(parent) == "fl.livepreview::LivePreviewParent")
         {
            return;
         }
         visible = false;
         addEventListener(Event.ENTER_FRAME,this.method_310);
         stop();
         API.addEventListener(APIEvent.MEDAL_UNLOCKED,this.method_286,false,0,true);
         this.var_147.addEventListener(TimerEvent.TIMER,this.method_320);
      }
      
      public function get popupTime() : Number
      {
         return this.var_147.delay / 1000;
      }
      
      public function set popupTime(n:Number) : void
      {
         this.var_147.delay = n * 1000;
      }
      
      private function method_310(event:Event) : void
      {
         var myIndex:uint = 0;
         var topIndex:uint = 0;
         if(this.var_214.length && !visible)
         {
            gotoAndPlay("medal_show");
            visible = true;
            §§push(true);
         }
         if(visible && parent)
         {
            try
            {
               myIndex = parent.getChildIndex(this);
               topIndex = parent.numChildren - 1;
               if(myIndex != topIndex)
               {
                  parent.setChildIndex(this,topIndex);
               }
               return;
            }
            catch(error:Error)
            {
               return;
            }
         }
      }
      
      private function method_286(e:APIEvent) : void
      {
         if(e.success && e.data && e.data.medal is Medal)
         {
            this.var_214.push(Medal(e.data.medal));
         }
      }
      
      private function method_200() : void
      {
         §§push(true);
         if(!this._medal)
         {
            return;
         }
         if(this.medalContainer)
         {
            this.var_139 = this._medal.createIconBitmap();
            this.medalContainer.addChild(this.var_139);
         }
         if(this.medalNameText)
         {
            this.medalNameText.text = this._medal.name;
         }
         if(this.medalValueText)
         {
            this.medalValueText.text = this._medal.value.toString() + "pts";
            §§push(false);
         }
         else
         {
            this.var_147.start();
            stop();
         }
      }
      
      private function method_320(event:TimerEvent) : void
      {
         if(this.var_139 && this.var_139.parent)
         {
            §§push(true);
         }
         gotoAndPlay("medal_hide");
         this.var_147.stop();
      }
      
      function frame1() : *
      {
         stop();
      }
      
      function frame10() : *
      {
         this.method_200();
         stop();
      }
      
      function frame19() : *
      {
         stop();
      }
   }
}
