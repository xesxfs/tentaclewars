module com {
	export module bit101 {
		export module components {
			export class InputText extends com.bit101.components.Component {
				protected var_96:egret.Sprite;
				protected var_29:flash.TextField;
				protected var_311:boolean = false;
				protected _text:string = "";

				public constructor(parent:egret.DisplayObjectContainer = null,xpos:number = 0,ypos:number = 0,text:string = "",defaultHandler:Function = null)
				{
					super();
				}

				protected addChildren()
				{
					var _self__:any = this;
					this.var_96 = new egret.Sprite();
					this.var_29 = new flash.TextField();
					this.var_29.embedFonts = Style.embedFonts;
					_self__.addChild(this.var_29);
					this.var_29.addEventListener(egret.Event.CHANGE,flash.bind(this.method_239,this),null);
				}

				public set text(t:string)
				{
					this._text = "";
					this.method_40();
				}

				public get restrict():string
				{
					return this.var_29.restrict;
				}

				public draw()
				{
					super.draw();
					this.var_96.graphics.clear();
					this.var_96.graphics.beginFill(Style.BACKGROUND);
					this.var_96.graphics.drawRect(0,0,this._width,this._height);
					this.var_29.x = 2;
					this.var_29.y = Math.round(this._height / 2 - this.var_29.height / 2);
				}

				public set enabled(value:boolean)
				{
					egret.superSetter(com.bit101.components.InputText,this,"enabled",value);
					this.var_29.tabEnabled = value;
				}

				public get enabled():boolean{
			return egret.superGetter(com.bit101.components.InputText,this, "enabled");
		}
	
 				public get password():boolean
				{
					return this.var_311;
				}

				public get text():string
				{
					return this._text;
				}

				protected method_239(event:egret.Event)
				{
				}

				protected init()
				{
					super.init();
					this.setSize(100,16);
				}

				public set maxChars(max:number)
				{
					max = flash.checkInt(max);
					this.var_29.maxChars = flash.checkInt(max);
				}

				public set password(b:boolean)
				{
					this.var_311 = b;
					this.method_40();
				}

				public get maxChars():number
				{
					return this.var_29.maxChars;
				}

				public get textField():flash.TextField
				{
					return this.var_29;
				}

				public set restrict(str:string)
				{
					this.var_29.restrict = str;
				}

			}
		}
	}
}

flash.extendsClass("com.bit101.components.InputText","com.bit101.components.Component")
