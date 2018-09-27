module com {
	export module google {
		export module analytics {
			export module campaign {
				export class CampaignManager extends egret.HashObject {
					public static trackingDelimiter:string;
					private _config:com.google.analytics.v4.Configuration;
					private _domainHash:number = NaN;
					private _debug:com.google.analytics.debug.DebugConfiguration;
					private _timeStamp:number = NaN;
					private _referrer:string;
					private _buffer:com.google.analytics.core.Buffer;

					public constructor(config:com.google.analytics.v4.Configuration,debug:com.google.analytics.debug.DebugConfiguration,buffer:com.google.analytics.core.Buffer,domainHash:number,referrer:string,timeStamp:number)
					{
						super();
						super();
						this._config = config;
						this._debug = debug;
						this._buffer = buffer;
						this._domainHash = domainHash;
						this._referrer = referrer;
						this._timeStamp = timeStamp;
					}

					public static isInvalidReferrer(referrer:string):boolean
					{
						var url:com.google.analytics.utils.URL = <any>null;
						if(referrer == "" || referrer == "-" || referrer == "0")
						{
							return true;
						}
						if(referrer.indexOf("://") > -1)
						{
							url = new com.google.analytics.utils.URL(referrer);
							if(url.protocol == com.google.analytics.utils.Protocols.file || url.protocol == com.google.analytics.utils.Protocols.none)
							{
								return true;
							}
						}
						return false;
					}

					public static isFromGoogleCSE(referrer:string,config:com.google.analytics.v4.Configuration):boolean
					{
						var url:com.google.analytics.utils.URL = new com.google.analytics.utils.URL(referrer);
						if(url.hostName["indexOf"](config.google) > -1)
						{
							if(url.search["indexOf"](config.googleSearchParam + "=") > -1)
							{
								if(url.path == "/" + config.googleCsePath)
								{
									return true;
								}
							}
						}
						return false;
					}

					public getCampaignInformation(search:string,noSessionInformation:boolean):com.google.analytics.campaign.CampaignInfo
					{
						var campaignTracker:com.google.analytics.campaign.CampaignTracker = <any>null;
						var oldTracker:com.google.analytics.campaign.CampaignTracker = <any>null;
						var sessionCount:number = flash.checkInt(0);
						var campInfo:com.google.analytics.campaign.CampaignInfo = new com.google.analytics.campaign.CampaignInfo();
						var duplicateCampaign:any = false;
						var campNoOverride:boolean = <any>false;
						var responseCount:number = flash.checkInt(0);
						if(this._config.allowLinker && this._buffer.isGenuine())
						{
							if(<any>!this._buffer.hasUTMZ())
							{
								return campInfo;
							}
						}
						campaignTracker = this.getTrackerFromSearchString(search);
						if(this.isValid(campaignTracker))
						{
							campNoOverride = this.hasNoOverride(search);
							if(campNoOverride && <any>!this._buffer.hasUTMZ())
							{
								return campInfo;
							}
						}
						if(<any>!this.isValid(campaignTracker))
						{
							campaignTracker = this.getOrganicCampaign();
							if(<any>!this._buffer.hasUTMZ() && this.isIgnoredKeyword(campaignTracker))
							{
								return campInfo;
							}
						}
						if(<any>!this.isValid(campaignTracker) && noSessionInformation)
						{
							campaignTracker = this.getReferrerCampaign();
							if(<any>!this._buffer.hasUTMZ() && this.isIgnoredReferral(campaignTracker))
							{
								return campInfo;
							}
						}
						if(<any>!this.isValid(campaignTracker))
						{
							if(<any>!this._buffer.hasUTMZ() && noSessionInformation)
							{
								campaignTracker = this.getDirectCampaign();
							}
						}
						if(<any>!this.isValid(campaignTracker))
						{
							return campInfo;
						}
						if(this._buffer.hasUTMZ() && <any>!this._buffer.utmz["isEmpty"]())
						{
							oldTracker = new com.google.analytics.campaign.CampaignTracker();
							oldTracker.fromTrackerString(this._buffer.utmz["campaignTracking"]);
							duplicateCampaign = oldTracker.toTrackerString() == campaignTracker.toTrackerString();
							responseCount = flash.checkInt(this._buffer.utmz["responseCount"]);
						}
						if(<any>!duplicateCampaign || noSessionInformation)
						{
							sessionCount = flash.checkInt(this._buffer.utma["sessionCount"]);
							responseCount++;
							if(sessionCount == 0)
							{
								sessionCount = flash.checkInt(1);
							}
							this._buffer.utmz["domainHash"] = this._domainHash;
							this._buffer.utmz["campaignCreation"] = this._timeStamp;
							this._buffer.utmz["campaignSessions"] = sessionCount;
							this._buffer.utmz["responseCount"] = responseCount;
							this._buffer.utmz["campaignTracking"] = campaignTracker.toTrackerString();
							this._debug.info(this._buffer.utmz.toString(),com.google.analytics.debug.VisualDebugMode.geek);
							campInfo = new com.google.analytics.campaign.CampaignInfo(false,true);
						}
						else
						{
							campInfo = new com.google.analytics.campaign.CampaignInfo(false,false);
						}
						return campInfo;
					}

					public hasNoOverride(search:string):boolean
					{
						var key:com.google.analytics.campaign.CampaignKey = this._config.campaignKey;
						if(search == "")
						{
							return false;
						}
						var variables:com.google.analytics.utils.Variables = new com.google.analytics.utils.Variables(search);
						var value:string = "";
						if(variables.hasOwnProperty(key.UCNO))
						{
							value = variables[key.UCNO];
							switch(value)
							{
							case "1" :
								return true;
							case "" :
							case "0" :
							default :
								return false;
							}
						}
						else
						{
							return false;
						}
					}

					public getTrackerFromSearchString(search:string):com.google.analytics.campaign.CampaignTracker
					{
						var organicCampaign:com.google.analytics.campaign.CampaignTracker = this.getOrganicCampaign();
						var camp:com.google.analytics.campaign.CampaignTracker = new com.google.analytics.campaign.CampaignTracker();
						var key:com.google.analytics.campaign.CampaignKey = this._config.campaignKey;
						if(search == "")
						{
							return camp;
						}
						var variables:com.google.analytics.utils.Variables = new com.google.analytics.utils.Variables(search);
						if(variables.hasOwnProperty(key.UCID))
						{
							camp.id = variables[key.UCID];
						}
						if(variables.hasOwnProperty(key.UCSR))
						{
							camp.source = variables[key.UCSR];
						}
						if(variables.hasOwnProperty(key.UGCLID))
						{
							camp.clickId = variables[key.UGCLID];
						}
						if(variables.hasOwnProperty(key.UCCN))
						{
							camp.name = variables[key.UCCN];
						}
						else
						{
							camp.name = "(not set)";
						}
						if(variables.hasOwnProperty(key.UCMD))
						{
							camp.medium = variables[key.UCMD];
						}
						else
						{
							camp.medium = "(not set)";
						}
						if(variables.hasOwnProperty(key.UCTR))
						{
							camp.term = variables[key.UCTR];
						}
						else if(organicCampaign && organicCampaign.term != "")
						{
							camp.term = organicCampaign.term;
						}
						if(variables.hasOwnProperty(key.UCCT))
						{
							camp.content = variables[key.UCCT];
						}
						return camp;
					}

					public getOrganicCampaign():com.google.analytics.campaign.CampaignTracker
					{
						var camp:com.google.analytics.campaign.CampaignTracker = <any>null;
						var tmp:Array<any> = <any>null;
						var currentOrganicSource:com.google.analytics.core.OrganicReferrer = <any>null;
						var keyword:string = <any>null;
						if(com.google.analytics.campaign.CampaignManager.isInvalidReferrer(this._referrer) || com.google.analytics.campaign.CampaignManager.isFromGoogleCSE(this._referrer,this._config))
						{
							return camp;
						}
						var ref:com.google.analytics.utils.URL = new com.google.analytics.utils.URL(this._referrer);
						var name:string = "";
						if(ref.hostName != "")
						{
							if(ref.hostName["indexOf"](".") > -1)
							{
								tmp = ref.hostName["split"](".");
								switch(tmp.length)
								{
								case 2 :
									name = tmp[0];
									break;
								case 3 :
									name = tmp[1];
								}
							}
						}
						if(this._config.organic["match"](name))
						{
							currentOrganicSource = this._config.organic["getReferrerByName"](name);
							keyword = this._config.organic["getKeywordValue"](currentOrganicSource,ref.search);
							camp = new com.google.analytics.campaign.CampaignTracker();
							camp.source = currentOrganicSource.engine;
							camp.name = "(organic)";
							camp.medium = "organic";
							camp.term = keyword;
						}
						return camp;
					}

					public getDirectCampaign():com.google.analytics.campaign.CampaignTracker
					{
						var camp:com.google.analytics.campaign.CampaignTracker = new com.google.analytics.campaign.CampaignTracker();
						camp.source = "(direct)";
						camp.name = "(direct)";
						camp.medium = "(none)";
						return camp;
					}

					public isIgnoredKeyword(tracker:com.google.analytics.campaign.CampaignTracker):boolean
					{
						if(tracker && tracker.medium == "organic")
						{
							return this._config.organic["isIgnoredKeyword"](tracker.term);
						}
						return false;
					}

					public isIgnoredReferral(tracker:com.google.analytics.campaign.CampaignTracker):boolean
					{
						if(tracker && tracker.medium == "referral")
						{
							return this._config.organic["isIgnoredReferral"](tracker.source);
						}
						return false;
					}

					public isValid(tracker:com.google.analytics.campaign.CampaignTracker):boolean
					{
						if(tracker && tracker.isValid())
						{
							return true;
						}
						return false;
					}

					public getReferrerCampaign():com.google.analytics.campaign.CampaignTracker
					{
						var camp:com.google.analytics.campaign.CampaignTracker = <any>null;
						if(com.google.analytics.campaign.CampaignManager.isInvalidReferrer(this._referrer) || com.google.analytics.campaign.CampaignManager.isFromGoogleCSE(this._referrer,this._config))
						{
							return camp;
						}
						var ref:com.google.analytics.utils.URL = new com.google.analytics.utils.URL(this._referrer);
						var hostname:string = <any>ref.hostName;
						var content:string = <any>ref.path;
						if(hostname.indexOf("www.") == 0)
						{
							hostname = hostname.substr(4);
						}
						camp = new com.google.analytics.campaign.CampaignTracker();
						camp.source = hostname;
						camp.name = "(referral)";
						camp.medium = "referral";
						camp.content = content;
						return camp;
					}

				}
			}
		}
	}
}

com.google.analytics.campaign.CampaignManager.trackingDelimiter = "|";
