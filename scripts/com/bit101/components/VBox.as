package com.bit101.components
{
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   
   public class VBox extends Component
   {
      
      public static const CENTER:String = "center";
      
      public static const LEFT:String = "left";
      
      public static const RIGHT:String = "right";
      
      public static const NONE:String = "none";
       
      
      private var var_172:String = "none";
      
      protected var var_241:Number = 5;
      
      public function VBox(parent:DisplayObjectContainer = null, xpos:Number = 0, ypos:Number = 0)
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
         var ypos:Number = 0;
         for(var i:int = 0; i < numChildren; i++)
         {
            child = getChildAt(i);
            child.y = ypos;
            ypos = ypos + child.height;
            ypos = ypos + this.var_241;
            _height = _height + child.height;
            _width = Math.max(_width,child.width);
         }
         _height = _height + this.var_241 * (numChildren - 1);
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
      }
      
      override public function addChildAt(child:DisplayObject, index:int) : DisplayObject
      {
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
            while(i < numChildren)
            {
               child = getChildAt(i);
               if(this.var_172 == LEFT)
               {
                  child.x = 0;
               }
               else
               {
                  §§push(this.var_172);
                  if(true == CENTER)
                  {
                     child.x = (_width - child.width) / 2;
                  }
               }
               i++;
            }
            §§push(true);
         }
      }
      
      protected function onResize(event:Event) : void
      {
         method_40();
      }
      
      override public function addChild(child:DisplayObject) : DisplayObject
      {
         super.addChild(child);
         child.addEventListener(Event.RESIZE,this.onResize);
         this.draw();
         return child;
      }
      
      override public function removeChild(child:DisplayObject) : DisplayObject
      {
         this.draw();
         return child;
      }
   }
}
