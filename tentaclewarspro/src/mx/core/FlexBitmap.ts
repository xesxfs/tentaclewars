module mx {
	export module core {
		export class FlexBitmap extends flash.Bitmap {
			public static VERSION:string;

			public constructor(bitmapData:flash.BitmapData = null,pixelSnapping:string = "auto",smoothing:boolean = false)
			{
				super(bitmapData,pixelSnapping,smoothing);
				try 
				{
					this.name = mx.utils.NameUtil.createUniqueName(this);
					return ;
				}
				catch(e)
				{
					return ;
				}
			}

			public toString():string
			{
				return mx.utils.NameUtil.displayObjectToString(this);
			}

		}
	}
}

mx.core.FlexBitmap.VERSION = "3.5.0.12683";
flash.extendsClass("mx.core.FlexBitmap","flash.Bitmap")
