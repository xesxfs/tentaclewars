module NewgroundsAPI_fla {
	export class NewgroundsAPIAsset_FlashAd_Container_23 extends egret.SwfMovie {
		public adMask:egret.SwfMovie;
		public ngLinkButton:egret.SwfButton;

		public constructor()
		{
			super();
			this["addFrameScript"](0,flash.bind(this.frame1,this),10,flash.bind(this.frame11,this));
		}

		public onNGLinkClicked(e:flash.MouseEvent)
		{
			API.loadNewgrounds();
		}

		public frame1():any
		{
		}

		public frame11():any
		{
			var _self__:any = this;
			_self__.gotoAndPlay(1);
		}

	}
}

flash.extendsClass("NewgroundsAPI_fla.NewgroundsAPIAsset_FlashAd_Container_23","egret.SwfMovie")
