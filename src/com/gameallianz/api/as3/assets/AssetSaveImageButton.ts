module com {
	export module gameallianz {
		export module api {
			export module as3 {
				export module assets {
					export class AssetSaveImageButton extends AssetButton {
						private var_15:egret.Sprite;
						private var_11:number = NaN;
						private var_10:number = NaN;
						private var_18:number = NaN;

						public constructor(_container:egret.Sprite = null,_x:number = 0,_y:number = 0,_scale:number = 1,_image:egret.Sprite = null,_width:number = 640,_height:number = 480,_scale_image:number = 1)
						{
							super(_container,_x,_y,_scale);
							this.var_15 = _image;
							this.var_11 = _width;
							this.var_10 = _height;
							this.var_18 = _scale_image;
						}

						public ini()
						{
							var mc_logo_over:egret.SwfMovie = <any>null;
							var mc_logo:egret.SwfMovie = flash.As3As(com.gameallianz.api.as3.GameAllianzApi.save_image_button,egret.SwfMovie);
							mc_logo_over = flash.As3As(com.gameallianz.api.as3.GameAllianzApi.save_image_button,egret.SwfMovie);
							mc_logo_over.y = 2;
							btn_logo = new egret.SwfButton();
							btn_logo.upState = mc_logo;
							btn_logo.overState = mc_logo_over;
							btn_logo.downState = mc_logo;
							btn_logo.hitTestState = mc_logo;
							this["addChild"](btn_logo);
							super["ini"]();
						}

						public iniImage(_image:egret.Sprite = null,_width:number = 640,_height:number = 480,_scale_image:number = 1)
						{
							this.var_15 = _image;
							this.var_11 = _width;
							this.var_10 = _height;
							this.var_18 = _scale_image;
						}

						public handlerOnClick(_event:flash.MouseEvent = null)
						{
							validate();
							com.gameallianz.api.as3.GameAllianzApi.saveImage(this.var_15,this.var_11,this.var_10,this.var_18);
						}

					}
				}
			}
		}
	}
}

flash.extendsClass("com.gameallianz.api.as3.assets.AssetSaveImageButton","AssetButton")
