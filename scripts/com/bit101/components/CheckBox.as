package com.bit101.components
{
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class CheckBox extends Component
   {
       
      
      protected var var_96:Sprite;
      
      protected var var_195:String = "";
      
      protected var _button:Sprite;
      
      protected var _label:Label;
      
      protected var var_102:Boolean = false;
      
      public function CheckBox(parent:DisplayObjectContainer = null, xpos:Number = 0, ypos:Number = 0, label:String = "", defaultHandler:Function = null)
      {
         this.var_195 = label;
         super(parent,xpos,ypos);
         if(defaultHandler != null)
         {
            addEventListener(MouseEvent.CLICK,defaultHandler);
         }
      }
      
      override protected function addChildren() : void
      {
         this.var_96 = new Sprite();
         this.var_96.filters = [method_42(2,true)];
         addChild(this.var_96);
         this._button.visible = false;
         addChild(this._button);
      }
      
      public function set label(str:String) : void
      {
         this.var_195 = str;
         method_40();
      }
      
      override public function draw() : void
      {
         super.draw();
         this.var_96.graphics.clear();
         this.var_96.graphics.beginFill(Style.BACKGROUND);
         this.var_96.graphics.drawRect(0,0,10,10);
         this.var_96.graphics.endFill();
         this._button.graphics.clear();
         this._button.graphics.beginFill(Style.BUTTON_FACE);
         this._button.graphics.drawRect(2,2,6,6);
         this._label.text = this.var_195;
         this._label.draw();
         this._label.x = 12;
         this._label.y = (10 - this._label.height) / 2;
         _width = this._label.width + 12;
         _height = 10;
      }
      
      override public function set enabled(value:Boolean) : void
      {
         super.enabled = value;
         mouseChildren = false;
      }
      
      override protected function init() : void
      {
         super.init();
         buttonMode = true;
         useHandCursor = true;
         mouseChildren = false;
      }
      
      public function set selected(s:Boolean) : void
      {
         this.var_102 = s;
         this._button.visible = this.var_102;
      }
      
      protected function onClick(event:MouseEvent) : void
      {
         this._button.visible = this.var_102;
      }
      
      public function get label() : String
      {
         return this.var_195;
      }
      
      public function get selected() : Boolean
      {
         return this.var_102;
      }
   }
}
