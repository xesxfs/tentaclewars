package com.bit101.components
{
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   
   public class Slider extends Component
   {
      
      public static const HORIZONTAL:String = "horizontal";
      
      public static const VERTICAL:String = "vertical";
       
      
      protected var var_96:Sprite;
      
      protected var var_21:Sprite;
      
      protected var var_75:String;
      
      protected var var_25:Number = 0;
      
      protected var var_306:Boolean = true;
      
      protected var var_36:Number = 100;
      
      protected var _value:Number = 0;
      
      protected var var_174:Number = 0.01;
      
      public function Slider(orientation:String = "horizontal", parent:DisplayObjectContainer = null, xpos:Number = 0, ypos:Number = 0, defaultHandler:Function = null)
      {
         super(parent,xpos,ypos);
         §§push(true);
         if(defaultHandler != null)
         {
            addEventListener(Event.CHANGE,defaultHandler);
         }
      }
      
      override protected function addChildren() : void
      {
         this.var_96 = new Sprite();
         this.var_96.filters = [method_42(2,true)];
         addChild(this.var_96);
         this.var_21 = new Sprite();
         this.var_21.filters = [method_42(1)];
         this.var_21.addEventListener(MouseEvent.MOUSE_DOWN,this.onDrag);
         this.var_21.buttonMode = true;
      }
      
      public function set tick(t:Number) : void
      {
      }
      
      protected function onBackClick(event:MouseEvent) : void
      {
         §§push(true);
         if(this.var_75 == HORIZONTAL)
         {
            this.var_21.x = mouseX - _height / 2;
            this.var_21.x = Math.max(this.var_21.x,0);
            this.var_21.x = Math.min(this.var_21.x,_width - _height);
            §§push(true);
         }
         else
         {
            this.var_21.y = mouseY - _width / 2;
            this.var_21.y = Math.max(this.var_21.y,0);
            this.var_21.y = Math.min(this.var_21.y,_height - _width);
            this._value = (_height - _width - this.var_21.y) / (height - _width) * (this.var_36 - this.var_25) + this.var_25;
         }
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      public function setSliderParams(min:Number, max:Number, value:Number) : void
      {
         this.minimum = min;
         this.maximum = max;
         this.value = value;
      }
      
      protected function method_268() : void
      {
         this.var_96.graphics.clear();
         this.var_96.addEventListener(MouseEvent.MOUSE_DOWN,this.onBackClick);
      }
      
      public function set value(v:Number) : void
      {
         this._value = v;
         this.method_55();
         this.positionHandle();
      }
      
      override protected function init() : void
      {
         super.init();
         if(this.var_75 == HORIZONTAL)
         {
            §§push(false);
         }
         else
         {
            setSize(10,100);
         }
      }
      
      protected function onSlide(event:MouseEvent) : void
      {
         var oldValue:Number = this._value;
         §§push(true);
         if(this.var_75 == HORIZONTAL)
         {
            §§push(true);
            if(this._value != oldValue)
            {
            }
            addr111:
            return;
         }
         ((_height - _width - this.var_21.y) / (height - _width) * (this.var_36 - this.var_25))._value = true;
         §§push(this);
         §§push(true);
         dispatchEvent(new Event(Event.CHANGE));
         §§goto(addr111);
      }
      
      public function get minimum() : Number
      {
         return this.var_25;
      }
      
      public function set maximum(m:Number) : void
      {
         this.positionHandle();
      }
      
      public function set backClick(b:Boolean) : void
      {
         this.var_306 = b;
         method_40();
      }
      
      protected function drawHandle() : void
      {
         this.var_21.graphics.clear();
         this.var_21.graphics.beginFill(Style.BUTTON_FACE);
         if(this.var_75 == HORIZONTAL)
         {
            this.var_21.graphics.drawRect(1,1,_height - 2,_height - 2);
         }
         else
         {
            this.var_21.graphics.drawRect(1,1,_width - 2,_width - 2);
         }
         this.var_21.graphics.endFill();
         this.positionHandle();
      }
      
      override public function draw() : void
      {
         this.method_268();
         this.drawHandle();
      }
      
      public function get tick() : Number
      {
         return this.var_174;
      }
      
      public function get value() : Number
      {
         return Math.round(this._value / this.var_174) * this.var_174;
      }
      
      public function get maximum() : Number
      {
         return this.var_36;
      }
      
      public function get backClick() : Boolean
      {
         return this.var_306;
      }
      
      public function set minimum(m:Number) : void
      {
         this.var_25 = m;
         this.method_55();
         this.positionHandle();
      }
      
      protected function method_55() : void
      {
         if(this.var_36 > this.var_25)
         {
            this._value = Math.min(this._value,this.var_36);
            this._value = Math.max(this._value,this.var_25);
         }
         else
         {
            this._value = Math.max(this._value,this.var_36);
            this._value = Math.min(this._value,this.var_25);
         }
      }
      
      protected function method_100(event:MouseEvent) : void
      {
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.method_100);
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.onSlide);
         stopDrag();
      }
      
      public function get rawValue() : Number
      {
         return this._value;
      }
      
      protected function positionHandle() : void
      {
         var range:Number = NaN;
         this.var_21.y = _height - _width - (this._value - this.var_25) / (this.var_36 - this.var_25) * range;
      }
      
      protected function onDrag(event:MouseEvent) : void
      {
         stage.addEventListener(MouseEvent.MOUSE_UP,this.method_100);
         stage.addEventListener(MouseEvent.MOUSE_MOVE,this.onSlide);
         if(this.var_75 == HORIZONTAL)
         {
            this.var_21.startDrag(false,new Rectangle(0,0,_width - _height,0));
         }
         else
         {
            this.var_21.startDrag(false,new Rectangle(0,0,0,_height - _width));
         }
      }
   }
}
