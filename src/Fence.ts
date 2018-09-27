 class Fence extends egret.Sprite {
	private var_153:number = 0;
	private var_91:number = 0;
	private var_92:number = 0;
	private var_134:number = 0;
	private var_250:Sync = null;
	private const_18:number = 5;

	public constructor(x1:number,y1:number,x2:number,y2:number)
	{
		super();
		var _self__:any = this;
		this.var_92 = x1;
		this.var_91 = y1;
		this.var_134 = x2;
		this.var_153 = y2;
		this.var_250 = new Sync(0.2);
		this.method_57();
		_self__.addEventListener(egret.Event.ENTER_FRAME,flash.bind(this.onEnterFrame,this),null);
	}

	public get y2():number
	{
		return this.var_153;
	}

	public get x2():number
	{
		return this.var_134;
	}

	public destruct()
	{
		this.graphics.clear();
	}

	public set x1(x:number)
	{
		this.var_92 = x;
		this.method_57();
	}

	private onEnterFrame(event:egret.Event)
	{
	}

	private method_57()
	{
		var g:egret.Graphics = this.graphics;
		var dx:number = this.var_134 - this.var_92;
		var dy:number = this.var_153 - this.var_91;
		var a:number = Math.atan2(dy,dx);
		var r:number = <any>this.const_18;
		var a90:number = Math.PI / 2;
		var a180:number = Math.PI;
		var delta:number = Math.sin(this.var_250["phase"]) * 5 + 2;
		var delta2:number = Math.sin(this.var_250["phase"] + a180) + 2;
		g.clear();
		g.lineStyle(2,GUI.OUTLINE_COLOR);
		g.beginFill(5592371,1);
		g.moveTo(Math.cos(a + a90) * r + this.var_92,Math.sin(a + a90) * r + this.var_91);
		g.curveTo(Math.cos(a + a180) * r * delta2 + this.var_92,Math.sin(a + a180) * r * delta2 + this.var_91,Math.cos(a - a90) * r + this.var_92,Math.sin(a - a90) * r + this.var_91);
		g.curveTo(Math.cos(a - a90) * delta + dx / 2 + this.var_92,Math.sin(a - a90) * delta + dy / 2 + this.var_91,Math.cos(a - a90) * r + this.var_134,Math.sin(a - a90) * r + this.var_153);
		g.curveTo(Math.cos(a) * r * delta2 + this.var_134,Math.sin(a) * r * delta2 + this.var_153,Math.cos(a + a90) * r + this.var_134,Math.sin(a + a90) * r + this.var_153);
		g.curveTo(Math.cos(a + a90) * delta + dx / 2 + this.var_92,Math.sin(a + a90) * delta + dy / 2 + this.var_91,Math.cos(a + a90) * r + this.var_92,Math.sin(a + a90) * r + this.var_91);
		g.endFill();
	}

	public set y1(y:number)
	{
		this.method_57();
	}

	public set y2(y:number)
	{
		this.var_153 = y;
		this.method_57();
	}

	public get x1():number
	{
		return this.var_92;
	}

	public set x2(x:number)
	{
	}

	public get y1():number
	{
		return this.var_91;
	}

}

flash.extendsClass("Fence","egret.Sprite")
