package
{
   import flash.display.MovieClip;
   
   public dynamic class AssetLoadingIndicator extends MovieClip
   {
       
      
      public function AssetLoadingIndicator()
      {
         super();
         addFrameScript(32,frame33);
      }
      
      function frame33() : *
      {
         gotoAndPlay(1);
      }
   }
}
