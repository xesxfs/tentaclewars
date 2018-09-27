package com.bit101.components
{
   import flash.display.DisplayObjectContainer;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class ComboBox extends Component
   {
      
      public static const BOTTOM:String = "bottom";
      
      public static const TOP:String = "top";
       
      
      protected var var_22:List;
      
      protected var var_116:PushButton;
      
      protected var var_218:String = "";
      
      protected var var_175:Boolean = false;
      
      protected var _items:Array;
      
      protected var var_239:int = 6;
      
      protected var var_124:PushButton;
      
      protected var var_305:String = "bottom";
      
      protected var _stage:Stage;
      
      public function ComboBox(parent:DisplayObjectContainer = null, xpos:Number = 0, ypos:Number = 0, defaultLabel:String = "", items:Array = null)
      {
         this.var_218 = defaultLabel;
         this._items = items;
         addEventListener(Event.ADDED_TO_STAGE,this.method_105);
         addEventListener(Event.REMOVED_FROM_STAGE,this.method_192);
         super(parent,xpos,ypos);
      }
      
      public function set items(value:Array) : void
      {
      }
      
      public function get selectedColor() : uint
      {
         return this.var_22.selectedColor;
      }
      
      public function get alternateColor() : uint
      {
         return this.var_22.alternateColor;
      }
      
      public function get alternateRows() : Boolean
      {
         return this.var_22.alternateRows;
      }
      
      override protected function init() : void
      {
         setSize(100,20);
         this.method_76();
      }
      
      public function get openPosition() : String
      {
         return this.var_305;
      }
      
      public function get numVisibleItems() : int
      {
         return this.var_239;
      }
      
      public function set selectedColor(value:uint) : void
      {
         this.var_22.selectedColor = value;
      }
      
      public function get rolloverColor() : uint
      {
         return this.var_22.rolloverColor;
      }
      
      public function get isOpen() : Boolean
      {
         return this.var_175;
      }
      
      public function set selectedItem(item:Object) : void
      {
         this.var_22.selectedItem = item;
         this.method_76();
      }
      
      public function set alternateColor(value:uint) : void
      {
         this.var_22.alternateColor = value;
      }
      
      public function get defaultColor() : uint
      {
         return this.var_22.defaultColor;
      }
      
      public function set openPosition(value:String) : void
      {
         this.var_305 = value;
      }
      
      public function addItemAt(item:Object, index:int) : void
      {
         this.var_22.addItemAt(item,index);
      }
      
      public function set numVisibleItems(value:int) : void
      {
         this.var_239 = value;
         method_40();
      }
      
      public function set rolloverColor(value:uint) : void
      {
         this.var_22.rolloverColor = value;
      }
      
      public function get listItemClass() : Class
      {
         return this.var_22.listItemClass;
      }
      
      protected function method_123(event:MouseEvent) : void
      {
         var point:Point = null;
         this.var_175 = !this.var_175;
         if(this.var_175)
         {
            point = new Point();
            §§push(false);
            if(this.var_305 == BOTTOM)
            {
               point.y = _height;
            }
            else
            {
               point.y = -this.var_239 * this.var_22.listItemHeight;
            }
            point = this.localToGlobal(point);
            this.var_124.label = "-";
            §§push(false);
         }
         else
         {
            this.method_112();
         }
      }
      
      protected function method_105(event:Event) : void
      {
         this._stage = stage;
      }
      
      public function get defaultLabel() : String
      {
         return this.var_218;
      }
      
      public function set listItemHeight(value:Number) : void
      {
         this.var_22.listItemHeight = value;
         method_40();
      }
      
      protected function method_297(event:Event) : void
      {
      }
      
      public function removeItem(item:Object) : void
      {
         this.var_22.removeItem(item);
      }
      
      override protected function addChildren() : void
      {
         super.addChildren();
         this.var_22 = new List(null,0,0,this._items);
         this.var_22.autoHideScrollBar = true;
         this.var_22.addEventListener(Event.SELECT,this.method_297);
         this.var_116 = new PushButton(this,0,0,"",this.method_123);
         this.var_124 = new PushButton(this,0,0,"+",this.method_123);
      }
      
      protected function method_112() : void
      {
         if(this._stage.contains(this.var_22))
         {
            this._stage.removeChild(this.var_22);
         }
         this._stage.removeEventListener(MouseEvent.CLICK,this.method_150);
         this.var_124.label = "+";
      }
      
      public function get items() : Array
      {
         return this.var_22.items;
      }
      
      public function removeItemAt(index:int) : void
      {
         this.var_22.removeItemAt(index);
      }
      
      override public function draw() : void
      {
         super.draw();
         this.var_116.setSize(_width - _height + 1,_height);
         this.var_116.draw();
         this.var_124.setSize(_height,_height);
         this.var_124.draw();
         this.var_124.x = _width - height;
         this.var_22.setSize(_width,this.var_239 * this.var_22.listItemHeight);
      }
      
      public function get selectedItem() : Object
      {
         return this.var_22.selectedItem;
      }
      
      protected function method_76() : void
      {
         if(this.selectedItem == null)
         {
            this.var_116.label = this.var_218;
         }
         else
         {
            false;
            §§push(this.selectedItem is String);
            if(this.selectedItem.label is String)
            {
               this.var_116.label = this.selectedItem.label;
            }
            else
            {
               this.var_116.label = this.selectedItem.toString();
            }
         }
      }
      
      public function set defaultColor(value:uint) : void
      {
      }
      
      public function addItem(item:Object) : void
      {
      }
      
      public function get listItemHeight() : Number
      {
         return this.var_22.listItemHeight;
      }
      
      public function set listItemClass(value:Class) : void
      {
      }
      
      public function set defaultLabel(value:String) : void
      {
         this.var_218 = value;
         this.method_76();
      }
      
      protected function method_150(event:MouseEvent) : void
      {
         if(event.target == this.var_124 || event.target == this.var_116)
         {
            return;
         }
         if(new Rectangle(this.var_22.x,this.var_22.y,this.var_22.width,this.var_22.height).contains(event.stageX,event.stageY))
         {
            return;
         }
         this.var_175 = false;
         this.method_112();
      }
      
      public function set autoHideScrollBar(value:Boolean) : void
      {
         this.var_22.autoHideScrollBar = value;
         method_40();
      }
      
      public function set alternateRows(value:Boolean) : void
      {
         this.var_22.alternateRows = value;
      }
      
      public function set selectedIndex(value:int) : void
      {
         this.var_22.selectedIndex = value;
         this.method_76();
      }
      
      protected function method_192(event:Event) : void
      {
         this.method_112();
      }
      
      public function get autoHideScrollBar() : Boolean
      {
         return this.var_22.autoHideScrollBar;
      }
      
      public function get selectedIndex() : int
      {
         return this.var_22.selectedIndex;
      }
      
      public function removeAll() : void
      {
      }
   }
}
