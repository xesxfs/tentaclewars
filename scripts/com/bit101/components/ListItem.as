package com.bit101.components
{
   import flash.display.DisplayObjectContainer;
   import flash.events.MouseEvent;
   
   public class ListItem extends Component
   {
       
      
      protected var var_117:uint = 16777215;
      
      protected var var_266:uint = 14540253;
      
      protected var _data:Object;
      
      protected var var_244:uint = 15658734;
      
      protected var var_268:Boolean = false;
      
      protected var var_102:Boolean;
      
      protected var _label:Label;
      
      public function ListItem(parent:DisplayObjectContainer = null, xpos:Number = 0, ypos:Number = 0, data:Object = null)
      {
         this._data = data;
         super(parent,xpos,ypos);
      }
      
      override protected function addChildren() : void
      {
         super.addChildren();
         this._label = new Label(this,5,0);
         this._label.draw();
      }
      
      override public function draw() : void
      {
         super.draw();
         graphics.clear();
         if(this.var_102)
         {
            graphics.beginFill(this.var_266);
            addr69:
            graphics.drawRect(0,0,width,height);
            §§push(true);
         }
         else if(this.var_268)
         {
            graphics.beginFill(this.var_244);
            §§goto(addr69);
         }
         else
         {
            graphics.beginFill(this.var_117);
            §§push(true);
         }
         this._label.text = this._data.label;
      }
      
      public function get selectedColor() : uint
      {
         return this.var_266;
      }
      
      public function set defaultColor(value:uint) : void
      {
         this.var_117 = value;
         method_40();
      }
      
      public function set data(value:Object) : void
      {
         this._data = value;
         method_40();
      }
      
      override protected function init() : void
      {
         super.init();
         addEventListener(MouseEvent.MOUSE_OVER,this.method_238);
         setSize(100,20);
      }
      
      public function get selected() : Boolean
      {
         return this.var_102;
      }
      
      public function set selectedColor(value:uint) : void
      {
         this.var_266 = value;
         method_40();
      }
      
      public function get rolloverColor() : uint
      {
         return this.var_244;
      }
      
      public function get defaultColor() : uint
      {
         return this.var_117;
      }
      
      public function set rolloverColor(value:uint) : void
      {
         this.var_244 = value;
         method_40();
      }
      
      protected function method_169(event:MouseEvent) : void
      {
         removeEventListener(MouseEvent.MOUSE_OUT,this.method_169);
         this.var_268 = false;
         method_40();
      }
      
      public function get data() : Object
      {
         return this._data;
      }
      
      public function set selected(value:Boolean) : void
      {
         this.var_102 = value;
         method_40();
      }
      
      protected function method_238(event:MouseEvent) : void
      {
         addEventListener(MouseEvent.MOUSE_OUT,this.method_169);
      }
   }
}
