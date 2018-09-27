package com.bit101.components
{
   import flash.display.DisplayObjectContainer;
   
   public class HSlider extends Slider
   {
       
      
      public function HSlider(parent:DisplayObjectContainer = null, xpos:Number = 0, ypos:Number = 0, defaultHandler:Function = null)
      {
         super(Slider.HORIZONTAL,parent,xpos,ypos,defaultHandler);
      }
   }
}
