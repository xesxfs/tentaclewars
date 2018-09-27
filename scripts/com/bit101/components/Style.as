package com.bit101.components
{
   public class Style
   {
      
      public static var TEXT_BACKGROUND:uint = 16777215;
      
      public static var fontName:String = "translate";
      
      public static var BUTTON_FACE:uint = 16777215;
      
      public static var LIST_DEFAULT:uint = 16777215;
      
      public static var LIST_ROLLOVER:uint = 14540253;
      
      public static var BUTTON_DOWN:uint = 15658734;
      
      public static var LIST_SELECTED:uint = 13421772;
      
      public static var PROGRESS_BAR:uint = 16777215;
      
      public static var PANEL:uint = 15987699;
      
      public static var DROPSHADOW:uint = 0;
      
      public static var INPUT_TEXT:uint = 3355443;
      
      public static var BACKGROUND:uint = 13421772;
      
      public static const CUSTOM:String = "custom";
      
      public static const DARK:String = "dark";
      
      public static var fontSize:Number = 12;
      
      public static var LABEL_TEXT:uint = 6710886;
      
      public static var LIST_ALTERNATE:uint = 15987699;
      
      public static var embedFonts:Boolean = true;
      
      public static const LIGHT:String = "light";
       
      
      public function Style()
      {
         super();
      }
      
      public static function setStyle(style:String) : void
      {
         if(DARK === _loc2_)
         {
            §§push(0);
            §§push(true);
         }
         else if(CUSTOM === _loc2_)
         {
            §§push(1);
         }
         else if(LIGHT === _loc2_)
         {
            §§push(2);
            §§push(true);
         }
         else
         {
            §§push(3);
         }
         switch(§§pop())
         {
            case 0:
               BACKGROUND = 4473924;
               BUTTON_FACE = 6710886;
               BUTTON_DOWN = 2236962;
               LIST_ALTERNATE = 3750201;
               LIST_SELECTED = 6710886;
               LIST_ROLLOVER = 7829367;
               addr227:
               return;
               §§push(true);
            case 1:
               BACKGROUND = 1122850;
               BUTTON_FACE = 5596774;
               BUTTON_DOWN = 1122850;
               TEXT_BACKGROUND = 4478293;
               LIST_DEFAULT = 3359812;
               §§push(true);
               §§push(true);
               break;
            case 2:
            default:
               BACKGROUND = 13421772;
               BUTTON_FACE = 16777215;
               BUTTON_DOWN = 15658734;
               INPUT_TEXT = 3355443;
               LABEL_TEXT = 6710886;
               PANEL = 15987699;
               PROGRESS_BAR = 16777215;
               TEXT_BACKGROUND = 16777215;
         }
         LIST_DEFAULT = 16777215;
         LIST_ALTERNATE = 15987699;
         LIST_SELECTED = 13421772;
         LIST_ROLLOVER = 14540253;
         §§goto(addr227);
      }
   }
}
