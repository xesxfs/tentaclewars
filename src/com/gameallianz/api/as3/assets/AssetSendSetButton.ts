module com {
	export module gameallianz {
		export module api {
			export module as3 {
				export module assets {
					export class AssetSendSetButton extends AssetButton {
						private var_17:any;

						public constructor(_container:egret.Sprite = null,_x:number = 0,_y:number = 0,_scale:number = 1,_set:any = null)
						{
							super(_container,_x,_y,_scale);
							this.var_17 = _set;
						}

						public ini()
						{
							var mc_logo_over:egret.SwfMovie = <any>null;
							var mc_logo:egret.SwfMovie = flash.As3As(com.gameallianz.api.as3.GameAllianzApi.send_set_button,egret.SwfMovie);
							if(mc_logo != null)
							{
								mc_logo_over = flash.As3As(com.gameallianz.api.as3.GameAllianzApi.send_set_button,egret.SwfMovie);
							}
							else
							{
								mc_logo = flash.As3As(new AssetSendSetButtonSkin(),egret.SwfMovie);
								mc_logo_over = flash.As3As(new AssetSendSetButtonSkin(),egret.SwfMovie);
							}
							mc_logo_over.y = 2;
							btn_logo = new egret.SwfButton();
							btn_logo.upState = mc_logo;
							btn_logo.overState = mc_logo_over;
							btn_logo.downState = mc_logo;
							btn_logo.hitTestState = mc_logo;
							this["addChild"](btn_logo);
							var b_visible:any = GameAllianzApiExtended.action(com.gameallianz.api.as3.classes.GameAllianzApiInternalEvent.GET_GAME_INFO,"send_set");
							if(b_visible == null)
							{
								visible = false;
							}
							else
							{
								visible = flash.Boolean(b_visible);
							}
							super["ini"]();
						}

						public iniSet(_set:any = null)
						{
							this.var_17 = _set;
						}

						public handlerOnClick(_event:flash.MouseEvent = null)
						{
							validate();
							com.gameallianz.api.as3.GameAllianzApi.sendSet(this.var_17);
						}

					}
				}
			}
		}
	}
}

flash.extendsClass("com.gameallianz.api.as3.assets.AssetSendSetButton","AssetButton")
