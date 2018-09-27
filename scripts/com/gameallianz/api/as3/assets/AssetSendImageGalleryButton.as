package com.gameallianz.api.as3.assets
{
   import com.gameallianz.api.as3.GameAllianzApi;
   import com.gameallianz.api.as3.classes.GameAllianzApiExtended;
   import com.gameallianz.api.as3.classes.GameAllianzApiInternalEvent;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class AssetSendImageGalleryButton extends AssetButton
   {
       
      
      private var var_15:Sprite;
      
      private var var_11:Number;
      
      private var var_10:Number;
      
      public function AssetSendImageGalleryButton(_container:Sprite = null, _x:Number = 0, _y:Number = 0, _scale:Number = 1, _image:Sprite = null, _width:Number = 640, _height:Number = 480)
      {
         this.var_15 = _image;
         this.var_11 = _width;
         this.var_10 = _height;
         super(_container,_x,_y,_scale);
      }
      
      override public function ini() : void
      {
         var mc_logo:MovieClip = null;
         var mc_logo_over:MovieClip = null;
         mc_logo = GameAllianzApi.send_image_gallery_button as MovieClip;
         §§push(true);
         if(mc_logo != null)
         {
            mc_logo_over = GameAllianzApi.send_image_gallery_button as MovieClip;
         }
         else
         {
            mc_logo = new AssetSendGalleryButtonSkin() as MovieClip;
            mc_logo_over = new AssetSendGalleryButtonSkin() as MovieClip;
         }
         mc_logo_over.y = 2;
         btn_logo = new SimpleButton();
         btn_logo.upState = mc_logo;
         btn_logo.downState = mc_logo;
         btn_logo.hitTestState = mc_logo;
         this.addChild(btn_logo);
         var b_visible:* = GameAllianzApiExtended.action(GameAllianzApiInternalEvent.GET_GAME_INFO,"send_image_gallery");
         §§push(true);
         if(b_visible == null)
         {
            visible = false;
         }
         else
         {
            visible = Boolean(b_visible);
         }
         super.ini();
      }
      
      public function iniImageGallery(_image:Sprite = null, _width:Number = 640, _height:Number = 480) : void
      {
         this.var_15 = _image;
         this.var_11 = _width;
         this.var_10 = _height;
      }
      
      override public function handlerOnClick(_event:MouseEvent = null) : void
      {
         validate();
         GameAllianzApi.sendImageGallery(this.var_15,this.var_11,this.var_10);
      }
   }
}
