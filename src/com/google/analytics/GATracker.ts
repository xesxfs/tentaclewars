module com {
	export module google {
		export module analytics {
			export class GATracker extends egret.HashObject implements com.google.analytics.AnalyticsTracker {
				public static version:com.google.analytics.utils.Version;
				public static autobuild:boolean;
				private _adSense:com.google.analytics.external.AdSenseGlobals;
				private _env:com.google.analytics.utils.Environment;
				private _visualDebug:boolean = false;
				private _idleTimer:com.google.analytics.core.IdleTimer;
				private _debug:com.google.analytics.debug.DebugConfiguration;
				private _buffer:com.google.analytics.core.Buffer;
				private _config:com.google.analytics.v4.Configuration;
				private _mode:string;
				private _display:egret.DisplayObject;
				private _jsproxy:com.google.analytics.external.JavascriptProxy;
				private _dom:com.google.analytics.external.HTMLDOM;
				private _eventDispatcher:egret.EventDispatcher;
				private _ready:boolean = false;
				private _gifRequest:com.google.analytics.core.GIFRequest;
				private _ecom:com.google.analytics.core.Ecommerce;
				private _account:string;
				private _tracker:com.google.analytics.v4.GoogleAnalyticsAPI;

				public constructor(display:egret.DisplayObject,account:string,mode:string = "AS3",visualDebug:boolean = false,config:com.google.analytics.v4.Configuration = null,debug:com.google.analytics.debug.DebugConfiguration = null)
				{
					super();
					super();
					this._display = display;
					this._eventDispatcher = new egret.EventDispatcher(<any>this);
					this._tracker = new com.google.analytics.core.TrackerCache();
					this.account = account;
					this.mode = mode;
					this.visualDebug = visualDebug;
					if(<any>!debug)
					{
						this.debug = new com.google.analytics.debug.DebugConfiguration();
					}
					if(<any>!config)
					{
						this.config = new com.google.analytics.v4.Configuration(debug);
					}
					if(com.google.analytics.GATracker.autobuild)
					{
						this._factory();
					}
				}

				public link(targetUrl:string,useHash:boolean = false)
				{
					this._tracker.link(targetUrl,useHash);
				}

				public addOrganic(newOrganicEngine:string,newOrganicKeyword:string)
				{
					this._tracker.addOrganic(newOrganicEngine,newOrganicKeyword);
				}

				public setAllowLinker(enable:boolean)
				{
					this._tracker.setAllowLinker(enable);
				}

				public trackEvent(category:string,action:string,label:string = null,value:number = NaN):boolean
				{
					var b:boolean = <any>false;
					try 
					{
						b = this._tracker.trackEvent(category,action,label,value);
					}
					catch(e)
					{
						b = false;
					}
					return b;
				}

				public getLinkerUrl(url:string = "",useHash:boolean = false):string
				{
					return this._tracker.getLinkerUrl(url,useHash);
				}

				public setCookieTimeout(newDefaultTimeout:number)
				{
					newDefaultTimeout = flash.checkInt(newDefaultTimeout);
					this._tracker.setCookieTimeout(newDefaultTimeout);
				}

				public trackTrans()
				{
					this._tracker.trackTrans();
				}

				public getClientInfo():boolean
				{
					return this._tracker.getClientInfo();
				}

				public trackPageview(pageURL:string = "")
				{
					this._tracker.trackPageview(pageURL);
				}

				public setClientInfo(enable:boolean)
				{
					this._tracker.setClientInfo(enable);
				}

				public get account():string
				{
					return this._account;
				}

				public linkByPost(formObject:any,useHash:boolean = false)
				{
					this._tracker.linkByPost(formObject,useHash);
				}

				public getDetectTitle():boolean
				{
					return this._tracker.getDetectTitle();
				}

				public dispatchEvent(event:egret.Event):boolean
				{
					return this._eventDispatcher.dispatchEvent(event);
				}

				public get config():com.google.analytics.v4.Configuration
				{
					return this._config;
				}

				public set mode(value:string)
				{
					this._mode = value;
				}

				public removeEventListener(type:string,listener:Function,thisObject:any,useCapture:boolean = false)
				{
					this._eventDispatcher.removeEventListener(type,listener,null,useCapture);
				}

				public setDetectFlash(enable:boolean)
				{
					this._tracker.setDetectFlash(enable);
				}

				public resetSession()
				{
					this._tracker.resetSession();
				}

				public setCampNameKey(newCampNameKey:string)
				{
					this._tracker.setCampNameKey(newCampNameKey);
				}

				public get debug():com.google.analytics.debug.DebugConfiguration
				{
					return this._debug;
				}

				public addItem(item:string,sku:string,name:string,category:string,price:number,quantity:number)
				{
					quantity = flash.checkInt(quantity);
					this._tracker.addItem(item,sku,name,category,price,quantity);
				}

				private _bridgeFactory():com.google.analytics.v4.GoogleAnalyticsAPI
				{
					this.debug["info"]("GATracker (Bridge) v" + com.google.analytics.GATracker.version + "\naccount: " + this.account);
					return new Bridge(this.account,this._debug,this._jsproxy);
				}

				public clearIgnoredOrganic()
				{
					this._tracker.clearIgnoredOrganic();
				}

				public set account(value:string)
				{
					this._account = value;
				}

				public setVar(newVal:string)
				{
					this._tracker.setVar(newVal);
				}

				public build()
				{
					if(<any>!this.isReady())
					{
						this._factory();
					}
				}

				public addEventListener(type:string,listener:Function,thisObject:any,useCapture:boolean = false,priority:number = 0,useWeakReference:boolean = false)
				{
					this._eventDispatcher.addEventListener(type,listener,null,useCapture,priority);
				}

				public setDomainName(newDomainName:string)
				{
					this._tracker.setDomainName(newDomainName);
				}

				public createEventTracker(objName:string):com.google.analytics.core.EventTracker
				{
					return this._tracker.createEventTracker(objName);
				}

				public setCampSourceKey(newCampSrcKey:string)
				{
					this._tracker.setCampSourceKey(newCampSrcKey);
				}

				public set config(value:com.google.analytics.v4.Configuration)
				{
					this._config = value;
				}

				public addTrans(orderId:string,affiliation:string,total:number,tax:number,shipping:number,city:string,state:string,country:string)
				{
					this._tracker.addTrans(orderId,affiliation,total,tax,shipping,city,state,country);
				}

				public setCampContentKey(newCampContentKey:string)
				{
					this._tracker.setCampContentKey(newCampContentKey);
				}

				public willTrigger(type:string):boolean
				{
					return this._eventDispatcher.willTrigger(type);
				}

				public setLocalServerMode()
				{
					this._tracker.setLocalServerMode();
				}

				public isReady():boolean
				{
					return this._ready;
				}

				public getLocalGifPath():string
				{
					return this._tracker.getLocalGifPath();
				}

				public setAllowAnchor(enable:boolean)
				{
					this._tracker.setAllowAnchor(enable);
				}

				public clearIgnoredRef()
				{
					this._tracker.clearIgnoredRef();
				}

				public get mode():string
				{
					return this._mode;
				}

				public set debug(value:com.google.analytics.debug.DebugConfiguration)
				{
					this._debug = value;
				}

				public setLocalGifPath(newLocalGifPath:string)
				{
					this._tracker.setLocalGifPath(newLocalGifPath);
				}

				public getVersion():string
				{
					return this._tracker.getVersion();
				}

				public setSampleRate(newRate:number)
				{
					this._tracker.setSampleRate(newRate);
				}

				public setCookiePath(newCookiePath:string)
				{
					this._tracker.setCookiePath(newCookiePath);
				}

				public setAllowHash(enable:boolean)
				{
					this._tracker.setAllowHash(enable);
				}

				public addIgnoredOrganic(newIgnoredOrganicKeyword:string)
				{
					this._tracker.addIgnoredOrganic(newIgnoredOrganicKeyword);
				}

				public setLocalRemoteServerMode()
				{
					this._tracker.setLocalRemoteServerMode();
				}

				public cookiePathCopy(newPath:string)
				{
					this._tracker.cookiePathCopy(newPath);
				}

				private _factory()
				{
					var activeTracker:com.google.analytics.v4.GoogleAnalyticsAPI = <any>null;
					this._jsproxy = new JavascriptProxy(this.debug);
					if(this.visualDebug)
					{
						this.debug["layout"] = new com.google.analytics.debug.Layout(this.debug,this._display);
						this.debug["active"] = this.visualDebug;
					}
					var cache:com.google.analytics.core.TrackerCache = flash.As3As(this._tracker,com.google.analytics.core.TrackerCache);
					switch(this.mode)
					{
					case com.google.analytics.core.TrackerMode.BRIDGE :
						activeTracker = this._bridgeFactory();
						break;
					case com.google.analytics.core.TrackerMode.AS3 :
					default :
						activeTracker = this._trackerFactory();
					}
					if(<any>!cache.isEmpty())
					{
						cache.tracker = activeTracker;
						cache.flush();
					}
					this._tracker = activeTracker;
					this._ready = true;
					this.dispatchEvent(new com.google.analytics.events.AnalyticsEvent(com.google.analytics.events.AnalyticsEvent.READY,this));
				}

				public setCampTermKey(newCampTermKey:string)
				{
					this._tracker.setCampTermKey(newCampTermKey);
				}

				private _trackerFactory():com.google.analytics.v4.GoogleAnalyticsAPI
				{
					this.debug["info"]("GATracker (AS3) v" + com.google.analytics.GATracker.version + "\naccount: " + this.account);
					this._adSense = new AdSenseGlobals(this.debug);
					this._dom = new HTMLDOM(this.debug);
					this._dom["cacheProperties"]();
					this._env = new com.google.analytics.utils.Environment("","","",this.debug,this._dom);
					this._buffer = new com.google.analytics.core.Buffer(this.config,this.debug,false);
					this._gifRequest = new com.google.analytics.core.GIFRequest(this.config,this.debug,this._buffer,this._env);
					this._idleTimer = new com.google.analytics.core.IdleTimer(this.config,this.debug,this._display,this._buffer);
					this._ecom = new com.google.analytics.core.Ecommerce(this._debug);
					this._env.url = this._display.stage["loaderInfo"].url;
					return new com.google.analytics.v4.Tracker(this.account,this.config,this.debug,this._env,this._buffer,this._gifRequest,this._adSense,this._ecom);
				}

				public setCampNOKey(newCampNOKey:string)
				{
					this._tracker.setCampNOKey(newCampNOKey);
				}

				public setDetectTitle(enable:boolean)
				{
					this._tracker.setDetectTitle(enable);
				}

				public clearOrganic()
				{
					this._tracker.clearOrganic();
				}

				public setCampaignTrack(enable:boolean)
				{
					this._tracker.setCampaignTrack(enable);
				}

				public addIgnoredRef(newIgnoredReferrer:string)
				{
					this._tracker.addIgnoredRef(newIgnoredReferrer);
				}

				public getServiceMode():com.google.analytics.core.ServerOperationMode
				{
					return this._tracker.getServiceMode();
				}

				public set visualDebug(value:boolean)
				{
					this._visualDebug = value;
				}

				public setCampMediumKey(newCampMedKey:string)
				{
					this._tracker.setCampMediumKey(newCampMedKey);
				}

				public getDetectFlash():boolean
				{
					return this._tracker.getDetectFlash();
				}

				public get visualDebug():boolean
				{
					return this._visualDebug;
				}

				public hasEventListener(type:string):boolean
				{
					return this._eventDispatcher.hasEventListener(type);
				}

				public getAccount():string
				{
					return this._tracker.getAccount();
				}

				public setSessionTimeout(newTimeout:number)
				{
					newTimeout = flash.checkInt(newTimeout);
					this._tracker.setSessionTimeout(newTimeout);
				}

				public setRemoteServerMode()
				{
					this._tracker.setRemoteServerMode();
				}

			}
		}
	}
}

com.google.analytics.GATracker.version = com.google.analytics.API.version;
com.google.analytics.GATracker.autobuild = true;
flash.implementsClass("com.google.analytics.GATracker",["com.google.analytics.AnalyticsTracker"]);