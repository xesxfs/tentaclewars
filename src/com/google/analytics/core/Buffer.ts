module com {
	export module google {
		export module analytics {
			export module core {
				export class Buffer extends egret.HashObject {
					private _SO:flash.SharedObject;
					private _data:any;
					private _OBJ:any;
					private _utmb:com.google.analytics.data.UTMB;
					private _utmc:com.google.analytics.data.UTMC;
					private _utma:com.google.analytics.data.UTMA;
					private _debug:com.google.analytics.debug.DebugConfiguration;
					private _utmk:com.google.analytics.data.UTMK;
					private _config:com.google.analytics.v4.Configuration;
					private _utmv:com.google.analytics.data.UTMV;
					private _utmx:com.google.analytics.data.UTMX;
					private _utmz:com.google.analytics.data.UTMZ;
					private _volatile:boolean = false;

					public constructor(config:com.google.analytics.v4.Configuration,debug:com.google.analytics.debug.DebugConfiguration,volatile:boolean = false,data:any = null)
					{
						super();
						super();
						var prop:any = null;
						this._config = config;
						this._debug = debug;
						this._data = data;
						this._volatile = volatile;
						if(this._volatile)
						{
							this._OBJ = new Object();
							if(this._data)
							{
								for(prop in this._data)
								{
									this._OBJ[prop] = this._data[prop];
								}
							}
						}
					}

					public save()
					{
						var flushStatus:string = <any>null;
						if(<any>!this.isVolatile())
						{
							flushStatus = null;
							try 
							{
								flushStatus = this._SO.flush();
							}
							catch(e)
							{
								this._debug.warning("Error...Could not write SharedObject to disk");
							}
							switch(flushStatus)
							{
							case SharedObjectFlushStatus.PENDING :
								this._debug.info("Requesting permission to save object...");
								this._SO.addEventListener(NetStatusEvent.NET_STATUS,flash.bind(this._onFlushStatus,this),null);
								break;
							case SharedObjectFlushStatus.FLUSHED :
								this._debug.info("Value flushed to disk.");
							}
						}
					}

					public get utmv():com.google.analytics.data.UTMV
					{
						if(<any>!this.hasUTMV())
						{
							this._createUMTV();
						}
						return this._utmv;
					}

					public get utmx():com.google.analytics.data.UTMX
					{
						if(<any>!this.hasUTMX())
						{
							this._createUMTX();
						}
						return this._utmx;
					}

					public get utmz():com.google.analytics.data.UTMZ
					{
						if(<any>!this.hasUTMZ())
						{
							this._createUMTZ();
						}
						return this._utmz;
					}

					public hasUTMA():boolean
					{
						if(this._utma)
						{
							return true;
						}
						return false;
					}

					public hasUTMB():boolean
					{
						if(this._utmb)
						{
							return true;
						}
						return false;
					}

					public hasUTMC():boolean
					{
						if(this._utmc)
						{
							return true;
						}
						return false;
					}

					public clearCookies()
					{
						this.utma["reset"]();
						this.utmb["reset"]();
						this.utmc["reset"]();
						this.utmz["reset"]();
						this.utmv["reset"]();
						this.utmk["reset"]();
					}

					public resetCurrentSession()
					{
						this._clearUTMB();
						this._clearUTMC();
						this.save();
					}

					public hasUTMK():boolean
					{
						if(this._utmk)
						{
							return true;
						}
						return false;
					}

					public getLinkerUrl(targetUrl:string = "",useHash:boolean = false):string
					{
						var linkerParams:string = this.toLinkerParams();
						var formattedUrl:any = <any>targetUrl;
						var urlFields:Array<any> = targetUrl.split("#");
						if(linkerParams)
						{
							if(useHash)
							{
								if(1 >= urlFields.length)
								{
									formattedUrl = formattedUrl + ("#" + linkerParams);
								}
								else
								{
									formattedUrl = formattedUrl + ("&" + linkerParams);
								}
							}
							else if(1 >= urlFields.length)
							{
								if(targetUrl.indexOf("?") > -1)
								{
									formattedUrl = formattedUrl + "&";
								}
								else
								{
									formattedUrl = formattedUrl + "?";
								}
								formattedUrl = formattedUrl + linkerParams;
							}
							else
							{
								formattedUrl = urlFields[0];
								if(targetUrl.indexOf("?") > -1)
								{
									formattedUrl = formattedUrl + "&";
								}
								else
								{
									formattedUrl = formattedUrl + "?";
								}
								formattedUrl = formattedUrl + (linkerParams + "#" + urlFields[1]);
							}
						}
						return formattedUrl;
					}

					public generateCookiesHash():number
					{
						var value:string = "";
						value = value + this.utma.valueOf();
						value = value + this.utmb.valueOf();
						value = value + this.utmc.valueOf();
						value = value + this.utmx.valueOf();
						value = value + this.utmz.valueOf();
						value = value + this.utmv.valueOf();
						return com.google.analytics.core.Utils.generateHash(value);
					}

					private _createUMTA()
					{
						this._utma = new com.google.analytics.data.UTMA();
						this._utma.proxy = this;
					}

					private _createUMTB()
					{
						this._utmb = new com.google.analytics.data.UTMB();
						this._utmb.proxy = this;
					}

					private _createUMTC()
					{
						this._utmc = new com.google.analytics.data.UTMC();
					}

					public hasUTMV():boolean
					{
						if(this._utmv)
						{
							return true;
						}
						return false;
					}

					private _createUMTK()
					{
						this._utmk = new com.google.analytics.data.UTMK();
						this._utmk.proxy = this;
					}

					public hasUTMX():boolean
					{
						if(this._utmx)
						{
							return true;
						}
						return false;
					}

					public hasUTMZ():boolean
					{
						if(this._utmz)
						{
							return true;
						}
						return false;
					}

					private _createUMTV()
					{
						this._utmv = new com.google.analytics.data.UTMV();
						this._utmv.proxy = this;
					}

					private _createUMTX()
					{
						this._utmx = new com.google.analytics.data.UTMX();
						this._utmx.proxy = this;
					}

					private _createUMTZ()
					{
						this._utmz = new com.google.analytics.data.UTMZ();
						this._utmz.proxy = this;
					}

					public updateUTMA(timestamp:number)
					{
						if(this._debug.verbose)
						{
							this._debug.info("updateUTMA( " + timestamp + " )",com.google.analytics.debug.VisualDebugMode.advanced);
						}
						if(<any>!this.utma["isEmpty"]())
						{
							if(isNaN(this.utma["sessionCount"]))
							{
								this.utma["sessionCount"] = 1;
							}
							else
							{
								this.utma["sessionCount"] = this.utma["sessionCount"] + 1;
							}
							this.utma["lastTime"] = this.utma["currentTime"];
							this.utma["currentTime"] = timestamp;
						}
					}

					public isGenuine():boolean
					{
						if(<any>!this.hasUTMK())
						{
							return true;
						}
						return this.utmk["hash"] == this.generateCookiesHash();
					}

					private _onFlushStatus(event:flash.events.NetStatusEvent)
					{
						this._debug.info("User closed permission dialog...");
						switch(event["info"].code)
						{
						case "SharedObject.Flush.Success" :
							this._debug.info("User granted permission -- value saved.");
							break;
						case "SharedObject.Flush.Failed" :
							this._debug.info("User denied permission -- value not saved.");
						}
						this._SO.removeEventListener(NetStatusEvent.NET_STATUS,flash.bind(this._onFlushStatus,this),null);
					}

					public toLinkerParams():string
					{
						var output:string = "";
						output = output + this.utma["toURLString"]();
						output = output + ("&" + this.utmb["toURLString"]());
						output = output + ("&" + this.utmc["toURLString"]());
						output = output + ("&" + this.utmx["toURLString"]());
						output = output + ("&" + this.utmz["toURLString"]());
						output = output + ("&" + this.utmv["toURLString"]());
						output = output + ("&__utmk=" + this.generateCookiesHash());
						return output;
					}

					private _clearUTMA()
					{
						this._utma = null;
						if(<any>!this.isVolatile())
						{
							this._SO.data["utma"] = null;
							delete this._SO.data["utma"];
						}
					}

					private _clearUTMC()
					{
						this._utmc = null;
					}

					private _clearUTMB()
					{
						this._utmb = null;
						if(<any>!this.isVolatile())
						{
							this._SO.data["utmb"] = null;
							delete this._SO.data["utmb"];
						}
					}

					public update(name:string,value:any)
					{
						if(this.isVolatile())
						{
							this._OBJ[name] = value;
						}
						else
						{
							this._SO.data[name] = value;
						}
					}

					public createSO()
					{
						var saveSO:boolean = <any>false;
						com.google.analytics.data.UTMZ.defaultTimespan = this._config.conversionTimeout;
						com.google.analytics.data.UTMB.defaultTimespan = this._config.sessionTimeout;
						if(<any>!this._volatile)
						{
							try 
							{
								this._SO = flash.SharedObject.getLocal(this._config.cookieName,this._config.cookiePath);
							}
							catch(e)
							{
								if(this._debug.active)
								{
									this._debug.warning("Shared Object " + this._config.cookieName + " failed to be set\nreason: " + e.message);
								}
							}
							saveSO = false;
							if(this._SO.data["utma"])
							{
								if(<any>!this.hasUTMA())
								{
									this._createUMTA();
								}
								this._utma.fromSharedObject(this._SO.data["utma"]);
								if(this._debug.verbose)
								{
									this._debug.info("found: " + this._utma.toString(true),com.google.analytics.debug.VisualDebugMode.geek);
								}
								if(this._utma.isExpired())
								{
									if(this._debug.verbose)
									{
										this._debug.warning("UTMA has expired",com.google.analytics.debug.VisualDebugMode.advanced);
									}
									this._clearUTMA();
									saveSO = true;
								}
							}
							if(this._SO.data["utmb"])
							{
								if(<any>!this.hasUTMB())
								{
									this._createUMTB();
								}
								this._utmb.fromSharedObject(this._SO.data["utmb"]);
								if(this._debug.verbose)
								{
									this._debug.info("found: " + this._utmb.toString(true),com.google.analytics.debug.VisualDebugMode.geek);
								}
								if(this._utmb.isExpired())
								{
									if(this._debug.verbose)
									{
										this._debug.warning("UTMB has expired",com.google.analytics.debug.VisualDebugMode.advanced);
									}
									this._clearUTMB();
									saveSO = true;
								}
							}
							if(this._SO.data["utmc"])
							{
								delete this._SO.data["utmc"];
								saveSO = true;
							}
							if(this._SO.data["utmk"])
							{
								if(<any>!this.hasUTMK())
								{
									this._createUMTK();
								}
								this._utmk.fromSharedObject(this._SO.data["utmk"]);
								if(this._debug.verbose)
								{
									this._debug.info("found: " + this._utmk.toString(),com.google.analytics.debug.VisualDebugMode.geek);
								}
							}
							if(<any>!this.hasUTMX())
							{
								this._createUMTX();
							}
							if(this._SO.data["utmv"])
							{
								if(<any>!this.hasUTMV())
								{
									this._createUMTV();
								}
								this._utmv.fromSharedObject(this._SO.data["utmv"]);
								if(this._debug.verbose)
								{
									this._debug.info("found: " + this._utmv.toString(true),com.google.analytics.debug.VisualDebugMode.geek);
								}
								if(this._utmv.isExpired())
								{
									if(this._debug.verbose)
									{
										this._debug.warning("UTMV has expired",com.google.analytics.debug.VisualDebugMode.advanced);
									}
									this._clearUTMV();
									saveSO = true;
								}
							}
							if(this._SO.data["utmz"])
							{
								if(<any>!this.hasUTMZ())
								{
									this._createUMTZ();
								}
								this._utmz.fromSharedObject(this._SO.data["utmz"]);
								if(this._debug.verbose)
								{
									this._debug.info("found: " + this._utmz.toString(true),com.google.analytics.debug.VisualDebugMode.geek);
								}
								if(this._utmz.isExpired())
								{
									if(this._debug.verbose)
									{
										this._debug.warning("UTMZ has expired",com.google.analytics.debug.VisualDebugMode.advanced);
									}
									this._clearUTMZ();
									saveSO = true;
								}
							}
							if(saveSO)
							{
								this.save();
							}
						}
					}

					private _clearUTMZ()
					{
						this._utmz = null;
						if(<any>!this.isVolatile())
						{
							this._SO.data["utmz"] = null;
							delete this._SO.data["utmz"];
						}
					}

					private _clearUTMV()
					{
						this._utmv = null;
						if(<any>!this.isVolatile())
						{
							this._SO.data["utmv"] = null;
							delete this._SO.data["utmv"];
						}
					}

					public isVolatile():boolean
					{
						return this._volatile;
					}

					public get utma():com.google.analytics.data.UTMA
					{
						if(<any>!this.hasUTMA())
						{
							this._createUMTA();
						}
						return this._utma;
					}

					public get utmb():com.google.analytics.data.UTMB
					{
						if(<any>!this.hasUTMB())
						{
							this._createUMTB();
						}
						return this._utmb;
					}

					public get utmc():com.google.analytics.data.UTMC
					{
						if(<any>!this.hasUTMC())
						{
							this._createUMTC();
						}
						return this._utmc;
					}

					public get utmk():com.google.analytics.data.UTMK
					{
						if(<any>!this.hasUTMK())
						{
							this._createUMTK();
						}
						return this._utmk;
					}

				}
			}
		}
	}
}

