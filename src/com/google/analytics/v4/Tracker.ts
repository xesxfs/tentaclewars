module com {
	export module google {
		export module analytics {
			export module v4 {
				export class Tracker extends egret.HashObject implements com.google.analytics.v4.GoogleAnalyticsAPI {
					private _adSense:com.google.analytics.external.AdSenseGlobals;
					private EVENT_TRACKER_LABEL_KEY_NUM:number = 3;
					private _eventTracker:com.google.analytics.data.X10;
					private EVENT_TRACKER_VALUE_VALUE_NUM:number = 1;
					private _noSessionInformation:boolean = false;
					private _browserInfo:com.google.analytics.core.BrowserInfo;
					private _debug:com.google.analytics.debug.DebugConfiguration;
					private _isNewVisitor:boolean = false;
					private _buffer:com.google.analytics.core.Buffer;
					private _config:com.google.analytics.v4.Configuration;
					private _x10Module:com.google.analytics.data.X10;
					private _campaign:com.google.analytics.campaign.CampaignManager;
					private _formatedReferrer:string;
					private _timeStamp:number = NaN;
					private _info:com.google.analytics.utils.Environment;
					private _domainHash:number = NaN;
					private EVENT_TRACKER_PROJECT_ID:number = 5;
					private _campaignInfo:com.google.analytics.campaign.CampaignInfo;
					private EVENT_TRACKER_OBJECT_NAME_KEY_NUM:number = 1;
					private _gifRequest:com.google.analytics.core.GIFRequest;
					private EVENT_TRACKER_TYPE_KEY_NUM:number = 2;
					private _hasInitData:boolean = false;
					private _ecom:com.google.analytics.core.Ecommerce;
					private _account:string;

					public constructor(account:string,config:com.google.analytics.v4.Configuration,debug:com.google.analytics.debug.DebugConfiguration,info:com.google.analytics.utils.Environment,buffer:com.google.analytics.core.Buffer,gifRequest:com.google.analytics.core.GIFRequest,adSense:com.google.analytics.external.AdSenseGlobals,ecom:com.google.analytics.core.Ecommerce)
					{
						super();
						super();
						var msg:any = null;
						this._account = account;
						this._config = config;
						this._debug = debug;
						this._info = info;
						this._buffer = buffer;
						this._gifRequest = gifRequest;
						this._adSense = adSense;
						this._ecom = ecom;
						if(<any>!com.google.analytics.core.Utils.validateAccount(account))
						{
							msg = "Account \"" + account + "\" is not valid.";
							this._debug.warning(msg);
							throw new flash.Error(msg).message;
						}
					}

					private _doTracking():boolean
					{
						if(this._info.protocol != com.google.analytics.utils.Protocols.file && this._info.protocol != com.google.analytics.utils.Protocols.none && this._isNotGoogleSearch())
						{
							return true;
						}
						if(this._config.allowLocalTracking)
						{
							return true;
						}
						return false;
					}

					public addOrganic(newOrganicEngine:string,newOrganicKeyword:string)
					{
						this._debug.info("addOrganic( " + [newOrganicEngine,newOrganicKeyword].join(", ") + " )");
						this._config.organic["addSource"](newOrganicEngine,newOrganicKeyword);
					}

					public setAllowLinker(enable:boolean)
					{
						this._config.allowLinker = enable;
						this._debug.info("setAllowLinker( " + this._config.allowLinker + " )");
					}

					public getLinkerUrl(targetUrl:string = "",useHash:boolean = false):string
					{
						this._initData();
						this._debug.info("getLinkerUrl( " + targetUrl + ", " + useHash.toString() + " )");
						return this._buffer.getLinkerUrl(targetUrl,useHash);
					}

					public trackEvent(category:string,action:string,label:string = null,value:number = NaN):boolean
					{
						this._initData();
						var success:boolean = <any>true;
						var params:number = flash.checkInt(2);
						if(category != "" && action != "")
						{
							this._eventTracker.clearKey(this.EVENT_TRACKER_PROJECT_ID);
							this._eventTracker.clearValue(this.EVENT_TRACKER_PROJECT_ID);
							success = this._eventTracker.setKey(this.EVENT_TRACKER_PROJECT_ID,this.EVENT_TRACKER_OBJECT_NAME_KEY_NUM,category);
							success = this._eventTracker.setKey(this.EVENT_TRACKER_PROJECT_ID,this.EVENT_TRACKER_TYPE_KEY_NUM,action);
							if(label)
							{
								success = this._eventTracker.setKey(this.EVENT_TRACKER_PROJECT_ID,this.EVENT_TRACKER_LABEL_KEY_NUM,label);
								params = flash.checkInt(3);
							}
							if(<any>!isNaN(value))
							{
								success = this._eventTracker.setValue(this.EVENT_TRACKER_PROJECT_ID,this.EVENT_TRACKER_VALUE_VALUE_NUM,value);
								params = flash.checkInt(4);
							}
							if(success)
							{
								this._debug.info("valid event tracking call\ncategory: " + category + "\naction: " + action,com.google.analytics.debug.VisualDebugMode.geek);
								this._sendXEvent(this._eventTracker);
							}
						}
						else
						{
							this._debug.warning("event tracking call is not valid, failed!\ncategory: " + category + "\naction: " + action,com.google.analytics.debug.VisualDebugMode.geek);
							success = false;
						}
						switch(params)
						{
						case 4 :
							this._debug.info("trackEvent( " + [category,action,label,value].join(", ") + " )");
							break;
						case 3 :
							this._debug.info("trackEvent( " + [category,action,label].join(", ") + " )");
							break;
						case 2 :
						default :
							this._debug.info("trackEvent( " + [category,action].join(", ") + " )");
						}
						return success;
					}

					public trackPageview(pageURL:string = "")
					{
						this._debug.info("trackPageview( " + pageURL + " )");
						if(this._doTracking())
						{
							this._initData();
							this._trackMetrics(pageURL);
							this._noSessionInformation = false;
						}
						else
						{
							this._debug.warning("trackPageview( " + pageURL + " ) failed");
						}
					}

					public setCookieTimeout(newDefaultTimeout:number)
					{
						newDefaultTimeout = flash.checkInt(newDefaultTimeout);
						this._config.conversionTimeout = newDefaultTimeout;
						this._debug.info("setCookieTimeout( " + this._config.conversionTimeout + " )");
					}

					public trackTrans()
					{
						var i:number = <any>NaN;
						var j:number = <any>NaN;
						var curTrans:com.google.analytics.ecommerce.Transaction = <any>null;
						this._initData();
						var searchStrings:Array<any> = new Array();
						if(this._takeSample())
						{
							for(i = 0; i < this._ecom.getTransLength(); i++)
							{
								curTrans = this._ecom.getTransFromArray(i);
								searchStrings.push(curTrans.toGifParams());
								for(j = 0; j < curTrans.getItemsLength(); j++)
								{
									searchStrings.push(curTrans.getItemFromArray(j).toGifParams());
								}
							}
							for(i = 0; i < searchStrings.length; i++)
							{
								this._gifRequest.send(this._account,searchStrings[i]);
							}
						}
					}

					public setClientInfo(enable:boolean)
					{
						this._config.detectClientInfo = enable;
						this._debug.info("setClientInfo( " + this._config.detectClientInfo + " )");
					}

					public linkByPost(formObject:any,useHash:boolean = false)
					{
						this._debug.warning("linkByPost not implemented in AS3 mode");
					}

					private _initData()
					{
						var data0:any = null;
						var data:any = null;
						if(<any>!this._hasInitData)
						{
							this._updateDomainName();
							this._domainHash = this._getDomainHash();
							this._timeStamp = Math.round(new flash.As3Date().getTime() / 1000);
							if(this._debug.verbose)
							{
								data0 = "";
								data0 = data0 + "_initData 0";
								data0 = data0 + ("\ndomain name: " + this._config.domainName);
								data0 = data0 + ("\ndomain hash: " + this._domainHash);
								data0 = data0 + ("\ntimestamp:   " + this._timeStamp + " (" + new flash.As3Date(this._timeStamp * 1000) + ")");
								this._debug.info(data0,com.google.analytics.debug.VisualDebugMode.geek);
							}
						}
						if(this._doTracking())
						{
							this._handleCookie();
						}
						if(<any>!this._hasInitData)
						{
							if(this._doTracking())
							{
								this._formatedReferrer = this._formatReferrer();
								this._browserInfo = new com.google.analytics.core.BrowserInfo(this._config,this._info);
								this._debug.info("browserInfo: " + this._browserInfo.toURLString(),com.google.analytics.debug.VisualDebugMode.advanced);
								if(this._config.campaignTracking)
								{
									this._campaign = new com.google.analytics.campaign.CampaignManager(this._config,this._debug,this._buffer,this._domainHash,this._formatedReferrer,this._timeStamp);
									this._campaignInfo = this._campaign.getCampaignInformation(this._info.locationSearch,this._noSessionInformation);
									this._debug.info("campaignInfo: " + this._campaignInfo.toURLString(),com.google.analytics.debug.VisualDebugMode.advanced);
									this._debug.info("Search: " + this._info.locationSearch);
									this._debug.info("CampaignTrackig: " + this._buffer.utmz["campaignTracking"]);
								}
							}
							this._x10Module = new com.google.analytics.data.X10();
							this._eventTracker = new com.google.analytics.data.X10();
							this._hasInitData = true;
						}
						if(this._config.hasSiteOverlay)
						{
							this._debug.warning("Site Overlay is not supported");
						}
						if(this._debug.verbose)
						{
							data = "";
							data = data + "_initData (misc)";
							data = data + ("\nflash version: " + this._info.flashVersion.toString(4));
							data = data + ("\nprotocol: " + this._info.protocol);
							data = data + ("\ndefault domain name (auto): \"" + this._info.domainName + "\"");
							data = data + ("\nlanguage: " + this._info.language);
							data = data + ("\ndomain hash: " + this._getDomainHash());
							data = data + ("\nuser-agent: " + this._info.userAgent);
							this._debug.info(data,com.google.analytics.debug.VisualDebugMode.geek);
						}
					}

					public getDetectTitle():boolean
					{
						this._debug.info("getDetectTitle()");
						return this._config.detectTitle;
					}

					public resetSession()
					{
						this._debug.info("resetSession()");
						this._buffer.resetCurrentSession();
					}

					public getClientInfo():boolean
					{
						this._debug.info("getClientInfo()");
						return this._config.detectClientInfo;
					}

					private _sendXEvent(opt_xObj:com.google.analytics.data.X10 = null)
					{
						var searchVariables:com.google.analytics.utils.Variables = <any>null;
						var eventInfo:com.google.analytics.core.EventInfo = <any>null;
						var eventvars:com.google.analytics.utils.Variables = <any>null;
						var generalvars:com.google.analytics.utils.Variables = <any>null;
						if(this._takeSample())
						{
							searchVariables = new com.google.analytics.utils.Variables();
							searchVariables.URIencode = true;
							eventInfo = new com.google.analytics.core.EventInfo(true,this._x10Module,opt_xObj);
							eventvars = eventInfo.toVariables();
							generalvars = this._renderMetricsSearchVariables();
							searchVariables.join(eventvars,generalvars);
							this._gifRequest.send(this._account,searchVariables,false,true);
						}
					}

					public setDetectFlash(enable:boolean)
					{
						this._config.detectFlash = enable;
						this._debug.info("setDetectFlash( " + this._config.detectFlash + " )");
					}

					public setCampNameKey(newCampNameKey:string)
					{
						this._config.campaignKey.UCCN = newCampNameKey;
						var msg:any = <any>"setCampNameKey( " + this._config.campaignKey.UCCN + " )";
						if(this._debug.mode == com.google.analytics.debug.VisualDebugMode.geek)
						{
							this._debug.info(msg + " [UCCN]");
						}
						else
						{
							this._debug.info(msg);
						}
					}

					private _formatReferrer():string
					{
						var domainName:string = <any>null;
						var ref:com.google.analytics.utils.URL = <any>null;
						var dom:com.google.analytics.utils.URL = <any>null;
						var referrer:string = <any>this._info.referrer;
						if(referrer == "" || referrer == "localhost")
						{
							referrer = "-";
						}
						else
						{
							domainName = this._info.domainName;
							ref = new com.google.analytics.utils.URL(referrer);
							dom = new com.google.analytics.utils.URL("http://" + domainName);
							if(ref.hostName == domainName)
							{
								return "-";
							}
							if(dom.domain == ref.domain)
							{
								if(dom.subDomain != ref.subDomain)
								{
									referrer = "0";
								}
							}
							if(referrer.charAt(0) == "[" && referrer.charAt(referrer.length - 1))
							{
								referrer = "-";
							}
						}
						this._debug.info("formated referrer: " + referrer,com.google.analytics.debug.VisualDebugMode.advanced);
						return referrer;
					}

					private _visitCode():number
					{
						if(this._debug.verbose)
						{
							this._debug.info("visitCode: " + this._buffer.utma["sessionId"],com.google.analytics.debug.VisualDebugMode.geek);
						}
						return this._buffer.utma["sessionId"];
					}

					public createEventTracker(objName:string):com.google.analytics.core.EventTracker
					{
						this._debug.info("createEventTracker( " + objName + " )");
						return new com.google.analytics.core.EventTracker(objName,this);
					}

					public addItem(id:string,sku:string,name:string,category:string,price:number,quantity:number)
					{
						quantity = flash.checkInt(quantity);
						var parentTrans:com.google.analytics.ecommerce.Transaction = <any>null;
						parentTrans = this._ecom.getTransaction(id);
						if(parentTrans == null)
						{
							parentTrans = this._ecom.addTransaction(id,"","","","","","","");
						}
						parentTrans.addItem(sku,name,category,price.toString(),quantity.toString());
						if(this._debug.active)
						{
							this._debug.info("addItem( " + [id,sku,name,category,price,quantity].join(", ") + " )");
						}
					}

					public clearIgnoredOrganic()
					{
						this._debug.info("clearIgnoredOrganic()");
						this._config.organic["clearIgnoredKeywords"]();
					}

					public setVar(newVal:string)
					{
						var variables:com.google.analytics.utils.Variables = <any>null;
						if(newVal != "" && this._isNotGoogleSearch())
						{
							this._initData();
							this._buffer.utmv["domainHash"] = this._domainHash;
							this._buffer.utmv["value"] = encodeURI(newVal);
							if(this._debug.verbose)
							{
								this._debug.info(this._buffer.utmv.toString(),com.google.analytics.debug.VisualDebugMode.geek);
							}
							this._debug.info("setVar( " + newVal + " )");
							if(this._takeSample())
							{
								variables = new com.google.analytics.utils.Variables();
								variables["utmt"] = "var";
								this._gifRequest.send(this._account,variables);
							}
						}
						else
						{
							this._debug.warning("setVar \"" + newVal + "\" is ignored");
						}
					}

					public setDomainName(newDomainName:string)
					{
						if(newDomainName == "auto")
						{
							this._config.domain["mode"] = com.google.analytics.core.DomainNameMode.auto;
						}
						else if(newDomainName == "none")
						{
							this._config.domain["mode"] = com.google.analytics.core.DomainNameMode.none;
						}
						else
						{
							this._config.domain["mode"] = com.google.analytics.core.DomainNameMode.custom;
							this._config.domain["name"] = newDomainName;
						}
						this._updateDomainName();
						this._debug.info("setDomainName( " + this._config.domainName + " )");
					}

					private _updateDomainName()
					{
						var domainName:string = <any>null;
						if(this._config.domain["mode"] == com.google.analytics.core.DomainNameMode.auto)
						{
							domainName = this._info.domainName;
							if(domainName.substring(0,4) == "www.")
							{
								domainName = domainName.substring(4);
							}
							this._config.domain["name"] = domainName;
						}
						this._config.domainName = this._config.domain["name"].toLowerCase();
						this._debug.info("domain name: " + this._config.domainName,com.google.analytics.debug.VisualDebugMode.advanced);
					}

					public addTrans(orderId:string,affiliation:string,total:number,tax:number,shipping:number,city:string,state:string,country:string)
					{
						this._ecom.addTransaction(orderId,affiliation,total.toString(),tax.toString(),shipping.toString(),city,state,country);
						if(this._debug.active)
						{
							this._debug.info("addTrans( " + [orderId,affiliation,total,tax,shipping,city,state,country].join(", ") + " );");
						}
					}

					private _renderMetricsSearchVariables(pageURL:string = ""):com.google.analytics.utils.Variables
					{
						var campvars:com.google.analytics.utils.Variables = <any>null;
						var variables:com.google.analytics.utils.Variables = new com.google.analytics.utils.Variables();
						variables.URIencode = true;
						var docInfo:com.google.analytics.core.DocumentInfo = new com.google.analytics.core.DocumentInfo(this._config,this._info,this._formatedReferrer,pageURL,this._adSense);
						this._debug.info("docInfo: " + docInfo.toURLString(),com.google.analytics.debug.VisualDebugMode.geek);
						if(this._config.campaignTracking)
						{
							campvars = this._campaignInfo.toVariables();
						}
						var browservars:com.google.analytics.utils.Variables = this._browserInfo.toVariables();
						variables.join(docInfo.toVariables(),browservars,campvars);
						return variables;
					}

					public setCampContentKey(newCampContentKey:string)
					{
						this._config.campaignKey.UCCT = newCampContentKey;
						var msg:any = <any>"setCampContentKey( " + this._config.campaignKey.UCCT + " )";
						if(this._debug.mode == com.google.analytics.debug.VisualDebugMode.geek)
						{
							this._debug.info(msg + " [UCCT]");
						}
						else
						{
							this._debug.info(msg);
						}
					}

					private _handleCookie()
					{
						var data0:any = null;
						var data1:any = null;
						var vid:Array<any> = <any>null;
						var data2:any = null;
						if(<any>!this._config.allowLinker)
							{}
						this._buffer.createSO();
						if(this._buffer.hasUTMA() && <any>!this._buffer.utma["isEmpty"]())
						{
							if(<any>!this._buffer.hasUTMB() || <any>!this._buffer.hasUTMC())
							{
								this._buffer.updateUTMA(this._timeStamp);
								this._noSessionInformation = true;
							}
							if(this._debug.verbose)
							{
								this._debug.info("from cookie " + this._buffer.utma.toString(),com.google.analytics.debug.VisualDebugMode.geek);
							}
						}
						else
						{
							this._debug.info("create a new utma",com.google.analytics.debug.VisualDebugMode.advanced);
							this._buffer.utma["domainHash"] = this._domainHash;
							this._buffer.utma["sessionId"] = this._getUniqueSessionId();
							this._buffer.utma["firstTime"] = this._timeStamp;
							this._buffer.utma["lastTime"] = this._timeStamp;
							this._buffer.utma["currentTime"] = this._timeStamp;
							this._buffer.utma["sessionCount"] = 1;
							if(this._debug.verbose)
							{
								this._debug.info(this._buffer.utma.toString(),com.google.analytics.debug.VisualDebugMode.geek);
							}
							this._noSessionInformation = true;
							this._isNewVisitor = true;
						}
						if(this._adSense["gaGlobal"] && this._adSense["dh"] == String(this._domainHash))
						{
							if(this._adSense["sid"])
							{
								this._buffer.utma["currentTime"] = flash.trannumber(this._adSense["sid"]);
								if(this._debug.verbose)
								{
									data0 = "";
									data0 = data0 + "AdSense sid found\n";
									data0 = data0 + ("Override currentTime(" + this._buffer.utma["currentTime"] + ") from AdSense sid(" + flash.trannumber(this._adSense["sid"]) + ")");
									this._debug.info(data0,com.google.analytics.debug.VisualDebugMode.geek);
								}
							}
							if(this._isNewVisitor)
							{
								if(this._adSense["sid"])
								{
									this._buffer.utma["lastTime"] = flash.trannumber(this._adSense["sid"]);
									if(this._debug.verbose)
									{
										data1 = "";
										data1 = data1 + "AdSense sid found (new visitor)\n";
										data1 = data1 + ("Override lastTime(" + this._buffer.utma["lastTime"] + ") from AdSense sid(" + flash.trannumber(this._adSense["sid"]) + ")");
										this._debug.info(data1,com.google.analytics.debug.VisualDebugMode.geek);
									}
								}
								if(this._adSense["vid"])
								{
									vid = this._adSense["vid"].split(".");
									this._buffer.utma["sessionId"] = flash.trannumber(vid[0]);
									this._buffer.utma["firstTime"] = flash.trannumber(vid[1]);
									if(this._debug.verbose)
									{
										data2 = "";
										data2 = data2 + "AdSense vid found (new visitor)\n";
										data2 = data2 + ("Override sessionId(" + this._buffer.utma["sessionId"] + ") from AdSense vid(" + flash.trannumber(vid[0]) + ")\n");
										data2 = data2 + ("Override firstTime(" + this._buffer.utma["firstTime"] + ") from AdSense vid(" + flash.trannumber(vid[1]) + ")");
										this._debug.info(data2,com.google.analytics.debug.VisualDebugMode.geek);
									}
								}
								if(this._debug.verbose)
								{
									this._debug.info("AdSense modified : " + this._buffer.utma.toString(),com.google.analytics.debug.VisualDebugMode.geek);
								}
							}
						}
						this._buffer.utmb["domainHash"] = this._domainHash;
						if(isNaN(this._buffer.utmb["trackCount"]))
						{
							this._buffer.utmb["trackCount"] = 0;
						}
						if(isNaN(this._buffer.utmb["token"]))
						{
							this._buffer.utmb["token"] = this._config.tokenCliff;
						}
						if(isNaN(this._buffer.utmb["lastTime"]))
						{
							this._buffer.utmb["lastTime"] = this._buffer.utma["currentTime"];
						}
						this._buffer.utmc["domainHash"] = this._domainHash;
						if(this._debug.verbose)
						{
							this._debug.info(this._buffer.utmb.toString(),com.google.analytics.debug.VisualDebugMode.advanced);
							this._debug.info(this._buffer.utmc.toString(),com.google.analytics.debug.VisualDebugMode.advanced);
						}
					}

					public setLocalServerMode()
					{
						this._config.serverMode = com.google.analytics.core.ServerOperationMode.local;
						this._debug.info("setLocalServerMode()");
					}

					public clearIgnoredRef()
					{
						this._debug.info("clearIgnoredRef()");
						this._config.organic["clearIgnoredReferrals"]();
					}

					public setCampSourceKey(newCampSrcKey:string)
					{
						this._config.campaignKey.UCSR = newCampSrcKey;
						var msg:any = <any>"setCampSourceKey( " + this._config.campaignKey.UCSR + " )";
						if(this._debug.mode == com.google.analytics.debug.VisualDebugMode.geek)
						{
							this._debug.info(msg + " [UCSR]");
						}
						else
						{
							this._debug.info(msg);
						}
					}

					public getLocalGifPath():string
					{
						this._debug.info("getLocalGifPath()");
						return this._config.localGIFpath;
					}

					public setLocalGifPath(newLocalGifPath:string)
					{
						this._config.localGIFpath = newLocalGifPath;
						this._debug.info("setLocalGifPath( " + this._config.localGIFpath + " )");
					}

					public getVersion():string
					{
						this._debug.info("getVersion()");
						return this._config.version;
					}

					public setAllowAnchor(enable:boolean)
					{
						this._config.allowAnchor = enable;
						this._debug.info("setAllowAnchor( " + this._config.allowAnchor + " )");
					}

					private _isNotGoogleSearch():boolean
					{
						var domainName:string = this._config.domainName;
						var g0:any = <any>domainName.indexOf("www.google.") < 0;
						var g1:any = <any>domainName.indexOf(".google.") < 0;
						var g2:any = <any>domainName.indexOf("google.") < 0;
						var g4:any = <any>domainName.indexOf("google.org") > -1;
						return g0 || g1 || g2 || this._config.cookiePath != "/" || g4;
					}

					public setSampleRate(newRate:number)
					{
						if(newRate < 0)
						{
							this._debug.warning("sample rate can not be negative, ignoring value.");
						}
						else
						{
							this._config.sampleRate = newRate;
						}
						this._debug.info("setSampleRate( " + this._config.sampleRate + " )");
					}

					private _takeSample():boolean
					{
						if(this._debug.verbose)
						{
							this._debug.info("takeSample: (" + this._visitCode() % 10000 + ") < (" + this._config.sampleRate * 10000 + ")",com.google.analytics.debug.VisualDebugMode.geek);
						}
						return this._visitCode() % 10000 < this._config.sampleRate * 10000;
					}

					public setCookiePath(newCookiePath:string)
					{
						this._config.cookiePath = newCookiePath;
						this._debug.info("setCookiePath( " + this._config.cookiePath + " )");
					}

					public setAllowHash(enable:boolean)
					{
						this._config.allowDomainHash = enable;
						this._debug.info("setAllowHash( " + this._config.allowDomainHash + " )");
					}

					private _generateUserDataHash():number
					{
						var hash:string = "";
						hash = hash + this._info.appName;
						hash = hash + this._info.appVersion;
						hash = hash + this._info.language;
						hash = hash + this._info.platform;
						hash = hash + this._info.userAgent.toString();
						hash = hash + (this._info.screenWidth + "x" + this._info.screenHeight + this._info.screenColorDepth);
						hash = hash + this._info.referrer;
						return com.google.analytics.core.Utils.generateHash(hash);
					}

					public setCampNOKey(newCampNOKey:string)
					{
						this._config.campaignKey.UCNO = newCampNOKey;
						var msg:any = <any>"setCampNOKey( " + this._config.campaignKey.UCNO + " )";
						if(this._debug.mode == com.google.analytics.debug.VisualDebugMode.geek)
						{
							this._debug.info(msg + " [UCNO]");
						}
						else
						{
							this._debug.info(msg);
						}
					}

					public addIgnoredOrganic(newIgnoredOrganicKeyword:string)
					{
						this._debug.info("addIgnoredOrganic( " + newIgnoredOrganicKeyword + " )");
						this._config.organic["addIgnoredKeyword"](newIgnoredOrganicKeyword);
					}

					public setLocalRemoteServerMode()
					{
						this._config.serverMode = com.google.analytics.core.ServerOperationMode.both;
						this._debug.info("setLocalRemoteServerMode()");
					}

					public cookiePathCopy(newPath:string)
					{
						this._debug.warning("cookiePathCopy( " + newPath + " ) not implemented");
					}

					public setDetectTitle(enable:boolean)
					{
						this._config.detectTitle = enable;
						this._debug.info("setDetectTitle( " + this._config.detectTitle + " )");
					}

					public setCampTermKey(newCampTermKey:string)
					{
						this._config.campaignKey.UCTR = newCampTermKey;
						var msg:any = <any>"setCampTermKey( " + this._config.campaignKey.UCTR + " )";
						if(this._debug.mode == com.google.analytics.debug.VisualDebugMode.geek)
						{
							this._debug.info(msg + " [UCTR]");
						}
						else
						{
							this._debug.info(msg);
						}
					}

					public getServiceMode():com.google.analytics.core.ServerOperationMode
					{
						this._debug.info("getServiceMode()");
						return this._config.serverMode;
					}

					private _trackMetrics(pageURL:string = "")
					{
						var searchVariables:com.google.analytics.utils.Variables = <any>null;
						var x10vars:com.google.analytics.utils.Variables = <any>null;
						var generalvars:com.google.analytics.utils.Variables = <any>null;
						var eventInfo:com.google.analytics.core.EventInfo = <any>null;
						if(this._takeSample())
						{
							searchVariables = new com.google.analytics.utils.Variables();
							searchVariables.URIencode = true;
							if(this._x10Module && this._x10Module.hasData())
							{
								eventInfo = new com.google.analytics.core.EventInfo(false,this._x10Module);
								x10vars = eventInfo.toVariables();
							}
							generalvars = this._renderMetricsSearchVariables(pageURL);
							searchVariables.join(x10vars,generalvars);
							this._gifRequest.send(this._account,searchVariables);
						}
					}

					public setCampaignTrack(enable:boolean)
					{
						this._config.campaignTracking = enable;
						this._debug.info("setCampaignTrack( " + this._config.campaignTracking + " )");
					}

					public addIgnoredRef(newIgnoredReferrer:string)
					{
						this._debug.info("addIgnoredRef( " + newIgnoredReferrer + " )");
						this._config.organic["addIgnoredReferral"](newIgnoredReferrer);
					}

					public clearOrganic()
					{
						this._debug.info("clearOrganic()");
						this._config.organic["clearEngines"]();
					}

					public getDetectFlash():boolean
					{
						this._debug.info("getDetectFlash()");
						return this._config.detectFlash;
					}

					public setCampMediumKey(newCampMedKey:string)
					{
						this._config.campaignKey.UCMD = newCampMedKey;
						var msg:any = <any>"setCampMediumKey( " + this._config.campaignKey.UCMD + " )";
						if(this._debug.mode == com.google.analytics.debug.VisualDebugMode.geek)
						{
							this._debug.info(msg + " [UCMD]");
						}
						else
						{
							this._debug.info(msg);
						}
					}

					private _getUniqueSessionId():number
					{
						var sessionID:number = (com.google.analytics.core.Utils.generate32bitRandom() ^ this._generateUserDataHash()) * 2147483647;
						this._debug.info("Session ID: " + sessionID,com.google.analytics.debug.VisualDebugMode.geek);
						return sessionID;
					}

					private _getDomainHash():number
					{
						if(<any>!this._config.domainName || this._config.domainName == "" || this._config.domain["mode"] == com.google.analytics.core.DomainNameMode.none)
						{
							this._config.domainName = "";
							return 1;
						}
						this._updateDomainName();
						if(this._config.allowDomainHash)
						{
							return com.google.analytics.core.Utils.generateHash(this._config.domainName);
						}
						return 1;
					}

					public setSessionTimeout(newTimeout:number)
					{
						newTimeout = flash.checkInt(newTimeout);
						this._config.sessionTimeout = newTimeout;
						this._debug.info("setSessionTimeout( " + this._config.sessionTimeout + " )");
					}

					public getAccount():string
					{
						this._debug.info("getAccount()");
						return this._account;
					}

					public link(targetUrl:string,useHash:boolean = false)
					{
						this._initData();
						var out:string = this._buffer.getLinkerUrl(targetUrl,useHash);
						var request:egret.URLRequest = new egret.URLRequest(out);
						this._debug.info("link( " + [targetUrl,useHash].join(",") + " )");
						try 
						{
							flash.navigateToURL(request,"_top");
							return ;
						}
						catch(e)
						{
							this._debug.warning("An error occured in link() msg: " + e.message);
							return ;
						}
					}

					public setRemoteServerMode()
					{
						this._config.serverMode = com.google.analytics.core.ServerOperationMode.remote;
						this._debug.info("setRemoteServerMode()");
					}

				}
			}
		}
	}
}

flash.implementsClass("com.google.analytics.v4.Tracker",["com.google.analytics.v4.GoogleAnalyticsAPI"]);