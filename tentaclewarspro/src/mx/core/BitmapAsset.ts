module mx {
	export module core {
		export class BitmapAsset extends mx.core.FlexBitmap implements mx.core.IFlexAsset,mx.core.IFlexDisplayObject {
			public static VERSION_static_mx_core_BitmapAsset:string;

			public constructor(bitmapData:flash.BitmapData = null,pixelSnapping:string = "auto",smoothing:boolean = false)
			{
				super(bitmapData,pixelSnapping,smoothing);
			}

			public get measuredWidth():number
			{
				if(this.bitmapData)
				{
					return this.bitmapData.width;
				}
				return 0;
			}

			public get measuredHeight():number
			{
				if(this.bitmapData)
				{
					return this.bitmapData.height;
				}
				return 0;
			}

			public setActualSize(newWidth:number,newHeight:number)
			{
				this.width = newWidth;
				this.height = newHeight;
			}

			public move(x:number,y:number)
			{
				this.x = x;
				this.y = y;
			}

		}
	}
}

mx.core.BitmapAsset.VERSION_static_mx_core_BitmapAsset = "3.5.0.12683";
flash.extendsClass("mx.core.BitmapAsset","mx.core.FlexBitmap")
flash.implementsClass("mx.core.BitmapAsset",["mx.core.IFlexAsset","mx.core.IFlexDisplayObject"]);