module com {
	export module bit101 {
		export module components {
			export class CheckBox extends com.bit101.components.Component {
				protected var_96:egret.Sprite;
				protected var_195:string = "";
				protected _button:egret.Sprite;
				protected _label:Label;
				protected var_102:boolean = false;

				public constructor(parent:egret.DisplayObjectContainer = null,xpos:number = 0,ypos:number = 0,label:string = "",defaultHandler:Function = null)
				{
					super(p					var _self__:any = this;
arent,xpos,ypos);
					this.var_195 = label;
					if(defaultHandler != null)
					{
						_self__.addEventListener(egret.TouchEvent.TOUCH_TAP,defaultHandler,null);
					}
				}

				protected addChildren()
				{
					var _self__:any = this;
					this.var_96 = new egret.Sprite();
					this.var_96.filters = [this.method_42(2,true)];
					_self__.addChild(this.var_96);
					this._button.visible = false;
					_self__.addChild(this._button);
				}

				public set label(str:string)
				{
					this.var_195 = str;
					this.method_40();
				}

				public draw()
				{
					super.draw();
					this.var_96.graphics.clear();
					this.var_96.graphics.beginFill(Style.BACKGROUND);
					this.var_96.graphics.drawRect(0,0,10,10);
					this.var_96.graphics.endFill();
					this._button.graphics.clear();
					this._button.graphics.beginFill(Style.BUTTON_FACE);
					this._button.graphics.drawRect(2,2,6,6);
					this._label["text"] = this.var_195;
					this._label["draw"]();
					this._label["x"] = 12;
					this._label["y"] = (10 - this._label["height"]) / 2;
					this._width = this._label["width"] + 12;
					this._height = 10;
				}

				public set enabled(value:boolean)
				{
					egret.superSetter(com.bit101.components.CheckBox,this,"enabled",value);
					this.touchChildren = false;
				}

				public get enabled():boolean{
			return egret.superGetter(com.bit101.components.CheckBox,this, "enabled");
		}
	
 				protected init()
				{
					super.init();
					this["buttonMode"] = true;
					this["useHandCursor"] = true;
					this.touchChildren = false;
				}

				public set selected(s:boolean)
				{
					this.var_102 = s;
					this._button.visible = this.var_102;
				}

				protected onClick(event:flash.MouseEvent)
				{
					this._button.visible = this.var_102;
				}

				public get label():string
				{
					return this.var_195;
				}

				public get selected():boolean
				{
					return this.var_102;
				}

			}
		}
	}
}

flash.extendsClass("com.bit101.components.CheckBox","com.bit101.components.Component")
