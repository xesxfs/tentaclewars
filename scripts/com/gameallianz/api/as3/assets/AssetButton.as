package com.gameallianz.api.as3.assets
{
   import com.gameallianz.api.as3.GameAllianzApi;
   import com.gameallianz.api.as3.GameAllianzApiLinks;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class AssetButton extends MovieClip
   {
      
      public static const VALIDATE:String = "validate";
       
      
      public var btn_logo:SimpleButton;
      
      private var var_16:Sprite;
      
      private var var_19:Number;
      
      private var var_20:Number;
      
      private var var_14:Number;
      
      public function AssetButton(_container:Sprite = null, _x:Number = 0, _y:Number = 0, _scale:Number = 1)
      {
         this.var_16 = _container;
         this.var_19 = _x;
         this.var_20 = _y;
         this.var_14 = _scale;
         super();
         this.ini();
         this.method_14();
      }
      
      public function ini() : void
      {
         §§push(true);
         if(this.var_16 != null)
         {
            try
            {
               this.var_16.addChild(this);
               this.scaleX = this.var_14;
               this.scaleY = this.var_14;
               return;
            }
            catch(e:Error)
            {
               return;
            }
         }
      }
      
      private function method_14() : void
      {
      }
      
      private function method_30() : void
      {
      }
      
      private function method_38(_event:Event = null) : void
      {
         this.method_30();
         try
         {
            return;
         }
         catch(e:Error)
         {
            return;
         }
      }
      
      public function validate() : void
      {
      }
      
      public function handlerOnClick(_event:MouseEvent = null) : void
      {
         GameAllianzApi.navigateTo(GameAllianzApiLinks.TO_PORTAL_BY_LOGO);
      }
   }
}
