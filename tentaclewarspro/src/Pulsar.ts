 class Pulsar extends Node {
	private var_250:Sync = null;
	private var_379:number = 0;
	private var_293:number = 0;
	private var_231:number = 0;

	public constructor(baseRadius:number,baseAngle:number,color:number,size:number = 4,rotDelta:number = 0)
	{
		super();
		this.var_231 = flash.checkInt(size);
		this.var_293 = flash.checkUint(color);
		this.var_379 = rotDelta * Math.PI / 180;
		this.var_250 = new Sync(0.3);
	}

	public setSize(size:number)
	{
	}

	public setBaseRadius(radius:number)
	{
		super["setBaseRadius"](radius);
	}

	private method_57()
	{
		var angle:number = <any>NaN;
		angle = var_144 + Math.sin(this.var_250["phase"]) * this.var_379;
		this["x"] = Math.cos(angle) * var_125;
		this["y"] = Math.sin(angle) * var_125;
		this["rotation"] = angle * 180 / Math.PI;
		var g:egret.Graphics = <any>graphics;
		var r:number = Math.sin(this.var_250["phase"]) * this.var_231 / 2 + this.var_231;
		g.clear();
		g.lineStyle(1,GUI.OUTLINE_COLOR);
		g.beginFill(this.var_293);
		g.drawCircle(0,0,r);
		g.endFill();
		method_153(r);
	}

	protected onEnterFrame(event:egret.Event)
	{
		this.var_250["tick"]();
		this.method_57();
	}

	public destruct()
	{
	}

}

flash.extendsClass("Pulsar","Node")
