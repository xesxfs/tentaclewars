module com {
	export module google {
		export module analytics {
			export module utils {
				export class Environment extends egret.HashObject {
					private _dom:com.google.analytics.external.HTMLDOM;
					private _appName:string;
					private _debug:com.google.analytics.debug.DebugConfiguration;
					private _appVersion:com.google.analytics.utils.Version;
					private _url:string;
					private _protocol:com.google.analytics.utils.Protocols;
					private _userAgent:com.google.analytics.utils.UserAgent;

					public constructor(url:string = "",app:string = "",version:string = "",debug:com.google.analytics.debug.DebugConfiguration = null,dom:com.google.analytics.external.HTMLDOM = null)
					{
						super();
						super();
						var v:com.google.analytics.utils.Version = <any>null;
						if(app == "")
						{
							if(this.isAIR())
							{
								app = "AIR";
							}
							else
							{
								app = "Flash";
							}
						}
						if(version == "")
						{
							v = this.flashVersion;
						}
						else
						{
							v = com.google.analytics.utils.Version.fromString(version);
						}
						this._url = url;
						this._appName = app;
						this._appVersion = v;
						this._debug = debug;
						this._dom = dom;
					}

					public isAIR():boolean
					{
						return this.playerType == "Desktop" && flash.Security["sandboxType"].toString() == "application";
					}

					public get screenWidth():number
					{
						return flash.Capabilities.screenResolutionX;
					}

					public get playerType():string
					{
						return flash.Capabilities.playerType;
					}

					public get locationSearch():string
					{
						var _search:string = <any>this._dom["search"];
						if(_search)
						{
							return _search;
						}
						return "";
					}

					public get protocol():com.google.analytics.utils.Protocols
					{
						if(<any>!this._protocol)
						{
							this._findProtocol();
						}
						return this._protocol;
					}

					public get flashVersion():com.google.analytics.utils.Version
					{
						var v:com.google.analytics.utils.Version = com.google.analytics.utils.Version.fromString(flash.Capabilities.version.split(" ")[1],",");
						return v;
					}

					public get userAgent():com.google.analytics.utils.UserAgent
					{
						if(<any>!this._userAgent)
						{
							this._userAgent = new com.google.analytics.utils.UserAgent(this,this.appName,this.appVersion.toString(4));
						}
						return this._userAgent;
					}

					public get languageEncoding():string
					{
						var _charset:string = <any>null;
						if(flash.System["useCodePage"])
						{
							_charset = this._dom["characterSet"];
							if(_charset)
							{
								return _charset;
							}
							return "-";
						}
						return "UTF-8";
					}

					public get appName():string
					{
						return this._appName;
					}

					public get screenColorDepth():string
					{
						var color:string = <any>null;
						switch(flash.Capabilities.screenColor)
						{
						case "bw" :
							color = "1";
							break;
						case "gray" :
							color = "2";
							break;
						case "color" :
						default :
							color = "24";
						}
						var _colorDepth:string = <any>this._dom["colorDepth"];
						if(_colorDepth)
						{
							color = _colorDepth;
						}
						return color;
					}

					private _findProtocol()
					{
						var URL:string = <any>null;
						var test:string = <any>null;
						var p:com.google.analytics.utils.Protocols = com.google.analytics.utils.Protocols.none;
						if(this._url != "")
						{
							URL = this._url.toLowerCase();
							test = URL.substr(0,5);
							switch(test)
							{
							case "file:" :
								p = com.google.analytics.utils.Protocols.file;
								break;
							case "http:" :
								p = com.google.analytics.utils.Protocols.HTTP;
								break;
							case "https" :
								if(URL.charAt(5) == ":")
								{
									p = com.google.analytics.utils.Protocols.HTTPS;
									break;
								}
								break;
							default :
								this._protocol = com.google.analytics.utils.Protocols.none;
							}
						}
						var _proto:string = <any>this._dom["protocol"];
						var proto:string = (p.toString() + ":").toLowerCase();
						if(_proto && _proto != proto && this._debug)
						{
							this._debug.warning("Protocol mismatch: SWF=" + proto + ", DOM=" + _proto);
						}
						this._protocol = p;
					}

					public get locationSWFPath():string
					{
						return this._url;
					}

					public get platform():string
					{
						var p:string = flash.Capabilities.manufacturer;
						return p.split("Adobe ")[1];
					}

					public get operatingSystem():string
					{
						return flash.Capabilities.os;
					}

					public set appName(value:string)
					{
						this._appName = value;
						this.userAgent["applicationProduct"] = value;
					}

					public set url(value:string)
					{
						this._url = value;
					}

					public get referrer():string
					{
						var _referrer:string = <any>this._dom["referrer"];
						if(_referrer)
						{
							return _referrer;
						}
						if(this.protocol == com.google.analytics.utils.Protocols.file)
						{
							return "localhost";
						}
						return "";
					}

					public isInHTML():boolean
					{
						return flash.Capabilities.playerType == "PlugIn";
					}

					public get language():string
					{
						var _lang:string = <any>this._dom["language"];
						var lang:string = flash.Capabilities.language;
						if(_lang)
						{
							if(_lang.length > lang.length && _lang.substr(0,lang.length) == lang)
							{
								lang = _lang;
							}
						}
						return lang;
					}

					public get domainName():string
					{
						var URL:string = <any>null;
						var str:string = <any>null;
						var end:number = flash.checkInt(0);
						if(this.protocol == com.google.analytics.utils.Protocols.HTTP || this.protocol == com.google.analytics.utils.Protocols.HTTPS)
						{
							URL = this._url.toLowerCase();
							if(this.protocol == com.google.analytics.utils.Protocols.HTTP)
							{
								str = URL.split("http://").join("");
							}
							else if(this.protocol == com.google.analytics.utils.Protocols.HTTPS)
							{
								str = URL.split("https://").join("");
							}
							end = flash.checkInt(str.indexOf("/"));
							if(end > -1)
							{
								str = str.substring(0,end);
							}
							return str;
						}
						if(this.protocol == com.google.analytics.utils.Protocols.file)
						{
							return "localhost";
						}
						return "";
					}

					public set userAgent(custom:com.google.analytics.utils.UserAgent)
					{
						this._userAgent = custom;
					}

					public set appVersion(value:com.google.analytics.utils.Version)
					{
						this._appVersion = value;
						this.userAgent["applicationVersion"] = value.toString(4);
					}

					public get screenHeight():number
					{
						return flash.Capabilities.screenResolutionY;
					}

					public get locationPath():string
					{
						var _pathname:string = <any>this._dom["pathname"];
						if(_pathname)
						{
							return _pathname;
						}
						return "";
					}

					public get documentTitle():string
					{
						var _title:string = <any>this._dom["title"];
						if(_title)
						{
							return _title;
						}
						return "";
					}

					public get appVersion():com.google.analytics.utils.Version
					{
						return this._appVersion;
					}

				}
			}
		}
	}
}

