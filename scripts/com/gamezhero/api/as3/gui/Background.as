package com.gamezhero.api.as3.gui
{
   import flash.display.MovieClip;
   
   public class Background extends MovieClip
   {
       
      
      private var var_63:MovieClip;
      
      private var var_291:MovieClip;
      
      public function Background(g:MovieClip)
      {
         super();
         this.var_63 = g;
         this.var_63.addChild(this);
         this.ini();
         this.method_14();
      }
      
      public function remove() : void
      {
      }
      
      private function method_30() : void
      {
      }
      
      public function update(w:Number, h:Number) : void
      {
         this.x = 0;
         this.y = 0;
         this.width = w + 100;
         this.height = h + 100;
      }
      
      private function method_206() : MovieClip
      {
         var mc:MovieClip = new MovieClip();
         mc.graphics.beginFill(0,1);
         mc.graphics.lineStyle(0,0,0);
         mc.graphics.moveTo(0,0);
         mc.graphics.lineTo(1000,0);
         mc.graphics.lineTo(1000,1000);
         mc.graphics.lineTo(0,1000);
         mc.graphics.lineTo(0,0);
         mc.graphics.endFill();
         return mc;
      }
      
      private function ini() : void
      {
      }
      
      private function method_14() : void
      {
      }
   }
}
