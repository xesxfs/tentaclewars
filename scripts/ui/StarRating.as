package ui
{
   import flash.display.Graphics;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.filters.GlowFilter;
   
   public class StarRating extends Sprite
   {
       
      
      private var var_267:Number = 10;
      
      private var var_256:Boolean = false;
      
      private var var_273:Function = null;
      
      private const const_5:GlowFilter = new GlowFilter(16776960,1,4,4);
      
      private var var_283:int = 0;
      
      private var var_286:int = 0;
      
      private var _value:int = -1;
      
      public function StarRating(parent:Sprite, x:Number, y:Number, onClick:Function = null, starsNum:int = 5)
      {
         super();
         this.var_286 = starsNum;
         this.var_273 = onClick;
         mouseEnabled = true;
         buttonMode = true;
         this.method_57();
         parent.addChild(this);
         addEventListener(MouseEvent.MOUSE_OUT,this.method_98);
         addEventListener(MouseEvent.CLICK,this.method_146);
      }
      
      private function method_98(e:MouseEvent) : void
      {
         var star:Sprite = null;
         star = e.target as Sprite;
         trace("onMouseFocus: " + e.type);
         §§push(true);
         if(e.type == MouseEvent.MOUSE_OVER)
         {
            star.filters = [this.const_5];
            this.var_283 = int(star.name);
         }
         else
         {
            star.filters = [];
            this.var_283 = 0;
            §§push(true);
         }
      }
      
      public function setEnable(enabled:Boolean) : void
      {
      }
      
      public function set size(size:Number) : void
      {
         this.method_57();
      }
      
      private function method_57() : void
      {
         var g:Graphics = null;
         var ang:Number = NaN;
         var j:int = 0;
         var star:Sprite = null;
         for(mouseChildren = false; numChildren > 0; )
         {
            star = getChildAt(0) as Sprite;
            star.parent.removeChild(star);
         }
         var step:Number = Math.PI * 2 / 5;
         var outer:Number = this.var_267;
         var inner:Number = true;
         for(var i:int = 0; i < this.var_286; i++)
         {
            star = new Sprite();
            star.name = String(i);
            star.x = i * outer * 2.2 - (this.var_286 - 1) * outer * 2.2 / 2;
            g = star.graphics;
            g.lineStyle(1,11184810);
            g.beginFill(i > this._value?uint(3355443):uint(16777011));
            ang = Math.PI / 4;
            g.moveTo(Math.cos(ang) * outer,Math.sin(ang) * outer);
            for(j = 0; j < 5; j++)
            {
               g.lineTo(Math.cos(ang) * outer,Math.sin(ang) * outer);
               g.lineTo(Math.cos(ang + step / 2) * inner,Math.sin(ang + step / 2) * inner);
               ang = ang + step;
            }
            ang = Math.PI / 4;
            g.lineTo(Math.cos(ang) * outer,Math.sin(ang) * outer);
            addChild(star);
         }
         mouseChildren = true;
      }
      
      public function set value(value:uint) : void
      {
         this.method_57();
      }
      
      public function destruct() : void
      {
         removeEventListener(MouseEvent.MOUSE_OVER,this.method_98);
         removeEventListener(MouseEvent.MOUSE_OUT,this.method_98);
         parent.removeChild(this);
      }
      
      public function get value() : uint
      {
         return this._value + 1;
      }
      
      private function method_146(e:MouseEvent) : void
      {
         this._value = this.var_283;
         this.method_57();
         this.var_273(this._value + 1);
      }
   }
}
