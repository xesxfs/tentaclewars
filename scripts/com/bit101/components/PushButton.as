package com.bit101.components
{
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class PushButton extends Component
   {
       
      
      protected var var_184:Boolean = false;
      
      protected var var_195:String = "";
      
      protected var var_52:Sprite;
      
      protected var var_96:Sprite;
      
      protected var var_290:uint;
      
      protected var var_323:Boolean = false;
      
      protected var var_299:Boolean = true;
      
      protected var var_102:Boolean = false;
      
      protected var var_296:uint;
      
      protected var _label:Label;
      
      protected var var_65:Boolean = false;
      
      protected var var_215:Number = 10;
      
      public function PushButton(parent:DisplayObjectContainer = null, xpos:Number = 0, ypos:Number = 0, label:String = "", defaultHandler:Function = null)
      {
         this.var_290 = Style.BUTTON_FACE;
         this.var_296 = Style.BUTTON_DOWN;
         super(parent,xpos,ypos);
         §§push(true);
         if(defaultHandler != null)
         {
            addEventListener(MouseEvent.CLICK,defaultHandler);
         }
         this.label = label;
      }
      
      override protected function addChildren() : void
      {
         this.var_96 = new Sprite();
         this.var_96.filters = [method_42(2,true)];
         this.var_96.mouseEnabled = false;
         addChild(this.var_96);
         this.var_52 = new Sprite();
         this.var_52.mouseEnabled = false;
         this.var_52.filters = [method_42(1)];
         this.var_52.x = 1;
         this.var_52.y = 1;
         addChild(this.var_52);
         this._label = new Label();
         addChild(this._label);
         addEventListener(MouseEvent.MOUSE_DOWN,this.method_299);
         addEventListener(MouseEvent.ROLL_OVER,this.method_238);
      }
      
      protected function method_82() : void
      {
         this.var_52.graphics.clear();
         §§push(true);
         if(this.var_184)
         {
            this.var_52.graphics.beginFill(this.var_296);
         }
         else
         {
            this.var_52.graphics.beginFill(this.var_290);
         }
         if(!this.var_299)
         {
            this.var_52.graphics.drawRect(0,0,_width - 2,_height - 2);
         }
         else
         {
            this.var_52.graphics.drawRoundRect(0,0,_width - 2,_height - 2,this.var_215,this.var_215);
         }
         this.var_52.graphics.endFill();
      }
      
      override protected function init() : void
      {
         super.init();
         buttonMode = true;
         useHandCursor = true;
         setSize(100,20);
      }
      
      public function get toggle() : Boolean
      {
         return this.var_65;
      }
      
      public function set roundFace(enable:Boolean) : void
      {
      }
      
      protected function method_299(event:MouseEvent) : void
      {
         this.var_184 = true;
         this.method_82();
         this.var_52.filters = [method_42(1,true)];
         stage.addEventListener(MouseEvent.MOUSE_UP,this.method_136);
      }
      
      protected function method_136(event:MouseEvent) : void
      {
         if(this.var_65 && this.var_323)
         {
            this.var_102 = !this.var_102;
         }
         this.var_184 = this.var_102;
         this.method_82();
         this.var_52.filters = [method_42(1,this.var_102)];
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.method_136);
      }
      
      public function set downColor(color:uint) : void
      {
         this.var_296 = color;
         this.draw();
      }
      
      public function get selected() : Boolean
      {
         return this.var_102;
      }
      
      protected function method_238(event:MouseEvent) : void
      {
         this.var_323 = true;
         addEventListener(MouseEvent.ROLL_OUT,this.method_169);
      }
      
      protected function method_169(event:MouseEvent) : void
      {
         this.var_323 = false;
         if(!this.var_184)
         {
            this.var_52.filters = [method_42(1)];
         }
         removeEventListener(MouseEvent.ROLL_OUT,this.method_169);
      }
      
      public function set label(str:String) : void
      {
         this.var_195 = str;
         this.draw();
      }
      
      override public function draw() : void
      {
         super.draw();
         this.var_96.graphics.clear();
         this.var_96.graphics.beginFill(Style.BACKGROUND,0.3);
         if(!this.var_299)
         {
            this.var_96.graphics.drawRect(0,0,_width,_height);
         }
         else
         {
            this.var_96.graphics.drawRoundRect(0,0,_width,_height,this.var_215,this.var_215);
         }
         this.var_96.graphics.endFill();
         this.method_82();
         this._label.text = this.var_195;
         this._label.autoSize = true;
         this._label.draw();
         if(this._label.width > _width - 4)
         {
            §§push(this._label);
            §§push(false);
            §§push(false);
         }
         else
         {
            §§push(this._label);
            §§push(true);
         }
         §§pop().autoSize = §§pop();
         this._label.draw();
         this._label.move(_width / 2 - this._label.width / 2,_height / 2 - this._label.height / 2);
      }
      
      public function set selected(value:Boolean) : void
      {
         if(!this.var_65)
         {
            value = false;
         }
         this.var_102 = value;
         this.var_184 = this.var_102;
         this.method_82();
         this.var_52.filters = [method_42(1,this.var_102)];
      }
      
      public function set toggle(value:Boolean) : void
      {
         this.var_65 = value;
      }
      
      public function get label() : String
      {
         return this.var_195;
      }
      
      public function set normalColor(color:uint) : void
      {
         this.var_290 = color;
         this.draw();
      }
   }
}
