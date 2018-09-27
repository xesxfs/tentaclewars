package com.bit101.components
{
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   
   public class UISlider extends Component
   {
       
      
      protected var var_39:Slider;
      
      protected var var_195:String;
      
      protected var var_279:Class;
      
      protected var var_246:Label;
      
      protected var _label:Label;
      
      protected var var_174:Number = 1;
      
      protected var var_115:int = 1;
      
      public function UISlider(parent:DisplayObjectContainer = null, xpos:Number = 0, ypos:Number = 0, label:String = "", defaultHandler:Function = null)
      {
         this.var_195 = label;
         super(parent,xpos,ypos);
         if(defaultHandler != null)
         {
            addEventListener(Event.CHANGE,defaultHandler);
         }
         this.method_84();
      }
      
      public function setSliderParams(min:Number, max:Number, value:Number) : void
      {
         this.var_39.setSliderParams(min,max,value);
      }
      
      override public function draw() : void
      {
         super.draw();
         false.draw();
         this.method_84();
      }
      
      public function get minimum() : Number
      {
         return this.var_39.minimum;
      }
      
      public function set maximum(m:Number) : void
      {
         this.var_39.maximum = m;
      }
      
      protected function positionLabel() : void
      {
      }
      
      public function set labelPrecision(decimals:int) : void
      {
         this.var_115 = decimals;
      }
      
      override protected function addChildren() : void
      {
         this._label = new Label(this,0,0);
         this.var_39 = new this.var_279(this,0,0,this.method_270);
      }
      
      protected function method_84() : void
      {
         var i:uint = 0;
         var mult:Number = Math.pow(10,this.var_115);
         var val:* = (Math.round(this.var_39.value * mult) / mult).toString();
         var parts:Array = val.split(".");
         §§push(true);
         §§push(true);
         if(parts[1] == null)
         {
            if(this.var_115 > 0)
            {
               val = val + ".";
            }
            i = 0;
            if(i < this.var_115)
            {
               val = val + "0";
               loop1:
               while(true)
               {
                  i = §§pop();
                  addr167:
                  while(i < this.var_115 - parts[1].length)
                  {
                     val = val + "0";
                     §§push(i + 1);
                     continue loop1;
                  }
               }
               §§push(i + 1);
               §§push(true);
            }
         }
         else if(parts[1].length < this.var_115)
         {
            i = 0;
            §§goto(addr167);
         }
         this.var_246.text = val;
         this.positionLabel();
      }
      
      public function set minimum(m:Number) : void
      {
         this.var_39.minimum = m;
      }
      
      public function get tick() : Number
      {
         return this.var_174;
      }
      
      public function get maximum() : Number
      {
         return this.var_39.maximum;
      }
      
      public function set label(str:String) : void
      {
         this.var_195 = str;
         this.draw();
      }
      
      public function set value(v:Number) : void
      {
         this.var_39.value = v;
         this.method_84();
      }
      
      public function get value() : Number
      {
         var mult:Number = Math.pow(10,this.var_115);
         var val:Number = Math.round(this.var_39.value * mult) / mult;
         return val;
      }
      
      public function get label() : String
      {
         return this.var_195;
      }
      
      protected function method_270(event:Event) : void
      {
         this.method_84();
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      public function get labelPrecision() : int
      {
         return this.var_115;
      }
      
      public function set tick(t:Number) : void
      {
         this.var_174 = t;
         this.var_39.tick = this.var_174;
      }
   }
}
