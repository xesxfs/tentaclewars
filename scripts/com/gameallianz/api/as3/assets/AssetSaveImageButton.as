package com.gameallianz.api.as3.assets
{
   import com.gameallianz.api.as3.GameAllianzApi;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class AssetSaveImageButton extends AssetButton
   {
       
      
      private var var_15:Sprite;
      
      private var var_11:Number;
      
      private var var_10:Number;
      
      private var var_18:Number;
      
      public function AssetSaveImageButton(_container:Sprite = null, _x:Number = 0, _y:Number = 0, _scale:Number = 1, _image:Sprite = null, _width:Number = 640, _height:Number = 480, _scale_image:Number = 1)
      {
         this.var_15 = _image;
         this.var_11 = _width;
         this.var_10 = _height;
         this.var_18 = _scale_image;
         super(_container,_x,_y,_scale);
      }
      
      override public function ini() : void
      {
         var mc_logo_over:MovieClip = null;
         var mc_logo:MovieClip = GameAllianzApi.save_image_button as MovieClip;
         mc_logo_over = GameAllianzApi.save_image_button as MovieClip;
         mc_logo_over.y = 2;
         btn_logo = new SimpleButton();
         btn_logo.upState = mc_logo;
         btn_logo.overState = mc_logo_over;
         btn_logo.downState = mc_logo;
         btn_logo.hitTestState = mc_logo;
         this.addChild(btn_logo);
         super.ini();
      }
      
      public function iniImage(_image:Sprite = null, _width:Number = 640, _height:Number = 480, _scale_image:Number = 1) : void
      {
         this.var_15 = _image;
         this.var_11 = _width;
         this.var_10 = _height;
         this.var_18 = _scale_image;
      }
      
      override public function handlerOnClick(_event:MouseEvent = null) : void
      {
         validate();
         GameAllianzApi.saveImage(this.var_15,this.var_11,this.var_10,this.var_18);
      }
   }
}
