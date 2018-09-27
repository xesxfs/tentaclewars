module com {
	export module google {
		export module analytics {
			export module debug {
				export class UISprite extends egret.Sprite {
					private _forcedWidth:number = 0;
					public margin:com.google.analytics.debug.Margin;
					protected alignTarget:egret.DisplayObject;
					protected listenResize:boolean = false;
					public alignement:com.google.analytics.debug.Align;
					private _forcedHeight:number = 0;

					public constructor(alignTarget:egret.DisplayObject = null)
					{
						super(						var _self__:any = this;
);
						this.listenResize = false;
						this.alignement = com.google.analytics.debug.Align.none;
						this.alignTarget = alignTarget;
						this.margin = new com.google.analytics.debug.Margin();
						_self__.addEventListener(egret.Event.ADDED_TO_STAGE,flash.bind(this._onAddedToStage,this),null);
						_self__.addEventListener(egret.Event.REMOVED_FROM_STAGE,flash.bind(this._onRemovedFromStage,this),null);
					}

					public get forcedHeight():number
					{
						if(this._forcedHeight)
						{
							return this._forcedHeight;
						}
						return this.height;
					}

					private _onAddedToStage(event:egret.Event)
					{
						this.layout();
						this.resize();
					}

					protected dispose()
					{
						var _self__:any = this;
						var d:egret.DisplayObject = <any>null;
						for(var i:number = flash.checkInt(0);i < this.numChildren; )
						{
							d = _self__.getChildAt(i);
							if(d)
							{
								_self__.removeChild(d);
							}
							i++;
						}
					}

					public set forcedHeight(value:number)
					{
						value = flash.checkUint(value);
						this._forcedHeight = flash.checkUint(value);
					}

					public set forcedWidth(value:number)
					{
						value = flash.checkUint(value);
						this._forcedWidth = flash.checkUint(value);
					}

					protected layout()
					{
					}

					public get forcedWidth():number
					{
						if(this._forcedWidth)
						{
							return this._forcedWidth;
						}
						return this.width;
					}

					public alignTo(alignement:com.google.analytics.debug.Align,target:egret.DisplayObject = null)
					{
						var H:number = flash.checkUint(0);
						var W:number = flash.checkUint(0);
						var X:number = flash.checkUint(0);
						var Y:number = flash.checkUint(0);
						var t:com.google.analytics.debug.UISprite = <any>null;
						if(target == null)
						{
							if(flash.As3is(this.parent,egret.Stage))
							{
								target = this.stage;
							}
							else
							{
								target = this.parent;
							}
						}
						if(target == this.stage)
						{
							if(this.stage == null)
							{
								return ;
							}
							H = flash.checkUint(this.stage.stageHeight);
							W = flash.checkUint(this.stage.stageWidth);
							X = flash.checkUint(0);
							Y = flash.checkUint(0);
						}
						else
						{
							t = flash.As3As(target,com.google.analytics.debug.UISprite);
							if(t.forcedHeight)
							{
								H = flash.checkUint(t.forcedHeight);
							}
							else
							{
								H = flash.checkUint(t.height);
							}
							if(t.forcedWidth)
							{
								W = flash.checkUint(t.forcedWidth);
							}
							else
							{
								W = flash.checkUint(t.width);
							}
							X = flash.checkUint(0);
							Y = flash.checkUint(0);
						}
						switch(alignement)
						{
						case com.google.analytics.debug.Align.top :
							this.x = W / 2 - this.forcedWidth / 2;
							this.y = Y + this.margin.top;
							break;
						case com.google.analytics.debug.Align.bottom :
							this.x = W / 2 - this.forcedWidth / 2;
							this.y = Y + H - this.forcedHeight - this.margin.bottom;
							break;
						case com.google.analytics.debug.Align.left :
							this.x = X + this.margin.left;
							this.y = H / 2 - this.forcedHeight / 2;
							break;
						case com.google.analytics.debug.Align.right :
							this.x = X + W - this.forcedWidth - this.margin.right;
							this.y = H / 2 - this.forcedHeight / 2;
							break;
						case com.google.analytics.debug.Align.center :
							this.x = W / 2 - this.forcedWidth / 2;
							this.y = H / 2 - this.forcedHeight / 2;
							break;
						case com.google.analytics.debug.Align.topLeft :
							this.x = X + this.margin.left;
							this.y = Y + this.margin.top;
							break;
						case com.google.analytics.debug.Align.topRight :
							this.x = X + W - this.forcedWidth - this.margin.right;
							this.y = Y + this.margin.top;
							break;
						case com.google.analytics.debug.Align.bottomLeft :
							this.x = X + this.margin.left;
							this.y = Y + H - this.forcedHeight - this.margin.bottom;
							break;
						case com.google.analytics.debug.Align.bottomRight :
							this.x = X + W - this.forcedWidth - this.margin.right;
							this.y = Y + H - this.forcedHeight - this.margin.bottom;
						}
						if(<any>!this.listenResize && alignement != com.google.analytics.debug.Align.none)
						{
							target.addEventListener(egret.Event.RESIZE,flash.bind(this.onResize,this),null,false,0);
							this.listenResize = true;
						}
						this.alignement = alignement;
						this.alignTarget = target;
					}

					private _onRemovedFromStage(event:egret.Event)
					{
						var _self__:any = this;
						_self__.removeEventListener(egret.Event.ADDED_TO_STAGE,flash.bind(this._onAddedToStage,this),null);
						_self__.removeEventListener(egret.Event.REMOVED_FROM_STAGE,flash.bind(this._onRemovedFromStage,this),null);
						this.dispose();
					}

					public resize()
					{
						if(this.alignement != com.google.analytics.debug.Align.none)
						{
							this.alignTo(this.alignement,this.alignTarget);
						}
					}

					protected onResize(event:egret.Event)
					{
						this.resize();
					}

				}
			}
		}
	}
}

flash.extendsClass("com.google.analytics.debug.UISprite","egret.Sprite")
