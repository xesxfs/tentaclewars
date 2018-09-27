package com.bit101.components
{
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   import flash.text.TextField;
   import flash.text.TextFieldType;
   import flash.text.TextFormat;
   
   public class Text extends Component
   {
       
      
      protected var var_272:Boolean = true;
      
      protected var var_74:Panel;
      
      protected var var_307:Boolean = false;
      
      protected var _text:String = "";
      
      protected var var_327:TextFormat;
      
      protected var var_29:TextField;
      
      protected var var_257:Boolean = true;
      
      public function Text(parent:DisplayObjectContainer = null, xpos:Number = 0, ypos:Number = 0, text:String = "")
      {
         this.text = text;
         super(parent,xpos,ypos);
         setSize(200,100);
      }
      
      override protected function addChildren() : void
      {
         this.var_74 = new Panel(this);
         this.var_74.color = Style.TEXT_BACKGROUND;
         this.var_327 = new TextFormat(Style.fontName,Style.fontSize,Style.LABEL_TEXT);
         this.var_29 = new TextField();
         this.var_29.x = 2;
      }
      
      override public function set enabled(value:Boolean) : void
      {
         super.enabled = value;
         this.var_29.tabEnabled = value;
      }
      
      override public function draw() : void
      {
         super.draw();
      }
      
      public function set editable(b:Boolean) : void
      {
         this.var_272 = b;
         method_40();
      }
      
      public function get textField() : TextField
      {
         return this.var_29;
      }
      
      override protected function init() : void
      {
         super.init();
      }
      
      public function set text(t:String) : void
      {
         this._text = t;
         if(this._text == null)
         {
            this._text = "";
            §§push(false);
         }
         else
         {
            method_40();
         }
      }
      
      public function get selectable() : Boolean
      {
         return this.var_257;
      }
      
      public function get editable() : Boolean
      {
         return this.var_272;
      }
      
      public function set html(b:Boolean) : void
      {
         this.var_307 = b;
         method_40();
      }
      
      public function get html() : Boolean
      {
         return this.var_307;
      }
      
      public function set selectable(b:Boolean) : void
      {
         this.var_257 = b;
         method_40();
      }
      
      public function get text() : String
      {
         return this._text;
      }
      
      protected function method_239(event:Event) : void
      {
         this._text = this.var_29.text;
         dispatchEvent(event);
      }
   }
}
