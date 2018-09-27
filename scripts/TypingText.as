package
{
   import flash.events.Event;
   
   public class TypingText extends TextSprite
   {
       
      
      private var var_223:int = 0;
      
      private var var_300:String = null;
      
      private var var_178:int = 0;
      
      public function TypingText(str:String, size:int, color:uint)
      {
         super(">",size,color,1,false,16777215,"translate");
         this.var_300 = str;
         addEventListener(Event.ENTER_FRAME,this.onEnterFrame);
      }
      
      private function onEnterFrame(event:Event) : void
      {
      }
      
      public function destruct() : void
      {
      }
   }
}
