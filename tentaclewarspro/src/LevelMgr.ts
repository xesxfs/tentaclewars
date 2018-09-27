 class LevelMgr extends egret.HashObject {
	private var_275:Array<any> = null;
	private m_game:Main = null;
	private var_330:number = 0;
	private var_338:number = 0;
	private m_currLevel:number = 0;
	private var_392:number = 0;
	private var_391:number = 0;

	public constructor(game:Main)
	{
		super();
		this.var_338["var_391"] = true;
		this.var_275 = new Array(flash.bind(this.method_248,this),flash.bind(this.method_223,this),flash.bind(this.method_203,this),flash.bind(this.method_271,this),flash.bind(this.method_258,this),flash.bind(this.method_227,this),flash.bind(this.method_226,this),flash.bind(this.method_225,this),flash.bind(this.method_289,this),flash.bind(this.method_321,this),flash.bind(this.method_306,this),flash.bind(this.method_274,this),flash.bind(this.method_213,this),flash.bind(this.method_207,this),flash.bind(this.method_323,this),flash.bind(this.method_198,this),flash.bind(this.method_217,this),flash.bind(this.method_257,this),flash.bind(this.method_327,this),flash.bind(this.method_260,this));
	}

	private method_306(lvl:Level)
	{
	}

	private method_274(lvl:Level)
	{
		lvl["initFromCode"]("6,0,100,0,100,3,10,281,229,3,30,177,318,5,30,414,230,5,30,414,321,5,30,415,134,3,30,178,143,3644");
	}

	private method_213(lvl:Level)
	{
		lvl["initFromCode"]("8,0,150,0,100,3,30,116,242,3,50,72,347,5,30,399,392,5,30,403,86,3,50,79,126,5,30,546,142,5,30,461,246,5,30,545,345,5119");
	}

	private method_289(lvl:Level)
	{
		lvl["initFromCode"]("9,4,200,0,100,3,50,335,389,3,50,329,84,3,30,156,248,3,30,515,244,1,200,334,243,5,50,445,128,5,50,219,367,5,30,454,366,5,30,223,136,257,271,257,214,359,320,308,321,414,273,414,217,303,167,356,166,10698");
	}

	private method_323(lvl:Level)
	{
		lvl["initFromCode"]("7,0,100,0,100,3,50,161,275,3,10,337,81,2,10,255,395,4,10,503,274,2,50,485,146,4,50,200,135,1,50,419,392,4514");
	}

	private method_198(lvl:Level)
	{
		lvl["initFromCode"]("6,7,100,0,100,3,100,324,343,3,30,85,150,3,10,325,152,3,30,560,153,5,70,129,319,5,70,530,317,266,277,245,406,381,279,401,406,458,90,478,184,195,88,174,188,257,414,393,415,629,78,468,78,186,78,13,77,11534");
	}

	public createLevel(id:number):Level
	{
		id = flash.checkUint(id);
		var func:Function = <any>null;
		var lvl:Level = new Level(this.m_game,String(id + 1));
		this.m_currLevel = flash.checkInt(id);
		func = this.var_275[id];
		func(lvl);
		return lvl;
	}

	private method_257(lvl:Level)
	{
		lvl["initFromCode"]("8,0,160,0,100,3,20,99,389,3,10,190,278,5,160,552,89,3,20,62,273,3,20,210,409,3,20,87,159,3,20,321,354,3,20,190,128,4374");
	}

	private method_223(lvl:Level)
	{
		lvl["initFromCode"]("5,0,60,0,100,3,10,347,328,2,50,200,299,3,10,258,154,3,60,456,161,3,10,324,228,3074");
	}

	private method_207(lvl:Level)
	{
		lvl["initFromCode"]("6,3,60,0,100,5,60,323,124,2,60,221,293,5,10,491,135,3,60,432,297,2,10,177,140,3,10,322,407,322,345,322,238,328,229,417,173,316,229,233,173,7086");
	}

	private method_248(lvl:Level)
	{
		lvl["initFromCode"]("2,0,60,0,100,2,3,509,148,3,60,325,241,1453");
		GUI.showInGameStatus(GUI.TXT_GAME_HINT1.toLocaleUpperCase());
	}

	private method_258(lvl:Level)
	{
		lvl["initFromCode"]("5,0,100,0,100,3,30,110,160,3,30,132,287,3,30,211,387,1,90,307,205,5,100,532,101,2932");
		GUI.showInGameStatus(GUI.TXT_GAME_HINT3.toLocaleUpperCase());
	}

	private method_321(lvl:Level)
	{
		lvl["initFromCode"]("8,0,100,0,100,3,20,122,330,3,20,250,330,3,20,384,330,3,20,519,330,2,30,119,150,2,30,247,150,2,30,381,150,2,30,512,150,4882");
	}

	private method_226(lvl:Level)
	{
		lvl["initFromCode"]("9,0,80,0,100,3,20,198,338,2,10,329,348,3,20,456,342,4,60,328,231,2,10,459,234,2,10,191,227,2,10,329,111,3,20,452,118,3,20,201,116,5401");
	}

	private method_225(lvl:Level)
	{
		lvl["initFromCode"]("6,0,80,0,100,3,70,94,377,1,10,210,308,1,10,364,334,1,10,244,165,2,50,534,96,1,10,392,191,3664");
	}

	private method_227(lvl:Level)
	{
		lvl["initFromCode"]("7,5,60,0,100,3,10,214,184,3,10,418,186,2,30,318,346,1,10,198,357,1,10,438,359,3,30,65,313,3,30,567,319,242,286,304,225,123,392,150,300,489,306,511,395,316,223,390,287,309,215,309,124,10496");
	}

	public currLevel():number
	{
		return this.m_currLevel;
	}

	private method_327(lvl:Level)
	{
		lvl["initFromCode"]("13,0,80,0,100,3,10,69,235,2,50,565,89,2,50,566,381,1,30,209,338,1,30,369,246,1,30,341,391,1,30,434,122,1,30,459,330,1,30,236,198,1,30,284,67,1,30,556,233,1,30,131,107,1,30,86,386,8048");
	}

	private method_203(lvl:Level)
	{
		lvl["initFromCode"]("6,3,100,0,100,3,50,90,331,2,20,315,315,1,30,128,165,1,30,299,107,1,30,464,161,1,30,473,319,341,205,264,218,253,427,210,305,210,296,256,221,6781");
		GUI.showInGameStatus(GUI.TXT_GAME_HINT2.toLocaleUpperCase());
	}

	private method_271(lvl:Level)
	{
	}

	private method_217(lvl:Level)
	{
		lvl["initFromCode"]("20,0,50,0,100,3,20,71,397,3,20,202,288,3,20,312,395,3,20,444,293,3,20,565,395,5,30,76,289,5,30,197,394,5,30,324,287,5,30,440,398,5,30,562,287,3,20,73,179,3,20,194,78,3,20,319,180,3,20,444,77,3,20,559,184,5,30,567,74,5,30,443,186,5,30,317,75,5,30,197,184,5,30,67,83,11846");
	}

	private method_260(lvl:Level)
	{
		lvl["initFromCode"]("8,0,100,0,50,3,40,313,124,3,40,90,249,4,10,539,293,3,40,186,383,3,40,239,232,5,60,419,374,5,60,488,151,5,60,146,99,4864");
	}

}

