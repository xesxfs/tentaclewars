package com.gameallianz.api.as3.assets
{
   import com.gameallianz.api.as3.GameAllianzApi;
   import com.gameallianz.api.as3.GameAllianzApiLinks;
   import com.gameallianz.api.as3.classes.GameAllianzApiExtended;
   import com.gameallianz.api.as3.classes.GameAllianzApiInternalEvent;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class AssetTwitterButton extends AssetButton
   {
       
      
      public function AssetTwitterButton(_container:Sprite = null, _x:Number = 0, _y:Number = 0, _scale:Number = 1)
      {
         super(_container,_x,_y,_scale);
      }
      
      override public function ini() : void
      {
         var mc_logo_over:MovieClip = null;
         var mc_logo:MovieClip = GameAllianzApi.twitter_logo as MovieClip;
         if(mc_logo != null)
         {
            mc_logo_over = GameAllianzApi.twitter_logo as MovieClip;
         }
         else
         {
            mc_logo = new AssetTwitterButtonSkin() as MovieClip;
            mc_logo_over = new AssetTwitterButtonSkin() as MovieClip;
         }
         mc_logo_over.y = 2;
         btn_logo = new SimpleButton();
         btn_logo.upState = mc_logo;
         btn_logo.overState = mc_logo_over;
         btn_logo.downState = mc_logo;
         btn_logo.hitTestState = mc_logo;
         this.addChild(btn_logo);
         var b_visible:* = GameAllianzApiExtended.action(GameAllianzApiInternalEvent.GET_GAME_INFO,"twitter");
         if(b_visible == null)
         {
            visible = true;
         }
         else
         {
            visible = Boolean(b_visible);
         }
         super.ini();
      }
      
      override public function handlerOnClick(_event:MouseEvent = null) : void
      {
         validate();
         GameAllianzApi.navigateTo(GameAllianzApiLinks.TO_TWITTER);
      }
   }
}
