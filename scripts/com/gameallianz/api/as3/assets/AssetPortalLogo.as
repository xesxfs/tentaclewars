package com.gameallianz.api.as3.assets
{
   import com.gameallianz.api.as3.GameAllianzApi;
   import com.gameallianz.api.as3.GameAllianzApiLinks;
   import com.gameallianz.api.as3.GameAllianzApiPortals;
   import com.gameallianz.api.as3.classes.GameAllianzApiExtended;
   import com.gameallianz.api.as3.classes.GameAllianzApiGlobal;
   import com.gameallianz.api.as3.classes.GameAllianzApiInternalEvent;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class AssetPortalLogo extends AssetButton
   {
       
      
      public function AssetPortalLogo(_container:Sprite = null, _x:Number = 0, _y:Number = 0, _scale:Number = 1)
      {
      }
      
      override public function ini() : void
      {
         var mc_logo:MovieClip = GameAllianzApi.portal_logo as MovieClip;
         var mc_logo_over:MovieClip = GameAllianzApi.portal_logo as MovieClip;
         if(mc_logo == null)
         {
            if(GameAllianzApiPortals.FLASHGIRLGAMES === _loc4_)
            {
               §§push(true);
            }
            else
            {
               if(GameAllianzApiPortals.GAMESHERO !== _loc4_)
               {
                  §§push(2);
               }
               addr162:
               switch(§§pop())
               {
                  case 0:
                     mc_logo = new AssetFlashGirlGamesButtonSkin() as MovieClip;
                     mc_logo_over = new AssetFlashGirlGamesButtonSkin() as MovieClip;
                     break;
                  case 1:
                     mc_logo = new AssetGamezheroLogoButtonSkin() as MovieClip;
                     mc_logo_over = new AssetGamezheroLogoButtonSkin() as MovieClip;
                     break;
                  default:
                     mc_logo = new AssetGamezheroLogoButtonSkin() as MovieClip;
                     mc_logo_over = new AssetGamezheroLogoButtonSkin() as MovieClip;
               }
            }
            §§goto(addr162);
            §§push(1);
         }
         btn_logo = new SimpleButton();
         mc_logo_over.y = 2;
         btn_logo.upState = mc_logo;
         btn_logo.overState = mc_logo_over;
         btn_logo.downState = mc_logo;
         btn_logo.hitTestState = mc_logo;
         this.addChild(btn_logo);
         var b_visible:* = GameAllianzApiExtended.action(GameAllianzApiInternalEvent.GET_GAME_INFO,"portal_logo");
         if(b_visible == null)
         {
            visible = true;
         }
         else
         {
            visible = Boolean(b_visible);
         }
         trace("AssetPortalLogo ",btn_logo,mc_logo,visible);
         super.ini();
      }
      
      override public function handlerOnClick(_event:MouseEvent = null) : void
      {
         validate();
         GameAllianzApi.navigateTo(GameAllianzApiLinks.TO_PORTAL_BY_LOGO);
      }
   }
}
