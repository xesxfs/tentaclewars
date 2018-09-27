module com {
	export module google {
		export module analytics {
			export module debug {
				export class Panel extends com.google.analytics.debug.UISprite {
					private _savedH:number = 0;
					private _data:com.google.analytics.debug.UISprite;
					private _mask:egret.Sprite;
					private _background:egret.Shape;
					private _savedW:number = 0;
					private _stickToEdge:boolean = false;
					private _border:egret.Shape;
					private _borderColor:number = 0;
					protected baseAlpha:number = NaN;
					private _backgroundColor:number = 0;
					private _title:com.google.analytics.debug.Label;
					private _colapsed:boolean = false;
					private _name:string;

					public constructor(name:string,width:number,height:number,backgroundColor:number = 0,borderColor:number = 0,baseAlpha:number = 0.3,alignement:com.google.analytics.debug.Align = null,stickToEdge:boolean = false)
					{
						super();
						this._name = name;
						this.name = name;
						this.touchEnabled = false;
						this._colapsed = false;
						this.forcedWidth = flash.checkUint(width);
						this.forcedHeight = height;
						this.baseAlpha = baseAlpha;
						this._background = new egret.Shape();
						this._data = new com.google.analytics.debug.UISprite();
						this._data.forcedWidth = width;
						this._data.forcedHeight = height;
						this._data.touchEnabled = false;
						this._title = new com.google.analytics.debug.Label(name,"uiLabel",16777215,com.google.analytics.debug.Align.topLeft,stickToEdge);
						this._title["buttonMode"] = true;
						this._title.margin.top = flash.checkInt(0.6);
						this._title.margin.left = flash.checkInt(0.6);
						this._title.addEventListener(egret.TouchEvent.TOUCH_TAP,flash.bind(this.onToggle,this),null);
						this._title.touchChildren = false;
						this._border = new egret.Shape();
						this._mask = new egret.Sprite();
						this._mask["useHandCursor"] = false;
						this._mask.touchEnabled = false;
						this._mask.touchChildren = false;
						if(alignement == null)
						{
							alignement = com.google.analytics.debug.Align.none;
						}
						this.alignement = alignement;
						this.stickToEdge = stickToEdge;
						if(backgroundColor == 0)
						{
							backgroundColor = flash.checkUint(Style.backgroundColor);
						}
						this._backgroundColor = flash.checkUint(backgroundColor);
						if(borderColor == 0)
						{
							borderColor = flash.checkUint(Style.borderColor);
						}
						this._borderColor = flash.checkUint(borderColor);
					}

					public get stickToEdge():boolean
					{
						return this._stickToEdge;
					}

					public onToggle(event:flash.MouseEvent = null)
					{
						if(this._colapsed)
						{
							this._data.visible = true;
						}
						else
						{
							this._data.visible = false;
						}
						this._colapsed = <any>!this._colapsed;
						this._update();
						this.resize();
					}

					public set stickToEdge(value:boolean)
					{
						this._stickToEdge = value;
						this._title.stickToEdge = value;
					}

					protected dispose()
					{
						this._title.removeEventListener(egret.TouchEvent.TOUCH_TAP,flash.bind(this.onToggle,this),null);
						super.dispose();
					}

					private _draw()
					{
						var W:number = flash.checkUint(0);
						var H:number = flash.checkUint(0);
						if(this._savedW && this._savedH)
						{
							this.forcedWidth = flash.checkUint(this._savedW);
							this.forcedHeight = this._savedH;
						}
						if(<any>!this._colapsed)
						{
							W = flash.checkUint(this.forcedWidth);
							H = flash.checkUint(this.forcedHeight);
						}
						else
						{
							W = flash.checkUint(this._title.width);
							H = flash.checkUint(this._title.height);
							this._savedW = flash.checkUint(this.forcedWidth);
							this._savedH = flash.checkUint(this.forcedHeight);
							this.forcedWidth = flash.checkUint(W);
							this.forcedHeight = H;
						}
						var g0:egret.Graphics = this._background.graphics;
						g0.clear();
						g0.beginFill(this._backgroundColor);
						com.google.analytics.debug.Background.drawRounded(this,g0,W,H);
						g0.endFill();
						var g01:egret.Graphics = this._data.graphics;
						g01.clear();
						g01.beginFill(this._backgroundColor,0);
						com.google.analytics.debug.Background.drawRounded(this,g01,W,H);
						g01.endFill();
						var g1:egret.Graphics = this._border.graphics;
						g1.clear();
						g1.lineStyle(0.1,this._borderColor);
						com.google.analytics.debug.Background.drawRounded(this,g1,W,H);
						g1.endFill();
						var g2:egret.Graphics = this._mask.graphics;
						g2.clear();
						g2.beginFill(this._backgroundColor);
						com.google.analytics.debug.Background.drawRounded(this,g2,W + 1,H + 1);
						g2.endFill();
					}

					public get title():string
					{
						return this._title.text;
					}

					private _update()
					{
						this._draw();
						if(this.baseAlpha < 1)
						{
							this._background.alpha = this.baseAlpha;
							this._border.alpha = this.baseAlpha;
						}
					}

					public addData(child:egret.DisplayObject)
					{
						this._data.addChild(child);
					}

					protected layout()
					{
						var _self__:any = this;
						this._update();
						_self__.addChild(this._background);
						_self__.addChild(this._data);
						_self__.addChild(this._title);
						_self__.addChild(this._border);
						_self__.addChild(this._mask);
						this.mask = this._mask;
					}

					public set title(value:string)
					{
						this._title.text = value;
					}

					public close()
					{
						this.dispose();
						if(this.parent != null)
						{
							this.parent.removeChild(this);
						}
					}

				}
			}
		}
	}
}

flash.extendsClass("com.google.analytics.debug.Panel","com.google.analytics.debug.UISprite")
