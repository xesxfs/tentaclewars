module com {
	export module google {
		export module analytics {
			export module debug {
				export class AlertAction extends egret.HashObject {
					public container:com.google.analytics.debug.Alert;
					private _callback:any;
					public activator:string;
					public name:string;

					public constructor(name:string,activator:string,callback:any)
					{
						super();
						super();
						this.name = name;
						this.activator = activator;
						this._callback = callback;
					}

					public execute()
					{
						if(this._callback)
						{
							if(flash.As3is(this._callback,Function))
							{
								(flash.As3As(this._callback,Function))();
							}
							else if(flash.As3is(this._callback,"string"))
							{
								this.container[this._callback]();
							}
						}
					}

				}
			}
		}
	}
}

