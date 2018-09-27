package
{
   import flash.display.Sprite;
   import flash.filters.GlowFilter;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   
   public class TextSprite extends Sprite
   {
       
      
      private var var_393:String = "TextSprite_GameDefaultFont";
      
      private var var_395:String = "TextSprite_GameTranslateFont";
      
      private var var_401:String = "TextSprite_GameHeaderFont";
      
      protected var var_333:TextField = null;
      
      public function TextSprite(html:String, size:int, color:uint, alpha:Number = 1, outline:Boolean = false, outlineColor:uint = 16777215, fontName:String = "default", isCentered:Boolean = true)
      {
         super();
         var text:TextField = new TextField();
         text.alpha = alpha;
         text.embedFonts = true;
         text.autoSize = TextFieldAutoSize.LEFT;
         text.selectable = false;
         text.border = false;
         text.mouseEnabled = false;
         text.multiline = true;
         text.condenseWhite = false;
         text.mouseEnabled = false;
         if(outline)
         {
            text.filters = [new GlowFilter(outlineColor,1,4,4,8,1,false,false)];
         }
         var format:TextFormat = new TextFormat();
         format.font = fontName;
         §§push(true);
         if(html)
         {
            text.htmlText = html;
         }
         addChild(text);
         mouseEnabled = false;
         if(isCentered)
         {
            text.x = -(text.width / 2);
            text.y = -(text.height / 2);
         }
         this.var_333 = text;
      }
   }
}
