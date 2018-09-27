module com {
	export module google {
		export module analytics {
			export module v4 {
				export interface GoogleAnalyticsAPI {
					setCampSourceKey(param1:string);
					setDetectTitle(param1:boolean);
					setLocalRemoteServerMode();
					resetSession();
					setLocalServerMode();
					setCampContentKey(param1:string);
					addOrganic(param1:string,param2:string);
					setDetectFlash(param1:boolean);
					setAllowLinker(param1:boolean);
					trackEvent(param1:string,param2:string,param3?:string,param4?:number):boolean;
					setCampTermKey(param1:string);
					setCampNameKey(param1:string);
					getLinkerUrl(param1?:string,param2?:boolean):string;
					addItem(param1:string,param2:string,param3:string,param4:string,param5:number,param6:number);
					clearIgnoredRef();
					addTrans(param1:string,param2:string,param3:number,param4:number,param5:number,param6:string,param7:string,param8:string);
					getDetectFlash():boolean;
					setCampaignTrack(param1:boolean);
					createEventTracker(param1:string):com.google.analytics.core.EventTracker;
					setCookieTimeout(param1:number);
					setAllowAnchor(param1:boolean);
					trackTrans();
					clearOrganic();
					trackPageview(param1?:string);
					setLocalGifPath(param1:string);
					getVersion():string;
					getLocalGifPath():string;
					getServiceMode():com.google.analytics.core.ServerOperationMode;
					setVar(param1:string);
					clearIgnoredOrganic();
					setCampMediumKey(param1:string);
					addIgnoredRef(param1:string);
					setClientInfo(param1:boolean);
					setCookiePath(param1:string);
					setSampleRate(param1:number);
					setSessionTimeout(param1:number);
					setRemoteServerMode();
					setDomainName(param1:string);
					addIgnoredOrganic(param1:string);
					setAllowHash(param1:boolean);
					getAccount():string;
					linkByPost(param1:any,param2?:boolean);
					link(param1:string,param2?:boolean);
					setCampNOKey(param1:string);
					getClientInfo():boolean;
					cookiePathCopy(param1:string);
					getDetectTitle():boolean;
				}
			}
		}
	}
}

