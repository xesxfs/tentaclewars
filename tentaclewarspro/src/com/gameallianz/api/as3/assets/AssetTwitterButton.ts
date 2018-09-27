module com {
	export module gameallianz {
		export module api {
			export module as3 {
				export module assets {
					export class AssetTwitterButton extends AssetButton {

						public constructor(_container:egret.Sprite = null,_x:number = 0,_y:number = 0,_scale:number = 1)
						{
							super(_container,_x,_y,_scale);
						}

						public ini()
						{
							var mc_logo_over:egret.SwfMovie = <any>null;
							var mc_logo:egret.SwfMovie = flash.As3As(com.gameallianz.api.as3.GameAllianzApi.twitter_logo,egret.SwfMovie);
							if(mc_logo != null)
							{
								mc_logo_over = flash.As3As(com.gameallianz.api.as3.GameAllianzApi.twitter_logo,egret.SwfMovie);
							}
							else
							{
								mc_logo = flash.As3As(new AssetTwitterButtonSkin(),egret.SwfMovie);
								mc_logo_over = flash.As3As(new AssetTwitterButtonSkin(),egret.SwfMovie);
							}
							mc_logo_over.y = 2;
							btn_logo = new egret.SwfButton();
							btn_logo.upState = mc_logo;
							btn_logo.overState = mc_logo_over;
							btn_logo.downState = mc_logo;
							btn_logo.hitTestState = mc_logo;
							this["addChild"](btn_logo);
							var b_visible:any = GameAllianzApiExtended.action(com.gameallianz.api.as3.classes.GameAllianzApiInternalEvent.GET_GAME_INFO,"twitter");
							if(b_visible == null)
							{
								visible = true;
							}
							else
							{
								visible = flash.Boolean(b_visible);
							}
							super["ini"]();
						}

						public handlerOnClick(_event:flash.MouseEvent = null)
						{
							validate();
							com.gameallianz.api.as3.GameAllianzApi.navigateTo(com.gameallianz.api.as3.GameAllianzApiLinks.TO_TWITTER);
						}

					}
				}
			}
		}
	}
}

flash.extendsClass("com.gameallianz.api.as3.assets.AssetTwitterButton","AssetButton")
