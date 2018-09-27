package com.bit101.components
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.GradientType;
   import flash.display.Graphics;
   import flash.display.InterpolationMethod;
   import flash.display.SpreadMethod;
   import flash.display.Sprite;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Matrix;
   import flash.geom.Point;
   
   public class ColorChooser extends Component
   {
      
      public static const BOTTOM:String = "bottom";
      
      public static const TOP:String = "top";
       
      
      protected var var_317:Boolean = false;
      
      protected var var_81:InputText;
      
      protected var var_180:BitmapData;
      
      protected var include:Array;
      
      protected var var_71:Sprite;
      
      protected var var_181:uint;
      
      protected var var_294:String = "bottom";
      
      protected var var_105:DisplayObject;
      
      protected var var_258:uint;
      
      protected var var_27:Sprite;
      
      protected var _value:uint = 16711680;
      
      protected var _stage:Stage;
      
      public function ColorChooser(parent:DisplayObjectContainer = null, xpos:Number = 0, ypos:Number = 0, value:uint = 16711680, defaultHandler:Function = null)
      {
         this.include = [16711680,16776960,65280,65535,255,16711935,16711680,16777215,0];
         this.var_181 = this._value;
         this.var_258 = this._value;
         this._value = value;
         this.var_181 = this.var_258 = _loc6_;
         super(parent,xpos,ypos);
         if(defaultHandler != null)
         {
            §§push(true);
         }
      }
      
      override protected function addChildren() : void
      {
         this.var_81 = new InputText();
         this.var_81.width = 45;
         true.maxChars = 6;
         addChild(this.var_81);
         this.var_81.addEventListener(Event.CHANGE,this.method_239);
         this.var_71 = new Sprite();
         this.var_71.x = 50;
         this.var_105 = this.method_174();
         this.method_103(this.var_105);
      }
      
      public function set popupAlign(value:String) : void
      {
         this.var_294 = value;
         this.method_106();
      }
      
      protected function method_165(e:MouseEvent) : void
      {
         this.value = this.var_181;
      }
      
      protected function method_215(e:Event) : void
      {
      }
      
      protected function method_261(e:Event) : void
      {
         this._stage = stage;
      }
      
      protected function method_158(e:MouseEvent) : void
      {
         this.var_258 = this.var_180.getPixel(this.var_27.mouseX,this.var_27.mouseY);
         this.value = this.var_258;
      }
      
      public function set usePopup(value:Boolean) : void
      {
         this.var_317 = value;
         this.var_27.addEventListener(MouseEvent.MOUSE_OUT,this.method_165);
         this.var_27.addEventListener(MouseEvent.CLICK,this.method_168);
         this.var_71.addEventListener(MouseEvent.CLICK,this.method_172);
         this.var_27.removeEventListener(MouseEvent.MOUSE_MOVE,this.method_158);
         this.var_27.removeEventListener(MouseEvent.MOUSE_OUT,this.method_165);
         this.var_27.removeEventListener(MouseEvent.CLICK,this.method_168);
         this.var_71.removeEventListener(MouseEvent.CLICK,this.method_172);
      }
      
      protected function method_172(event:MouseEvent) : void
      {
         event.stopImmediatePropagation();
         this.method_114();
      }
      
      override protected function init() : void
      {
         super.init();
         _width = 65;
         _height = 15;
         this.value = this._value;
      }
      
      public function get popupAlign() : String
      {
         return this.var_294;
      }
      
      public function set model(value:DisplayObject) : void
      {
         this.var_105 = value;
         if(this.var_105 != null)
         {
            this.method_103(this.var_105);
            if(!this.usePopup)
            {
               this.usePopup = true;
            }
         }
         else
         {
            this.var_105 = this.method_174();
            this.method_103(this.var_105);
            this.usePopup = false;
         }
      }
      
      override public function draw() : void
      {
         super.draw();
         this.var_71.graphics.endFill();
      }
      
      protected function method_114() : void
      {
         this.method_106();
      }
      
      protected function method_159(w:Number, h:Number, gc:Array) : Sprite
      {
         var gs:Sprite = new Sprite();
         var g:Graphics = gs.graphics;
         var gn:int = gc.length;
         var ga:Array = [];
         var gr:Array = [];
         var gm:Matrix = new Matrix();
         gm.createGradientBox(w,h,0,0,0);
         var i:int = 0;
         while(i < gn)
         {
            ga.push(1);
            gr.push(0 + 255 / (gn - 1) * i);
            i++;
         }
         g.beginGradientFill(GradientType.LINEAR,gc,ga,gr,gm,SpreadMethod.PAD,InterpolationMethod.RGB);
         g.drawRect(0,0,w,h);
         g.endFill();
         return gs;
      }
      
      public function set value(n:uint) : void
      {
         for(var str:String = n.toString(16).toUpperCase(); str.length < 6; )
         {
            str = "0" + str;
         }
         this.var_81.text = str;
         this._value = parseInt("0x" + this.var_81.text,16);
         method_40();
      }
      
      protected function method_103(d:DisplayObject) : void
      {
         this.var_180 = new BitmapData(d.width,d.height);
         this.var_180.draw(d);
         while(this.var_27.numChildren)
         {
            this.var_27.removeChildAt(0);
         }
         this.var_27.addChild(new Bitmap(this.var_180));
         this.method_106();
      }
      
      public function get usePopup() : Boolean
      {
         return this.var_317;
      }
      
      protected function method_106() : void
      {
         var point:Point = new Point(x,y);
         if(parent)
         {
            point = parent.localToGlobal(point);
         }
         §§push(false);
         switch(_loc2_)
         {
            case TOP:
               this.var_27.x = point.x;
               this.var_27.y = point.y - this.var_27.height - 4;
               break;
            case BOTTOM:
               this.var_27.x = point.x;
               this.var_27.y = point.y + 22;
               break;
            default:
               this.var_27.x = point.x;
               this.var_27.y = point.y + 22;
         }
      }
      
      public function get model() : DisplayObject
      {
         return this.var_105;
      }
      
      protected function method_174() : Sprite
      {
         var blendmode:String = null;
         var m:Matrix = null;
         var bmd:BitmapData = new BitmapData(100,100);
         var g1:Sprite = this.method_159(100,100,this.include);
         bmd.draw(g1);
         var blendmodes:Array = [BlendMode.MULTIPLY,BlendMode.ADD];
         var nb:int = blendmodes.length;
         for(var g2:Sprite = this.method_159(100 / nb,100,[16777215,0]),var i:int = 0; i < nb; )
         {
            blendmode = blendmodes[i];
            m = new Matrix();
            m.rotate(-Math.PI / 2);
            m.translate(0,100 / nb * i + 100 / nb);
            bmd.draw(g2,m,null,blendmode);
            i++;
         }
         var s:Sprite = new Sprite();
         var bm:Bitmap = new Bitmap(bmd);
         s.addChild(bm);
         return s;
      }
      
      protected function method_239(event:Event) : void
      {
         method_40();
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      public function get value() : uint
      {
         return this._value;
      }
      
      protected function method_168(e:MouseEvent) : void
      {
         this.value = this.var_180.getPixel(this.var_27.mouseX,this.var_27.mouseY);
         this.method_114();
      }
      
      protected function method_150(e:MouseEvent) : void
      {
      }
   }
}
