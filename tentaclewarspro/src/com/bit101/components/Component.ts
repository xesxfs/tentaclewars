module com {
	export module bit101 {
		export module components {
			export class Component extends egret.Sprite {
				public static DRAW:string;
				protected var_256:boolean = true;
				protected _height:number = 0;
				protected _width:number = 0;
				protected _tag:number = -1;
				protected var_384:any;

				public constructor(parent:egret.DisplayObjectContainer = null,xpos:number = 0,ypos:number = 0)
				{
					super();
					this.var_384 = com.bit101.components.Component_Ronda;
					this.move(xpos,ypos);
					this.init();
					if(parent != null)
					{
						parent.addChild(this);
					}
				}

				public static initStage(stage:egret.Stage)
				{
					stage["align"] = flash.StageAlign.TOP_LEFT;
					stage.scaleMode = egret.StageScaleMode.NO_SCALE;
				}

				protected addChildren()
				{
				}

				public get enabled():boolean
				{
					return this.var_256;
				}

				public setSize(w:number,h:number)
				{
					var _self__:any = this;
					this._width = w;
					this._height = h;
					_self__.dispatchEvent(new egret.Event(egret.Event.RESIZE));
					this.method_40();
				}

				public set enabled(value:boolean)
				{
					this.var_256 = value;
					this.touchEnabled = this.touchChildren = this.var_256;
					this.tabEnabled = value;
					this.alpha = <any>!<any>!this.var_256?flash.trannumber(1):flash.trannumber(0.5);
				}

				public draw()
				{
				}

				public get width():number
				{
					return this._width;
				}

				public set height(h:number)
				{
					var _self__:any = this;
					this.method_40();
					_self__.dispatchEvent(new egret.Event(egret.Event.RESIZE));
				}

				protected init()
				{
				}

				public move(xpos:number,ypos:number)
				{
					this.y = Math.round(ypos);
				}

				public set width(w:number)
				{
					var _self__:any = this;
					this._width = w;
					this.method_40();
					_self__.dispatchEvent(new egret.Event(egret.Event.RESIZE));
				}

				protected method_42(dist:number,knockout:boolean = false):flash.DropShadowFilter
				{
					return new flash.DropShadowFilter(dist,45,Style.DROPSHADOW,1,dist,dist,0.3,1,knockout);
				}

				public get tag():number
				{
					return this._tag;
				}

				public get height():number
				{
					return this._height;
				}

				public set x(value:number)
				{
					egret.superSetter(com.bit101.components.Component,this,"x",Math.round(value));
				}

				public get x():number{
			return egret.superGetter(com.bit101.components.Component,this, "x");
		}
	
 				public set y(value:number)
				{
					egret.superSetter(com.bit101.components.Component,this,"y",Math.round(value));
				}

				public get y():number{
			return egret.superGetter(com.bit101.components.Component,this, "y");
		}
	
 				public set tag(value:number)
				{
					value = flash.checkInt(value);
				}

				protected method_127(event:egret.Event)
				{
					var _self__:any = this;
					_self__.removeEventListener(egret.Event.ENTER_FRAME,flash.bind(this.method_127,this),null);
					this.draw();
				}

				protected method_40()
				{
					var _self__:any = this;
					_self__.addEventListener(egret.Event.ENTER_FRAME,flash.bind(this.method_127,this),null);
				}

			}
		}
	}
}

com.bit101.components.Component.DRAW = "draw";
flash.extendsClass("com.bit101.components.Component","egret.Sprite")
