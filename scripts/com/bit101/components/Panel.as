package com.bit101.components
{
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   
   public class Panel extends Component
   {
       
      
      protected var var_284:Boolean = false;
      
      protected var var_224:int = 10;
      
      protected var _background:Sprite;
      
      protected var _mask:Sprite;
      
      protected var _color:int = -1;
      
      public var content:Sprite;
      
      protected var var_276:uint = 13684944;
      
      protected var var_270:Boolean = true;
      
      public function Panel(parent:DisplayObjectContainer = null, xpos:Number = 0, ypos:Number = 0)
      {
         super(parent,xpos,ypos);
      }
      
      override protected function addChildren() : void
      {
         super.addChild(this._background);
         this._mask = new Sprite();
         this._mask.mouseEnabled = false;
         super.addChild(this._mask);
         this.content = new Sprite();
         super.addChild(this.content);
         filters = [method_42(2,true)];
      }
      
      public function set shadow(b:Boolean) : void
      {
         this.var_270 = b;
         §§push(false);
         if(this.var_270)
         {
            filters = [method_42(2,true)];
         }
         else
         {
            filters = [];
         }
      }
      
      override public function draw() : void
      {
         super.draw();
         this._background.graphics.drawRect(0,0,_width,_height);
         this._background.graphics.endFill();
         this.method_285();
         this._mask.graphics.clear();
         this._mask.graphics.beginFill(16711680);
         this._mask.graphics.drawRect(0,0,_width,_height);
         this._mask.graphics.endFill();
      }
      
      public function set gridSize(value:int) : void
      {
         this.var_224 = value;
         method_40();
      }
      
      override protected function init() : void
      {
         super.init();
         setSize(100,100);
      }
      
      public function addRawChild(child:DisplayObject) : DisplayObject
      {
         return child;
      }
      
      public function get showGrid() : Boolean
      {
         return this.var_284;
      }
      
      public function set color(c:int) : void
      {
         this._color = c;
         method_40();
      }
      
      public function get shadow() : Boolean
      {
         return this.var_270;
      }
      
      public function get color() : int
      {
         return this._color;
      }
      
      public function get gridSize() : int
      {
         return this.var_224;
      }
      
      public function set showGrid(value:Boolean) : void
      {
         method_40();
      }
      
      protected function method_285() : void
      {
         if(!this.var_284)
         {
            return;
         }
         this._background.graphics.lineStyle(0,this.var_276);
         for(var i:* = 0,i = false; i < _height; )
         {
            this._background.graphics.moveTo(0,i);
            this._background.graphics.lineTo(_width,i);
            i = int(i + this.var_224);
         }
         return;
         §§push(i);
         §§push(false);
      }
      
      public function set gridColor(value:uint) : void
      {
         this.var_276 = value;
         method_40();
      }
      
      override public function addChild(child:DisplayObject) : DisplayObject
      {
         return child;
      }
      
      public function get gridColor() : uint
      {
         return this.var_276;
      }
   }
}
