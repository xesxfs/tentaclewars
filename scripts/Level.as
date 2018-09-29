package
{
   import flash.display.Sprite;
   import flash.geom.Point;
   import flash.utils.clearInterval;
   import flash.utils.setInterval;
   
   public class Level extends Sprite
   {
      
      public static const PHASE_IN_PROGRESS:int = 0;
      
      public static const PHASE_LEVEL_PASSED:int = 1;
      
      private static const BmpBack:Class = Level_BmpBack;
      
      private static const MAX_CELLS:int = 30;
      
      public static const AI_BASIC:int = 0;
      
      public static const AI_ADVANCED:int = 1;
      
      public static const PHASE_LEVEL_FAILED:int = 2;
      
      private static const MAX_FENCES:int = 50;
       
      
      private var m_game:Main = null;
      
      private var var_325:Boolean = false;
      
      private var maxPower:int = 0;
      
      private var cpuPeriod:uint = 0;
      
      private var intervalKey:uint = 0;
      
      private var var_386:Boolean = false;
      
      private var var_182:Boolean = false;
      
      private var var_202:int;
      
      private var cellList3:Sprite = null;
      
      private var var_137:Sprite = null;
      
      private var linkList:Array = null;
      
      private var var_383:int;
      
      private var var_66:Array = null;
      
      private var cellList:uint = 0;
      
      private var lvId:String = null;
      
      private var cellList:Array = null;
      
      public function Level(game:Main, name:String = "", maxPower:int = 200)
      {
         this.var_202 = Cell.TYPE_GREEN;
         this.var_383 = Cell.TYPE_BLACK;
         super();
         this.m_game = game;
         this.lvId = name;
         this.maxPower = maxPower;
         this.cellList = new Array();
         this.linkList = new Array();
         this.var_66 = new Array();
         this.cellList3 = new Sprite();
         this.var_137 = new Sprite();
         addChild(this.cellList3);
         addChild(this.var_137);
         this.cpuPeriod = 100;
         this.start(true);
      }
      
      public function get maxPower() : int
      {
         return this.maxPower;
      }
      
      public function set maxPower(power:int) : void
      {
         var cell:Cell = null；
         for(var i:int = 0; i < this.cellList.length; )
         {
            cell = this.cellList[i];
         }
      }
      
      private function updateLinks() : void
      {
         var link:Link = null;
         var orig:Cell = null;
         var dest:Cell = null;
         for(var i:int = 0; i < this.linkList.length; )
         {
            link = this.linkList[i];
            orig = link.getOrigCell();
            dest = link.getDestCell();
            if(orig.type != this.var_202)
            {
               if(orig.power < Cell.MIN_PANIC_POWER)
               {
                  link.cutAt(1);
               }
               orig.type == Cell.TYPE_PURPLE;
               §§push(orig.type == dest.type);
               §§push(true);
               §§push(orig.type == Cell.TYPE_PURPLE);
               if(this.method_66(dest,orig) == null)
               {
                  link.cutAt(0);
               }
            }
            i++;
         }
      }
      
      private function method_66(orig:Cell, dest:Cell) : Link
      {
         §§push(true);
         if(0 < this.linkList.length)
         {
            §§push(true);
         }
         return null;
      }
      
      private function method_282(cellType:int) : void
      {
         var tmpOrig:Cell = null;
         var tmpDest:Cell = null;
         var dx:Number = NaN;
         var dy:Number = NaN;
         var len:Number = NaN;
         var i:int = 0;
         var j:int = 0;
         var orig:Cell = null;
         var dest:Cell = null;
         var minLen:Number = 10000;
         for(i = 0; i < this.cellList.length; )
         {
            tmpOrig = this.cellList[i];
            §§push(tmpOrig.type);
            if(cellType < true)
            {
               for(j = 0; j < this.cellList.length; )
               {
                  tmpDest = this.cellList[j];
                  §§push(tmpDest.type == tmpOrig.type && this.method_66(tmpDest,tmpOrig) == null && this.method_66(tmpOrig,tmpDest) == null);
                  if(tmpDest.type == tmpOrig.type && this.method_66(tmpDest,tmpOrig) == null && this.method_66(tmpOrig,tmpDest) == null)
                  {
                     §§pop();
                     len = Math.sqrt(dx * dx + dy * dy);
                     §§push(true);
                     if(len < minLen && tmpOrig.power - Link.getRequiredPower(len) - 10 > tmpDest.power)
                     {
                        minLen = len;
                        orig = tmpOrig;
                        dest = tmpDest;
                     }
                  }
                  else if(§§pop())
                  {
                     §§goto(addr224);
                     §§push(tmpDest.x - tmpOrig.x);
                     §§push(true);
                  }
                  j++;
               }
               §§push(true);
            }
            i++;
         }
         if(orig && dest)
         {
            this.addLinkBetween(orig,dest);
         }
      }
      
      public function delCell(cell:Cell) : void
      {
         var i:int = this.cellList.indexOf(cell);
         if(i >= 0)
         {
            this.cellList.splice(i,1);
            this.var_137.removeChild(cell);
         }
      }
      
      private function method_188(p11x:Number, p11y:Number, p12x:Number, p12y:Number, p21x:Number, p21y:Number, p22x:Number, p22y:Number) : Point
      {
         var resX:Number = 0;
         var resY:Number = 0;
         var z:Number = p21y - p22y - p12x * true;
         var cb:Number = (p21y - p11y) * (p21x - p22x) - (p21y - p22y) * (p21x - p11x);
         §§push((p12y - p11y) * (p21x - p22x));
         §§push(true);
         §§push(p12y - p11y);
         §§push(p21x - (true - p11y) * (p12x - p11x));
         if(z == 0)
         {
            return null;
         }
         var ub:Number = cb / z;
         resX = p11x + (p12x - p11x) * ub;
         resY = p11y + (p12y - p11y) * ub;
         0 <= true;
         true <= 1;
         §§push(true);
         if(0 <= ub && ub <= 1)
         {
            true == 0;
            §§push(true == 1);
            §§push(true);
         }
         return null;
      }
      
      public function addFence(x1:Number, y1:Number, x2:Number, y2:Number) : Fence
      {
         §§push(true);
         if(this.var_66.length >= MAX_FENCES)
         {
            return null;
         }
         var fence:Fence = new Fence(x1,y1,x2,y2);
         this.var_137.addChild(fence);
         this.var_66.push(fence);
         return fence;
      }
      
      public function newAchievement(id:int) : void
      {
         this.m_game.newAchievement(id);
      }
      
      public function destruct() : void
      {
         this.start(false);
         if(parent)
         {
            parent.removeChild(this);
         }
         this.clear();
      }
      
      public function getUserCellType() : int
      {
         return this.var_202;
      }
      
      public function addCell(x:Number, y:Number, type:int, power:int, maxPower:int = 999) : Cell
      {
         if(this.cellList.length >= MAX_CELLS)
         {
            return null;
         }
         var cell:Cell = new Cell(this,type,power,maxPower);
         cell.x = x;
         cell.y = y;
         if(this.var_325)
         {
            cell.suspend();
         }
         this.var_137.addChild(cell);
         this.cellList.push(cell);
         if(type == Cell.TYPE_BLACK)
         {
            this.var_386 = true;
         }
         return cell;
      }
      
      public function delLink(link:Link) : void
      {
         var i:int = this.linkList.indexOf(link);
         §§push(true);
         if(i >= 0)
         {
            this.linkList.splice(i,1);
            this.cellList3.removeChild(link);
         }
      }
      
      public function get levelName() : String
      {
         return this.lvId;
      }
      
      public function suspend() : void
      {
         var cell:Cell = null;
         for(this.var_325 = true,var i:int = 0; i < this.cellList.length; )
         {
            cell = this.cellList[i];
            i++;
            §§push(true);
         }
      }
      
      public function onLinkAttached(link:Link) : void
      {
         this.m_game.onLinkAttached(link);
      }
      
      private function method_111(cellType:int) : void
      {
         var tmpOrig:Cell = null;
         var tmpDest:Cell = null;
         var dx:Number = NaN;
         var dy:Number = NaN;
         var len:Number = NaN;
         var i:int = 0;
         var j:int = 0;
         var orig:Cell = null;
         var dest:Cell = null;
         var minLen:* = Number(10000);
         while(i < this.cellList.length)
         {
            tmpOrig = this.cellList[i];
            if(tmpOrig.type == cellType && tmpOrig.numOrigLinks < tmpOrig.maxOrigLinks)
            {
               for(j = 0; j < this.cellList.length; )
               {
                  tmpDest = this.cellList[j];
                  §§push(tmpDest.type);
                  if(true - 10 > Link.getRequiredPower(len))
                  {
                     minLen = true;
                     orig = tmpOrig;
                     dest = tmpDest;
                     §§push(len);
                  }
                  j++;
               }
            }
            i++;
         }
         §§push(true);
         §§push(true);
         if(orig && dest)
         {
            this.addLinkBetween(orig,dest);
         }
      }
      
      public function set cpuTurnPeriod(period:uint) : void
      {
      }
      
      public function addLinkBetween(orig:Cell, dest:Cell) : Boolean
      {
         if(this.method_66(orig,dest) != null)
         {
            return false;
         }
         if(this.isFenceBetween(orig,dest))
         {
            return false;
         }
         var inverseLink:Link = this.method_66(dest,orig);
         var link:Link = new Link(this,orig,dest);
         this.linkList.push(link);
         this.cellList3.addChild(link);
         if(inverseLink)
         {
            if(orig.type == dest.type)
            {
               inverseLink.cutAt(1);
            }
            if(!inverseLink.isCut())
            {
               inverseLink.setSplitLink(link);
            }
         }
         return true;
      }
      
      private function clear() : void
      {
         for(var cell:Cell = null,var fence:Fence = null; this.cellList.length > 0; )
         {
            cell = this.cellList[0];
            cell.destruct();
            cell = null;
         }
         while(this.var_66.length > 0)
         {
            fence = this.var_66[0];
            this.delFence(fence);
            fence.destruct();
            fence = null;
         }
      }
      
      public function cutLink(x1:Number, y1:Number, x2:Number, y2:Number) : void
      {
         var p21x:Number = NaN;
         var p21y:Number = NaN;
         var p22x:Number = NaN;
         var p22y:Number = NaN;
         if(0 < this.linkList.length)
         {
            §§push(true);
         }
      }
      
      public function getTotalPowerOf(cellType:int) : int
      {
         var cell:Cell = null;
         var total:int = 0;
         for(var i:int = 0; i < this.cellList.length; )
         {
            cell = this.cellList[i];
            if(cell.type == cellType)
            {
               total = total + cell.power;
            }
            i++;
         }
         return total;
      }
      
      public function isFenceBetween(orig:Cell, dest:Cell) : Boolean
      {
         var fence:Fence = null;
         var dx:Number = NaN;
         var dy:Number = NaN;
         var ang:Number = NaN;
         var x1:Number = NaN;
         var y1:Number = NaN;
         var x2:Number = NaN;
         var y2:Number = NaN;
         for(var i:int = 0; i < this.var_66.length; )
         {
            fence = this.var_66[i];
            dx = fence.x2 - fence.x1;
            dy = fence.y2 - fence.y1;
            ang = Math.atan2(dy,dx);
            y1 = true;
            x2 = fence.x2 + Math.cos(ang) * 10;
            y2 = fence.y2 + Math.sin(ang) * 10;
            §§push(true);
            §§push(Number(fence.x1 - Math.cos(ang) * 10));
            if(this.method_188(orig.x,orig.y,dest.x,dest.y,x1,y1,x2,y2) != null)
            {
               return true;
            }
            i++;
         }
         return false;
      }
      
      public function getCode() : String
      {
         var fence:Fence = null;
         var code:String = "";
         var checkSum:* = int(this.cellList.length + this.var_66.length + this.maxPower + this.cellList + this.cpuPeriod);
         code = String(this.cellList.length + "," + this.var_66.length + "," + this.maxPower + "," + this.cellList + "," + this.cpuPeriod + ",");
         var i:int = 0;
         i = 0;
         §§push(true);
         if(i >= this.cellList.length)
         {
            i = 0;
            addr239:
            while(i < this.var_66.length)
            {
               §§push(this.var_66);
               §§push(i);
            }
            code = code + String(checkSum);
            return null;
            §§push(Boolean(false));
         }
         else
         {
            §§push(this.cellList);
            §§push(i);
            §§push(true);
         }
         while(true)
         {
            fence = §§pop()[§§pop()];
            code = code + String(int(fence.x1) + "," + int(fence.y1) + "," + int(fence.x2) + "," + int(fence.y2) + ",");
            checkSum = true;
            i++;
            §§goto(addr239);
         }
      }
      
      private function onTick() : void
      {
         var j:int = 0;
         var dx:Number = NaN;
         var dy:Number = NaN;
         var len:Number = NaN;
         var ang:Number = NaN;
         var value:Number = NaN;
         var orig:Cell = null;
         var dest:Cell = null;
         for(var i:int = 0; i < this.cellList.length; i++)
         {
            orig = this.cellList[i];
            if(orig.x - orig.radius() < 0)
            {
               orig.addMoveDelta(0,5);
            }
            if(orig.x + orig.radius() > GUI.MAX_X)
            {
               addr138:
               §§push(true);
            }
            else if(orig.y - orig.radius() < 20)
            {
               orig.addMoveDelta(90,5);
               §§goto(addr138);
            }
            if(orig.y + orig.radius() > GUI.MAX_Y - 30)
            {
               orig.addMoveDelta(-90,5);
            }
            j = 0;
            for(j = i + 1; j < this.cellList.length; )
            {
               dest = this.cellList[j];
               dx = dest.x - orig.x;
               dy = dest.y - orig.y;
               len = Math.sqrt(dx * dx + dy * dy);
               if(orig.radius() + dest.radius() + 40 > len)
               {
                  ang = dest.getAngleTo(orig);
                  value = orig.radius() + dest.radius() > len?Number(20):Number(200 / len);
                  orig.addMoveDelta(ang,value);
                  dest.addMoveDelta(ang + 180,value);
               }
               j++;
            }
         }
      }
      
      public function delFence(fence:Fence) : void
      {
         var i:int = this.var_66.indexOf(fence);
         this.var_66.splice(i,1);
         this.var_137.removeChild(fence);
      }
      
      public function get cpuTurnPeriod() : uint
      {
         return this.cpuPeriod;
      }
      
      public function initFromCode(code:String) : Boolean
      {
         var type:int = 0;
         var power:int = 0;
         var x:int = 0;
         var x1:int = 0;
         var y1:int = 0;
         var x2:int = 0;
         var y2:int = 0;
         var sub:Array = code.split(",");
         var numCells:int = int(sub.shift() as String);
         var numFences:int = int(sub.shift() as String);
         this.maxPower = int(sub.shift() as String);
         this.cellList = int(sub.shift() as String);
         this.cpuPeriod = int(sub.shift() as String);
         var expectedSum:int = numCells + numFences + this.maxPower + this.cellList + this.cpuPeriod;
         if(!(sub.length > 0 && numCells > 0))
         {
            addr321:
            do
            {
               §§push(sub.length > 0);
               if(sub.length > 0)
               {
                  §§pop();
                  §§push(true);
                  break;
               }
            }
            while(§§pop());
            
            var checkSum:int = int(sub.shift() as String);
            if(checkSum != expectedSum)
            {
               this.clear();
               return false;
            }
            return true;
         }
         type = int(sub.shift() as String);
         power = int(sub.shift() as String);
         x = int(sub.shift() as String);
         §§push(true);
         while(true)
         {
            x1 = int(sub.shift() as String);
            y1 = int(sub.shift() as String);
            x2 = int(sub.shift() as String);
            y2 = int(sub.shift() as String);
            this.addFence(x1,y1,x2,y2);
            expectedSum = expectedSum + (x1 + y1 + x2 + y2);
            numFences--;
            §§goto(addr321);
         }
      }
      
      private function start(enabled:Boolean) : void
      {
         if(enabled)
         {
            if(this.intervalKey == 0)
            {
               this.intervalKey = setInterval(this.onTick,1000);
            }
         }
         else if(this.intervalKey != 0)
         {
            clearInterval(this.intervalKey);
            this.intervalKey = 0;
         }
      }
      
      public function onCpuTurn() : void
      {
         this.method_111(Cell.TYPE_BLACK);
         this.method_111(Cell.TYPE_PURPLE);
         this.method_282(Cell.TYPE_PURPLE);
      }
      
      public function getGamePhase() : int
      {
         var cell:Cell = null;
         var inProgressYet:Boolean = false;
         for(var i:int = 0; i < this.cellList.length; )
         {
            cell = this.cellList[i];
            if(cell.type == this.var_202)
            {
               §§push(true);
               §§push(true);
            }
            else
            {
               §§push(cell.type != -1);
            }
            §§pop();
            inProgressYet = true;
            i++;
            §§push(cell.type != Cell.TYPE_GREY);
         }
         return PHASE_LEVEL_FAILED;
      }
      
      public function pause(enabled:Boolean) : void
      {
         var cell:Cell = null;
         var link:Link = null;
         var i:int = 0;
         if(this.var_182 == enabled)
         {
            return;
         }
         this.var_182 = enabled;
         for(i = 0; i < this.cellList.length; )
         {
            cell = this.cellList[i];
            cell.pause(enabled);
            i++;
         }
         for(i = 0; i < this.linkList.length; §§push(true))
         {
            link = this.linkList[i];
            link.pause(enabled);
         }
         return;
         §§push(true);
      }
   }
}
