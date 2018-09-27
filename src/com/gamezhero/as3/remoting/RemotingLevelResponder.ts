module com {
	export module gamezhero {
		export module as3 {
			export module remoting {
				export class RemotingLevelResponder extends flash.net.Responder {
					public func_res:Function;
					public name:string = null;
					public func_status:Function;

					public constructor(n:string,result:Function,status:Function = null)
					{
						super(flash.bind(this.method_263,this),flash.bind(this.method_281,this));
						this.name = n;
						this.func_res = result;
						this.func_status = status;
					}

					private method_263(value:any)
					{
					}

					private method_281(value:any)
					{
					}

				}
			}
		}
	}
}

flash.extendsClass("com.gamezhero.as3.remoting.RemotingLevelResponder","flash.net.Responder")
