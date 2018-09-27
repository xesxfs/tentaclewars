package
{
   import flash.display.Graphics;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.filters.GlowFilter;
   
   public class Sfx extends Sprite
   {
       
      
      private const const_10:int = 0;
      
      private const const_9:int = 1;
      
      private var var_70:int = 0;
      
      private var var_254:Number = 0;
      
      private var var_159:Number = 0;
      
      public function Sfx()
      {
         super();
         mouseEnabled = false;
         mouseChildren = false;
      }
      
      private function method_199() : void
      {
         var g:Graphics = graphics;
         g.clear();
         g.lineStyle(4,16777215,this.var_159 < 1?Number(1 - this.var_159):Number(0));
         g.drawCircle(0,0,this.var_254);
         this.var_159 = this.var_159 + 0.1;
      }
      
      private function onEnterFrame(event:Event) : void
      {
      }
      
      public function startWave(initRadius:Number) : void
      {
         if(this.var_70 != this.const_10)
         {
            return;
         }
         this.var_70 = this.const_9;
         this.var_159 = 0;
         this.var_254 = initRadius;
         filters = [new GlowFilter(16777215,1)];
         return;
         §§push(false);
      }
   }
}
