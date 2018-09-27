module com {
	export module google {
		export module analytics {
			export module core {
				export class GIFRequest extends egret.HashObject {
					private _info:com.google.analytics.utils.Environment;
					private _count:number = 0;
					private _utmac:string;
					private _alertcount:number = 0;
					private _debug:com.google.analytics.debug.DebugConfiguration;
					private _lastRequest:egret.URLRequest;
					private _buffer:com.google.analytics.core.Buffer;
					private _config:com.google.analytics.v4.Configuration;
					private _requests:Array<any>;

					public constructor(config:com.google.analytics.v4.Configuration,debug:com.google.analytics.debug.DebugConfiguration,buffer:com.google.analytics.core.Buffer,info:com.google.analytics.utils.Environment)
					{
						super();
						super();
						this._config = config;
						this._debug = debug;
						this._buffer = buffer;
						this._info = info;
						this._count = flash.checkInt(0);
						this._alertcount = flash.checkInt(0);
						this._requests = [];
					}

					public get utmn():string
					{
						return <string>com.google.analytics.core.Utils.generate32bitRandom();
					}

					public onIOError(event:flash.IOErrorEvent)
					{
						var url:string = this._lastRequest.url;
						var id:string = String(this._requests.length - 1);
						var msg:any = <any>"Gif Request #" + id + " failed";
						if(this._debug.GIFRequests)
						{
							if(<any>!this._debug.verbose)
							{
								if(url.indexOf("?") > -1)
								{
									url = url.split("?")[0];
								}
								url = this._shortenURL(url);
							}
							if(flash.tranint(this._debug.mode) > flash.tranint(com.google.analytics.debug.VisualDebugMode.basic))
							{
								msg = msg + (" \"" + url + "\" does not exists or is unreachable");
							}
							this._debug.failure(msg);
						}
						else
						{
							this._debug.warning(msg);
						}
						this._removeListeners(event.target);
					}

					public send(account:string,variables:com.google.analytics.utils.Variables = null,force:boolean = false,rateLimit:boolean = false)
					{
						var localPath:string = <any>null;
						var localImage:egret.URLRequest = <any>null;
						var remoteImage:egret.URLRequest = <any>null;
						this._utmac = account;
						if(<any>!variables)
						{
							variables = new com.google.analytics.utils.Variables();
						}
						variables.URIencode = false;
						variables.pre = ["utmwv","utmn","utmhn","utmt","utme","utmcs","utmsr","utmsc","utmul","utmje","utmfl","utmdt","utmhid","utmr","utmp"];
						variables.post = ["utmcc"];
						if(this._debug.verbose)
						{
							this._debug.info("tracking: " + this._buffer.utmb["trackCount"] + "/" + this._config.trackingLimitPerSession,com.google.analytics.debug.VisualDebugMode.geek);
						}
						if(this._buffer.utmb["trackCount"] < this._config.trackingLimitPerSession || force)
						{
							if(rateLimit)
							{
								this.updateToken();
							}
							if(force || <any>!rateLimit || this._buffer.utmb["token"] >= 1)
							{
								if(<any>!force && rateLimit)
								{
									this._buffer.utmb["token"] = this._buffer.utmb["token"] - 1;
								}
								this._buffer.utmb["trackCount"] = this._buffer.utmb["trackCount"] + 1;
								if(this._debug.verbose)
								{
									this._debug.info(this._buffer.utmb.toString(),com.google.analytics.debug.VisualDebugMode.geek);
								}
								variables["utmwv"] = this.utmwv;
								variables["utmn"] = com.google.analytics.core.Utils.generate32bitRandom();
								if(this._info.domainName != "")
								{
									variables["utmhn"] = this._info.domainName;
								}
								if(this._config.sampleRate < 1)
								{
									variables["utmsp"] = this._config.sampleRate * 100;
								}
								if(this._config.serverMode == com.google.analytics.core.ServerOperationMode.local || this._config.serverMode == com.google.analytics.core.ServerOperationMode.both)
								{
									localPath = this._info.locationSWFPath;
									if(localPath.lastIndexOf("/") > 0)
									{
										localPath = localPath.substring(0,localPath.lastIndexOf("/"));
									}
									localImage = new egret.URLRequest();
									if(this._config.localGIFpath.indexOf("http") == 0)
									{
										localImage.url = this._config.localGIFpath;
									}
									else
									{
										localImage.url = localPath + this._config.localGIFpath;
									}
									localImage.url = localImage.url + ("?" + variables.toString());
									if(this._debug.active && this._debug.GIFRequests)
									{
										this._debugSend(localImage);
									}
									else
									{
										this.sendRequest(localImage);
									}
								}
								if(this._config.serverMode == com.google.analytics.core.ServerOperationMode.remote || this._config.serverMode == com.google.analytics.core.ServerOperationMode.both)
								{
									remoteImage = new egret.URLRequest();
									if(this._info.protocol == com.google.analytics.utils.Protocols.HTTPS)
									{
										remoteImage.url = this._config.secureRemoteGIFpath;
									}
									else if(this._info.protocol == com.google.analytics.utils.Protocols.HTTP)
									{
										remoteImage.url = this._config.remoteGIFpath;
									}
									else
									{
										remoteImage.url = this._config.remoteGIFpath;
									}
									variables["utmac"] = this.utmac;
									variables["utmcc"] = encodeURIComponent(this.utmcc);
									remoteImage.url = remoteImage.url + ("?" + variables.toString());
									if(this._debug.active && this._debug.GIFRequests)
									{
										this._debugSend(remoteImage);
									}
									else
									{
										this.sendRequest(remoteImage);
									}
								}
							}
						}
					}

					public onSecurityError(event:flash.SecurityErrorEvent)
					{
						if(this._debug.GIFRequests)
						{
							this._debug.failure(event["text"]);
						}
					}

					public get utmsp():string
					{
						return <string>this._config.sampleRate * 100;
					}

					public get utmcc():string
					{
						var cookies:Array<any> = [];
						if(this._buffer.hasUTMA())
						{
							cookies.push(this._buffer.utma["toURLString"]() + ";");
						}
						if(this._buffer.hasUTMZ())
						{
							cookies.push(this._buffer.utmz["toURLString"]() + ";");
						}
						if(this._buffer.hasUTMV())
						{
							cookies.push(this._buffer.utmv["toURLString"]() + ";");
						}
						return cookies.join("+");
					}

					public get utmac():string
					{
						return this._utmac;
					}

					public get utmwv():string
					{
						return this._config.version;
					}

					public sendRequest(request:egret.URLRequest)
					{
						var loader:flash.Loader = new flash.Loader();
						loader.name = String(this._count++);
						var context:flash.LoaderContext = new flash.LoaderContext(false);
						loader.contentLoaderInfo.addEventListener(egret.IOErrorEvent.IO_ERROR,flash.bind(this.onIOError,this),null);
						loader.contentLoaderInfo.addEventListener(egret.Event.COMPLETE,flash.bind(this.onComplete,this),null);
						this._lastRequest = request;
						this._requests[loader.name] = new com.google.analytics.core.RequestObject(request);
						try 
						{
							loader.load(request,context);
							return ;
						}
						catch(e)
						{
							this._debug.failure("\"Loader.load()\" could not instanciate Gif Request");
							return ;
						}
					}

					private _removeListeners(target:any)
					{
						target["removeEventListener"](egret.IOErrorEvent.IO_ERROR,flash.bind(this.onIOError,this));
						target["removeEventListener"](egret.Event.COMPLETE,flash.bind(this.onComplete,this));
					}

					public updateToken()
					{
						var tokenDelta:number = <any>NaN;
						var timestamp:number = new flash.As3Date().getTime();
						tokenDelta = (timestamp - this._buffer.utmb["lastTime"]) * (this._config.tokenRate / 1000);
						if(this._debug.verbose)
						{
							this._debug.info("tokenDelta: " + tokenDelta,com.google.analytics.debug.VisualDebugMode.geek);
						}
						if(tokenDelta >= 1)
						{
							this._buffer.utmb["token"] = Math.min(Math.floor(this._buffer.utmb["token"] + tokenDelta),this._config.bucketCapacity);
							this._buffer.utmb["lastTime"] = timestamp;
							if(this._debug.verbose)
							{
								this._debug.info(this._buffer.utmb.toString(),com.google.analytics.debug.VisualDebugMode.geek);
							}
						}
					}

					public get utmhn():string
					{
						return this._info.domainName;
					}

					private _shortenURL(url:string):string
					{
						var paths:Array<any> = <any>null;
						if(url.length > 60)
						{
							for(paths = url.split("/"); url.length > 60; )
							{
								paths.shift();
								url = "../" + paths.join("/");
							}
						}
						return url;
					}

					private _debugSend(request:egret.URLRequest)
					{
						var url:string = <any>null;
						var data:any = <any>"";
						switch(this._debug.mode)
						{
						case com.google.analytics.debug.VisualDebugMode.geek :
							data = "Gif Request #" + this._alertcount + ":\n" + request.url;
							break;
						case com.google.analytics.debug.VisualDebugMode.advanced :
							url = request.url;
							if(url.indexOf("?") > -1)
							{
								url = url.split("?")[0];
							}
							url = this._shortenURL(url);
							data = "Send Gif Request #" + this._alertcount + ":\n" + url + " ?";
							break;
						case com.google.analytics.debug.VisualDebugMode.basic :
						default :
							data = "Send " + this._config.serverMode.toString() + " Gif Request #" + this._alertcount + " ?";
						}
						this._debug.alertGifRequest(data,request,this);
						this._alertcount++;
					}

					public onComplete(event:egret.Event)
					{
						var id:string = <any>event.target["loader"].name;
						this._requests[id].complete();
						var msg:any = <any>"Gif Request #" + id + " sent";
						var url:string = <any>this._requests[id].request.url;
						if(this._debug.GIFRequests)
						{
							if(<any>!this._debug.verbose)
							{
								if(url.indexOf("?") > -1)
								{
									url = url.split("?")[0];
								}
								url = this._shortenURL(url);
							}
							if(flash.tranint(this._debug.mode) > flash.tranint(com.google.analytics.debug.VisualDebugMode.basic))
							{
								msg = msg + (" to \"" + url + "\"");
							}
							this._debug.success(msg);
						}
						else
						{
							this._debug.info(msg);
						}
						this._removeListeners(event.target);
					}

				}
			}
		}
	}
}

