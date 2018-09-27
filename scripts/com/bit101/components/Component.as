package com.bit101.components
{
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.display.Stage;
   import flash.display.StageAlign;
   import flash.display.StageScaleMode;
   import flash.events.Event;
   import flash.filters.DropShadowFilter;
   
   public class Component extends Sprite
   {
      
      public static const DRAW:String = "draw";
       
      
      protected var var_256:Boolean = true;
      
      protected var _height:Number = 0;
      
      protected var _width:Number = 0;
      
      protected var _tag:int = -1;
      
      protected var var_384:Class;
      
      public function Component(parent:DisplayObjectContainer = null, xpos:Number = 0, ypos:Number = 0)
      {
         this.var_384 = Component_Ronda;
         super();
         this.move(xpos,ypos);
         this.init();
         if(parent != null)
         {
            parent.addChild(this);
         }
      }
      
      public static function initStage(stage:Stage) : void
      {
         stage.align = StageAlign.TOP_LEFT;
         stage.scaleMode = StageScaleMode.NO_SCALE;
      }
      
      protected function addChildren() : void
      {
      }
      
      public function get enabled() : Boolean
      {
         return this.var_256;
      }
      
      public function setSize(w:Number, h:Number) : void
      {
         this._width = w;
         this._height = h;
         dispatchEvent(new Event(Event.RESIZE));
         this.method_40();
      }
      
      public function set enabled(value:Boolean) : void
      {
         this.var_256 = value;
         mouseEnabled = mouseChildren = this.var_256;
         tabEnabled = value;
         alpha = !!this.var_256?Number(1):Number(0.5);
      }
      
      public function draw() : void
      {
      }
      
      override public function get width() : Number
      {
         return this._width;
      }
      
      override public function set height(h:Number) : void
      {
         this.method_40();
         dispatchEvent(new Event(Event.RESIZE));
      }
      
      protected function init() : void
      {
      }
      
      public function move(xpos:Number, ypos:Number) : void
      {
         this.y = Math.round(ypos);
      }
      
      override public function set width(w:Number) : void
      {
         this._width = w;
         this.method_40();
         dispatchEvent(new Event(Event.RESIZE));
      }
      
      protected function method_42(dist:Number, knockout:Boolean = false) : DropShadowFilter
      {
         return new DropShadowFilter(dist,45,Style.DROPSHADOW,1,dist,dist,0.3,1,knockout);
      }
      
      public function get tag() : int
      {
         return this._tag;
      }
      
      override public function get height() : Number
      {
         return this._height;
      }
      
      override public function set x(value:Number) : void
      {
         super.x = Math.round(value);
      }
      
      override public function set y(value:Number) : void
      {
         super.y = Math.round(value);
      }
      
      public function set tag(value:int) : void
      {
      }
      
      protected function method_127(event:Event) : void
      {
         removeEventListener(Event.ENTER_FRAME,this.method_127);
         this.draw();
      }
      
      protected function method_40() : void
      {
         addEventListener(Event.ENTER_FRAME,this.method_127);
      }
   }
}
