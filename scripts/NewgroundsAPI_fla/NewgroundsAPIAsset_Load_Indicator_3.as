package NewgroundsAPI_fla
{
   import flash.display.MovieClip;
   import flash.events.Event;
   
   public dynamic class NewgroundsAPIAsset_Load_Indicator_3 extends MovieClip
   {
       
      
      public function NewgroundsAPIAsset_Load_Indicator_3()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function onEnterFrame(e:Event) : void
      {
         if(visible && stage)
         {
            rotation = rotation + 30;
         }
         else
         {
            removeEventListener(Event.ENTER_FRAME,this.onEnterFrame);
         }
      }
      
      function frame1() : *
      {
         addEventListener(Event.ENTER_FRAME,this.onEnterFrame);
      }
   }
}
