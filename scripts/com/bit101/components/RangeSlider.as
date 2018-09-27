package com.bit101.components
{
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   
   public class RangeSlider extends Component
   {
      
      public static const HORIZONTAL:String = "horizontal";
      
      public static const LEFT:String = "left";
      
      public static const BOTTOM:String = "bottom";
      
      public static const NEVER:String = "never";
      
      public static const ALWAYS:String = "always";
      
      public static const MOVE:String = "move";
      
      public static const TOP:String = "top";
      
      public static const RIGHT:String = "right";
      
      public static const VERTICAL:String = "vertical";
       
      
      protected var var_155:int = 0;
      
      protected var var_75:String = "vertical";
      
      protected var var_32:Sprite;
      
      protected var var_34:Sprite;
      
      protected var var_156:String;
      
      protected var var_113:String = "always";
      
      protected var var_96:Sprite;
      
      protected var _minimum:Number = 0;
      
      protected var var_44:Number = 0;
      
      protected var var_41:Label;
      
      protected var var_49:Number = 100;
      
      protected var var_46:Number = 100;
      
      protected var var_50:Label;
      
      protected var var_174:Number = 1;
      
      public function RangeSlider(orientation:String, parent:DisplayObjectContainer = null, xpos:Number = 0, ypos:Number = 0, defaultHandler:Function = null)
      {
         this.var_75 = orientation;
         addEventListener(Event.CHANGE,defaultHandler);
      }
      
      public function set labelPosition(value:String) : void
      {
         this.var_156 = value;
         this.method_69();
      }
      
      protected function method_145(value:Number) : String
      {
         var decimal:String = null;
         var i:int = 0;
         var str:* = (Math.round(value * Math.pow(10,this.var_155)) / Math.pow(10,this.var_155)).toString();
         §§push(true);
         if(this.var_155 > 0)
         {
            decimal = str.split(".")[1] || "";
            if(decimal.length == 0)
            {
               str = str + ".";
            }
            for(i = decimal.length; i < this.var_155; )
            {
               str = str + "0";
               i++;
            }
         }
         return str;
      }
      
      public function get minimum() : Number
      {
         return this._minimum;
      }
      
      override protected function init() : void
      {
         super.init();
         §§push(false);
         if(this.var_75 == HORIZONTAL)
         {
            setSize(110,10);
            this.var_156 = TOP;
         }
         else
         {
            setSize(10,110);
            this.var_156 = RIGHT;
         }
      }
      
      public function set minimum(value:Number) : void
      {
         this._minimum = value;
         this.var_49 = Math.max(this.var_49,this._minimum);
         this.var_44 = Math.max(this.var_44,this._minimum);
         this.var_46 = Math.max(this.var_46,this._minimum);
         this.method_72();
      }
      
      public function get tick() : Number
      {
         return this.var_174;
      }
      
      protected function method_301(event:MouseEvent) : void
      {
         stage.addEventListener(MouseEvent.MOUSE_UP,this.method_100);
         stage.addEventListener(MouseEvent.MOUSE_MOVE,this.method_171);
         if(this.var_75 == HORIZONTAL)
         {
            §§push(true);
         }
         else
         {
            this.var_32.startDrag(false,new Rectangle(0,this.var_34.y + _width,0,_height - this.var_34.y - _width * 2));
            if(this.var_113 == MOVE)
            {
               this.var_41.visible = true;
               this.var_50.visible = true;
            }
         }
      }
      
      public function get maximum() : Number
      {
         return this.var_49;
      }
      
      protected function method_69() : void
      {
         this.var_41.text = this.method_145(this.lowValue);
         this.var_50.text = this.method_145(this.highValue);
         this.var_41.draw();
         this.var_50.draw();
         if(this.var_75 == VERTICAL)
         {
            this.var_41.y = this.var_32.y + (_width - this.var_41.height) * 0.5;
            this.var_50.y = this.var_34.y + (_width - this.var_50.height) * 0.5;
            §§push(this.var_156);
            §§push(LEFT);
            §§push(true);
         }
         else
         {
            this.var_41.x = this.var_32.x - this.var_41.width + _height;
            this.var_50.x = this.var_34.x;
            §§push(this.var_156);
            §§push(BOTTOM);
         }
         if(§§pop() == §§pop())
         {
            this.var_41.y = _height + 2;
            this.var_50.y = _height + 2;
         }
         else
         {
            this.var_41.y = -this.var_41.height;
            §§push(true);
         }
      }
      
      protected function method_130(event:MouseEvent) : void
      {
         var oldValue:Number = this.var_46;
         if(this.var_75 == HORIZONTAL)
         {
            (this.var_34.x - _height).var_46 = (_width - _height * 2) * true + this._minimum;
            §§push(this);
         }
         else
         {
            ((_height - _width * 2 - this.var_34.y) / (_height - _width * 2) * (this.var_49 - this._minimum)).var_46 = true;
            §§push(this);
         }
         if(this.var_46 != oldValue)
         {
            dispatchEvent(new Event(Event.CHANGE));
         }
         this.method_69();
      }
      
      protected function method_247(event:MouseEvent) : void
      {
         this.var_41.visible = true;
         this.var_50.visible = true;
      }
      
      public function get labelMode() : String
      {
         return this.var_113;
      }
      
      public function set tick(value:Number) : void
      {
         this.var_174 = value;
         this.method_69();
      }
      
      public function get labelPosition() : String
      {
         return this.var_156;
      }
      
      override protected function addChildren() : void
      {
         this.var_34.useHandCursor = true;
         addChild(this.var_34);
         this.var_41 = new Label(this);
         this.var_50 = new Label(this);
         this.var_41.visible = this.var_113 == ALWAYS;
      }
      
      override public function draw() : void
      {
         super.draw();
         this.method_268();
         this.method_288();
      }
      
      public function set maximum(value:Number) : void
      {
         this.var_49 = value;
         this._minimum = Math.min(this._minimum,this.var_49);
         this.var_44 = Math.min(this.var_44,this.var_49);
         this.var_46 = Math.min(this.var_46,this.var_49);
         this.method_72();
      }
      
      protected function method_268() : void
      {
         this.var_96.graphics.clear();
         this.var_96.graphics.beginFill(Style.BACKGROUND);
         this.var_96.graphics.drawRect(0,0,_width,_height);
         this.var_96.graphics.endFill();
      }
      
      public function set labelPrecision(value:int) : void
      {
         this.var_155 = value;
         this.method_69();
      }
      
      public function set highValue(value:Number) : void
      {
         this.var_46 = value;
         this.var_46 = Math.max(this.var_46,this.var_44);
         this.var_46 = Math.min(this.var_46,this.var_49);
         this.method_72();
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      protected function method_72() : void
      {
         var range:Number = NaN;
         §§push(true);
         if(this.var_75 == HORIZONTAL)
         {
            range = _width - _height * 2;
            this.var_32.x = (this.var_44 - this._minimum) / (this.var_49 - this._minimum) * range;
            §§push(false);
         }
         else
         {
            range = _height - _width * 2;
         }
         this.var_32.y = _height - _width - (this.var_44 - this._minimum) / (this.var_49 - this._minimum) * range;
         this.var_34.y = _height - _width * 2 - (this.var_46 - this._minimum) / (this.var_49 - this._minimum) * range;
         this.method_69();
      }
      
      protected function method_288() : void
      {
         this.var_32.graphics.clear();
         this.var_34.graphics.drawRect(1,1,_height - 2,_height - 2);
         this.var_32.graphics.endFill();
         this.method_72();
      }
      
      public function get labelPrecision() : int
      {
         return this.var_155;
      }
      
      public function set labelMode(value:String) : void
      {
         this.var_113 = value;
         this.var_50.visible = this.var_113 == ALWAYS;
         this.var_41.visible = this.var_113 == ALWAYS;
      }
      
      public function get highValue() : Number
      {
         return Math.round(this.var_46 / this.var_174) * this.var_174;
      }
      
      protected function method_100(event:MouseEvent) : void
      {
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.method_100);
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.method_171);
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.method_130);
         stopDrag();
         this.var_50.visible = false;
      }
      
      public function set lowValue(value:Number) : void
      {
         this.var_44 = value;
         this.var_44 = Math.min(this.var_44,this.var_46);
         this.var_44 = Math.max(this.var_44,this._minimum);
         this.method_72();
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      public function get lowValue() : Number
      {
         return Math.round(this.var_44 / this.var_174) * this.var_174;
      }
      
      protected function method_171(event:MouseEvent) : void
      {
         var oldValue:Number = this.var_44;
         §§push(false);
         if(this.var_75 == HORIZONTAL)
         {
            (this.var_32.x / (_width - _height * 2)).var_44 = true + this._minimum;
            §§push(this);
         }
         else
         {
            this.var_44 = (_height - _width - this.var_32.y) / (height - _width * 2) * (this.var_49 - this._minimum) + this._minimum;
         }
         if(this.var_44 != oldValue)
         {
            dispatchEvent(new Event(Event.CHANGE));
         }
         this.method_69();
      }
   }
}
