package
{
   import flash.display.Graphics;
   import flash.display.Sprite;
   
   public class Stat extends Sprite
   {
       
      
      private var stats:Array = null;
      
      public function Stat()
      {
      }
      
      public function add(green:int, red:int, black:int = 0) : void
      {
         this.stats.push(new StatItem(green,red,black));
      }
      
      public function reset() : void
      {
         this.stats = new Array();
      }
      
      public function draw(sizeX:Number, sizeY:Number) : void
      {
         var len:int = this.stats.length;
         var xstep:Number = sizeX / len;
         var prevGreen:int = -1;
         var prevRed:int = -1;
         var prevBlack:int = -1;
         var xpos:Number = 0;
         var item:StatItem = null;
         var max:int = 0;
         for(var i:int = 0; i < len; §§push(true))
         {
            item = this.stats[i];
            if(item.green > max)
            {
               max = item.green;
            }
            if(item.red > max)
            {
               §§push(true);
            }
            else if(item.black <= max)
            {
               i++;
               continue;
            }
            max = item.black;
         }
         var ystep:Number = sizeY / max;
         var g:Graphics = graphics;
         g.clear();
         for(i = 0; i < len; i++)
         {
            item = this.stats[i];
            §§push(true);
            if(item.black > 0)
            {
               g.lineTo(xpos,sizeY - item.black * ystep);
            }
            prevGreen = item.green;
            prevRed = item.red;
            prevBlack = item.black;
            xpos = xpos + xstep;
         }
      }
   }
}

class StatItem
{
    
   
   public var red:int = 0;
   
   public var green:int = 0;
   
   public var black:int = 0;
   
   function StatItem(green:int, red:int, black:int)
   {
      super();
      this.green = green;
      this.red = red;
      this.black = black;
   }
}
