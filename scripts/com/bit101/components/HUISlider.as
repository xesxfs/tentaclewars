package com.bit101.components
{
   import flash.display.DisplayObjectContainer;
   
   public class HUISlider extends UISlider
   {
       
      
      public function HUISlider(parent:DisplayObjectContainer = null, xpos:Number = 0, ypos:Number = 0, label:String = "", defaultHandler:Function = null)
      {
         var_279 = HSlider;
         super(parent,xpos,ypos,label,defaultHandler);
      }
      
      override protected function init() : void
      {
         super.init();
         setSize(200,18);
      }
      
      override protected function positionLabel() : void
      {
         var_246.x = var_39.x + var_39.width + 5;
      }
      
      override public function draw() : void
      {
         super.draw();
         var_39.x = _label.width + 5;
         var_39.y = height / 2 - var_39.height / 2;
         var_39.width = width - _label.width - 50 - 10;
         var_246.x = var_39.x + var_39.width + 5;
      }
   }
}
