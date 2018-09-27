package
{
   import flash.display.Graphics;
   import flash.events.Event;
   
   public class Tendril extends Node
   {
      
      public static const TYPE_WITH_SPOT:int = 1;
      
      public static const TYPE_WITHOUT_SPOT:int = 0;
       
      
      private var var_366:Number = 1;
      
      private var var_341:Number = 0;
      
      private var var_70:Number = 0;
      
      private var var_250:Sync = null;
      
      private var var_293:uint = 16777215;
      
      private var var_231:Number = 0;
      
      private var var_377:Number = 0;
      
      private var var_336:Boolean = false;
      
      public function Tendril(type:int, baseRadius:Number, angle:int, size:Number, moveSize:Number, moveOffset:Number = 0, moveDir:Boolean = false, sync:Sync = null)
      {
         this.var_336 = sync == null?true:false;
         this.var_70 = type;
         this.var_231 = size;
         this.var_341 = moveSize;
         this.var_377 = moveOffset;
         this.var_366 = !!moveDir?Number(1):Number(-1);
      }
      
      public function setColor(color:uint) : void
      {
         this.var_293 = color;
      }
      
      public function setSize(size:Number) : void
      {
         this.var_231 = size;
      }
      
      private function method_57() : void
      {
         var g:Graphics = graphics;
         var centerRadius:Number = var_125 + this.var_231 / 2;
         var endRadius:Number = var_125 + this.var_231;
         var endAngle:Number = var_144 + this.var_366 * this.var_341 * (Math.sin(this.var_250.phase) - this.var_377);
         var beginX:Number = Math.cos(var_144) * var_125;
         var midX:Number = Math.cos(var_144) * centerRadius;
         var midY:Number = Math.sin(var_144) * centerRadius;
         var endX:Number = Math.cos(endAngle) * endRadius;
         var endY:Number = Math.sin(endAngle) * endRadius;
         g.clear();
         g.lineStyle(1,GUI.OUTLINE_COLOR);
         g.moveTo(beginX,true);
         g.curveTo(midX,midY,endX,endY);
         §§push(true);
         §§push(Math.sin(var_144) * var_125);
         if(this.var_70 == TYPE_WITH_SPOT)
         {
            g.lineStyle(1,GUI.OUTLINE_COLOR);
            g.beginFill(this.var_293);
            g.drawCircle(endX,endY,3);
            g.endFill();
         }
      }
      
      override protected function onEnterFrame(event:Event) : void
      {
         if(this.var_336)
         {
            §§push(true);
         }
         this.method_57();
      }
      
      override public function destruct() : void
      {
         super.destruct();
      }
   }
}
