module com {
	export module google {
		export module analytics {
			export module debug {
				export class DebugConfiguration extends egret.HashObject {
					public showHideKey:number = 32.0;
					private _mode:com.google.analytics.debug.VisualDebugMode;
					private _verbose:boolean = false;
					public destroyKey:number = 8.0;
					public GIFRequests:boolean = false;
					public showInfos:boolean = true;
					public infoTimeout:number = 1000;
					public minimizedOnStart:boolean = false;
					private _active:boolean = false;
					public traceOutput:boolean = false;
					public layout:com.google.analytics.debug.ILayout;
					public warningTimeout:number = 1500;
					public javascript:boolean = false;
					public showWarnings:boolean = true;
					private _visualInitialized:boolean = false;

					public constructor()
					{
						super();
						super();
						this._mode = com.google.analytics.debug.VisualDebugMode.basic;
					}

					public get verbose():boolean
					{
						return this._verbose;
					}

					public set verbose(value:boolean)
					{
						this._verbose = value;
					}

					public set mode(value:any)
					{
						if(flash.As3is(value,"string"))
						{
							switch(value)
							{
							case "geek" :
								value = com.google.analytics.debug.VisualDebugMode.geek;
								break;
							case "advanced" :
								value = com.google.analytics.debug.VisualDebugMode.advanced;
								break;
							default :
							case "basic" :
								value = com.google.analytics.debug.VisualDebugMode.basic;
							}
						}
						this._mode = value;
					}

					public success(message:string)
					{
						if(this.layout)
						{
							this.layout.createSuccessAlert(message);
						}
						if(this.traceOutput)
						{
							this.trace("[+] " + message + " !!");
						}
					}

					public get active():boolean
					{
						return this._active;
					}

					private _initializeVisual()
					{
						if(this.layout)
						{
							this.layout.init();
							this._visualInitialized = true;
						}
					}

					private _destroyVisual()
					{
						if(this.layout && this._visualInitialized)
						{
							this.layout.destroy();
						}
					}

					public warning(message:string,mode:com.google.analytics.debug.VisualDebugMode = null)
					{
						if(this._filter(mode))
						{
							return ;
						}
						if(this.layout && this.showWarnings)
						{
							this.layout.createWarning(message);
						}
						if(this.traceOutput)
						{
							this.trace("## " + message + " ##");
						}
					}

					private _filter(mode:com.google.analytics.debug.VisualDebugMode = null):boolean
					{
						return mode && flash.tranint(mode) >= flash.tranint(this.mode);
					}

					public failure(message:string)
					{
						if(this.layout)
						{
							this.layout.createFailureAlert(message);
						}
						if(this.traceOutput)
						{
							this.trace("[-] " + message + " !!");
						}
					}

					public get mode():any
					{
						return this._mode;
					}

					public set active(value:boolean)
					{
						this._active = value;
						if(this._active)
						{
							this._initializeVisual();
						}
						else
						{
							this._destroyVisual();
						}
					}

					protected trace(message:string)
					{
						var msgs:Array<any> = <any>null;
						var j:number = flash.checkInt(0);
						var messages:Array<any> = [];
						var pre0:any = <any>"";
						var pre1:any = <any>"";
						if(this.mode == com.google.analytics.debug.VisualDebugMode.geek)
						{
							pre0 = egret.getTimer() + " - ";
							pre1 = new Array(pre0.length).join(" ") + " ";
						}
						if(message.indexOf("\n") > -1)
						{
							msgs = message.split("\n");
							for(j = flash.checkInt(0); j < msgs.length; j++)
							{
								if(msgs[j] != "")
								{
									if(j == 0)
									{
										messages.push(pre0 + msgs[j]);
									}
									else
									{
										messages.push(pre1 + msgs[j]);
									}
								}
							}
						}
						else
						{
							messages.push(pre0 + message);
						}
						var len:number = flash.checkInt(messages.length);
						for(var i:number = flash.checkInt(0);i < len; i++)
						{
							this.trace(messages[i]);
						}
					}

					public alert(message:string)
					{
						if(this.layout)
						{
							this.layout.createAlert(message);
						}
						if(this.traceOutput)
						{
							this.trace("!! " + message + " !!");
						}
					}

					public info(message:string,mode:com.google.analytics.debug.VisualDebugMode = null)
					{
						if(this._filter(mode))
						{
							return ;
						}
						if(this.layout && this.showInfos)
						{
							this.layout.createInfo(message);
						}
						if(this.traceOutput)
						{
							this.trace(message);
						}
					}

					public alertGifRequest(message:string,request:egret.URLRequest,ref:com.google.analytics.core.GIFRequest)
					{
						if(this.layout)
						{
							this.layout.createGIFRequestAlert(message,request,ref);
						}
						if(this.traceOutput)
						{
							this.trace(">> " + message + " <<");
						}
					}

				}
			}
		}
	}
}

