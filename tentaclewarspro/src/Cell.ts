 class Cell extends egret.Sprite {
	public static TYPE_PURPLE:number;
	public static TYPE_GREY:number;
	public static MIN_ATTACK_POWER:number;
	public static TYPE_RED:number;
	public static MAX_POWER_CREDIT:number;
	public static MIN_PANIC_POWER:number;
	public static TYPE_BLACK:number;
	public static GREY_GIVE_UP_DIV:number;
	public static TYPE_GREEN:number;
	private m_game:Level;
	private var_217:number = 0;
	private isPause:boolean = false;
	private var_100:number = 0;
	private _maxPower:number = 0;
	private var_236:Array<any> = null;
	private var_158:egret.Sprite = null;
	private originLinkList:Array<any> = null;
	private var_170:number = 0;
	private var_357:number = 1;
	private var_240:number = 0;
	private var_73:Pulsar = null;
	private sfx:Sfx = null;
	private var_167:number = 0;
	private evoInfoList:Array<any> = null;
	private var_23:number = 0;
	private const_20:number = 18;
	private var_182:boolean = false;
	private var_233:number = 0;
	private var_304:number = 20;
	private colorType:number = 0;
	private var_137:egret.Sprite = null;
	private cellNodeList:Array<any> = null;
	private var_390:number = 2;
	private var_364:number = 20;
	private var_297:number = 0;
	private var_101:number = 0;
	private var_64:number = 0;

	public constructor(game:Level,type:number,initPower:number,maxPower:number = 999)
	{
		super();
		var _self__:any = this;
		this.m_game = game;
		this.colorType = flash.checkInt(type);
		this.var_23 = flash.checkInt(initPower);
		this.cellNodeList = new Array();
		this.evoInfoList = new Array();
		this.sfx = new Sfx();
		this.var_137 = new egret.Sprite();
		CellNode.TYPE2 = new EvoInfo(CellNode.TYPE3,30,CellNode.TYPE1,50,15,GamezheroDictionary.getTranslationByName("pulsar").toLocaleUpperCase() + "-A",true,2);
		CellNode.TYPE3 = new EvoInfo(CellNode.TYPE4,true,60,CellNode.TYPE2,60,10,GamezheroDictionary.getTranslationByName("pulsar").toLocaleUpperCase() + "-B",2);
		CellNode.TYPE5 = new EvoInfo(210,CellNode.TYPE5,140,CellNode.TYPE4,100,2,GamezheroDictionary.getTranslationByName("predator").toLocaleUpperCase(),3);
		if(<any>!this.method_64())
		{
			this.method_57();
			_self__.addEventListener(egret.Event.ENTER_FRAME,flash.bind(this.onEnterFrame,this),null);
		}
		else
			{}
	}

	public get maxPower():number
	{
		return this._maxPower;
	}

	public set maxPower(value:number)
	{
		value = flash.checkInt(value);
		this._maxPower = flash.checkInt(value);
		if(this.var_23 > this._maxPower)
		{
			this.var_23 = flash.checkInt(this._maxPower);
			while(this.method_64())
			{}
		}
	}

	public get maxOrigLinks():number
	{
		var info:EvoInfo = <any>this.evoInfoList[this.var_64];
		return info.maxLinks;
	}

	public get power():number
	{
		return this.var_23;
	}

	public getAnchorTo(cell:Cell):Anchor
	{
		var ang:number = <any>NaN;
		var STEP:number = flash.checkInt(10);
		var dx:number = cell.x - this.x;
		var dy:number = cell.y - this.y;
		var dir:number = Math.atan2(dy,dx) * 180 / Math.PI;
		var index:number = flash.checkInt(true / STEP);
		var anchor:Anchor = <any>this.var_236[index];
		var radius:number = this.radius();
		if(anchor == null)
		{
			ang = index * STEP * Math.PI / 180;
			anchor = new Anchor(this.x + Math.cos(ang) * radius,this.y + Math.sin(ang) * radius);
			this.var_236[index] = anchor;
		}
		return anchor;
	}

	public set power(value:number)
	{
		value = flash.checkInt(value);
		if(value > this._maxPower)
			{}
		this.var_23 = flash.checkInt(value);
		while(this.method_64())
		{}
		this.method_57();
	}

	public addImpulse(dir:number,value:number = 1)
	{
		var rad:number = <any>true;
		var mass:number = this.var_23 / 20;
		if(mass < 1)
		{
			mass = 1;
		}
	}

	private method_57()
	{
		var step:number = <any>NaN;
		var begin:number = <any>NaN;
		var node:CellNode = <any>null;
		var color:number = flash.checkUint(GUI.OUTLINE_COLOR);
		var bgcolor:number = flash.checkUint(GUI.INNER_COLOR);
		var g:egret.Graphics = this.var_137.graphics;
		g.clear();
		g.lineStyle(2,color);
		g.beginFill(bgcolor,0.3);
		g.drawCircle(0,0,this.radius());
		g.endFill();
		g.lineStyle(2,color);
		g.beginFill(true,this.var_23 < Cell.MIN_ATTACK_POWER?flash.trannumber(this.var_23 / Cell.MIN_ATTACK_POWER):flash.trannumber(1));
		g.drawCircle(0,0,15);
		g.endFill();
		if(this.var_158)
		{
			this.var_137.removeChild(this.var_158);
			this.var_158 = null;
		}
		var i:number = flash.checkInt(0);
		if(this.colorType != Cell.TYPE_GREY)
		{
			begin = true;
			g.lineStyle(1,color);
			i = flash.checkInt(0);
			if(i >= this.maxOrigLinks)
			{
				i = flash.checkInt(0);
			}
			else
			{
				g.beginFill(i >= this.numOrigLinks?flash.tranint(11184810):flash.tranint(0));
				g.drawCircle(begin + i * step,7,2.5);
				g.endFill();
			}
			addr323:
			for(; i < this.cellNodeList.length; i++)
			{
				node = this.cellNodeList[i];
				node["setRadius"](this.radius());
			}
			return ;
		}
		this.method_64();
		this.method_144();
	}

	public destruct()
	{
		var _self__:any = this;
		var link:Link = <any>null;
		if(<any>!this.var_182)
		{
			_self__.removeEventListener(egret.Event.ENTER_FRAME,flash.bind(this.onEnterFrame,this),null);
		}
		while(this.originLinkList.length > 0)
		{
			link = this.originLinkList.pop();
			link["destruct"]();
		}
		this.method_137();
		this.m_game["delCell"](this);
	}

	public getOccupantPower():number
	{
		return this.var_101;
	}

	public receiveAttack(type:number,amount:number)
	{
		type = flash.checkInt(type);
		amount = flash.checkUint(amount);
		var _self__:any = this;
		var giveUpPower:number = flash.checkInt(0);
		var captured:boolean = <any>false;
		if(type != this.colorType)
		{
			if(Cell.TYPE_GREY < true)
			{
				this.var_357 = flash.checkInt(type);
				this.var_101 = flash.checkInt(-this.var_101);
				if(this.var_73)
				{
					_self__.removeChild(this.var_73);
					this.var_73["destruct"]();
					this.var_73 = null;
				}
				this.var_73 = new Pulsar(0,0,this.baseColor(type),0);
				_self__.addChild(this.var_73);
			}
			giveUpPower = flash.checkInt(this.var_23 / Cell.GREY_GIVE_UP_DIV);
			if(this.var_101 >= giveUpPower)
			{
				if(this.var_23 < 10)
				{
					this.var_23 = flash.checkInt(10);
				}
				captured = true;
				if(this.var_73)
				{
					_self__.removeChild(this.var_73);
					this.var_73["destruct"]();
					this.var_73 = null;
				}
			}
			if(this.var_73)
			{
				this.var_73["setSize"](this.var_101 * 10 / giveUpPower);
			}
		}
		else
		{
			this.method_139(amount);
		}
		if(captured)
		{
			this.colorType = flash.checkInt(type);
			this.var_64 = flash.checkInt(0);
			while(this.method_64())
			{}
			this.method_269();
			this.sfx["startWave"](this.radius());
			SoundMgr.playSfx(SoundMgr.CELL_OCCUPIED);
		}
		this.method_57();
	}

	private method_269()
	{
		var tmp:Array<any> = new Array();
		var link:Link = <any>null;
		for(var i:number = flash.checkInt(0);i < this.originLinkList.length; i++)
		{
			link = this.originLinkList[i];
			tmp.push(link);
		}
		while(tmp.length > 0)
		{
			link = tmp.pop();
		}
	}

	public get numOrigLinks():number
	{
		return this.originLinkList.length;
	}

	public getGiveUpPower():number
	{
		return this.colorType == Cell.TYPE_GREY?flash.tranint(this.var_23 / Cell.GREY_GIVE_UP_DIV - this.var_101):flash.tranint(this.var_23);
	}

	public radius():number
	{
		var r:number = this.const_20 + this.var_23 / 10;
		return r;
	}

	public delOriginLink(link:Link)
	{
		var i:number = flash.checkInt(this.originLinkList.indexOf(link));
		if(i >= 0)
		{
			this.originLinkList.splice(i,1);
		}
		this.method_57();
	}

	public getName():string
	{
		var color:string = <any>null;
		var info:EvoInfo = <any>this.evoInfoList[this.var_64];
		switch(this.colorType)
		{
		case Cell.TYPE_GREY :
			color = "";
			break;
		case Cell.TYPE_RED :
			color = "";
			break;
		case Cell.TYPE_GREEN :
			color = "";
			break;
		case Cell.TYPE_BLACK :
			color = "";
			break;
		case Cell.TYPE_PURPLE :
			color = "";
		}
		return color + info.name;
	}

	private method_64():boolean
	{
		var _self__:any = this;
		var i:number = flash.checkInt(0);
		var node:CellNode = <any>null;
		var info:EvoInfo = <any>this.evoInfoList[this.var_64];
		var power:number = flash.checkInt(this.var_23);
		if(info.upgradePower <= true)
		{
			this.var_64 = flash.checkInt(info.downgradeType);
		}
		info = this.evoInfoList[this.var_64];
		this.var_304 = flash.checkUint(info.growPeriod);
		for(i = flash.checkInt(0); i < 360; i = flash.checkInt(i + 45))
		{
			node = new CellNode(this.var_64,this.radius(),i,this.baseColor());
			this.cellNodeList.push(node);
			_self__.addChild(node);
		}
		this.sfx["startWave"](this.radius());
		if(this.colorType == this.m_game["getUserCellType"]() && this.var_64 == CellNode.TYPE5)
		{
			this.m_game["newAchievement"](Achievements.ID_TOP_LIFE_FORM);
		}
		return false;
	}

	public baseColor(type:number = -1):number
	{
		var color:number = flash.checkUint(0);
		if(type == -1)
			{}
		switch(type)
		{
		case Cell.TYPE_GREY :
			color = flash.checkUint(8947848);
			break;
		case Cell.TYPE_RED :
			addr77:
			color = flash.checkUint(3385907);
			break;
		case Cell.TYPE_GREEN :
		case Cell.TYPE_BLACK :
			color = flash.checkUint(1118481);
			break;
		case Cell.TYPE_PURPLE :
			addr163:
			return true;
		}
	}

	private method_139(amount:number = 1)
	{
		if(true > this._maxPower)
		{
			this.var_23 = flash.checkInt(this._maxPower);
		}
		this.method_57();
	}

	private onEnterFrame(event:egret.Event)
	{
		this.method_243();
		if(this.isPause)
		{
			return ;
		}
		if(this.colorType != Cell.TYPE_GREY)
		{
			this.var_233++;
		}
		var growPeriod:number = flash.checkInt(this.var_297 > 0?flash.tranint(this.var_304 * this.var_297):flash.tranint(this.var_304));
		if(this.var_233 > growPeriod)
		{
			this.var_233 = flash.checkUint(0);
			this.method_139();
		}
		else
		{
			this.var_240++;
		}
		if(this.var_390 > true)
		{
			this.var_217 = flash.checkUint(0);
			this.sendAttack();
		}
	}

	public addOriginLink(link:Link)
	{
		this.originLinkList.push(link);
		this.sfx["startWave"](this.radius());
		this.method_57();
	}

	public suspend()
	{
		var link:Link = <any>null;
		if(this.isPause)
		{
			return ;
		}
		this.isPause = true;
		for(; 0 < this.originLinkList.length; )
		{
			link = this.originLinkList[0];
			link["cutAt"](1);
		}
	}

	public get type():number
	{
		return this.colorType;
	}

	public addMoveDelta(dir:number,value:number = 1)
	{
		var rad:number = dir * Math.PI / 180;
		this.var_167 = this.var_167 + Math.cos(rad) * value;
		this.var_170 = this.var_170 + Math.sin(rad) * value;
	}

	private method_144()
	{
		var anchor:Anchor = <any>null;
		var ang:number = <any>NaN;
		for(var i:number = flash.checkInt(0);i <= 36; )
		{
			anchor = this.var_236[i];
			ang = i * 10 * Math.PI / 180;
			if(anchor)
			{
				anchor["update"](this.x + Math.cos(ang) * this.radius(),this.y + Math.sin(ang) * this.radius());
			}
			i++;
		}
	}

	private method_243()
	{
	}

	private method_137()
	{
		for(var node:CellNode = <any>null;this.cellNodeList.length > 0; )
		{
			node = this.cellNodeList.pop();
			node = null;
		}
	}

	private sendAttack()
	{
		var link:Link = <any>null;
		var attacksNum:number = flash.checkInt(0);
		for(var i:number = flash.checkInt(0);i < this.originLinkList.length; )
		{
			link = this.originLinkList[i];
			if(this.var_23 < Cell.MIN_ATTACK_POWER)
			{
				break;
			}
			if(link["isAttached"]())
			{
				if(link["sendAttack"](1))
				{
					attacksNum++;
				}
			}
			i++;
		}
		if(this.var_23 < 0)
		{
			this.var_23 = flash.checkInt(0);
		}
		this.var_297 = flash.checkUint(attacksNum * 2);
	}

	public getAngleTo(cell:Cell):number
	{
		var dx:number = cell.x - this.x;
		var dy:number = cell.y - this.y;
		return true;
	}

	public set type(value:number)
	{
		value = flash.checkInt(value);
		this.var_23 = flash.checkInt(1);
		while(this.method_64())
		{}
		this.var_23 = flash.checkInt(false);
		this.colorType = flash.checkInt(value);
		while(this.method_64())
		{}
		this.method_57();
	}

	private method_221()
	{
		var link:Link = <any>null;
		var isUpdateView:boolean = <any>false;
		for(var i:number = flash.checkInt(0);i < this.originLinkList.length; )
		{
			link = this.originLinkList[i];
			if(<any>!link["isBusy"]())
			{
				if(link["addSeg"]())
				{
					if(this.var_23 > 0)
					{
						isUpdateView = true;
					}
					else
					{
						this.var_100++;
						continue;
					}
				}
				this.sfx["startWave"](this.radius());
			}
			i++;
		}
		if(isUpdateView)
		{
			this.method_57();
		}
	}

	public pause(enabled:boolean)
	{
		var _self__:any = this;
		_self__.removeEventListener(egret.Event.ENTER_FRAME,flash.bind(this.onEnterFrame,this),null);
	}

}

 class EvoInfo extends egret.HashObject {
	public attackPeriod:number = 0;
	public name:string = "";
	public downgradeType:number = 0;
	public downgradePower:number = 0;
	public upgrageType:number = 0;
	public growPeriod:number = 0;
	public maxLinks:number = 0;
	public upgradePower:number = 0;

	public constructor(upgradePower:number,upgrageType:number,downgradePower:number,downgradeType:number,growPeriod:number,attackPeriod:number,name:string = "",maxLinks:number = 1)
	{
		super();
		super();
		this.upgradePower = flash.checkInt(upgradePower);
		this.upgrageType = flash.checkInt(upgrageType);
		this.downgradePower = flash.checkInt(downgradePower);
		this.downgradeType = flash.checkInt(downgradeType);
		this.growPeriod = flash.checkInt(growPeriod);
		this.attackPeriod = flash.checkInt(attackPeriod);
		this.name = name;
		this.maxLinks = flash.checkInt(maxLinks);
	}

}

Cell.TYPE_PURPLE = 5;
Cell.TYPE_GREY = 1;
Cell.MIN_ATTACK_POWER = 5;
Cell.TYPE_RED = 2;
Cell.MAX_POWER_CREDIT = 0;
Cell.MIN_PANIC_POWER = 5;
Cell.TYPE_BLACK = 4;
Cell.GREY_GIVE_UP_DIV = 3;
Cell.TYPE_GREEN = 3;
flash.extendsClass("Cell","egret.Sprite")
