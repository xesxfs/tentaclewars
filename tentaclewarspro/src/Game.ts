// package
// {
//    import com.gameallianz.api.as3.GameAllianzApi;
//    import com.gameallianz.api.as3.GameAllianzApiEvent;
//    import com.gamezhero.api.as3.GamezheroApi;
//    import com.gamezhero.api.as3.GamezheroDictionary;
//    import flash.display.Bitmap;
//    import flash.display.Graphics;
//    import flash.display.Sprite;
//    import flash.events.Event;
//    import flash.events.MouseEvent;
//    import flash.filters.GlowFilter;
   
   public class Game extends egret.Sprite
   {
      
      private static const BmpTutorial0:Class;
      
      private static const BmpTutorial1:Class = Main_BmpTutorial1;
       
      
      private var var_314:Sprite = null;
      
      private var var_108:Sprite = null;
      
      private var var_106:uint = 0;
      
      private var var_119:Cell = null;
      
      private const const_16:int = 10;
      
      private var var_185:LevelMgr = null;
      
      private var var_89:Cell = null;
      
      private var var_110:Bitmap = null;
      
      private var var_171:Sprite = null;
      
      private var var_202:int = 3;
      
      private var var_191:uint = 0;
      
      private var var_182:Boolean = false;
      
      private var var_129:String = null;
      
      private var var_162:Number = -1;
      
      private var var_265:Number = -1;
      
      private const const_8:GlowFilter = new GlowFilter(16776960,0.7,4,4);
      
      private var var_342:Bitmap = null;
      
      private const const_7:uint = 1;
      
      private var var_367:String = null;
      
      private var var_26:Level = null;
      
      private const const_15:uint = 20;
      
      private var var_340:Stat = null;
      
      private const const_13:uint = 2;
      
      private var var_264:uint = 0;
      
      private var var_309:Achievements = null;
      
      private var var_80:int = 0;
      
      private var var_219:Sprite = null;
      
      private const const_4:uint = 0;
      
      private var var_207:uint = 0;
      
      private var var_68:LevelEditor = null;
      
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
         this.method_157();
         this.method_117();
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
            GUI.createSaveDialog(this.var_129);
         }
         else
         {
            GUI.createInterLevelMenu(isLevelPassed,this.var_80,this.var_309);
         }
      }
      
      private function onMouseMove(e:MouseEvent) : void
      {
         var cell:Cell = null;
         var g:Graphics = null;
         if(this.var_182)
         {
            return;
         }
         if(e.target is Cell)
         {
            cell = e.target as Cell;
            if(cell != this.var_119)
            {
               this.var_119 = cell;
               this.var_191 = 0;
               this.method_104(cell);
               this.var_119.filters = [this.const_8];
            }
         }
         else
         {
            this.method_104(null);
            if(this.var_119 != null)
            {
               this.var_119.filters = [];
               this.var_119 = null;
            }
         }
         if(this.var_89 || this.var_162 >= 0)
         {
            g = this.var_108.graphics;
            g.clear();
            if(!e.buttonDown)
            {
               this.var_89 = null;
               return;
            }
            this.method_276(e);
         }
      }
      
      public function newAchievement(id:int) : void
      {
         if(this.var_68)
         {
         }
      }
      
      public function testEditorLevel() : void
      {
         var lvl:Level = null;
         if(this.var_68)
         {
            this.var_129 = this.var_68.getLevelCode();
            if(this.var_129 == null)
            {
               GUI.createSaveDialog(null);
               return;
            }
            GUI.removeAll();
            this.clearLevel();
            lvl = new Level(this,"X");
            lvl.initFromCode(this.var_129);
            this.method_94(lvl);
            GUI.showInGamePanel(this.var_26.levelName,this.var_26.maxPower,this.var_80,true);
            this.var_106 = this.const_13;
         }
      }
      
      private function method_196(cell:Cell) : void
      {
         this.var_89 = cell;
      }
      
      public function levelEditorSave() : void
      {
         if(this.var_68)
         {
            GUI.createSaveDialog(this.var_68.getLevelCode());
         }
      }
      
      private function onEnterFrame(event:Event) : void
      {
         if(this.var_182)
         {
            return;
         }
         if(this.var_26.cpuTurnPeriod > 0)
         {
            this.var_207++;
            if(this.var_207 > this.var_26.cpuTurnPeriod)
            {
               this.var_207 = 0;
               this.var_26.onCpuTurn();
            }
         }
         this.var_264++;
         if(this.var_264 > this.const_15)
         {
            this.var_264 = 0;
            _loc3_.var_80 = true;
            return;
            §§push(this.var_80);
            §§push(true);
         }
         else
         {
            this.var_191++;
            if(this.var_191 > this.const_16)
            {
               this.var_191 = 0;
               if(this.var_119)
               {
                  this.method_104(this.var_119);
                  §§push(true);
               }
               else
               {
                  this.method_117();
               }
            }
            return;
         }
      }
      
      private function init(e:Event = null) : void
      {
         this.var_342 = new GUI.BmpBack();
         addChild(this.var_342);
         this.var_185 = new LevelMgr(this);
         addChild(this.var_314);
         addChild(this.var_219);
         addChild(this.var_171);
         var levelData:String = GameAllianzApi.current_level;
         §§push(true);
         §§push(true);
         if(levelData != null)
         {
            GUI.onStartSharedLevel(levelData,"Shared","","");
            §§push(true);
         }
         else
         {
            GameAllianzApi.addEventListener(GameAllianzApiEvent.RATE_LEVEL_CANCELED,this.method_177);
            GameAllianzApi.addEventListener(GameAllianzApiEvent.RATE_LEVEL_DONE,this.method_177);
         }
      }
      
      private function method_140(event:MouseEvent) : void
      {
         var cell:Cell = null;
         cell = event.target as Cell;
         §§push(Boolean(this.var_89));
         if(this.var_89 != cell)
         {
            this.var_26.addLinkBetween(this.var_89,cell);
         }
         var g:Graphics = this.var_108.graphics;
         g.clear();
         this.method_196(null);
      }
      
      private function method_94(lvl:Level) : void
      {
         this.clearLevel();
         this.var_26 = lvl;
         this.var_219.addChild(this.var_26);
         this.var_129 = lvl.getCode();
         this.var_80 = 0;
         this.method_117();
         addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         addEventListener(MouseEvent.MOUSE_DOWN,this.method_135);
         addEventListener(MouseEvent.MOUSE_UP,this.method_140);
         addEventListener(Event.ENTER_FRAME,this.onEnterFrame);
      }
      
      public function onLinkAttached(link:Link) : void
      {
         §§push(true);
         if(this.var_106 != this.const_4)
         {
            return;
         }
         if(this.var_185.currLevel() == 0)
         {
            this.method_190(1);
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
      
      private function method_157() : void
      {
         removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         removeEventListener(MouseEvent.MOUSE_DOWN,this.method_135);
         removeEventListener(MouseEvent.MOUSE_UP,this.method_140);
         removeEventListener(Event.ENTER_FRAME,this.onEnterFrame);
         §§push(false);
         if(this.var_26)
         {
            this.var_26.suspend();
         }
         this.var_108.graphics.clear();
      }
      
      private function method_251() : void
      {
      }
      
      private function method_104(cell:Cell) : void
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
         if(this.var_26 == null)
         {
            trace("Nothing to replay");
            return;
         }
         var lvl:Level = new Level(this,this.var_26.levelName);
         lvl.initFromCode(this.var_129);
         this.method_94(lvl);
         GUI.showInGamePanel(this.var_26.levelName,this.var_26.maxPower,this.var_80);
      }
      
      private function method_135(event:MouseEvent) : void
      {
         var cell:Cell = null;
         §§push(true);
         if(event.target is Cell)
         {
            cell = event.target as Cell;
            if(cell.type == this.var_202 && cell.numOrigLinks < cell.maxOrigLinks)
            {
               this.method_196(cell);
               §§push(true);
            }
         }
         else
         {
            this.var_162 = event.stageX;
            this.var_265 = event.stageY;
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
         this.method_94(this.var_185.createLevel(id));
         GUI.showInGamePanel(this.var_26.levelName,this.var_26.maxPower,this.var_80);
         if(id == 0)
         {
            this.method_190(0);
            §§push(true);
         }
      }
      
      private function method_117() : void
      {
         var green:int = this.var_26.getTotalPowerOf(Cell.TYPE_GREEN);
         var red:int = this.var_26.getTotalPowerOf(Cell.TYPE_RED);
         var black:int = this.var_26.getTotalPowerOf(Cell.TYPE_BLACK);
         var purple:int = this.var_26.getTotalPowerOf(Cell.TYPE_PURPLE);
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
      
      private function method_177(event:GameAllianzApiEvent = null) : void
      {
         GUI.createLevelsMenu();
      }
      
      public function initSharedLevel(levelData:String, name:String, levelId:String) : void
      {
         var lvl:Level = new Level(this,name);
         lvl.initFromCode(levelData);
         this.var_106 = this.const_7;
         this.var_367 = levelId;
         this.method_94(lvl);
         GUI.showInGamePanel(this.var_26.levelName,this.var_26.maxPower,this.var_80);
      }
      
      public function clearLevel() : void
      {
         this.method_251();
         this.var_207 = 0;
         this.var_182 = false;
         this.var_26 = null;
         §§push(true);
         §§push(true);
         if(this.var_68)
         {
            this.var_68.destruct();
            this.var_68 = null;
         }
         this.var_340.reset();
      }
      
      private function method_276(e:MouseEvent) : void
      {
         var dst:Cell = null;
         var angDelta:Number = NaN;
         var g:Graphics = this.var_108.graphics;
         var fromX:Number = 0;
         var fromY:Number = 0;
         var toX:Number = e.stageX;
         var toY:Number = e.stageY;
         var color:uint = 16733525;
         if(this.var_89)
         {
            fromX = this.var_89.x;
            fromY = this.var_89.y;
            color = 16777045;
         }
         else
         {
            fromX = this.var_162;
            fromY = this.var_265;
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
         if(this.var_89)
         {
            g.lineTo(Math.cos(ang - angDelta) * (dist - 5) + fromX,Math.sin(ang - angDelta) * (dist - 5) + fromY);
            g.moveTo(toX,toY);
            g.lineTo(Math.cos(ang + angDelta) * (dist - 5) + fromX,Math.sin(ang + angDelta) * (dist - 5) + fromY);
            §§push(true);
            §§push(true);
         }
      }
      
      private function method_190(id:int) : void
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
         this.var_182 = enabled;
         if(this.var_26)
         {
            §§push(false);
         }
      }
   }
// }
