module com {
	export module gamezhero {
		export module as3 {
			export module remoting {
				export class RemotingEventDispatcher extends egret.EventDispatcher {

					public constructor(target:any = null)
					{
						super();
					}

				}
			}
		}
	}
}

flash.extendsClass("com.gamezhero.as3.remoting.RemotingEventDispatcher","egret.EventDispatcher")
