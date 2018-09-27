module com {
	export module gamezhero {
		export module as3 {
			export module remoting {
				export module events {
					export class RemotingLevelsEvent extends egret.Event {
						public static GET_PAGE_LIST:string;
						public static SET_LEVEL:string;
						public static ERROR:string;
						public static SET_LEVEL_RATE:string;
						public static GET_LEVEL:string;
						public static GET_PAGE_AMOUNT:string;
						private var_332:any;

						public constructor(type:string)
						{
							super(type);
						}

						public get value():any
						{
							return this.var_332;
						}

						public set value(val:any)
						{
							this.var_332 = val;
						}

						public toString():string
						{
							var _self__:any = this;
							return _self__.formatToString("RemotinLevelsEvent");
						}

					}
				}
			}
		}
	}
}

com.gamezhero.as3.remoting.events.RemotingLevelsEvent.GET_PAGE_LIST = "GET_PAGE_LIST";
com.gamezhero.as3.remoting.events.RemotingLevelsEvent.SET_LEVEL = "SET_LEVEL";
com.gamezhero.as3.remoting.events.RemotingLevelsEvent.ERROR = "LEVEL_REMOTIN_ERROR";
com.gamezhero.as3.remoting.events.RemotingLevelsEvent.SET_LEVEL_RATE = "SET_LEVEL_RATE";
com.gamezhero.as3.remoting.events.RemotingLevelsEvent.GET_LEVEL = "GET_LEVEL";
com.gamezhero.as3.remoting.events.RemotingLevelsEvent.GET_PAGE_AMOUNT = "GET_PAGE_AMOUNT";
flash.extendsClass("com.gamezhero.as3.remoting.events.RemotingLevelsEvent","egret.Event")
