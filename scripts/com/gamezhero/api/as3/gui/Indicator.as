package com.gamezhero.api.as3.gui
{
   import flash.display.MovieClip;
   import flash.events.TimerEvent;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import flash.utils.Timer;
   
   public class Indicator extends MovieClip
   {
       
      
      private var _timer:Timer;
      
      private var var_63:MovieClip;
      
      private var var_206:MovieClip;
      
      private var var_362:Number;
      
      private var var_98:TextField;
      
      private var _arr:Array;
      
      private var var_295:uint = 10;
      
      private var var_242:Timer;
      
      private var var_205:Number = 0;
      
      public function Indicator(g:MovieClip)
      {
         this.var_362 = 360 / this.var_295;
         this._arr = new Array();
         super();
         this.var_63 = g;
         this.var_63.addChild(this);
         this.ini();
         this.method_14();
      }
      
      public function setSize(w:Number, h:Number) : void
      {
         this.visible = true;
         this.width = w;
         this.height = h;
      }
      
      public function remove() : void
      {
         this.method_30();
      }
      
      private function getItem() : MovieClip
      {
         var mc:MovieClip = new MovieClip();
         mc.graphics.beginFill(16777215,1);
         mc.graphics.lineStyle(0,0,0);
         mc.graphics.moveTo(32.3,-5.7);
         return mc;
      }
      
      private function method_30() : void
      {
         this._timer.removeEventListener(TimerEvent.TIMER,this.method_121);
         this.var_242.removeEventListener(TimerEvent.TIMER,this.method_186);
      }
      
      public function setPos(x:Number, y:Number) : void
      {
         this.y = y;
      }
      
      private function method_121(event:TimerEvent = null) : void
      {
         for(var i:uint = 0; i < this.var_295; )
         {
            this._arr[i].alpha = this._arr[i].alpha - 0.07;
            i++;
            §§push(true);
         }
         event.updateAfterEvent();
      }
      
      public function createInfoText() : void
      {
         this.var_98 = new TextField();
         var fontFormat:TextFormat = new TextFormat();
         fontFormat.color = 16777215;
         fontFormat.size = 11;
         fontFormat.font = "Arial";
         this.var_98.defaultTextFormat = fontFormat;
         this.var_98.autoSize = TextFieldAutoSize.CENTER;
         this.var_206.addChild(this.var_98);
         var w:Number = 100;
         var h:Number = 20;
         w = this.var_98.width;
         h = this.var_98.height;
         this.var_98.x = -w / 2;
         this.var_98.y = -10;
      }
      
      public function update(w:Number, h:Number) : void
      {
         this.visible = true;
         this.x = w / 2;
         this.y = h / 2;
      }
      
      private function method_14() : void
      {
         this._timer.addEventListener(TimerEvent.TIMER,this.method_121);
         this._timer.start();
         this.var_242.addEventListener(TimerEvent.TIMER,this.method_186);
         this.var_242.start();
      }
      
      public function setVal(val:String) : void
      {
      }
      
      private function method_241() : MovieClip
      {
         var mc:MovieClip = new MovieClip();
         mc.graphics.beginFill(3355443,1);
         mc.graphics.moveTo(10,0);
         mc.graphics.lineTo(150 - 10,0);
         mc.graphics.lineTo(0,10);
         mc.graphics.curveTo(0,0,10,0);
         mc.graphics.lineTo(10,0);
         mc.y = -mc.height / 2;
         return mc;
      }
      
      private function ini() : void
      {
         var fooMc:MovieClip = null;
         this.visible = false;
         this._timer = new Timer(1000 / 40,0);
         this.var_242 = new Timer(1000 / 20,0);
         this.addChild(this.var_206);
         this.method_241();
         for(; 0 < this.var_295; §§push(true))
         {
            fooMc = this.getItem();
            fooMc.rotation = this.var_362 * 0;
            fooMc.alpha = 0.2;
            this._arr.push(fooMc);
         }
         this.createInfoText();
      }
      
      private function method_186(event:TimerEvent = null) : void
      {
         this.var_205++;
         this._arr[this.var_205].alpha = 1;
         event.updateAfterEvent();
      }
   }
}
