module com {
	export module google {
		export module analytics {
			export module utils {
				export class URL extends egret.HashObject {
					private _url:string;

					public constructor(url:string = "")
					{
						super();
						super();
						this._url = url.toLowerCase();
					}

					public get domain():string
					{
						var parts:Array<any> = <any>null;
						if(this.hostName != "" && this.hostName["indexOf"](".") > -1)
						{
							parts = this.hostName["split"](".");
							switch(parts.length)
							{
							case 2 :
								return this.hostName;
							case 3 :
								if(parts[1] == "co")
								{
									return this.hostName;
								}
								parts.shift();
								return parts.join(".");
							case 4 :
								parts.shift();
								return parts.join(".");
							}
						}
						return "";
					}

					public get path():string
					{
						var _path:string = this._url;
						if(_path.indexOf("://") > -1)
						{
							_path = _path.split("://")[1];
						}
						if(_path.indexOf(this.hostName) == 0)
						{
							_path = _path.substr(this.hostName["length"]);
						}
						if(_path.indexOf("?") > -1)
						{
							_path = _path.split("?")[0];
						}
						if(_path.charAt(0) != "/")
						{
							_path = "/" + _path;
						}
						return _path;
					}

					public get protocol():com.google.analytics.utils.Protocols
					{
						var proto:string = <any>this._url.split("://")[0];
						switch(proto)
						{
						case "file" :
							return com.google.analytics.utils.Protocols.file;
						case "http" :
							return com.google.analytics.utils.Protocols.HTTP;
						case "https" :
							return com.google.analytics.utils.Protocols.HTTPS;
						default :
							return com.google.analytics.utils.Protocols.none;
						}
					}

					public get hostName():string
					{
						var hostname:string = this._url;
						if(hostname.indexOf("://") > -1)
						{
							hostname = hostname.split("://")[1];
						}
						if(hostname.indexOf("/") > -1)
						{
							hostname = hostname.split("/")[0];
						}
						if(hostname.indexOf("?") > -1)
						{
							hostname = hostname.split("?")[0];
						}
						if(this.protocol == com.google.analytics.utils.Protocols.file || this.protocol == com.google.analytics.utils.Protocols.none)
						{
							return "";
						}
						return hostname;
					}

					public get subDomain():string
					{
						if(this.domain != "" && this.domain != this.hostName)
						{
							return this.hostName["split"]("." + this.domain).join("");
						}
						return "";
					}

					public get search():string
					{
						var _search:string = this._url;
						if(_search.indexOf("://") > -1)
						{
							_search = _search.split("://")[1];
						}
						if(_search.indexOf(this.hostName) == 0)
						{
							_search = _search.substr(this.hostName["length"]);
						}
						if(_search.indexOf("?") > -1)
						{
							_search = _search.split("?")[1];
						}
						else
						{
							_search = "";
						}
						return _search;
					}

				}
			}
		}
	}
}

