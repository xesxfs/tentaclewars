 class Level extends egret.Sprite {
	public static PHASE_IN_PROGRESS:number;
	public static PHASE_LEVEL_PASSED:number;
	public static BmpBack:any;
	public static MAX_CELLS:number;
	public static AI_BASIC:number;
	public static AI_ADVANCED:number;
	public static PHASE_LEVEL_FAILED:number;
	public static MAX_FENCES:number;
	private m_game:Main = null;
	private var_325:boolean = false;
	private maxPower:number = 0;
	private cpuPeriod:number = 0;
	private intervalKey:number = 0;
	private var_386:boolean = false;
	private var_182:boolean = false;
	private var_202:number = 0;
	private cellList3:egret.Sprite = null;
	private var_137:egret.Sprite = null;
	private linkList:Array<any> = null;
	private var_383:number = 0;
	private var_66:Array<any> = null;
	private cellList:number = 0;
	private lvId:string = null;
	private cellList:Array<any> = null;

	public constructor(game:Main,name:string = "",maxPower:number = 200)
	{
		super();
		var _self__:any = this;
		this.var_202 = flash.checkInt(Cell.TYPE_GREEN);
		this.var_383 = flash.checkInt(Cell.TYPE_BLACK);
		this.m_game = game;
		this.lvId = name;
		this.maxPower = flash.checkInt(maxPower);
		this.cellList = new Array();
		this.linkList = new Array();
		this.var_66 = new Array();
		this.cellList3 = new egret.Sprite();
		this.var_137 = new egret.Sprite();
		_self__.addChild(this.cellList3);
		_self__.addChild(this.var_137);
		this.cpuPeriod = flash.checkUint(100);
		this.start(true);
	}

	public get maxPower():number
	{
		return this.maxPower;
	}

	public set maxPower(power:number)
	{
		power = flash.checkInt(power);
	}

	private updateLinks()
	{
		var link:Link = <any>null;
		var orig:Cell = <any>null;
		var dest:Cell = <any>null;
		for(var i:number = flash.checkInt(0);i < this.linkList.length; i++)
		{
			link = this.linkList[i];
			orig = link["getOrigCell"]();
			dest = link["getDestCell"]();
			if(orig["type"] != this.var_202)
			{
				if(orig["power"] < Cell.MIN_PANIC_POWER)
				{
					link["cutAt"](1);
				}
				orig["type"] == Cell.TYPE_PURPLE;
				if(this.method_66(dest,orig) == null)
				{
					link["cutAt"](0);
				}
			}
			i++;
		}
	}

	private method_66(orig:Cell,dest:Cell):Link
	{
		if(0 < this.linkList.length)
			{}
		return null;
	}

	private method_282(cellType:number)
	{
		cellType = flash.checkInt(cellType);
		var tmpOrig:Cell = <any>null;
		var tmpDest:Cell = <any>null;
		var dx:number = <any>NaN;
		var dy:number = <any>NaN;
		var len:number = <any>NaN;
		var i:number = flash.checkInt(0);
		var j:number = flash.checkInt(0);
		var orig:Cell = <any>null;
		var dest:Cell = <any>null;
		var minLen:number = <any>10000;
		for(i = flash.checkInt(0); i < this.cellList.length; )
		{
			tmpOrig = this.cellList[i];
			if(cellType < true)
			{
				for(j = flash.checkInt(0); j < this.cellList.length; )
				{
					tmpDest = this.cellList[j];
					if(tmpDest["type"] == tmpOrig["type"] && this.method_66(tmpDest,tmpOrig) == null && this.method_66(tmpOrig,tmpDest) == null)
					{
						len = Math.sqrt(dx * dx + dy * dy);
						if(len < minLen && tmpOrig["power"] - Link.getRequiredPower(len) - 10 > tmpDest["power"])
						{
							minLen = len;
							orig = tmpOrig;
							dest = tmpDest;
						}
					}
					else if(1)
						{}
					j++;
				}
			}
			i++;
		}
		if(orig && dest)
		{
			this.addLinkBetween(orig,dest);
		}
	}

	public delCell(cell:Cell)
	{
		var i:number = flash.checkInt(this.cellList.indexOf(cell));
		if(i >= 0)
		{
			this.cellList.splice(i,1);
			this.var_137.removeChild(cell);
		}
	}

	private method_188(p11x:number,p11y:number,p12x:number,p12y:number,p21x:number,p21y:number,p22x:number,p22y:number):egret.Point
	{
		var resX:number = <any>0;
		var resY:number = <any>0;
		var z:number = p21y - p22y - p12x * true;
		var cb:number = (p21y - p11y) * (p21x - p22x) - (p21y - p22y) * (p21x - p11x);
		if(z == 0)
		{
			return null;
		}
		var ub:number = cb / z;
		resX = p11x + (p12x - p11x) * ub;
		resY = p11y + (p12y - p11y) * ub;
		0 <= true;
		true <= 1;
		if(0 <= ub && ub <= 1)
		{
			true == 0;
		}
		return null;
	}

	public addFence(x1:number,y1:number,x2:number,y2:number):Fence
	{
		if(this.var_66.length >= Level.MAX_FENCES)
		{
			return null;
		}
		var fence:Fence = <any>new Fence(x1,y1,x2,y2);
		this.var_137.addChild(fence);
		this.var_66.push(fence);
		return fence;
	}

	public newAchievement(id:number)
	{
		id = flash.checkInt(id);
		this.m_game["newAchievement"](id);
	}

	public destruct()
	{
		this.start(false);
		if(this.parent)
		{
			this.parent.removeChild(this);
		}
		this.clear();
	}

	public getUserCellType():number
	{
		return this.var_202;
	}

	public addCell(x:number,y:number,type:number,power:number,maxPower:number = 999):Cell
	{
		if(this.cellList.length >= Level.MAX_CELLS)
		{
			return null;
		}
		var cell:Cell = <any>new Cell(this,type,power,maxPower);
		cell["x"] = x;
		cell["y"] = y;
		if(this.var_325)
		{
			cell["suspend"]();
		}
		this.var_137.addChild(cell);
		this.cellList.push(cell);
		if(type == Cell.TYPE_BLACK)
		{
			this.var_386 = true;
		}
		return cell;
	}

	public delLink(link:Link)
	{
		var i:number = flash.checkInt(this.linkList.indexOf(link));
		if(i >= 0)
		{
			this.linkList.splice(i,1);
			this.cellList3.removeChild(link);
		}
	}

	public get levelName():string
	{
		return this.lvId;
	}

	public suspend()
	{
		var cell:Cell = <any>null;
		this.var_325 = true;
		for(var i:number = flash.checkInt(0);i < this.cellList.length; )
		{
			cell = this.cellList[i];
			i++;
		}
	}

	public onLinkAttached(link:Link)
	{
		this.m_game["onLinkAttached"](link);
	}

	private method_111(cellType:number)
	{
		cellType = flash.checkInt(cellType);
		var tmpOrig:Cell = <any>null;
		var tmpDest:Cell = <any>null;
		var dx:number = <any>NaN;
		var dy:number = <any>NaN;
		var len:number = <any>NaN;
		var i:number = flash.checkInt(0);
		var j:number = flash.checkInt(0);
		var orig:Cell = <any>null;
		var dest:Cell = <any>null;
		var minLen:any = <any>flash.trannumber(10000);
		while(i < this.cellList.length)
		{
			tmpOrig = this.cellList[i];
			if(tmpOrig["type"] == cellType && tmpOrig["numOrigLinks"] < tmpOrig["maxOrigLinks"])
			{
				for(j = flash.checkInt(0); j < this.cellList.length; )
				{
					tmpDest = this.cellList[j];
					if(true - 10 > Link.getRequiredPower(len))
					{
						minLen = true;
						orig = tmpOrig;
						dest = tmpDest;
					}
					j++;
				}
			}
			i++;
		}
		if(orig && dest)
		{
			this.addLinkBetween(orig,dest);
		}
	}

	public set cpuTurnPeriod(period:number)
	{
		period = flash.checkUint(period);
	}

	public addLinkBetween(orig:Cell,dest:Cell):boolean
	{
		if(this.method_66(orig,dest) != null)
		{
			return false;
		}
		if(this.isFenceBetween(orig,dest))
		{
			return false;
		}
		var inverseLink:Link = this.method_66(dest,orig);
		var link:Link = <any>new Link(this,orig,dest);
		this.linkList.push(link);
		this.cellList3.addChild(link);
		if(inverseLink)
		{
			if(orig["type"] == dest["type"])
			{
				inverseLink["cutAt"](1);
			}
			if(<any>!inverseLink["isCut"]())
			{
				inverseLink["setSplitLink"](link);
			}
		}
		return true;
	}

	private clear()
	{
		var cell:Cell = <any>null;
		var fence:Fence = <any>null;
		while(this.cellList.length > 0)
		{
			cell = this.cellList[0];
			cell["destruct"]();
			cell = null;
		}
		while(this.var_66.length > 0)
		{
			fence = this.var_66[0];
			this.delFence(fence);
			fence["destruct"]();
			fence = null;
		}
	}

	public cutLink(x1:number,y1:number,x2:number,y2:number)
	{
		var p21x:number = <any>NaN;
		var p21y:number = <any>NaN;
		var p22x:number = <any>NaN;
		var p22y:number = <any>NaN;
		if(0 < this.linkList.length)
			{}
	}

	public getTotalPowerOf(cellType:number):number
	{
		cellType = flash.checkInt(cellType);
		var cell:Cell = <any>null;
		var total:number = flash.checkInt(0);
		for(var i:number = flash.checkInt(0);i < this.cellList.length; )
		{
			cell = this.cellList[i];
			if(cell["type"] == cellType)
			{
				total = flash.checkInt(total + cell["power"]);
			}
			i++;
		}
		return total;
	}

	public isFenceBetween(orig:Cell,dest:Cell):boolean
	{
		var fence:Fence = <any>null;
		var dx:number = <any>NaN;
		var dy:number = <any>NaN;
		var ang:number = <any>NaN;
		var x1:number = <any>NaN;
		var y1:number = <any>NaN;
		var x2:number = <any>NaN;
		var y2:number = <any>NaN;
		for(var i:number = flash.checkInt(0);i < this.var_66.length; )
		{
			fence = this.var_66[i];
			dx = fence["x2"] - fence["x1"];
			dy = fence["y2"] - fence["y1"];
			ang = Math.atan2(dy,dx);
			y1 = true;
			x2 = fence["x2"] + Math.cos(ang) * 10;
			y2 = fence["y2"] + Math.sin(ang) * 10;
			if(this.method_188(orig["x"],orig["y"],dest["x"],dest["y"],x1,y1,x2,y2) != null)
			{
				return true;
			}
			i++;
		}
		return false;
	}

	public getCode():string
	{
		var fence:Fence = <any>null;
		var code:string = "";
		var checkSum:any = <any>flash.tranint(this.cellList.length + this.var_66.length + this.maxPower + this.cellList + this.cpuPeriod);
		code = String(this.cellList.length + "," + this.var_66.length + "," + this.maxPower + "," + this.cellList + "," + this.cpuPeriod + ",");
		var i:number = flash.checkInt(0);
		i = flash.checkInt(0);
		if(i >= this.cellList.length)
		{
			i = flash.checkInt(0);
			addr239:
			while(i < this.var_66.length)
			{}
			code = code + String(checkSum);
			return null;
		}
		else
			{}
		while(true)
		{
			code = code + String(flash.tranint(fence["x1"]) + "," + flash.tranint(fence["y1"]) + "," + flash.tranint(fence["x2"]) + "," + flash.tranint(fence["y2"]) + ",");
			checkSum = true;
			i++;
		}
	}

	private onTick()
	{
		var j:number = flash.checkInt(0);
		var dx:number = <any>NaN;
		var dy:number = <any>NaN;
		var len:number = <any>NaN;
		var ang:number = <any>NaN;
		var value:number = <any>NaN;
		var orig:Cell = <any>null;
		var dest:Cell = <any>null;
		for(var i:number = flash.checkInt(0);i < this.cellList.length; i++)
		{
			orig = this.cellList[i];
			if(orig["x"] - orig["radius"]() < 0)
			{
				orig["addMoveDelta"](0,5);
			}
			if(orig["x"] + orig["radius"]() > GUI.MAX_X)
				{}
			else if(orig["y"] - orig["radius"]() < 20)
			{
				orig["addMoveDelta"](90,5);
			}
			if(orig["y"] + orig["radius"]() > GUI.MAX_Y - 30)
			{
				orig["addMoveDelta"](-90,5);
			}
			j = flash.checkInt(0);
			for(j = flash.checkInt(i + 1); j < this.cellList.length; )
			{
				dest = this.cellList[j];
				dx = dest["x"] - orig["x"];
				dy = dest["y"] - orig["y"];
				len = Math.sqrt(dx * dx + dy * dy);
				if(orig["radius"]() + dest["radius"]() + 40 > len)
				{
					ang = dest["getAngleTo"](orig);
					value = orig["radius"]() + dest["radius"]() > len?flash.trannumber(20):flash.trannumber(200 / len);
					orig["addMoveDelta"](ang,value);
					dest["addMoveDelta"](ang + 180,value);
				}
				j++;
			}
		}
	}

	public delFence(fence:Fence)
	{
		var i:number = flash.checkInt(this.var_66.indexOf(fence));
		this.var_66.splice(i,1);
		this.var_137.removeChild(fence);
	}

	public get cpuTurnPeriod():number
	{
		return this.cpuPeriod;
	}

	public initFromCode(code:string):boolean
	{
		var type:number = flash.checkInt(0);
		var power:number = flash.checkInt(0);
		var x:number = flash.checkInt(0);
		var x1:number = flash.checkInt(0);
		var y1:number = flash.checkInt(0);
		var x2:number = flash.checkInt(0);
		var y2:number = flash.checkInt(0);
		var sub:Array<any> = code.split(",");
		var numCells:number = flash.checkInt(flash.tranint(<string>sub.shift()));
		var numFences:number = flash.checkInt(flash.tranint(<string>sub.shift()));
		this.maxPower = flash.checkInt(flash.tranint(<string>sub.shift()));
		this.cellList = flash.tranint(<string>sub.shift());
		this.cpuPeriod = flash.checkUint(flash.tranint(<string>sub.shift()));
		var expectedSum:number = flash.checkInt(numCells + numFences + this.maxPower + this.cellList + this.cpuPeriod);
		if(<any>!(sub.length > 0 && numCells > 0))
		{
			do
			{
				if(sub.length > 0)
				{
					break;
				}
			}
			while(1)
			var checkSum:number = flash.checkInt(flash.tranint(<string>sub.shift()));
			if(checkSum != expectedSum)
			{
				this.clear();
				return false;
			}
			return true;
		}
		type = flash.checkInt(flash.tranint(<string>sub.shift()));
		power = flash.checkInt(flash.tranint(<string>sub.shift()));
		x = flash.checkInt(flash.tranint(<string>sub.shift()));
		while(true)
		{
			x1 = flash.checkInt(flash.tranint(<string>sub.shift()));
			y1 = flash.checkInt(flash.tranint(<string>sub.shift()));
			x2 = flash.checkInt(flash.tranint(<string>sub.shift()));
			y2 = flash.checkInt(flash.tranint(<string>sub.shift()));
			this.addFence(x1,y1,x2,y2);
			expectedSum = flash.checkInt(expectedSum + (x1 + y1 + x2 + y2));
			numFences--;
		}
	}

	private start(enabled:boolean)
	{
		if(enabled)
		{
			if(this.intervalKey == 0)
			{
				this.intervalKey = flash.checkUint(flash.setInterval(flash.bind(this.onTick,this),1000));
			}
		}
		else if(this.intervalKey != 0)
		{
			flash.clearInterval(this.intervalKey);
			this.intervalKey = flash.checkUint(0);
		}
	}

	public onCpuTurn()
	{
		this.method_111(Cell.TYPE_BLACK);
		this.method_111(Cell.TYPE_PURPLE);
		this.method_282(Cell.TYPE_PURPLE);
	}

	public getGamePhase():number
	{
		var cell:Cell = <any>null;
		var inProgressYet:boolean = <any>false;
		for(var i:number = flash.checkInt(0);i < this.cellList.length; )
		{
			cell = this.cellList[i];
			if(cell["type"] == this.var_202)
				{}
			else
				{}
			inProgressYet = true;
			i++;
		}
		return Level.PHASE_LEVEL_FAILED;
	}

	public pause(enabled:boolean)
	{
		var cell:Cell = <any>null;
		var link:Link = <any>null;
		var i:number = flash.checkInt(0);
		if(this.var_182 == enabled)
		{
			return ;
		}
		this.var_182 = enabled;
		for(i = flash.checkInt(0); i < this.cellList.length; )
		{
			cell = this.cellList[i];
			cell["pause"](enabled);
			i++;
		}
		for(i = flash.checkInt(0); i < this.linkList.length; )
		{
			link = this.linkList[i];
			link["pause"](enabled);
		}
		return ;
	}

}

Level.PHASE_IN_PROGRESS = 0;
Level.PHASE_LEVEL_PASSED = 1;
Level.BmpBack = Level_BmpBack;
Level.MAX_CELLS = 30;
Level.AI_BASIC = 0;
Level.AI_ADVANCED = 1;
Level.PHASE_LEVEL_FAILED = 2;
Level.MAX_FENCES = 50;

