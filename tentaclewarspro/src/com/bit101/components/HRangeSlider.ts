module com {
	export module bit101 {
		export module components {
			export class HRangeSlider extends RangeSlider {

				public constructor(parent:egret.DisplayObjectContainer = null,xpos:number = 0,ypos:number = 0,defaultHandler:Function = null)
				{
					super(HORIZONTAL,parent,xpos,ypos,defaultHandler);
				}

			}
		}
	}
}

flash.extendsClass("com.bit101.components.HRangeSlider","RangeSlider")
