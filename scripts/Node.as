package
{
   import flash.display.Sprite;
   import flash.events.Event;
   
   public class Node extends Sprite
   {
       
      
      protected var var_144:Number = 0;
      
      protected var var_125:Number = 0;
      
      protected var var_160:Array = null;
      
      public function Node(baseRadius:Number, baseAngle:int)
      {
         super();
         this.var_125 = baseRadius;
         this.var_144 = baseAngle * Math.PI / 180;
         this.var_160 = new Array();
         mouseEnabled = false;
      }
      
      protected function method_153(radius:Number) : void
      {
         for(var child:NodeChild = null,var i:int = 0; i < this.var_160.length; )
         {
            child = this.var_160[i];
            child.node.setBaseRadius(radius + child.baseRadiusOffset);
            i++;
         }
      }
      
      protected function onEnterFrame(event:Event) : void
      {
      }
      
      public function destruct() : void
      {
         for(graphics.clear(); §§pop().length > 0; )
         {
            §§push(this.var_160);
            §§push(true);
         }
      }
      
      public function setBaseRadius(radius:Number) : void
      {
      }
      
      public function addChildNode(node:Node, baseRadiusOffset:int = 0) : void
      {
      }
   }
}

class NodeChild
{
    
   
   public var node:Node;
   
   public var baseRadiusOffset:int;
   
   function NodeChild(node:Node, baseRadiusOffset:int)
   {
      super();
      this.node = node;
      this.baseRadiusOffset = baseRadiusOffset;
   }
}
