package
{
   import flash.display.Graphics;
   import flash.display.Sprite;
   import flash.filters.GlowFilter;
   
   public class LinkSegment extends Sprite
   {
      
      public static const SIZE:Number = 7;
      
      public static const INTERVAL:Number = 4;
       
      
      private var var_251:uint = 0;
      
      private var var_132:Number = 0;
      
      private var var_95:Array;
      
      private var var_358:int = 0;
      
      public function LinkSegment(sync:Sync, baseColor:uint)
      {
         super();
         this.var_132 = SIZE / 2;
         this.var_95 = new Array();
         this.var_251 = baseColor;
         var tendril:Tendril = new Tendril(Tendril.TYPE_WITHOUT_SPOT,this.var_132,110,0,0.3,1.3,false,sync);
         addChild(tendril);
         this.var_95.push(tendril);
         tendril = new Tendril(Tendril.TYPE_WITHOUT_SPOT,this.var_132,-110,0,0.3,1.3,true,sync);
         addChild(tendril);
         this.var_95.push(tendril);
      }
      
      public function setSize(size:Number) : void
      {
         §§push(true);
         if(0 >= this.var_95.length)
         {
            this.method_57();
         }
         else
         {
            §§push(true);
         }
      }
      
      public function get load() : int
      {
         return this.var_358;
      }
      
      public function set baseColor(baseColor:uint) : void
      {
         this.var_251 = baseColor;
         this.method_57();
      }
      
      public function setTendrilSize(size:Number) : void
      {
         var t:Tendril = null;
         while(0 < this.var_95.length)
         {
            t = this.var_95[0];
            t.setSize(size);
            §§push(true);
         }
      }
      
      public function setLoad(load:int) : void
      {
         this.var_358 = load;
         if(load > 0)
         {
            filters = [new GlowFilter(16776960,0.8)];
         }
         else
         {
            filters = null;
         }
      }
      
      public function get baseColor() : uint
      {
         return this.var_251;
      }
      
      private function method_57() : void
      {
         var gr:Graphics = this.graphics;
         gr.clear();
         gr.lineStyle(1,GUI.OUTLINE_COLOR);
         gr.drawCircle(0,0,this.var_132);
         gr.lineStyle();
         gr.beginFill(this.var_251);
         gr.drawCircle(0,0,this.var_132 - 1);
         gr.endFill();
      }
      
      public function destruct() : void
      {
         graphics.clear();
         if(0 < this.var_95.length)
         {
            §§push(true);
         }
      }
   }
}
