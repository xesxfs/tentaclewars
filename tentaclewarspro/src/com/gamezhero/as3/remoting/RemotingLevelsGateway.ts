module com {
	export module gamezhero {
		export module as3 {
			export module remoting {
				export class RemotingLevelsGateway extends egret.HashObject {
					public static SORT_BY_RATE:number;
					public static ERROR:string;
					public static SORT_BY_RATE_DEC:number;
					public static SORT_BY_DATE:number;
					public static SORT_BY_NAME:number;
					public static SORT_BY_NAME_DEC:number;
					public static SORT_BY_DATE_DEC:number;
					public static SORT_BY_AUTHOR:number;
					public static SORT_BY_AUTHOR_DEC:number;
					private var_150:com.gamezhero.as3.remoting.RemotingService;
					private var_375:string;
					private var_176:com.gamezhero.as3.remoting.RemotingEventDispatcher;

					public constructor(strServicePath:string = null)
					{
						super();
						super();
						console.log("Init remoting, path = " + strServicePath);
						try 
						{
							this.var_176 = new com.gamezhero.as3.remoting.RemotingEventDispatcher();
							return ;
						}
						catch(e)
						{
							console.log("Init remoting error");
							return ;
						}
					}

					public getPageList(gameID:number,pageIndex:number,amountInPage:number,sortFlag:number)
					{
						var responder:com.gamezhero.as3.remoting.RemotingLevelResponder = new com.gamezhero.as3.remoting.RemotingLevelResponder(com.gamezhero.as3.remoting.events.RemotingLevelsEvent.GET_PAGE_LIST,flash.bind(this.method_77,this),flash.bind(this.method_78,this));
						this.var_150["call"]("levels.getPageList",flash.As3As(responder,Responder),gameID,pageIndex,amountInPage,sortFlag);
					}

					public getPagesAmount(gameID:number,amountInPage:number)
					{
						var responder:com.gamezhero.as3.remoting.RemotingLevelResponder = new com.gamezhero.as3.remoting.RemotingLevelResponder(com.gamezhero.as3.remoting.events.RemotingLevelsEvent.GET_PAGE_AMOUNT,flash.bind(this.method_77,this),flash.bind(this.method_78,this));
						this.var_150["call"]("levels.getPagesAmount",flash.As3As(responder,Responder),gameID,amountInPage);
					}

					public setLevel(gameID:number,levelID:number,levelData:com.gamezhero.as3.remoting.structure.LevelStructure)
					{
						var responder:com.gamezhero.as3.remoting.RemotingLevelResponder = new com.gamezhero.as3.remoting.RemotingLevelResponder(com.gamezhero.as3.remoting.events.RemotingLevelsEvent.SET_LEVEL,flash.bind(this.method_77,this),flash.bind(this.method_78,this));
						var code:string = <any>new MD5().hash(gameID + levelData.level_name + levelData.level_value);
						var arr:Array<any> = levelData.getArray();
						this.var_150["call"]("levels.setLevel",flash.As3As(responder,Responder),gameID,levelID,arr,code);
					}

					public removeEventListener(action:string,func:Function,thisObject:any)
					{
						this.var_176.removeEventListener(action,func,null);
					}

					private method_326(event:flash.events.NetStatusEvent = null)
					{
						var evt:com.gamezhero.as3.remoting.events.RemotingLevelsEvent = new com.gamezhero.as3.remoting.events.RemotingLevelsEvent(com.gamezhero.as3.remoting.events.RemotingLevelsEvent.ERROR);
						this.var_176.dispatchEvent(evt);
					}

					public addEventListener(action:string,func:Function,thisObject:any)
					{
						this.var_176.addEventListener(action,func,null);
					}

					public getLevel(gameID:number,levelID:string)
					{
						var responder:com.gamezhero.as3.remoting.RemotingLevelResponder = new com.gamezhero.as3.remoting.RemotingLevelResponder(com.gamezhero.as3.remoting.events.RemotingLevelsEvent.GET_LEVEL,flash.bind(this.method_77,this),flash.bind(this.method_78,this));
						this.var_150["call"]("levels.getLevel",flash.As3As(responder,Responder),gameID,levelID);
					}

					private init(strServicePath:string = null)
					{
						this.var_375 = strServicePath;
						this.var_150 = new com.gamezhero.as3.remoting.RemotingService(this.var_375);
						this.var_150.addEventListener(NetStatusEvent.NET_STATUS,flash.bind(this.method_326,this),null);
					}

					public setLevelRate(gameID:number,levelID:string,rate:number)
					{
						var responder:com.gamezhero.as3.remoting.RemotingLevelResponder = new com.gamezhero.as3.remoting.RemotingLevelResponder(com.gamezhero.as3.remoting.events.RemotingLevelsEvent.SET_LEVEL_RATE,flash.bind(this.method_77,this),flash.bind(this.method_78,this));
						var code:string = <any>new MD5().hash(String(gameID + levelID + rate));
						this.var_150["call"]("levels.setLevelRate",flash.As3As(responder,Responder),gameID,levelID,rate,code);
					}

					private method_78(name:string,fault:any)
					{
						var evt:com.gamezhero.as3.remoting.events.RemotingLevelsEvent = new com.gamezhero.as3.remoting.events.RemotingLevelsEvent(com.gamezhero.as3.remoting.events.RemotingLevelsEvent.ERROR);
						evt.value = name;
						this.var_176.dispatchEvent(evt);
					}

					private method_77(name:string,result:any)
					{
						var evt:com.gamezhero.as3.remoting.events.RemotingLevelsEvent = new com.gamezhero.as3.remoting.events.RemotingLevelsEvent(name);
						evt.value = result;
						this.var_176.dispatchEvent(evt);
					}

				}
			}
		}
	}
}

com.gamezhero.as3.remoting.RemotingLevelsGateway.SORT_BY_RATE = 2;
com.gamezhero.as3.remoting.RemotingLevelsGateway.ERROR = "REMOTING_LEVEL_ERROR";
com.gamezhero.as3.remoting.RemotingLevelsGateway.SORT_BY_RATE_DEC = 3;
com.gamezhero.as3.remoting.RemotingLevelsGateway.SORT_BY_DATE = 6;
com.gamezhero.as3.remoting.RemotingLevelsGateway.SORT_BY_NAME = 0;
com.gamezhero.as3.remoting.RemotingLevelsGateway.SORT_BY_NAME_DEC = 1;
com.gamezhero.as3.remoting.RemotingLevelsGateway.SORT_BY_DATE_DEC = 7;
com.gamezhero.as3.remoting.RemotingLevelsGateway.SORT_BY_AUTHOR = 4;
com.gamezhero.as3.remoting.RemotingLevelsGateway.SORT_BY_AUTHOR_DEC = 5;
