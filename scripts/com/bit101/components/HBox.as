package com.bit101.components
{
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   
   public class HBox extends Component
   {
      
      public static const MIDDLE:String = "middle";
      
      public static const NONE:String = "none";
      
      public static const BOTTOM:String = "bottom";
      
      public static const TOP:String = "top";
       
      
      private var var_172:String = "none";
      
      protected var var_241:Number = 5;
      
      public function HBox(parent:DisplayObjectContainer = null, xpos:Number = 0, ypos:Number = 0)
      {
         super(parent,xpos,ypos);
      }
      
      public function get spacing() : Number
      {
         return this.var_241;
      }
      
      override public function draw() : void
      {
         var child:DisplayObject = null;
         _width = 0;
         _height = 0;
         var xpos:Number = 0;
         for(var i:int = 0; i < numChildren; i++)
         {
            child = getChildAt(i);
            child.x = xpos;
            xpos = xpos + child.width;
            xpos = xpos + this.var_241;
            _width = _width + child.width;
            _height = Math.max(_height,child.height);
         }
         this.method_224();
         _width = _width + this.var_241 * (numChildren - 1);
         dispatchEvent(new Event(Event.RESIZE));
      }
      
      public function get alignment() : String
      {
         return this.var_172;
      }
      
      override public function removeChildAt(index:int) : DisplayObject
      {
         var child:DisplayObject = super.removeChildAt(index);
         child.removeEventListener(Event.RESIZE,this.onResize);
         this.draw();
         return child;
      }
      
      public function set spacing(s:Number) : void
      {
         this.var_241 = s;
         method_40();
      }
      
      override public function addChildAt(child:DisplayObject, index:int) : DisplayObject
      {
         super.addChildAt(child,index);
         child.addEventListener(Event.RESIZE,this.onResize);
         this.draw();
         return child;
      }
      
      public function set alignment(value:String) : void
      {
         this.var_172 = value;
         method_40();
      }
      
      protected function method_224() : void
      {
         var i:int = 0;
         var child:DisplayObject = null;
         if(this.var_172 != NONE)
         {
            for(i = 0; i < numChildren; )
            {
               child = getChildAt(i);
               §§push(this.var_172);
               if(TOP == false)
               {
                  child.y = _height - child.height;
               }
               else if(this.var_172 == MIDDLE)
               {
                  child.y = (_height - child.height) / 2;
               }
               i++;
            }
         }
      }
      
      protected function onResize(event:Event) : void
      {
         method_40();
      }
      
      override public function addChild(child:DisplayObject) : DisplayObject
      {
         super.addChild(child);
         return child;
      }
      
      override public function removeChild(child:DisplayObject) : DisplayObject
      {
         super.removeChild(child);
         child.removeEventListener(Event.RESIZE,this.onResize);
         this.draw();
         return child;
      }
   }
}
