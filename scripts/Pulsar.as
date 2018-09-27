package
{
   import flash.display.Graphics;
   import flash.events.Event;
   
   public class Pulsar extends Node
   {
       
      
      private var var_250:Sync = null;
      
      private var var_379:Number = 0;
      
      private var var_293:uint = 0;
      
      private var var_231:int = 0;
      
      public function Pulsar(baseRadius:Number, baseAngle:int, color:uint, size:Number = 4, rotDelta:int = 0)
      {
         this.var_231 = size;
         this.var_293 = color;
         this.var_379 = rotDelta * Math.PI / 180;
         this.var_250 = new Sync(0.3);
      }
      
      public function setSize(size:Number) : void
      {
      }
      
      override public function setBaseRadius(radius:Number) : void
      {
         super.setBaseRadius(radius);
      }
      
      private function method_57() : void
      {
         var angle:Number = NaN;
         angle = var_144 + Math.sin(this.var_250.phase) * this.var_379;
         this.x = Math.cos(angle) * var_125;
         this.y = Math.sin(angle) * var_125;
         this.rotation = angle * 180 / Math.PI;
         var g:Graphics = graphics;
         var r:Number = Math.sin(this.var_250.phase) * this.var_231 / 2 + this.var_231;
         g.clear();
         g.lineStyle(1,GUI.OUTLINE_COLOR);
         g.beginFill(this.var_293);
         g.drawCircle(0,0,r);
         g.endFill();
         method_153(r);
      }
      
      override protected function onEnterFrame(event:Event) : void
      {
         this.var_250.tick();
         this.method_57();
      }
      
      override public function destruct() : void
      {
      }
   }
}
