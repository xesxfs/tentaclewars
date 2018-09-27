package
{
   import com.bit101.components.ComboBox;
   import com.bit101.components.HBox;
   import com.bit101.components.HUISlider;
   import com.bit101.components.Panel;
   import flash.display.Graphics;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.filters.GlowFilter;
   import ui.SimpleGUI;
   
   public class LevelEditor extends Sprite
   {
       
      
      private var var_69:SimpleGUI = null;
      
      private var var_107:ComboBox = null;
      
      private const const_2:int = 20;
      
      private var var_228:int = 3;
      
      private var _aiSpeed:ComboBox = null;
      
      private var var_263:int = 10;
      
      private const const_8:GlowFilter = new GlowFilter(16776960,0.8,6,6);
      
      private const const_3:int = 0;
      
      private var var_345:Boolean = false;
      
      private const const_1:int = 220;
      
      private var var_79:Fence = null;
      
      private var _maxPower:HUISlider = null;
      
      private var _lvl:Level = null;
      
      private var var_262:Boolean = false;
      
      private const const_6:int = 1;
      
      private var var_352:Boolean = false;
      
      private const const_11:int = 150;
      
      private const const_12:GlowFilter = new GlowFilter(16776960,0.8,10,10);
      
      private var var_33:Cell = null;
      
      public function LevelEditor(game:Main, levelCode:String)
      {
         super();
         this._lvl = new Level(game,"",200);
         true.initFromCode(levelCode);
         addChild(this._lvl);
         this.method_275();
         var g:Graphics = graphics;
         g.beginFill(0,0);
         g.drawRect(0,0,GUI.MAX_X,GUI.MAX_Y);
         g.endFill();
         addEventListener(MouseEvent.MOUSE_DOWN,this.method_135);
         addEventListener(MouseEvent.MOUSE_UP,this.method_140);
         addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         §§push(this._lvl);
         if(stage)
         {
            this.method_105();
         }
         else
         {
            addEventListener(Event.ADDED_TO_STAGE,this.method_105);
         }
      }
      
      public function get maxPower() : int
      {
         return this._lvl.maxPower;
      }
      
      public function set maxPower(power:int) : void
      {
         this._lvl.maxPower = power;
      }
      
      public function get selectedCellType() : int
      {
         §§push(true);
         if(this.var_33)
         {
            §§push(int(this.var_33.type));
            §§push(int(true));
         }
         else
         {
            §§push(this.var_228);
            §§push(true);
         }
         return §§pop();
      }
      
      private function method_71(fence:Fence, pivotX:Number, pivotY:Number) : void
      {
         var dx:Number = NaN;
         var dy:Number = NaN;
         var dist1:Number = NaN;
         var dist2:* = NaN;
         if(this.var_79)
         {
            this.var_79.filters = [];
            addr82:
            dx = fence.x1 - pivotX;
            dy = fence.y1 - pivotY;
            dist1 = Math.sqrt(dx * dx + dy * dy);
            dist2 = true;
            this.var_345 = dist2 > dist1?true:false;
            §§push(true);
            §§push(fence.x2);
            if(!this.var_69)
            {
               this.var_69 = this.method_180(this.const_6);
            }
         }
         else
         {
            this.var_79 = fence;
            if(fence)
            {
               this.var_262 = true;
               this.var_79.filters = [this.const_12];
               §§goto(addr82);
            }
         }
      }
      
      public function destruct() : void
      {
         removeEventListener(MouseEvent.MOUSE_DOWN,this.method_135);
         removeEventListener(MouseEvent.MOUSE_UP,this.method_140);
         removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
      }
      
      private function method_180(type:int) : SimpleGUI
      {
         var gui:SimpleGUI = new SimpleGUI(this,type == this.const_3?GUI.TXT_MICROBE:GUI.TXT_WALL);
         gui.setPos(0,this.const_2);
         return gui;
      }
      
      private function method_105(e:Event = null) : void
      {
         removeEventListener(Event.ADDED_TO_STAGE,this.method_105);
         stage.addEventListener(KeyboardEvent.KEY_DOWN,this.method_179);
      }
      
      private function onMouseMove(e:MouseEvent) : void
      {
         if(this.var_352)
         {
            return;
         }
         true;
         §§push(this.var_262);
         if(e.stageY < this.const_11)
         {
            this.var_69.setPos(this.const_1 + 20,this.const_2);
         }
         else
         {
            this.var_69.setPos(0,this.const_2);
         }
      }
      
      private function method_140(e:MouseEvent) : void
      {
         this.var_262 = false;
      }
      
      private function method_179(e:KeyboardEvent) : void
      {
         if(e.keyCode == 46)
         {
            this.method_109();
         }
      }
      
      private function method_135(e:MouseEvent) : void
      {
         var cell:Cell = null;
         this.method_71(null,0,0);
         this.method_75(e.target as Cell);
         §§push(true);
         §§push(this.var_352);
         if(e.target == this)
         {
            cell = this._lvl.addCell(e.stageX,e.stageY,this.var_228,this.var_263,this._lvl.maxPower);
            §§push(true);
            if(cell != null)
            {
               cell.suspend();
            }
            this.method_75(cell);
         }
      }
      
      public function set selectedCellPower(power:int) : void
      {
         if(this.var_33)
         {
            this.var_33.power = power;
            §§push(false);
         }
         else
         {
            this.var_263 = power;
         }
      }
      
      private function method_275() : void
      {
         var win:Panel = new Panel(this);
         win.shadow = false;
         win.width = 640;
         win.height = 19;
         var box:HBox = new HBox(this);
         box.spacing = 10;
         this.var_107 = new ComboBox(box);
         this._aiSpeed.addItem(GUI.TXT_DISABLE_AI);
         this._aiSpeed.selectedIndex = 0;
         150.selectedIndex = true;
         this._aiSpeed.addEventListener(Event.SELECT,function(e:Event):void
         {
            trace("AI speed: " + _aiSpeed.selectedIndex);
            switch(_aiSpeed.selectedIndex)
            {
               case 0:
                  _lvl.cpuTurnPeriod = 100;
                  break;
               case 1:
                  _lvl.cpuTurnPeriod = 50;
                  break;
               case 2:
                  _lvl.cpuTurnPeriod = 10;
                  break;
               case 3:
                  _lvl.cpuTurnPeriod = 0;
            }
         });
         true.labelPrecision = -1;
      }
      
      public function getLevelCode() : String
      {
         return this._lvl.getCode();
      }
      
      public function get selectedCellPower() : int
      {
         return int(true.power);
      }
      
      public function set selectedCellType(type:int) : void
      {
         if(this.var_33)
         {
            this.var_33.type = type;
         }
         this.var_228 = type;
      }
      
      private function method_109() : void
      {
         if(this.var_33)
         {
            this._lvl.delCell(this.var_33);
            this.method_75(null);
         }
         else if(this.var_79)
         {
            this.method_71(null,0,0);
            §§push(true);
         }
      }
      
      private function method_75(cell:Cell) : void
      {
         if(this.var_33)
         {
            this.var_33.filters = [];
            this.var_33 = null;
            false.hide();
            this.var_69 = null;
            §§push(this.var_69);
         }
         if(cell)
         {
            this.var_228 = cell.type;
            this.var_263 = cell.power;
            §§push(true);
         }
      }
   }
}
