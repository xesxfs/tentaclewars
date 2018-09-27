module com {
	export module gamezhero {
		export module api {
			export module as3 {
				export module events {
					export class GamePreloaderEvent extends egret.Event {
						public static FINISH:string;
						public static PARAMS:string;
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
							return _self__.formatToString("GamePreloaderEvent");
						}

					}
				}
			}
		}
	}
}

com.gamezhero.api.as3.events.GamePreloaderEvent.FINISH = "PRELOAD_COMPLETE";
com.gamezhero.api.as3.events.GamePreloaderEvent.PARAMS = "PARAMS_COMPLETE";
flash.extendsClass("com.gamezhero.api.as3.events.GamePreloaderEvent","egret.Event")
