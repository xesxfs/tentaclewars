package com.bit101.components
{
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class List extends Component
   {
       
      
      protected var var_117:uint;
      
      protected var var_74:Panel;
      
      protected var var_266:uint;
      
      protected var var_244:uint;
      
      protected var var_43:VScrollBar;
      
      protected var var_229:Class;
      
      protected var var_245:uint;
      
      protected var var_97:Sprite;
      
      protected var _items:Array;
      
      protected var var_281:Boolean = false;
      
      protected var var_60:int = -1;
      
      protected var var_93:Number = 20;
      
      public function List(parent:DisplayObjectContainer = null, xpos:Number = 0, ypos:Number = 0, items:Array = null)
      {
         this.var_229 = ListItem;
         this.var_117 = Style.LIST_DEFAULT;
         this.var_245 = Style.LIST_ALTERNATE;
         this.var_266 = Style.LIST_SELECTED;
         this.var_244 = Style.LIST_ROLLOVER;
         if(items != null)
         {
            this._items = items;
         }
         else
         {
            this._items = new Array();
         }
         super(parent,xpos,ypos);
      }
      
      public function set items(value:Array) : void
      {
         this._items = value;
         method_40();
      }
      
      protected function method_59() : void
      {
         var item:ListItem = null;
         var offset:int = this.var_43.value;
         var numItems:int = Math.ceil(_height / this.var_93);
         for(var i:int = 0; i < numItems; i++)
         {
            item = this.var_97.getChildAt(i) as ListItem;
            if(offset + i < this._items.length)
            {
               item.data = this._items[offset + i];
            }
            else
            {
               item.data = "";
            }
            if(this.var_281)
            {
               item.defaultColor = (offset + i) % 2 == 0?uint(this.var_117):uint(this.var_245);
               §§push(true);
            }
            else
            {
               item.defaultColor = this.var_117;
               if(offset + i == this.var_60)
               {
                  item.selected = true;
                  continue;
               }
               item.selected = false;
            }
         }
      }
      
      public function get selectedColor() : uint
      {
         return this.var_266;
      }
      
      protected function method_303(event:Event) : void
      {
         this.method_59();
      }
      
      public function get autoHideScrollBar() : Boolean
      {
         return this.var_43.autoHide;
      }
      
      public function set selectedColor(value:uint) : void
      {
         this.var_266 = value;
         method_40();
      }
      
      public function get alternateColor() : uint
      {
         return this.var_245;
      }
      
      public function get rolloverColor() : uint
      {
         return this.var_244;
      }
      
      public function set selectedItem(item:Object) : void
      {
         var index:int = this._items.indexOf(item);
         this.selectedIndex = index;
         method_40();
         dispatchEvent(new Event(Event.SELECT));
      }
      
      override protected function init() : void
      {
         this.method_96();
         this.method_59();
      }
      
      public function set alternateColor(value:uint) : void
      {
         this.var_245 = value;
         method_40();
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
      
      public function addItemAt(item:Object, index:int) : void
      {
         index = Math.max(0,index);
         index = Math.min(this._items.length,index);
         this._items.splice(index,0,item);
         method_40();
         this.method_59();
      }
      
      public function set listItemHeight(value:Number) : void
      {
         this.var_93 = value;
         this.method_96();
         method_40();
      }
      
      public function get listItemClass() : Class
      {
         return this.var_229;
      }
      
      public function removeItem(item:Object) : void
      {
         var index:int = this._items.indexOf(item);
         this.removeItemAt(index);
      }
      
      protected function method_297(event:Event) : void
      {
         if(!(event.target is ListItem))
         {
            return;
         }
         var offset:int = this.var_43.value;
         for(var i:int = 0; i < this.var_97.numChildren; i++)
         {
            if(this.var_97.getChildAt(i) == event.target)
            {
               this.var_60 = i + offset;
            }
            ListItem(this.var_97.getChildAt(i)).selected = false;
         }
         ListItem(event.target).selected = true;
         dispatchEvent(new Event(Event.SELECT));
      }
      
      override protected function addChildren() : void
      {
         this.var_43.setSliderParams(0,0,0);
      }
      
      protected function method_201() : void
      {
         var numItems:int = Math.ceil(_height / this.var_93);
         if(this.var_60 != -1)
         {
            if(this.var_43.value <= this.var_60)
            {
               if(this.var_43.value + numItems < this.var_60)
               {
                  (this.var_60 - numItems).value = true;
                  §§push(this.var_43);
               }
            }
         }
         else
         {
            this.var_43.value = 0;
         }
         this.method_59();
      }
      
      public function get items() : Array
      {
         return this._items;
      }
      
      public function removeItemAt(index:int) : void
      {
         if(index < 0 || index >= this._items.length)
         {
            return;
         }
         this._items.splice(index,1);
         method_40();
         this.method_59();
      }
      
      override public function draw() : void
      {
         super.draw();
         this.var_60 = Math.min(this.var_60,this._items.length - 1);
         this.var_74.setSize(_width,_height);
         this.var_74.color = this.var_117;
         this.var_74.draw();
         this.var_43.x = _width - 10;
         var contentHeight:Number = this._items.length * this.var_93;
         this.var_43.setThumbPercent(_height / contentHeight);
         var pageSize:Number = Math.floor(_height / this.var_93);
      }
      
      public function set defaultColor(value:uint) : void
      {
         this.var_117 = value;
         method_40();
      }
      
      public function addItem(item:Object) : void
      {
         this._items.push(item);
         method_40();
         this.method_59();
      }
      
      public function get selectedItem() : Object
      {
         if(this.var_60 >= 0 && this.var_60 < this._items.length)
         {
            return this._items[this.var_60];
         }
         return null;
      }
      
      public function get listItemHeight() : Number
      {
         return this.var_93;
      }
      
      public function set listItemClass(value:Class) : void
      {
         this.var_229 = value;
         this.method_96();
         method_40();
      }
      
      public function set alternateRows(value:Boolean) : void
      {
         this.var_281 = value;
         method_40();
      }
      
      public function set autoHideScrollBar(value:Boolean) : void
      {
      }
      
      public function set selectedIndex(value:int) : void
      {
         this.var_60 = -1;
         method_40();
         dispatchEvent(new Event(Event.SELECT));
      }
      
      protected function onResize(event:Event) : void
      {
         this.method_96();
      }
      
      public function get selectedIndex() : int
      {
         return this.var_60;
      }
      
      public function get alternateRows() : Boolean
      {
         return this.var_281;
      }
      
      protected function method_96() : void
      {
         while(this.var_97.numChildren > 0)
         {
            this.var_97.removeChildAt(0);
         }
         var numItems:int = Math.ceil(_height / this.var_93);
      }
      
      protected function method_235(event:MouseEvent) : void
      {
         this.var_43.value = this.var_43.value - event.delta;
         this.method_59();
      }
      
      public function removeAll() : void
      {
         this._items.length = 0;
         method_40();
         this.method_59();
      }
   }
}
