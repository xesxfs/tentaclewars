module com {
	export module google {
		export module analytics {
			export module core {
				export class BrowserInfo extends egret.HashObject {
					private _config:com.google.analytics.v4.Configuration;
					private _info:com.google.analytics.utils.Environment;

					public constructor(config:com.google.analytics.v4.Configuration,info:com.google.analytics.utils.Environment)
					{
						super();
						super();
						this._config = config;
						this._info = info;
					}

					public get utmul():string
					{
						return this._info.language["toLowerCase"]();
					}

					public get utmje():string
					{
						return "0";
					}

					public toURLString():string
					{
						var v:com.google.analytics.utils.Variables = this.toVariables();
						return v.toString();
					}

					public get utmsr():string
					{
						return this._info.screenWidth + "x" + this._info.screenHeight;
					}

					public get utmfl():string
					{
						var v:com.google.analytics.utils.Version = <any>null;
						if(this._config.detectFlash)
						{
							v = this._info.flashVersion;
							return v.major + "." + v.minor + " r" + v.build;
						}
						return "-";
					}

					public get utmcs():string
					{
						return this._info.languageEncoding;
					}

					public toVariables():com.google.analytics.utils.Variables
					{
						var variables:com.google.analytics.utils.Variables = new com.google.analytics.utils.Variables();
						variables.URIencode = true;
						variables["utmcs"] = this.utmcs;
						variables["utmsr"] = this.utmsr;
						variables["utmsc"] = this.utmsc;
						variables["utmul"] = this.utmul;
						variables["utmje"] = this.utmje;
						variables["utmfl"] = this.utmfl;
						return variables;
					}

					public get utmsc():string
					{
						return this._info.screenColorDepth + "-bit";
					}

				}
			}
		}
	}
}

