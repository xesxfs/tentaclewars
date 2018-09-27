module com {
	export module gamezhero {
		export module as3 {
			export module remoting {
				export class RemotingService extends flash.NetConnection {

					public constructor(url:string)
					{
						super();
						this["objectEncoding"] = flash.checkUint(ObjectEncoding.AMF3);
						this["connect"](url);
					}

				}
			}
		}
	}
}

flash.extendsClass("com.gamezhero.as3.remoting.RemotingService","flash.NetConnection")
