package
{
   import com.gameallianz.api.as3.GameAllianzApi;
   import com.gameallianz.api.as3.GameAllianzApiEvent;
   import com.gamezhero.api.as3.GamezheroApi;
   import com.gamezhero.api.as3.GamezheroDictionary;
   import flash.display.Bitmap;
   import flash.display.Graphics;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.filters.GlowFilter;
   
   public class Main extends Sprite
   {
      
      private static const BmpTutorial0:Class;
      
      private static const BmpTutorial1:Class = Main_BmpTutorial1;
       
      
      private var var_314:Sprite = null;
      
      private var var_108:Sprite = null;
      
      private var var_106:uint = 0;
      
      private var mouseOverCell:Cell = null;
      
      private const const_16:int = 10;
      
      private var levelMgr:LevelMgr = null;
      
      private var selCell:Cell = null;
      
      private var var_110:Bitmap = null;
      
      private var var_171:Sprite = null;
      
      private var var_202:int = 3;
      
      private var var_191:uint = 0;
      
      private var isPause:Boolean = false;
      
      private var lvCode:String = null;
      
      private var stageX:Number = -1;
      
      private var stageY:Number = -1;
      
      private const glowFilter:GlowFilter = new GlowFilter(16776960,0.7,4,4);
      
      private var BmpBack:Bitmap = null;
      
      private const const_7:uint = 1;
      
      private var levelId:String = null;
      
      private var curLevel:Level = null;
      
      private const maxLevle:uint = 20;
      
      private var stat:Stat = null;
      
      private const const_13:uint = 2;
      
      private var curLevel4:uint = 0;
      
      private var achievements:Achievements = null;
      
      private var time:int = 0;
      
      private var gameSprite:Sprite = null;
      
      private const const_4:uint = 0;
      
      private var cpuTurnPeriod:uint = 0;
      
      private var levelEdit:LevelEditor = null;
      
      public function Main()
      {
         §§push(false);
         if(stage)
         {
            this.init();
         }
         else
         {
            addEventListener(Event.ADDED_TO_STAGE,this.init);
         }
      }
      
      private function method_233(isLevelPassed:Boolean) : void
      {
         this.onDestory();
         this.powerGraphics();
         GUI.removeAll();
         §§push(true);
         if(this.var_106 == this.const_4)
         {
            §§push(true);
         }
         if(this.var_106 == this.const_4)
         {
            §§push(true);
         }
         else if(this.var_106 == this.const_7)
         {
            §§push(true);
         }
         else if(isLevelPassed)
         {
            GUI.createSaveDialog(this.lvCode);
         }
         else
         {
            GUI.createInterLevelMenu(isLevelPassed,this.time,this.achievements);
         }
      }
      
      private function onMouseMove(e:MouseEvent) : void
      {
         var cell:Cell = null;
         var g:Graphics = null;
         if(this.isPause)
         {
            return;
         }
         if(e.target is Cell)
         {
            cell = e.target as Cell;
            if(cell != this.mouseOverCell)
            {
               this.mouseOverCell = cell;
               this.var_191 = 0;
               this.showCellDetail(cell);
               this.mouseOverCell.filters = [this.glowFilter];
            }
         }
         else
         {
            this.showCellDetail(null);
            if(this.mouseOverCell != null)
            {
               this.mouseOverCell.filters = [];
               this.mouseOverCell = null;
            }
         }
         if(this.selCell || this.stageX >= 0)
         {
            g = this.var_108.graphics;
            g.clear();
            if(!e.buttonDown)
            {
               this.selCell = null;
               return;
            }
            this.arrowGraphics(e);
         }
      }
      
      public function newAchievement(id:int) : void
      {
         if(this.levelEdit)
         {
         }
      }
      
      public function testEditorLevel() : void
      {
         var lvl:Level = null;
         if(this.levelEdit)
         {
            this.lvCode = this.levelEdit.getLevelCode();
            if(this.lvCode == null)
            {
               GUI.createSaveDialog(null);
               return;
            }
            GUI.removeAll();
            this.clearLevel();
            lvl = new Level(this,"X");
            lvl.initFromCode(this.lvCode);
            this.beginGame(lvl);
            GUI.showInGamePanel(this.curLevel.levelName,this.curLevel.maxPower,this.time,true);
            this.var_106 = this.const_13;
         }
      }
      
      private function setSelCell(cell:Cell) : void
      {
         this.selCell = cell;
      }
      
      public function levelEditorSave() : void
      {
         if(this.levelEdit)
         {
            GUI.createSaveDialog(this.levelEdit.getLevelCode());
         }
      }
      
      private function onEnterFrame(event:Event) : void
      {
         if(this.isPause)
         {
            return;
         }
         if(this.curLevel.cpuTurnPeriod > 0)
         {
            this.cpuTurnPeriod++;
            if(this.cpuTurnPeriod > this.curLevel.cpuTurnPeriod)
            {
               this.cpuTurnPeriod = 0;
               this.curLevel.onCpuTurn();
            }
         }
         this.curLevel4++;
         if(this.curLevel4 > this.maxLevle)
         {
            this.curLevel4 = 0;
            _loc3_.time = true;
            return;
            §§push(this.time);
            §§push(true);
         }
         else
         {
            this.var_191++;
            if(this.var_191 > this.const_16)
            {
               this.var_191 = 0;
               if(this.mouseOverCell)
               {
                  this.showCellDetail(this.mouseOverCell);
                  §§push(true);
               }
               else
               {
                  this.powerGraphics();
               }
            }
            return;
         }
      }
      
      private function init(e:Event = null) : void
      {
         this.BmpBack = new GUI.BmpBack();
         addChild(this.BmpBack);
         this.levelMgr = new LevelMgr(this);
         addChild(this.var_314);
         addChild(this.gameSprite);
         addChild(this.var_171);
         var levelData:String = GameAllianzApi.current_level;
         if(levelData != null)
         {
            GUI.onStartSharedLevel(levelData,"Shared","","");
         }
         else
         {
            GameAllianzApi.addEventListener(GameAllianzApiEvent.RATE_LEVEL_CANCELED,this.createLevelsMenu);
            GameAllianzApi.addEventListener(GameAllianzApiEvent.RATE_LEVEL_DONE,this.createLevelsMenu);
         }
      }
      
      private function onMouseUp(event:MouseEvent) : void
      {
         var cell:Cell = null;
         cell = event.target as Cell;
         §§push(Boolean(this.selCell));
         if(this.selCell != cell)
         {
            this.curLevel.addLinkBetween(this.selCell,cell);
         }
         var g:Graphics = this.var_108.graphics;
         g.clear();
         this.setSelCell(null);
      }
      //开始游戏
      private function beginGame(lvl:Level) : void
      {
         this.clearLevel();
         this.curLevel = lvl;
         this.gameSprite.addChild(this.curLevel);
         this.lvCode = lvl.getCode();
         this.time = 0;
         this.powerGraphics();
         addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
         addEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
         addEventListener(Event.ENTER_FRAME,this.onEnterFrame);
      }
      
      public function onLinkAttached(link:Link) : void
      {
         §§push(true);
         if(this.var_106 != this.const_4)
         {
            return;
         }
         if(this.levelMgr.currLevel() == 0)
         {
            this.onTutorial(1);
         }
         if(link.getOrigCell().type == this.var_202)
         {
            §§push(link.getOrigCell().type);
         }
      }
      
      public function clearTutorial() : void
      {
         GUI.hideHint();
         if(this.var_110)
         {
            this.var_110.parent.removeChild(this.var_110);
            this.var_110 = null;
         }
      }
      
      private function onDestory() : void
      {
         removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         removeEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
         removeEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
         removeEventListener(Event.ENTER_FRAME,this.onEnterFrame);
         §§push(false);
         if(this.curLevel)
         {
            this.curLevel.suspend();
         }
         this.var_108.graphics.clear();
      }
      
      private function method_251() : void
      {
      }
      
      private function showCellDetail(cell:Cell) : void
      {
         var sign:Number = NaN;
         var dx:Number = NaN;
         var color:uint = 0;
         var str:String = null;
         GUI.removeByName("cell-info");
         §§push(true);
         if(cell != null)
         {
            sign = cell.y < stage.height / 2?Number(1):Number(-1);
            dx = 0;
            if(cell.x < 80)
            {
               dx = 80;
               §§push(true);
            }
            if(cell.x > GUI.MAX_X - 80)
            {
               §§push(true);
            }
            color = cell.baseColor();
            §§push(cell.type);
            switch(true)
            {
               case 0:
                  color = 15658666;
                  break;
               case 1:
                  color = 16777215;
                  break;
               case 2:
                  color = 16733525;
                  break;
               case 3:
                  color = 5635925;
            }
            str = GUI.TXT_CLASS.toLocaleUpperCase() + ": <font color=\'#" + color.toString(16) + "\'>" + cell.getName() + "</font><br>" + GUI.TXT_POWER.toLocaleUpperCase() + ": <font color=\'#FFFF55\'>" + cell.power + "</font>/" + cell.maxPower;
            if(cell.type == Cell.TYPE_GREY)
            {
               str = str + ("<br>" + GamezheroDictionary.getTranslationByName("occupacy").toLocaleUpperCase() + ": <font color=\'#FFFF55\'>" + cell.getOccupantPower() + "</font>/" + (cell.getGiveUpPower() + cell.getOccupantPower()));
            }
            else
            {
               str = str + ("<br>" + GamezheroDictionary.getTranslationByName("tentacles").toLocaleUpperCase() + ": <font color=\'#FFFF55\'>" + cell.numOrigLinks + "</font>/" + cell.maxOrigLinks);
            }
            GUI.createInfoPopup(cell.x + dx,cell.y + sign * (cell.radius() + 30),str,"cell-info");
         }
      }
      
      public function replayLevel() : void
      {
         §§push(false);
         if(this.curLevel == null)
         {
            trace("Nothing to replay");
            return;
         }
         var lvl:Level = new Level(this,this.curLevel.levelName);
         lvl.initFromCode(this.lvCode);
         this.beginGame(lvl);
         GUI.showInGamePanel(this.curLevel.levelName,this.curLevel.maxPower,this.time);
      }
      
      private function onMouseDown(event:MouseEvent) : void
      {
         var cell:Cell = null;
         §§push(true);
         if(event.target is Cell)
         {
            cell = event.target as Cell;
            if(cell.type == this.var_202 && cell.numOrigLinks < cell.maxOrigLinks)
            {
               this.setSelCell(cell);
               §§push(true);
            }
         }
         else
         {
            this.stageX = event.stageX;
            this.stageY = event.stageY;
         }
      }
      
      public function initLevelEditor() : void
      {
         GUI.removeAll();
         this.clearLevel();
      }
      
      public function initLevel(id:int) : void
      {
         GamezheroApi.trackEvent("play",id + 1 + "_start_level");
         this.var_106 = this.const_4;
         this.beginGame(this.levelMgr.createLevel(id));
         GUI.showInGamePanel(this.curLevel.levelName,this.curLevel.maxPower,this.time);
         if(id == 0)
         {
            this.onTutorial(0);
            §§push(true);
         }
      }
      //右上颜色区域
      private function powerGraphics() : void
      {
         var green:int = this.curLevel.getTotalPowerOf(Cell.TYPE_GREEN);
         var red:int = this.curLevel.getTotalPowerOf(Cell.TYPE_RED);
         var black:int = this.curLevel.getTotalPowerOf(Cell.TYPE_BLACK);
         var purple:int = this.curLevel.getTotalPowerOf(Cell.TYPE_PURPLE);
         var max:int = green + red + black + purple;
         var xpos:* = Number(0);
         var g:Graphics = this.var_171.graphics;
         g.clear();
         g.lineStyle(1,16777215);
         §§push(true);
         §§push(true);
         if(green > 0)
         {
            g.beginFill(3385907);
            g.drawRect(0,0,green / max * 60,10);
            xpos = true;
            §§push(xpos + green / max * 60);
         }
         if(red > 0)
         {
            g.beginFill(11154227);
            g.drawRect(xpos,0,red / max * 60,10);
            xpos = Number(xpos + red / max * 60);
         }
         if(black > 0)
         {
            g.beginFill(1118481);
            g.drawRect(xpos,0,black / max * 60,10);
         }
         if(purple > 0)
         {
            g.drawRect(xpos,0,purple / max * 60,10);
            §§push(true);
         }
         g.endFill();
      }
      
      private function createLevelsMenu(event:GameAllianzApiEvent = null) : void
      {
         GUI.createLevelsMenu();
      }
      
      public function initSharedLevel(levelData:String, name:String, levelId:String) : void
      {
         var lvl:Level = new Level(this,name);
         lvl.initFromCode(levelData);
         this.var_106 = this.const_7;
         this.levelId = levelId;
         this.beginGame(lvl);
         GUI.showInGamePanel(this.curLevel.levelName,this.curLevel.maxPower,this.time);
      }
      
      public function clearLevel() : void
      {
         this.method_251();
         this.cpuTurnPeriod = 0;
         this.isPause = false;
         this.curLevel = null;
         §§push(true);
         §§push(true);
         if(this.levelEdit)
         {
            this.levelEdit.destruct();
            this.levelEdit = null;
         }
         this.stat.reset();
      }
      
      private function arrowGraphics(e:MouseEvent) : void
      {
         var dst:Cell = null;
         var angDelta:Number = NaN;
         var g:Graphics = this.var_108.graphics;
         var fromX:Number = 0;
         var fromY:Number = 0;
         var toX:Number = e.stageX;
         var toY:Number = e.stageY;
         var color:uint = 16733525;
         if(this.selCell)
         {
            fromX = this.selCell.x;
            fromY = this.selCell.y;
            color = 16777045;
         }
         else
         {
            fromX = this.stageX;
            fromY = this.stageY;
         }
         if(e.target is Cell)
         {
            dst = e.target as Cell;
         }
         var dx:Number = toX - fromX;
         var dy:Number = toY - fromY;
         if(dx == 0 && dy == 0)
         {
            return;
         }
         var ang:Number = Math.atan2(dy,dx);
         var dist:Number = Math.sqrt(dx * dx + dy * dy);
         g.lineStyle(3,color);
         g.moveTo(fromX,fromY);
         g.lineTo(toX,toY);
         §§push(true);
         if(this.selCell)
         {
            g.lineTo(Math.cos(ang - angDelta) * (dist - 5) + fromX,Math.sin(ang - angDelta) * (dist - 5) + fromY);
            g.moveTo(toX,toY);
            g.lineTo(Math.cos(ang + angDelta) * (dist - 5) + fromX,Math.sin(ang + angDelta) * (dist - 5) + fromY);
            §§push(true);
            §§push(true);
         }
      }
      
      private function onTutorial(id:int) : void
      {
         this.clearTutorial();
         §§push(false);
         §§push(true);
         switch(0)
         {
            case 0:
               this.var_110 = new BmpTutorial0();
               GUI.showHint(420,210,GUI.TXT_TUTORIAL1.toLocaleUpperCase());
               break;
            case 1:
               this.var_110 = new BmpTutorial1();
               GUI.showHint(400,290,GUI.TXT_TUTORIAL2.toLocaleUpperCase());
         }
         this.var_110.smoothing = true;
         this.var_314.addChild(this.var_110);
      }
      
      public function pause(enabled:Boolean) : void
      {
         this.isPause = enabled;
         if(this.curLevel)
         {
            §§push(false);
         }
      }
   }
}
