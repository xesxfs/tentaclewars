module com {
	export module google {
		export module analytics {
			export module debug {
				export class Label extends com.google.analytics.debug.UISprite {
					public static count:number;
					private _color:number = 0;
					private _background:egret.Shape;
					private _textField:flash.TextField;
					public stickToEdge:boolean = false;
					private _text:string;
					protected selectable:boolean = false;
					private _tag:string;

					public constructor(text:string = "",tag:string = "uiLabel",color:number = 0,alignement:com.google.analytics.debug.Align = null,stickToEdge:boolean = false)
					{
						super();
						this.name = "Label" + com.google.analytics.debug.Label.count++;
						this.selectable = false;
						this._background = new egret.Shape();
						this._textField = new flash.TextField();
						this._text = text;
						this._tag = tag;
						if(alignement == null)
						{
							alignement = com.google.analytics.debug.Align.none;
						}
						this.alignement = alignement;
						this.stickToEdge = stickToEdge;
						if(color == 0)
						{
							color = flash.checkUint(Style.backgroundColor);
						}
						this._color = flash.checkUint(color);
						this._textField.addEventListener(egret.TextEvent.egret.TextEvent.LINK,flash.bind(this.onLink,this),null);
					}

					public get tag():string
					{
						return this._tag;
					}

					private _draw()
					{
						var g:egret.Graphics = this._background.graphics;
						g.clear();
						g.beginFill(this._color);
						var W:number = flash.checkUint(this._textField.width);
						var H:number = flash.checkUint(this._textField.height);
						if(this.forcedWidth > 0)
						{
							W = flash.checkUint(this.forcedWidth);
						}
						com.google.analytics.debug.Background.drawRounded(this,g,W,H);
						g.endFill();
					}

					public get text():string
					{
						return this._textField.text;
					}

					public appendText(value:string,newtag:string = "")
					{
						if(value == "")
						{
							return ;
						}
						if(newtag == "")
						{
							newtag = this.tag;
						}
						this._textField.htmlText = this._textField.htmlText + ("<span class=\"" + newtag + "\">" + value + "</span>");
						this._text = this._text + value;
						this._draw();
						this.resize();
					}

					public set text(value:string)
					{
						if(value == "")
						{
							value = this._text;
						}
						this._textField.htmlText = "<span class=\"" + this.tag + "\">" + value + "</span>";
						this._text = value;
						this._draw();
						this.resize();
					}

					protected layout()
					{
						var _self__:any = this;
						this._textField.type = egret.TextFieldType.DYNAMIC;
						this._textField.textAlign = flash.TextFieldAutoSize.LEFT;
						this._textField.background = false;
						this._textField["selectable"] = this.selectable;
						this._textField.multiline = true;
						this._textField.styleSheet = Style.sheet;
						this.text = this._text;
						_self__.addChild(this._background);
						_self__.addChild(this._textField);
					}

					public set tag(value:string)
					{
						this._tag = value;
						this.text = "";
					}

					public onLink(event:egret.TextEvent)
					{
					}

					protected dispose()
					{
						this._textField.removeEventListener(egret.TextEvent.egret.TextEvent.LINK,flash.bind(this.onLink,this),null);
						super.dispose();
					}

				}
			}
		}
	}
}

com.google.analytics.debug.Label.count = 0;
flash.extendsClass("com.google.analytics.debug.Label","com.google.analytics.debug.UISprite")
