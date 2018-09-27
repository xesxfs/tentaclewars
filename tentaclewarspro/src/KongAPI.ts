 class KongAPI extends egret.HashObject {
	public static _kong:any;

	public constructor()
	{
		super();
		super();
	}

	public static init(parent:egret.Sprite)
	{
		var paramObj:any = (<flash.LoaderInfo>(parent.root["loaderInfo"])).parameters;
		var apiPath:string = <any>paramObj["kongregate_api_path"] || "http://www.kongregate.com/flash/API_AS3_Local.swf";
		flash.Security["allowDomain"](apiPath);
		var request:egret.URLRequest = new egret.URLRequest(apiPath);
		var loader:flash.Loader = new flash.Loader();
		loader.contentLoaderInfo.addEventListener(egret.Event.COMPLETE,KongAPI.loadComplete,null);
		loader.load(request);
		parent.addChild(loader);
	}

	private static loadComplete(event:egret.Event)
	{
		KongAPI._kong = event.target["content"];
		KongAPI._kong.services.connect();
		console.log("KongAPI.loadComplete");
	}

	public static submitLevel(id:number)
	{
		id = flash.checkInt(id);
		if(KongAPI._kong)
		{
			KongAPI._kong.stats.submit("level",id);
			console.log("KongAPI.submitLevel: OK");
		}
		else
		{
			console.log("KongAPI.submitLevel: non initialized");
		}
	}

	public static submitHighScore(value:number)
	{
		value = flash.checkInt(value);
	}

}

KongAPI._kong = null;
