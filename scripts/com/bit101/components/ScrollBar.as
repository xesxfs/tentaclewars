package com.bit101.components
{
   import flash.display.DisplayObjectContainer;
   import flash.display.Shape;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class ScrollBar extends Component
   {
       
      
      protected var var_303:String;
      
      protected var var_259:PushButton;
      
      protected var var_260:Boolean = false;
      
      protected var var_127:PushButton;
      
      protected var var_75:String;
      
      protected const UP:String = "up";
      
      protected var var_189:Timer;
      
      protected const DOWN:String = "down";
      
      protected var var_197:Timer;
      
      protected const const_17:int = 500;
      
      protected var var_30:ScrollSlider;
      
      protected var var_326:Boolean = false;
      
      protected var var_212:int = 1;
      
      protected const const_19:int = 100;
      
      public function ScrollBar(orientation:String, parent:DisplayObjectContainer = null, xpos:Number = 0, ypos:Number = 0, defaultHandler:Function = null)
      {
         this.var_75 = orientation;
         super(parent,xpos,ypos);
         if(defaultHandler != null)
         {
            addEventListener(Event.CHANGE,defaultHandler);
         }
      }
      
      public function get minimum() : Number
      {
         return this.var_30.minimum;
      }
      
      override protected function init() : void
      {
         this.var_197 = new Timer(this.const_19);
         this.var_197.addEventListener(TimerEvent.TIMER,this.method_216);
      }
      
      public function get autoHide() : Boolean
      {
         return this.var_326;
      }
      
      public function get lineSize() : int
      {
         return this.var_212;
      }
      
      public function set minimum(v:Number) : void
      {
         this.var_30.minimum = v;
      }
      
      public function get maximum() : Number
      {
         return this.var_30.maximum;
      }
      
      public function set autoHide(value:Boolean) : void
      {
         this.var_326 = value;
         method_40();
      }
      
      protected function method_126() : void
      {
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      protected function method_119() : void
      {
         this.var_30.value = this.var_30.value + this.var_212;
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      public function set lineSize(value:int) : void
      {
         this.var_212 = value;
      }
      
      public function get pageSize() : int
      {
         return this.var_30.pageSize;
      }
      
      protected function method_232(event:TimerEvent) : void
      {
         if(this.var_260)
         {
            this.var_197.start();
         }
      }
      
      public function setThumbPercent(value:Number) : void
      {
      }
      
      override protected function addChildren() : void
      {
         this.var_259.addEventListener(MouseEvent.MOUSE_DOWN,this.method_273);
         this.var_259.setSize(10,10);
         var upArrow:Shape = new Shape();
         this.var_259.addChild(upArrow);
         var downArrow:Shape = new Shape();
         this.var_127.addChild(downArrow);
         §§push(true);
         §§push(true);
         if(this.var_75 == Slider.VERTICAL)
         {
            upArrow.graphics.beginFill(Style.DROPSHADOW,0.5);
            upArrow.graphics.moveTo(5,3);
            upArrow.graphics.lineTo(7,6);
            upArrow.graphics.lineTo(3,6);
            upArrow.graphics.endFill();
            §§push(true);
         }
         else
         {
            upArrow.graphics.beginFill(Style.DROPSHADOW,0.5);
         }
         upArrow.graphics.moveTo(3,5);
         upArrow.graphics.lineTo(6,7);
         upArrow.graphics.lineTo(6,3);
         upArrow.graphics.endFill();
         downArrow.graphics.beginFill(Style.DROPSHADOW,0.5);
         downArrow.graphics.moveTo(7,5);
         downArrow.graphics.lineTo(4,7);
         downArrow.graphics.lineTo(4,3);
         downArrow.graphics.endFill();
      }
      
      public function set maximum(v:Number) : void
      {
         this.var_30.maximum = v;
      }
      
      public function setSliderParams(min:Number, max:Number, value:Number) : void
      {
         this.var_30.setSliderParams(min,max,value);
      }
      
      override public function draw() : void
      {
         super.draw();
         if(this.var_75 == Slider.VERTICAL)
         {
            this.var_30.x = 0;
            this.var_30.y = 10;
            §§push(this.var_30);
            §§push(10);
            §§push(true);
         }
         else
         {
            §§push(this.var_30);
            §§push(10);
         }
         §§pop().x = §§pop();
         0.height = false;
         this.var_127.x = _width - 10;
         this.var_127.y = 0;
         this.var_30.draw();
         §§push(this.var_30);
         if(this.var_326)
         {
            visible = this.var_30.thumbPercent < 1;
         }
         else
         {
            visible = true;
            §§push(true);
         }
      }
      
      protected function method_273(event:MouseEvent) : void
      {
         this.method_126();
         this.var_260 = true;
      }
      
      protected function method_136(event:MouseEvent) : void
      {
         this.var_189.stop();
         this.var_197.stop();
         this.var_260 = false;
      }
      
      protected function method_216(event:TimerEvent) : void
      {
         if(this.var_303 == this.UP)
         {
            this.method_126();
         }
         else
         {
            this.method_119();
         }
      }
      
      public function set value(v:Number) : void
      {
         this.var_30.value = v;
      }
      
      protected function method_304(event:MouseEvent) : void
      {
         this.method_119();
         this.var_260 = true;
         this.var_303 = this.DOWN;
         stage.addEventListener(MouseEvent.MOUSE_UP,this.method_136);
      }
      
      public function set pageSize(value:int) : void
      {
         this.var_30.pageSize = value;
         method_40();
      }
      
      public function get value() : Number
      {
         return this.var_30.value;
      }
      
      protected function method_239(event:Event) : void
      {
      }
   }
}

import com.bit101.components.Slider;
import com.bit101.components.Style;
import flash.display.DisplayObjectContainer;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.geom.Rectangle;

class ScrollSlider extends Slider
{
    
   
   protected var _thumbPercent:Number = 1.0;
   
   protected var _pageSize:int = 1;
   
   function ScrollSlider(orientation:String, parent:DisplayObjectContainer = null, xpos:Number = 0, ypos:Number = 0, defaultHandler:Function = null)
   {
      super(orientation,parent,xpos,ypos);
      if(defaultHandler != null)
      {
         addEventListener(Event.CHANGE,defaultHandler);
      }
   }
   
   public function set pageSize(value:int) : void
   {
      this._pageSize = value;
      method_40();
   }
   
   override protected function onBackClick(event:MouseEvent) : void
   {
      if(var_75 == HORIZONTAL)
      {
         if(mouseX < var_21.x)
         {
            if(var_36 > var_25)
            {
               _value = _value - this._pageSize;
            }
            else
            {
               _value = _value + this._pageSize;
            }
            method_55();
         }
         else
         {
            if(var_36 > var_25)
            {
               _value = _value + this._pageSize;
            }
            else
            {
               _value = _value - this._pageSize;
            }
            method_55();
         }
         this.positionHandle();
      }
      else
      {
         if(mouseY < var_21.y)
         {
            if(var_36 > var_25)
            {
               _value = _value - this._pageSize;
            }
            else
            {
               _value = _value + this._pageSize;
            }
            method_55();
         }
         else
         {
            if(var_36 > var_25)
            {
               _value = _value + this._pageSize;
            }
            else
            {
               _value = _value - this._pageSize;
            }
            method_55();
         }
         this.positionHandle();
      }
      dispatchEvent(new Event(Event.CHANGE));
   }
   
   override protected function drawHandle() : void
   {
      var size:Number = NaN;
      var_21.graphics.clear();
      if(var_75 == HORIZONTAL)
      {
         size = Math.round(_width * this._thumbPercent);
         size = Math.max(_height,size);
         var_21.graphics.beginFill(0,0);
         var_21.graphics.drawRect(0,0,size,_height);
         var_21.graphics.endFill();
         var_21.graphics.beginFill(Style.BUTTON_FACE);
         var_21.graphics.drawRect(1,1,size - 2,_height - 2);
      }
      else
      {
         size = Math.round(_height * this._thumbPercent);
         size = Math.max(_width,size);
         var_21.graphics.beginFill(0,0);
         var_21.graphics.drawRect(0,0,_width - 2,size);
         var_21.graphics.endFill();
         var_21.graphics.beginFill(Style.BUTTON_FACE);
         var_21.graphics.drawRect(1,1,_width - 2,size - 2);
      }
      var_21.graphics.endFill();
      this.positionHandle();
   }
   
   override protected function init() : void
   {
      super.init();
      setSliderParams(1,1,0);
      backClick = true;
   }
   
   override protected function positionHandle() : void
   {
      var range:Number = NaN;
      if(var_75 == HORIZONTAL)
      {
         range = width - var_21.width;
         var_21.x = (_value - var_25) / (var_36 - var_25) * range;
      }
      else
      {
         range = height - var_21.height;
         var_21.y = (_value - var_25) / (var_36 - var_25) * range;
      }
   }
   
   override protected function onSlide(event:MouseEvent) : void
   {
      var oldValue:Number = _value;
      if(var_75 == HORIZONTAL)
      {
         if(_width == var_21.width)
         {
            _value = var_25;
         }
         else
         {
            _value = var_21.x / (_width - var_21.width) * (var_36 - var_25) + var_25;
         }
      }
      else if(_height == var_21.height)
      {
         _value = var_25;
      }
      else
      {
         _value = var_21.y / (_height - var_21.height) * (var_36 - var_25) + var_25;
      }
      if(_value != oldValue)
      {
         dispatchEvent(new Event(Event.CHANGE));
      }
   }
   
   public function get thumbPercent() : Number
   {
      return this._thumbPercent;
   }
   
   public function get pageSize() : int
   {
      return this._pageSize;
   }
   
   public function setThumbPercent(value:Number) : void
   {
      this._thumbPercent = Math.min(value,1);
      method_40();
   }
   
   override protected function onDrag(event:MouseEvent) : void
   {
      stage.addEventListener(MouseEvent.MOUSE_UP,method_100);
      stage.addEventListener(MouseEvent.MOUSE_MOVE,this.onSlide);
      if(var_75 == HORIZONTAL)
      {
         var_21.startDrag(false,new Rectangle(0,0,_width - var_21.width,0));
      }
      else
      {
         var_21.startDrag(false,new Rectangle(0,0,0,_height - var_21.height));
      }
   }
}
