module com {
	export module google {
		export module analytics {
			export module core {
				export class DocumentInfo extends egret.HashObject {
					private _pageURL:string;
					private _utmr:string;
					private _config:com.google.analytics.v4.Configuration;
					private _adSense:com.google.analytics.external.AdSenseGlobals;
					private _info:com.google.analytics.utils.Environment;

					public constructor(config:com.google.analytics.v4.Configuration,info:com.google.analytics.utils.Environment,formatedReferrer:string,pageURL:string = null,adSense:com.google.analytics.external.AdSenseGlobals = null)
					{
						super();
						super();
						this._config = config;
						this._info = info;
						this._utmr = formatedReferrer;
						this._pageURL = pageURL;
						this._adSense = adSense;
					}

					public get utmr():string
					{
						if(<any>!this._utmr)
						{
							return "-";
						}
						return this._utmr;
					}

					public toURLString():string
					{
						var v:com.google.analytics.utils.Variables = this.toVariables();
						return v.toString();
					}

					private _renderPageURL(pageURL:string = ""):string
					{
						var pathname:string = <any>this._info.locationPath;
						var search:string = <any>this._info.locationSearch;
						if(<any>!pageURL || pageURL == "")
						{
							pageURL = pathname + unescape(search);
							if(pageURL == "")
							{
								pageURL = "/";
							}
						}
						return pageURL;
					}

					public get utmp():string
					{
						return this._renderPageURL(this._pageURL);
					}

					public get utmhid():string
					{
						return String(this._generateHitId());
					}

					private _generateHitId():number
					{
						var hid:number = <any>NaN;
						if(this._adSense["hid"] && this._adSense["hid"] != "")
						{
							hid = flash.trannumber(this._adSense["hid"]);
						}
						else
						{
							hid = Math.round(Math.random() * 2147483647);
							this._adSense["hid"] = String(hid);
						}
						return hid;
					}

					public toVariables():com.google.analytics.utils.Variables
					{
						var variables:com.google.analytics.utils.Variables = new com.google.analytics.utils.Variables();
						variables.URIencode = true;
						if(this._config.detectTitle && this.utmdt != "")
						{
							variables["utmdt"] = this.utmdt;
						}
						variables["utmhid"] = this.utmhid;
						variables["utmr"] = this.utmr;
						variables["utmp"] = this.utmp;
						return variables;
					}

					public get utmdt():string
					{
						return this._info.documentTitle;
					}

				}
			}
		}
	}
}

