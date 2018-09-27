package com.bit101.components
{
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class NumericStepper extends Component
   {
       
      
      protected var var_303:String;
      
      protected var var_155:int = 1;
      
      protected const UP:String = "up";
      
      protected var var_189:Timer;
      
      protected const DOWN:String = "down";
      
      protected var var_225:PushButton;
      
      protected var var_230:int = 100;
      
      protected const const_17:int = 500;
      
      protected var var_197:Timer;
      
      protected var var_227:PushButton;
      
      protected var var_168:Number = 1;
      
      protected var var_169:InputText;
      
      protected var _minimum:Number = -Infinity;
      
      protected var var_49:Number = Infinity;
      
      protected var _value:Number = 0;
      
      public function NumericStepper(parent:DisplayObjectContainer = null, xpos:Number = 0, ypos:Number = 0, defaultHandler:Function = null)
      {
         super(parent,xpos,ypos);
         if(defaultHandler != null)
         {
            addEventListener(Event.CHANGE,defaultHandler);
         }
      }
      
      public function get repeatTime() : int
      {
         return this.var_230;
      }
      
      public function get minimum() : Number
      {
         return this._minimum;
      }
      
      override protected function init() : void
      {
         super.init();
         setSize(80,16);
         this.var_189 = new Timer(this.const_17,1);
         this.var_189.addEventListener(TimerEvent.TIMER_COMPLETE,this.method_232);
         this.var_197 = new Timer(this.var_230);
         this.var_197.addEventListener(TimerEvent.TIMER,this.method_216);
      }
      
      protected function method_149() : void
      {
         if(this._value - this.var_168 >= this._minimum)
         {
            this._value = this._value - this.var_168;
            method_40();
            dispatchEvent(new Event(Event.CHANGE));
         }
      }
      
      public function set repeatTime(value:int) : void
      {
         this.var_230 = Math.max(value,10);
      }
      
      public function set step(value:Number) : void
      {
         §§push(true);
         if(value < 0)
         {
            throw new Error("NumericStepper step must be positive.");
         }
         this.var_168 = value;
      }
      
      protected function method_210(event:MouseEvent) : void
      {
         this.method_118();
         this.var_303 = this.UP;
      }
      
      public function set minimum(value:Number) : void
      {
         this._minimum = value;
         if(this._value < this._minimum)
         {
            this._value = this._minimum;
            method_40();
         }
      }
      
      public function get maximum() : Number
      {
         return this.var_49;
      }
      
      protected function method_266(event:Event) : void
      {
         var newVal:Number = Number(this.var_169.text);
         this._value = newVal;
         method_40();
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      protected function method_232(event:TimerEvent) : void
      {
         this.var_197.start();
      }
      
      override protected function addChildren() : void
      {
         this.var_169 = new InputText(this,0,0,"0",this.method_266);
         this.var_169.restrict = "-0123456789.";
         this.var_227 = new PushButton(this,0,0,"<");
         this.var_227.addEventListener(MouseEvent.MOUSE_DOWN,this.method_231);
         this.var_227.setSize(16,16);
         this.var_225 = new PushButton(this,0,0,">");
         this.var_225.addEventListener(MouseEvent.MOUSE_DOWN,this.method_210);
         this.var_225.setSize(16,16);
      }
      
      public function set maximum(value:Number) : void
      {
         this.var_49 = value;
         if(this._value > this.var_49)
         {
            this._value = this.var_49;
            method_40();
         }
      }
      
      override public function draw() : void
      {
         this.var_225.x = _width - 16;
         this.var_227.x = _width - 32;
         this.var_169.text = (Math.round(this._value * Math.pow(10,this.var_155)) / Math.pow(10,this.var_155)).toString();
         this.var_169.width = _width - 32;
         this.var_169.draw();
      }
      
      public function get step() : Number
      {
         return this.var_168;
      }
      
      protected function method_136(event:MouseEvent) : void
      {
         this.var_189.stop();
         this.var_197.stop();
      }
      
      protected function method_231(event:MouseEvent) : void
      {
         this.method_149();
         this.var_303 = this.DOWN;
         this.var_189.start();
         stage.addEventListener(MouseEvent.MOUSE_UP,this.method_136);
      }
      
      public function set labelPrecision(value:int) : void
      {
         this.var_155 = value;
         method_40();
      }
      
      protected function method_216(event:TimerEvent) : void
      {
      }
      
      public function set value(val:Number) : void
      {
         this._value = val;
         method_40();
      }
      
      public function get labelPrecision() : int
      {
         return this.var_155;
      }
      
      protected function method_118() : void
      {
         if(this._value + this.var_168 <= this.var_49)
         {
            this._value = this._value + this.var_168;
            method_40();
            dispatchEvent(new Event(Event.CHANGE));
         }
      }
      
      public function get value() : Number
      {
         return this._value;
      }
   }
}
