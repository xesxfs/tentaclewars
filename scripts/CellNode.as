package
{
   import flash.display.Sprite;
   
   public class CellNode extends Sprite
   {
      
      public static const TYPE1:int = 1;
      
      public static const TYPE2:int = 2;
      
      public static const TYPE3:int = 3;
      
      public static const TYPE4:int = 4;
      
      public static const TYPE5:int = 5;
       
      
      private var var_213:Number = 0;
      
      private var var_132:Number = 0;
      
      private var var_70:int = 0;
      
      private var var_250:Sync = null;
      
      private var var_293:uint = 0;
      
      public function CellNode(type:int, radius:Number, angle:int, color:uint)
      {
         super();
         this.var_70 = type;
         this.var_132 = radius;
         this.var_213 = angle * Math.PI / 180;
         this.var_293 = color;
         this.var_250 = new Sync(0.3);
         this.setRadius(radius);
         var tendril:Tendril = null;
         var pulsar:Pulsar = null;
         if(TYPE1 === _loc7_)
         {
            §§push(0);
         }
         else if(TYPE2 === _loc7_)
         {
            §§push(1);
         }
         else if(TYPE3 === _loc7_)
         {
            §§push(2);
         }
         else if(TYPE4 === _loc7_)
         {
            §§push(3);
         }
         else
         {
            §§push(TYPE5);
            §§push(true);
         }
         switch(§§pop())
         {
            case 0:
               tendril = new Tendril(Tendril.TYPE_WITHOUT_SPOT,0,0,10,0.3);
               addChild(tendril);
               break;
            case 1:
               pulsar = new Pulsar(0,0,color,4);
               tendril = new Tendril(Tendril.TYPE_WITHOUT_SPOT,0,0,15,0.3);
               pulsar.addChildNode(tendril);
               addChild(pulsar);
               break;
            case 2:
               pulsar = new Pulsar(0,0,color,4);
               tendril = new Tendril(Tendril.TYPE_WITH_SPOT,0,0,15,0.3);
               tendril.setColor(this.var_293);
               pulsar.addChildNode(tendril);
               addChild(pulsar);
               break;
            case 3:
               pulsar = new Pulsar(0,0,color,4);
               pulsar.addChildNode(new Pulsar(0,-60,color,3),5);
               pulsar.addChildNode(new Pulsar(0,60,color,3),5);
               pulsar.addChildNode(new Tendril(Tendril.TYPE_WITHOUT_SPOT,0,-20,15,0.3));
               pulsar.addChildNode(new Tendril(Tendril.TYPE_WITHOUT_SPOT,0,20,15,0.3));
               addChild(pulsar);
               break;
            case 4:
               pulsar = new Pulsar(0,0,color,5);
               tendril = new Tendril(Tendril.TYPE_WITH_SPOT,0,0,20,0.3);
               tendril.setColor(this.var_293);
               pulsar.addChildNode(tendril);
               pulsar.addChildNode(new Pulsar(0,0,color,3,40),5);
               pulsar.addChildNode(new Pulsar(0,120,color,3,40),5);
               pulsar.addChildNode(new Pulsar(0,240,color,3,40),5);
               addChild(pulsar);
         }
      }
      
      public function setRadius(radius:Number) : void
      {
         this.var_132 = radius;
         this.x = Math.cos(this.var_213) * this.var_132;
         this.y = Math.sin(this.var_213) * this.var_132;
         (this.var_213 * 180).rotation = true;
      }
      
      public function destruct() : void
      {
         for(var node:Node = null; numChildren > 0; )
         {
            node = removeChildAt(0) as Node;
            node.destruct();
         }
      }
   }
}
