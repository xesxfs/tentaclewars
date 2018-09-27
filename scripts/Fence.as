package
{
   import flash.display.Graphics;
   import flash.display.Sprite;
   import flash.events.Event;
   
   public class Fence extends Sprite
   {
       
      
      private var var_153:Number = 0;
      
      private var var_91:Number = 0;
      
      private var var_92:Number = 0;
      
      private var var_134:Number = 0;
      
      private var var_250:Sync = null;
      
      private const const_18:int = 5;
      
      public function Fence(x1:Number, y1:Number, x2:Number, y2:Number)
      {
         super();
         this.var_92 = x1;
         this.var_91 = y1;
         this.var_134 = x2;
         this.var_153 = y2;
         this.var_250 = new Sync(0.2);
         this.method_57();
         addEventListener(Event.ENTER_FRAME,this.onEnterFrame);
      }
      
      public function get y2() : Number
      {
         return this.var_153;
      }
      
      public function get x2() : Number
      {
         return this.var_134;
      }
      
      public function destruct() : void
      {
         graphics.clear();
      }
      
      public function set x1(x:Number) : void
      {
         this.var_92 = x;
         this.method_57();
      }
      
      private function onEnterFrame(event:Event) : void
      {
      }
      
      private function method_57() : void
      {
         var g:Graphics = graphics;
         var dx:Number = this.var_134 - this.var_92;
         var dy:Number = this.var_153 - this.var_91;
         var a:Number = Math.atan2(dy,dx);
         var r:Number = this.const_18;
         var a90:Number = Math.PI / 2;
         var a180:Number = Math.PI;
         var delta:Number = Math.sin(this.var_250.phase) * 5 + 2;
         var delta2:Number = Math.sin(this.var_250.phase + a180) + 2;
         g.clear();
         g.lineStyle(2,GUI.OUTLINE_COLOR);
         g.beginFill(5592371,1);
         g.moveTo(Math.cos(a + a90) * r + this.var_92,Math.sin(a + a90) * r + this.var_91);
         g.curveTo(Math.cos(a + a180) * r * delta2 + this.var_92,Math.sin(a + a180) * r * delta2 + this.var_91,Math.cos(a - a90) * r + this.var_92,Math.sin(a - a90) * r + this.var_91);
         g.curveTo(Math.cos(a - a90) * delta + dx / 2 + this.var_92,Math.sin(a - a90) * delta + dy / 2 + this.var_91,Math.cos(a - a90) * r + this.var_134,Math.sin(a - a90) * r + this.var_153);
         g.curveTo(Math.cos(a) * r * delta2 + this.var_134,Math.sin(a) * r * delta2 + this.var_153,Math.cos(a + a90) * r + this.var_134,Math.sin(a + a90) * r + this.var_153);
         g.curveTo(Math.cos(a + a90) * delta + dx / 2 + this.var_92,Math.sin(a + a90) * delta + dy / 2 + this.var_91,Math.cos(a + a90) * r + this.var_92,Math.sin(a + a90) * r + this.var_91);
         g.endFill();
      }
      
      public function set y1(y:Number) : void
      {
         this.method_57();
      }
      
      public function set y2(y:Number) : void
      {
         this.var_153 = y;
         this.method_57();
      }
      
      public function get x1() : Number
      {
         return this.var_92;
      }
      
      public function set x2(x:Number) : void
      {
      }
      
      public function get y1() : Number
      {
         return this.var_91;
      }
   }
}
