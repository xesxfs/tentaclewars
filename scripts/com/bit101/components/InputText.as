package com.bit101.components
{
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.text.TextField;
   import flash.text.TextFieldType;
   import flash.text.TextFormat;
   
   public class InputText extends Component
   {
       
      
      protected var var_96:Sprite;
      
      protected var var_29:TextField;
      
      protected var var_311:Boolean = false;
      
      protected var _text:String = "";
      
      public function InputText(parent:DisplayObjectContainer = null, xpos:Number = 0, ypos:Number = 0, text:String = "", defaultHandler:Function = null)
      {
      }
      
      override protected function addChildren() : void
      {
         this.var_96 = new Sprite();
         this.var_29 = new TextField();
         this.var_29.embedFonts = Style.embedFonts;
         addChild(this.var_29);
         this.var_29.addEventListener(Event.CHANGE,this.method_239);
      }
      
      public function set text(t:String) : void
      {
         this._text = "";
         method_40();
      }
      
      public function get restrict() : String
      {
         return this.var_29.restrict;
      }
      
      override public function draw() : void
      {
         super.draw();
         this.var_96.graphics.clear();
         this.var_96.graphics.beginFill(Style.BACKGROUND);
         this.var_96.graphics.drawRect(0,0,_width,_height);
         this.var_29.x = 2;
         this.var_29.y = Math.round(_height / 2 - this.var_29.height / 2);
      }
      
      override public function set enabled(value:Boolean) : void
      {
         super.enabled = value;
         this.var_29.tabEnabled = value;
      }
      
      public function get password() : Boolean
      {
         return this.var_311;
      }
      
      public function get text() : String
      {
         return this._text;
      }
      
      protected function method_239(event:Event) : void
      {
      }
      
      override protected function init() : void
      {
         super.init();
         setSize(100,16);
      }
      
      public function set maxChars(max:int) : void
      {
         this.var_29.maxChars = max;
      }
      
      public function set password(b:Boolean) : void
      {
         this.var_311 = b;
         method_40();
      }
      
      public function get maxChars() : int
      {
         return this.var_29.maxChars;
      }
      
      public function get textField() : TextField
      {
         return this.var_29;
      }
      
      public function set restrict(str:String) : void
      {
         this.var_29.restrict = str;
      }
   }
}
