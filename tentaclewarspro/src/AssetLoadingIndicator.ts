 class AssetLoadingIndicator extends egret.SwfMovie {

	public constructor()
	{
		super();
		this["addFrameScript"](32,flash.bind(this.frame33,this));
	}

	public frame33():any
	{
		var _self__:any = this;
		_self__.gotoAndPlay(1);
	}

}

flash.extendsClass("AssetLoadingIndicator","egret.SwfMovie")
