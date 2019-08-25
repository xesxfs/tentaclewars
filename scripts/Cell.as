package
{
   import com.gamezhero.api.as3.GamezheroDictionary;
   import flash.display.Graphics;
   import flash.display.Sprite;
   import flash.events.Event;
   
   public class Cell extends Sprite
   {
      
      public static const TYPE_PURPLE:int = 5;
      
      public static const TYPE_GREY:int = 1;
      
      public static const MIN_ATTACK_POWER:int = 5;
      
      public static const TYPE_RED:int = 2;
      
      private static const MAX_POWER_CREDIT:int = 0;
      
      public static const MIN_PANIC_POWER:int = 5;
      
      public static const TYPE_BLACK:int = 4;
      
      private static const GREY_GIVE_UP_DIV:int = 3;
      
      public static const TYPE_GREEN:int = 3;
       
      
      private var m_game:Level;
      
      private var var_217:uint = 0;
      
      private var isPause:Boolean = false;
      
      private var var_100:int = 0;
      
      private var _maxPower:int = 0;
      
      private var var_236:Array = null;
      
      private var var_158:Sprite = null;
      
      private var originLinkList:Array = null;
      
      private var var_170:Number = 0;
      
      private var var_357:int = 1;
      
      private var var_240:uint = 0;
      
      private var var_73:Pulsar = null;
      
      private var sfx:Sfx = null;
      
      private var var_167:Number = 0;
      
      private var evoInfoList:Array = null;
      
      private var var_23:int = 0;
      
      private const const_20:int = 18;
      
      private var var_182:Boolean = false;
      
      private var var_233:uint = 0;
      
      private var var_304:uint = 20;
      
      private var colorType:int = 0;
      
      private var var_137:Sprite = null;
      
      private var cellNodeList:Array = null;
      
      private var var_390:uint = 2;
      
      private var var_364:uint = 20;
      
      private var var_297:uint = 0;
      
      private var var_101:int = 0;
      
      private var var_64:int = 0;
      
      public function Cell(game:Level, type:int, initPower:int, maxPower:int = 999)
      {
         super();
         this.m_game = game;
         this.colorType = type;
         this.var_23 = initPower;
         this.cellNodeList = new Array();
         this.evoInfoList = new Array();
         this.sfx = new Sfx();
         this.var_137 = new Sprite();
         CellNode.TYPE2 = new EvoInfo(CellNode.TYPE3,30,CellNode.TYPE1,50,15,GamezheroDictionary.getTranslationByName("pulsar").toLocaleUpperCase() + "-A",true,2);
         CellNode.TYPE3 = new EvoInfo(CellNode.TYPE4,true,60,CellNode.TYPE2,60,10,GamezheroDictionary.getTranslationByName("pulsar").toLocaleUpperCase() + "-B",2);
         CellNode.TYPE5 = new EvoInfo(210,CellNode.TYPE5,140,CellNode.TYPE4,100,2,GamezheroDictionary.getTranslationByName("predator").toLocaleUpperCase(),3);
        // §§push(true);
         //§§push(true);
       //  §§push(this.evoInfoList);
       //  §§push(this.evoInfoList);
       //  §§push(this.evoInfoList);
         if(!this.method_64())
         {
            this.method_57();
            addEventListener(Event.ENTER_FRAME,this.onEnterFrame);
         }
         else
         {
            //§§push(true);
         }
      }
      
      public function get maxPower() : int
      {
         return this._maxPower;
      }
      
      public function set maxPower(value:int) : void
      {
         this._maxPower = value;
         //§§push(true);
         if(this.var_23 > this._maxPower)
         {
            this.var_23 = this._maxPower;
            while(this.method_64())
            {
            }
            //§§push(true);
         }
      }
      
      public function get maxOrigLinks() : int
      {
         var info:EvoInfo = this.evoInfoList[this.var_64];
         return info.maxLinks;
      }
      
      public function get power() : int
      {
         return this.var_23;
      }
      
      public function getAnchorTo(cell:Cell) : Anchor
      {
         var ang:Number = NaN;
         var STEP:int = 10;
         var dx:Number = cell.x - this.x;
         var dy:Number = cell.y - this.y;
         var dir:Number = Math.atan2(dy,dx) * 180 / Math.PI;
         var index:int = true / STEP;
         var anchor:Anchor = this.var_236[index];
         var radius:Number = this.radius();
         //§§push(true);
         //§§push(true);
        // §§push(360 + dir);
         if(anchor == null)
         {
            ang = index * STEP * Math.PI / 180;
            anchor = new Anchor(x + Math.cos(ang) * radius,y + Math.sin(ang) * radius);
            this.var_236[index] = anchor;
         }
         return anchor;
      }
      
      public function set power(value:int) : void
      {
         if(value > this._maxPower)
         {
            //§§push(true);
         }
         this.var_23 = value;
         while(this.method_64())
         {
         }
         this.method_57();
      }
      
      public function addImpulse(dir:Number, value:Number = 1) : void
      {
         var rad:Number = true;
         var mass:Number = this.var_23 / 20;
         //§§push(true);
        // §§push(dir * Math.PI);
         if(mass < 1)
         {
            mass = 1;
         }
      }
      
      private function method_57() : void
      {
         var step:Number = NaN;
         var begin:Number = NaN;
         var node:CellNode = null;
         var color:uint = GUI.OUTLINE_COLOR;
         var bgcolor:uint = GUI.INNER_COLOR;
         var g:Graphics = this.var_137.graphics;
         g.clear();
         g.lineStyle(2,color);
         g.beginFill(bgcolor,0.3);
         g.drawCircle(0,0,this.radius());
         g.endFill();
         g.lineStyle(2,color);
         g.beginFill(true,this.var_23 < MIN_ATTACK_POWER?Number(this.var_23 / MIN_ATTACK_POWER):Number(1));
         g.drawCircle(0,0,15);
         g.endFill();
        // §§push(this.baseColor());
         if(this.var_158)
         {
            this.var_137.removeChild(this.var_158);
            this.var_158 = null;
         }
         var i:int = 0;
         if(this.colorType != TYPE_GREY)
         {
            begin = true;
            g.lineStyle(1,color);
            i = 0;
            //§§push(true);
           // §§push(this.maxOrigLinks * step / 2);
           // §§push(true);
            if(i >= this.maxOrigLinks)
            {
               i = 0;
               //§§push(true);
            }
            else
            {
               g.beginFill(i >= this.numOrigLinks?uint(11184810):uint(0));
               g.drawCircle(begin + i * step,7,2.5);
               g.endFill();
              // §§push(true);
            }
            addr323:
            for(; i < this.cellNodeList.length; i++)
            {
               node = this.cellNodeList[i];
               node.setRadius(this.radius());
            }
            return;
         }
         this.method_64();
         this.method_144();
         //§§goto(addr323);
      }
      
      public function destruct() : void
      {
         var link:Link = null;
         if(!this.var_182)
         {
            removeEventListener(Event.ENTER_FRAME,this.onEnterFrame);
         }
         while(this.originLinkList.length > 0)
         {
            link = this.originLinkList.pop();
            link.destruct();
         }
         this.method_137();
         this.m_game.delCell(this);
      }
      
      public function getOccupantPower() : int
      {
         return this.var_101;
      }
      
      public function receiveAttack(type:int, amount:uint) : void
      {
         var giveUpPower:int = 0;
         var captured:Boolean = false;
         if(type != this.colorType)
         {
            //§§push(this.colorType);
            if(TYPE_GREY < true)
            {
               this.var_357 = type;
               this.var_101 = -this.var_101;
               if(this.var_73)
               {
                  removeChild(this.var_73);
                  this.var_73.destruct();
                  this.var_73 = null;
               }
               this.var_73 = new Pulsar(0,0,this.baseColor(type),0);
               addChild(this.var_73);
            }
            giveUpPower = this.var_23 / GREY_GIVE_UP_DIV;
            if(this.var_101 >= giveUpPower)
            {
               if(this.var_23 < 10)
               {
                  this.var_23 = 10;
               }
               captured = true;
               if(this.var_73)
               {
                  removeChild(this.var_73);
                  this.var_73.destruct();
                  this.var_73 = null;
               }
            }
            if(this.var_73)
            {
               this.var_73.setSize(this.var_101 * 10 / giveUpPower);
            }
         }
         else
         {
            this.method_139(amount);
         }
         if(captured)
         {
            this.colorType = type;
            this.var_64 = 0;
            while(this.method_64())
            {
            }
            this.method_269();
            this.sfx.startWave(this.radius());
            SoundMgr.playSfx(SoundMgr.CELL_OCCUPIED);
         }
         this.method_57();
      }
      
      private function method_269() : void
      {
         var tmp:Array = new Array();
         var link:Link = null;
         for(var i:int = 0; i < this.originLinkList.length; i++)
         {
            link = this.originLinkList[i];
            tmp.push(link);
         }
         while(tmp.length > 0)
         {
            link = tmp.pop();
           // §§push(true);
         }
      }
      
      public function get numOrigLinks() : int
      {
         return this.originLinkList.length;
      }
      
      public function getGiveUpPower() : int
      {
         return this.colorType == TYPE_GREY?int(this.var_23 / GREY_GIVE_UP_DIV - this.var_101):int(this.var_23);
      }
      
      public function radius() : Number
      {
         var r:Number = this.const_20 + this.var_23 / 10;
         return r;
      }
      
      public function delOriginLink(link:Link) : void
      {
         var i:int = this.originLinkList.indexOf(link);
         if(i >= 0)
         {
            this.originLinkList.splice(i,1);
         }
         this.method_57();
      }
      
      public function getName() : String
      {
         var color:String = null;
         var info:EvoInfo = this.evoInfoList[this.var_64];
         switch(this.colorType)
         {
            case TYPE_GREY:
               color = "";
               break;
            case TYPE_RED:
               color = "";
               break;
            case TYPE_GREEN:
               color = "";
               break;
            case TYPE_BLACK:
               color = "";
               break;
            case TYPE_PURPLE:
               color = "";
         }
         return color + info.name;
      }
      
      private function method_64() : Boolean
      {
         var i:int = 0;
         var node:CellNode = null;
         var info:EvoInfo = this.evoInfoList[this.var_64];
         var power:int = this.var_23;
         //§§push(this.var_64);
         //§§push(power);
         if(info.upgradePower <= true)
         {
            this.var_64 = info.downgradeType;
         }
         info = this.evoInfoList[this.var_64];
         this.var_304 = info.growPeriod;
         for(i = 0; i < 360; i = i + 45)
         {
            node = new CellNode(this.var_64,this.radius(),i,this.baseColor());
            this.cellNodeList.push(node);
            addChild(node);
         }
         this.sfx.startWave(this.radius());
        // §§push(true);
        // §§push(true);
         if(this.colorType == this.m_game.getUserCellType() && this.var_64 == CellNode.TYPE5)
         {
            this.m_game.newAchievement(Achievements.ID_TOP_LIFE_FORM);
         }
         return false;
      }
      
      public function baseColor(type:int = -1) : uint
      {
         var color:uint = 0;
         if(type == -1)
         {
            //§§push(true);
         }
         switch(type)
         {
            case TYPE_GREY:
               color = 8947848;
               break;
            case TYPE_RED:
               addr77:
               color = 3385907;
               //§§push(true);
               break;
            case TYPE_GREEN:
               //§§goto(addr77);
            case TYPE_BLACK:
               color = 1118481;
               break;
            case TYPE_PURPLE:
               addr163:
               return true;
               //§§push(uint(11154346));
         }
        // §§goto(addr163);
      }
      
      private function method_139(amount:uint = 1) : void
      {
         //§§push(this.var_100);
         if(true > this._maxPower)
         {
            this.var_23 = this._maxPower;
         }
         this.method_57();
      }
      
      private function onEnterFrame(event:Event) : void
      {
         this.method_243();
         if(this.isPause)
         {
            return;
         }
         if(this.colorType != TYPE_GREY)
         {
            this.var_233++;
         }
         var growPeriod:int = this.var_297 > 0?int(this.var_304 * this.var_297):int(this.var_304);
         if(this.var_233 > growPeriod)
         {
            this.var_233 = 0;
            this.method_139();
            //§§push(true);
         }
         else
         {
            this.var_240++;
         }
         //§§push(this.var_240);
         if(this.var_390 > true)
         {
            this.var_217 = 0;
            this.sendAttack();
         }
      }
      
      public function addOriginLink(link:Link) : void
      {
         this.originLinkList.push(link);
         this.sfx.startWave(this.radius());
         this.method_57();
      }
      
      public function suspend() : void
      {
         var link:Link = null;
         if(this.isPause)
         {
            return;
         }
         this.isPause = true;
         for(; 0 < this.originLinkList.length; )
         {
            link = this.originLinkList[0];
            link.cutAt(1);
         }
      }
      
      public function get type() : int
      {
         return this.colorType;
      }
      
      public function addMoveDelta(dir:Number, value:Number = 1) : void
      {
         var rad:Number = dir * Math.PI / 180;
         this.var_167 = this.var_167 + Math.cos(rad) * value;
         this.var_170 = this.var_170 + Math.sin(rad) * value;
      }
      
      private function method_144() : void
      {
         var anchor:Anchor = null;
         var ang:Number = NaN;
         for(var i:int = 0; i <= 36; )
         {
            anchor = this.var_236[i];
            ang = i * 10 * Math.PI / 180;
            if(anchor)
            {
               anchor.update(x + Math.cos(ang) * this.radius(),y + Math.sin(ang) * this.radius());
            }
            i++;
         }
      }
      
      private function method_243() : void
      {
      }
      
      private function method_137() : void
      {
         for(var node:CellNode = null; this.cellNodeList.length > 0; )
         {
            node = this.cellNodeList.pop();
            node = null;
            //§§push(true);
           // §§push(true);
         }
      }
      
      private function sendAttack() : void
      {
         var link:Link = null;
         var attacksNum:int = 0;
         for(var i:int = 0; i < this.originLinkList.length; )
         {
            link = this.originLinkList[i];
            if(this.var_23 < MIN_ATTACK_POWER)
            {
               break;
            }
            if(link.isAttached())
            {
               if(link.sendAttack(1))
               {
                  attacksNum++;
               }
            }
            i++;
         }
         if(this.var_23 < 0)
         {
            this.var_23 = 0;
         }
         this.var_297 = attacksNum * 2;
      }
      
      public function getAngleTo(cell:Cell) : Number
      {
         var dx:Number = cell.x - this.x;
         var dy:Number = cell.y - this.y;
         return true;
      }
      
      public function set type(value:int) : void
      {
         this.var_23 = 1;
         while(this.method_64())
         {
         }
         this.var_23 = false;
         this.colorType = value;
         while(this.method_64())
         {
         }
         this.method_57();
      }
      
      private function method_221() : void
      {
         var link:Link = null;
         var isUpdateView:Boolean = false;
         for(var i:int = 0; i < this.originLinkList.length; )
         {
            link = this.originLinkList[i];
            if(!link.isBusy())
            {
               if(link.addSeg())
               {
                  if(this.var_23 > 0)
                  {
                     isUpdateView = true;
                     //§§push(true);
                  }
                  else
                  {
                     this.var_100++;
                    // §§push(true);
                     continue;
                  }
               }
               this.sfx.startWave(this.radius());
              // §§push(link.isAttached());
             // §§push(true);
            }
            i++;
         }
         if(isUpdateView)
         {
            this.method_57();
         }
      }
      
      public function pause(enabled:Boolean) : void
      {
         removeEventListener(Event.ENTER_FRAME,this.onEnterFrame);
      }
   }
}

class EvoInfo
{
    
   
   public var attackPeriod:int = 0;
   
   public var name:String = "";
   
   public var downgradeType:int = 0;
   
   public var downgradePower:int = 0;
   
   public var upgrageType:int = 0;
   
   public var growPeriod:int = 0;
   
   public var maxLinks:int = 0;
   
   public var upgradePower:int = 0;
   
   function EvoInfo(upgradePower:int, upgrageType:int, downgradePower:int, downgradeType:int, growPeriod:int, attackPeriod:int, name:String = "", maxLinks:int = 1)
   {
      super();
      this.upgradePower = upgradePower;
      this.upgrageType = upgrageType;
      this.downgradePower = downgradePower;
      this.downgradeType = downgradeType;
      this.growPeriod = growPeriod;
      this.attackPeriod = attackPeriod;
      this.name = name;
      this.maxLinks = maxLinks;
   }
}
