module com {
	export module newgrounds {
		export class Bridge extends egret.HashObject {
			private var_319:flash.LocalConnection;
			private var_164:flash.LocalConnection;
			private var_232:string;

			public constructor(id:string)
			{
				super();
				super();
				this.var_232 = id;
				this.var_319 = new flash.LocalConnection();
				this.var_164 = new flash.LocalConnection();
				this.var_319.client = this;
				this.var_319["connect"]("rec_" + this.var_232);
				this.var_164["addEventListener"](StatusEvent.STATUS,flash.bind(this.method_283,this));
			}

			public sendCommand(command:string,parameters:any)
			{
				if(this.var_164)
				{
					this.var_164["send"](this.var_232,"sendCommand",command,this.scrubParameters(parameters));
				}
			}

			public sendEvent(command:string,parameters:any)
			{
				if(this.var_164)
				{
					this.var_164["send"](this.var_232,"sendEvent",command,this.scrubParameters(parameters));
				}
			}

			public receiveEvent(event:string,parameters:any)
			{
				API.callListener(event,parameters["success"],parameters["data"]);
			}

			public scrubParameters(parameters:any):any
			{
				var key:any = null;
				var outParameters:any = new Object();
				for(key in parameters)
				{
					if(flash.As3is(parameters[key],"string") || flash.As3is(parameters[key],"number") || flash.As3is(parameters[key],"number") || flash.As3is(parameters[key],"number") || flash.As3is(parameters[key],"boolean"))
					{
						outParameters[key] = parameters[key];
					}
				}
				return outParameters;
			}

			private method_283(event:egret.Event)
			{
			}

		}
	}
}

