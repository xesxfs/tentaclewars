module NewgroundsAPI_fla {
	export class NewgroundsAPIAsset_Load_Indicator_3 extends egret.SwfMovie {

		public constructor()
		{
			super();
			this["addFrameScript"](0,flash.bind(this.frame1,this));
		}

		public onEnterFrame(e:egret.Event)
		{
			var _self__:any = this;
			if(this.visible && this.stage)
			{
				this.rotation = this.rotation + 30;
			}
			else
			{
				_self__.removeEventListener(egret.Event.ENTER_FRAME,flash.bind(this.onEnterFrame,this),null);
			}
		}

		public frame1():any
		{
			var _self__:any = this;
			_self__.addEventListener(egret.Event.ENTER_FRAME,flash.bind(this.onEnterFrame,this),null);
		}

	}
}

flash.extendsClass("NewgroundsAPI_fla.NewgroundsAPIAsset_Load_Indicator_3","egret.SwfMovie")
