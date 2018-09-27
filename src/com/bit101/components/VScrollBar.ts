module com {
	export module bit101 {
		export module components {
			export class VScrollBar extends ScrollBar {

				public constructor(parent:egret.DisplayObjectContainer = null,xpos:number = 0,ypos:number = 0,defaultHandler:Function = null)
				{
					super(Slider.VERTICAL,parent,xpos,ypos,defaultHandler);
				}

			}
		}
	}
}

flash.extendsClass("com.bit101.components.VScrollBar","ScrollBar")
