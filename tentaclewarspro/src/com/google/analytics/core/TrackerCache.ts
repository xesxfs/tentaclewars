module com {
	export module google {
		export module analytics {
			export module core {
				export class TrackerCache extends egret.HashObject implements com.google.analytics.v4.GoogleAnalyticsAPI {
					public static CACHE_THROW_ERROR:boolean = false;
					public tracker:com.google.analytics.v4.GoogleAnalyticsAPI;
					private _ar:Array<any>;

					public constructor(tracker:com.google.analytics.v4.GoogleAnalyticsAPI = null)
					{
						super();
						super();
						this.tracker = tracker;
						this._ar = [];
					}

					public size():number
					{
						return this._ar.length;
					}

					public flush()
					{
						var o:any = <any>null;
						var name:string = <any>null;
						var args:Array<any> = <any>null;
						var l:number = flash.checkInt(0);
						var i:number = flash.checkInt(0);
						if(this.tracker == null)
						{
							return ;
						}
						if(this.size() > 0)
						{
							for(l = flash.checkInt(this._ar.length); i < l; )
							{
								o = this._ar.shift();
								name = <string>o["name"];
								args = flash.As3As(o["args"],Array);
								if(name != null && name in this.tracker)
								{
									(flash.As3As(this.tracker[name],Function)).apply(this.tracker,args);
								}
								i++;
							}
						}
					}

					public enqueue(name:string,...args):boolean
					{
						if(name == null)
						{
							return false;
						}
						this._ar.push({"name":name,"args":args});
						return true;
					}

					public link(targetUrl:string,useHash:boolean = false)
					{
						this.enqueue("link",targetUrl,useHash);
					}

					public addOrganic(newOrganicEngine:string,newOrganicKeyword:string)
					{
						this.enqueue("addOrganic",newOrganicEngine,newOrganicKeyword);
					}

					public setAllowLinker(enable:boolean)
					{
						this.enqueue("setAllowLinker",enable);
					}

					public trackEvent(category:string,action:string,label:string = null,value:number = NaN):boolean
					{
						this.enqueue("trackEvent",category,action,label,value);
						return true;
					}

					public getLinkerUrl(url:string = "",useHash:boolean = false):string
					{
						if(com.google.analytics.core.TrackerCache.CACHE_THROW_ERROR)
						{
							throw new flash.IllegalOperationError("The tracker is not ready and you can use the \'getLinkerUrl\' method for the moment.").message;
						}
						return "";
					}

					public getClientInfo():boolean
					{
						if(com.google.analytics.core.TrackerCache.CACHE_THROW_ERROR)
						{
							throw new flash.IllegalOperationError("The tracker is not ready and you can use the \'getClientInfo\' method for the moment.").message;
						}
						return false;
					}

					public trackTrans()
					{
						this.enqueue("trackTrans");
					}

					public trackPageview(pageURL:string = "")
					{
						this.enqueue("trackPageview",pageURL);
					}

					public setClientInfo(enable:boolean)
					{
						this.enqueue("setClientInfo",enable);
					}

					public linkByPost(formObject:any,useHash:boolean = false)
					{
						this.enqueue("linkByPost",formObject,useHash);
					}

					public setCookieTimeout(newDefaultTimeout:number)
					{
						newDefaultTimeout = flash.checkInt(newDefaultTimeout);
						this.enqueue("setCookieTimeout",newDefaultTimeout);
					}

					public isEmpty():boolean
					{
						return this._ar.length == 0;
					}

					public getDetectTitle():boolean
					{
						if(com.google.analytics.core.TrackerCache.CACHE_THROW_ERROR)
						{
							throw new flash.IllegalOperationError("The tracker is not ready and you can use the \'getDetectTitle\' method for the moment.").message;
						}
						return false;
					}

					public resetSession()
					{
						this.enqueue("resetSession");
					}

					public setDetectFlash(enable:boolean)
					{
						this.enqueue("setDetectFlash",enable);
					}

					public clear()
					{
						this._ar = [];
					}

					public setCampNameKey(newCampNameKey:string)
					{
						this.enqueue("setCampNameKey",newCampNameKey);
					}

					public addItem(item:string,sku:string,name:string,category:string,price:number,quantity:number)
					{
						quantity = flash.checkInt(quantity);
						this.enqueue("addItem",item,sku,name,category,price,quantity);
					}

					public createEventTracker(objName:string):com.google.analytics.core.EventTracker
					{
						if(com.google.analytics.core.TrackerCache.CACHE_THROW_ERROR)
						{
							throw new flash.IllegalOperationError("The tracker is not ready and you can use the \'createEventTracker\' method for the moment.").message;
						}
						return null;
					}

					public clearIgnoredOrganic()
					{
						this.enqueue("clearIgnoredOrganic");
					}

					public setVar(newVal:string)
					{
						this.enqueue("setVar",newVal);
					}

					public setDomainName(newDomainName:string)
					{
						this.enqueue("setDomainName",newDomainName);
					}

					public setCampSourceKey(newCampSrcKey:string)
					{
						this.enqueue("setCampSourceKey",newCampSrcKey);
					}

					public addTrans(orderId:string,affiliation:string,total:number,tax:number,shipping:number,city:string,state:string,country:string)
					{
						if(com.google.analytics.core.TrackerCache.CACHE_THROW_ERROR)
						{
							throw new flash.IllegalOperationError("The tracker is not ready and you can use the \'addTrans\' method for the moment.").message;
						}
					}

					public setCampContentKey(newCampContentKey:string)
					{
						this.enqueue("setCampContentKey",newCampContentKey);
					}

					public setLocalServerMode()
					{
						this.enqueue("setLocalServerMode");
					}

					public getLocalGifPath():string
					{
						if(com.google.analytics.core.TrackerCache.CACHE_THROW_ERROR)
						{
							throw new flash.IllegalOperationError("The tracker is not ready and you can use the \'getLocalGifPath\' method for the moment.").message;
						}
						return "";
					}

					public setAllowAnchor(enable:boolean)
					{
						this.enqueue("setAllowAnchor",enable);
					}

					public clearIgnoredRef()
					{
						this.enqueue("clearIgnoredRef");
					}

					public setLocalGifPath(newLocalGifPath:string)
					{
						this.enqueue("setLocalGifPath",newLocalGifPath);
					}

					public getVersion():string
					{
						if(com.google.analytics.core.TrackerCache.CACHE_THROW_ERROR)
						{
							throw new flash.IllegalOperationError("The tracker is not ready and you can use the \'getVersion\' method for the moment.").message;
						}
						return "";
					}

					public setCookiePath(newCookiePath:string)
					{
						this.enqueue("setCookiePath",newCookiePath);
					}

					public setSampleRate(newRate:number)
					{
						this.enqueue("setSampleRate",newRate);
					}

					public setDetectTitle(enable:boolean)
					{
						this.enqueue("setDetectTitle",enable);
					}

					public setAllowHash(enable:boolean)
					{
						this.enqueue("setAllowHash",enable);
					}

					public addIgnoredOrganic(newIgnoredOrganicKeyword:string)
					{
						this.enqueue("addIgnoredOrganic",newIgnoredOrganicKeyword);
					}

					public setCampNOKey(newCampNOKey:string)
					{
						this.enqueue("setCampNOKey",newCampNOKey);
					}

					public getServiceMode():com.google.analytics.core.ServerOperationMode
					{
						if(com.google.analytics.core.TrackerCache.CACHE_THROW_ERROR)
						{
							throw new flash.IllegalOperationError("The tracker is not ready and you can use the \'getServiceMode\' method for the moment.").message;
						}
						return null;
					}

					public setLocalRemoteServerMode()
					{
						this.enqueue("setLocalRemoteServerMode");
					}

					public cookiePathCopy(newPath:string)
					{
						this.enqueue("cookiePathCopy",newPath);
					}

					public getDetectFlash():boolean
					{
						if(com.google.analytics.core.TrackerCache.CACHE_THROW_ERROR)
						{
							throw new flash.IllegalOperationError("The tracker is not ready and you can use the \'getDetectFlash\' method for the moment.").message;
						}
						return false;
					}

					public setCampaignTrack(enable:boolean)
					{
						this.enqueue("setCampaignTrack",enable);
					}

					public clearOrganic()
					{
						this.enqueue("clearOrganic");
					}

					public setCampTermKey(newCampTermKey:string)
					{
						this.enqueue("setCampTermKey",newCampTermKey);
					}

					public addIgnoredRef(newIgnoredReferrer:string)
					{
						this.enqueue("addIgnoredRef",newIgnoredReferrer);
					}

					public setCampMediumKey(newCampMedKey:string)
					{
						this.enqueue("setCampMediumKey",newCampMedKey);
					}

					public setSessionTimeout(newTimeout:number)
					{
						newTimeout = flash.checkInt(newTimeout);
						this.enqueue("setSessionTimeout",newTimeout);
					}

					public setRemoteServerMode()
					{
						this.enqueue("setRemoteServerMode");
					}

					public element():any
					{
						return this._ar[0];
					}

					public getAccount():string
					{
						if(com.google.analytics.core.TrackerCache.CACHE_THROW_ERROR)
						{
							throw new flash.IllegalOperationError("The tracker is not ready and you can use the \'getAccount\' method for the moment.").message;
						}
						return "";
					}

				}
			}
		}
	}
}

flash.implementsClass("com.google.analytics.core.TrackerCache",["com.google.analytics.v4.GoogleAnalyticsAPI"]);