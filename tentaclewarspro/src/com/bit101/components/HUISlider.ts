module com {
	export module bit101 {
		export module components {
			export class HUISlider extends UISlider {

				public constructor(parent:egret.DisplayObjectContainer = null,xpos:number = 0,ypos:number = 0,label:string = "",defaultHandler:Function = null)
				{
					super(parent,xpos,ypos,label,defaultHandler);
					var_279 = com.bit101.components.HSlider;
				}

				protected init()
				{
					super["init"]();
					setSize(200,18);
				}

				protected positionLabel()
				{
					var_246.x = var_39.x + var_39.width + 5;
				}

				public draw()
				{
					super["draw"]();
					var_39.x = _label.width + 5;
					var_39.y = height / 2 - var_39.height / 2;
					var_39.width = width - _label.width - 50 - 10;
					var_246.x = var_39.x + var_39.width + 5;
				}

			}
		}
	}
}

flash.extendsClass("com.bit101.components.HUISlider","UISlider")
