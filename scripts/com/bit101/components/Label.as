package com.bit101.components
{
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   
   public class Label extends Component
   {
       
      
      protected var _text:String = "";
      
      protected var var_356:Boolean = false;
      
      protected var var_346:Number = 0;
      
      protected var var_29:TextField;
      
      protected var var_316:Boolean = true;
      
      public function Label(parent:DisplayObjectContainer = null, xpos:Number = 0, ypos:Number = 0, text:String = "", fontSize:Number = -1, xCentered:Boolean = false)
      {
         §§push(this);
         if(fontSize > 0)
         {
            §§push(fontSize);
            §§push(true);
         }
         else
         {
            §§push(Number(Style.fontSize));
         }
         §§pop().var_346 = §§pop();
         this.var_356 = xCentered;
         this.text = text;
         super(parent,xpos,ypos);
      }
      
      override protected function addChildren() : void
      {
         _height = 18;
         this.var_29 = new TextField();
         this.var_29.text = this._text;
         §§push(true);
         if(this.var_356)
         {
            §§push(true);
         }
         else
         {
            addChild(this.var_29);
            this.draw();
         }
      }
      
      public function set text(t:String) : void
      {
         this._text = t;
         if(this._text == null)
         {
            this._text = "";
         }
         method_40();
      }
      
      override public function draw() : void
      {
         super.draw();
         this.var_29.text = this._text;
         if(this.var_316)
         {
            this.var_29.autoSize = TextFieldAutoSize.LEFT;
            _width = this.var_29.width;
            dispatchEvent(new Event(Event.RESIZE));
         }
         else
         {
            this.var_29.autoSize = TextFieldAutoSize.NONE;
            this.var_29.width = _width;
            §§push(true);
         }
         this.var_29.height = 18;
         _height = 18;
      }
      
      public function set autoSize(b:Boolean) : void
      {
         this.var_316 = b;
      }
      
      override protected function init() : void
      {
         super.init();
         mouseEnabled = false;
         mouseChildren = false;
      }
      
      public function get text() : String
      {
         return this._text;
      }
      
      public function get autoSize() : Boolean
      {
         return this.var_316;
      }
      
      public function get textField() : TextField
      {
         return this.var_29;
      }
   }
}
