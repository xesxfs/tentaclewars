package com.bit101.components
{
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class Window extends Component
   {
       
      
      protected var var_74:Panel;
      
      protected var var_235:Boolean = false;
      
      protected var var_142:PushButton;
      
      protected var var_183:Boolean = true;
      
      protected var var_35:Sprite;
      
      protected var var_204:Label;
      
      protected var var_238:Boolean = false;
      
      protected var var_270:Boolean = true;
      
      protected var _title:String;
      
      protected var var_58:Shape;
      
      protected var _color:int = -1;
      
      protected var var_220:Boolean;
      
      protected var var_38:Panel;
      
      public function Window(parent:DisplayObjectContainer = null, xpos:Number = 0, ypos:Number = 0, title:String = "Window")
      {
         this._title = title;
         super(parent,xpos,ypos);
      }
      
      public function get minimized() : Boolean
      {
         return this.var_235;
      }
      
      public function set minimized(value:Boolean) : void
      {
         this.var_235 = value;
         if(this.var_235)
         {
            if(contains(this.var_74))
            {
               removeChild(this.var_74);
            }
            this.var_35.rotation = -90;
         }
         else
         {
            if(!contains(this.var_74))
            {
               super.addChild(this.var_74);
            }
            this.var_35.rotation = 0;
         }
         dispatchEvent(new Event(Event.RESIZE));
      }
      
      public function get draggable() : Boolean
      {
         return this.var_183;
      }
      
      override protected function init() : void
      {
         super.init();
      }
      
      public function set draggable(b:Boolean) : void
      {
         this.var_183 = b;
      }
      
      protected function method_322(event:MouseEvent) : void
      {
         this.minimized = !this.minimized;
      }
      
      public function get shadow() : Boolean
      {
         return this.var_270;
      }
      
      public function get titleBar() : Panel
      {
         return this.var_38;
      }
      
      public function addRawChild(child:DisplayObject) : DisplayObject
      {
         return child;
      }
      
      override public function get height() : Number
      {
         if(contains(this.var_74))
         {
            return super.height;
         }
         return 20;
      }
      
      public function get hasMinimizeButton() : Boolean
      {
         return this.var_238;
      }
      
      public function set hasCloseButton(value:Boolean) : void
      {
         this.var_220 = value;
         if(this.var_220)
         {
            this.var_38.content.addChild(this.var_142);
         }
         else if(this.var_38.content.contains(this.var_142))
         {
            this.var_38.content.removeChild(this.var_142);
         }
         method_40();
      }
      
      public function set title(t:String) : void
      {
         this._title = t;
         this.var_204.text = this._title;
      }
      
      public function set titleBar(value:Panel) : void
      {
         this.var_38 = value;
      }
      
      override protected function addChildren() : void
      {
         this.var_38 = new Panel();
         this.var_38.filters = [];
         this.var_38.buttonMode = true;
         this.var_38.useHandCursor = true;
         this.var_38.addEventListener(MouseEvent.MOUSE_DOWN,this.method_299);
         super.addChild(this.var_38);
         this.var_204 = new Label(this.var_38.content,5,1,this._title);
         this.var_58 = new Shape();
         this.var_58.graphics.lineStyle(1,16777215,0.55);
         this.var_35.buttonMode = true;
         this.var_35.addEventListener(MouseEvent.CLICK,this.method_322);
         this.var_142 = new PushButton(null,86,6,"",this.method_307);
         this.var_142.setSize(8,8);
         filters = [method_42(4,false)];
      }
      
      public function set color(c:int) : void
      {
         this._color = c;
         method_40();
      }
      
      public function set shadow(b:Boolean) : void
      {
         this.var_270 = b;
         if(this.var_270)
         {
            filters = [method_42(4,false)];
         }
         else
         {
            filters = [];
         }
      }
      
      protected function method_136(event:MouseEvent) : void
      {
         this.stopDrag();
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.method_136);
      }
      
      override public function draw() : void
      {
         super.draw();
         this.var_38.color = this._color;
         this.var_74.color = this._color;
         §§push(true);
         §§push(false);
         §§push(this.var_204);
         if(this.var_238)
         {
            §§push(Number(20));
            §§push(true);
         }
         else
         {
            §§push(Number(5));
         }
         §§pop().x = §§pop();
         this.var_142.x = _width - 14;
         this.var_58.x = this.var_204.x + this.var_204.width;
         if(this.var_220)
         {
            §§push(false);
         }
         else
         {
            this.var_58.width = _width - this.var_58.x - 2;
            this.var_74.setSize(_width,_height - 20);
            this.var_74.draw();
         }
      }
      
      protected function method_299(event:MouseEvent) : void
      {
         if(this.var_183)
         {
            this.startDrag();
            stage.addEventListener(MouseEvent.MOUSE_UP,this.method_136);
            parent.addChild(this);
         }
         dispatchEvent(new Event(Event.SELECT));
      }
      
      public function set hasMinimizeButton(b:Boolean) : void
      {
         this.var_238 = b;
         if(this.var_238)
         {
            super.addChild(this.var_35);
         }
         else if(contains(this.var_35))
         {
            removeChild(this.var_35);
         }
         method_40();
      }
      
      public function get hasCloseButton() : Boolean
      {
         return this.var_220;
      }
      
      public function get title() : String
      {
         return this._title;
      }
      
      protected function method_307(event:MouseEvent) : void
      {
         dispatchEvent(new Event(Event.CLOSE));
      }
      
      public function get grips() : Shape
      {
         return this.var_58;
      }
      
      public function get color() : int
      {
         return this._color;
      }
      
      public function get content() : DisplayObjectContainer
      {
         return this.var_74.content;
      }
      
      override public function addChild(child:DisplayObject) : DisplayObject
      {
         this.content.addChild(child);
         return child;
      }
   }
}
