module com {
	export module google {
		export module analytics {
			export module utils {
				export class UserAgent extends egret.HashObject {
					public static minimal:boolean;
					private _localInfo:com.google.analytics.utils.Environment;
					private _applicationProduct:string;
					private _version:com.google.analytics.utils.Version;

					public constructor(localInfo:com.google.analytics.utils.Environment,product:string = "",version:string = "")
					{
						super();
						super();
						this._localInfo = localInfo;
						this.applicationProduct = product;
						this._version = com.google.analytics.utils.Version.fromString(version);
					}

					public get tamarinProductToken():string
					{
						if(com.google.analytics.utils.UserAgent.minimal)
						{
							return "";
						}
						if(flash.System["vmVersion"])
						{
							return "Tamarin/" + com.google.analytics.core.Utils.trim(flash.System["vmVersion"],true);
						}
						return "";
					}

					public get applicationVersion():string
					{
						return this._version.toString(2);
					}

					public get vendorProductToken():string
					{
						var vp:any = <any>"";
						if(this._localInfo.isAIR())
						{
							vp = vp + "AIR";
						}
						else
						{
							vp = vp + "FlashPlayer";
						}
						vp = vp + "/";
						vp = vp + this._version.toString(3);
						return vp;
					}

					public toString():string
					{
						var UA:string = "";
						UA = UA + this.applicationProductToken;
						if(this.applicationComment != "")
						{
							UA = UA + (" " + this.applicationComment);
						}
						if(this.tamarinProductToken != "")
						{
							UA = UA + (" " + this.tamarinProductToken);
						}
						if(this.vendorProductToken != "")
						{
							UA = UA + (" " + this.vendorProductToken);
						}
						return UA;
					}

					public get applicationComment():string
					{
						var comment:Array<any> = [];
						comment.push(this._localInfo.platform);
						comment.push(this._localInfo.playerType);
						if(<any>!com.google.analytics.utils.UserAgent.minimal)
						{
							comment.push(this._localInfo.operatingSystem);
							comment.push(this._localInfo.language);
						}
						if(flash.Capabilities.isDebugger)
						{
							comment.push("DEBUG");
						}
						if(comment.length > 0)
						{
							return "(" + comment.join("; ") + ")";
						}
						return "";
					}

					public set applicationVersion(value:string)
					{
						this._version = com.google.analytics.utils.Version.fromString(value);
					}

					public get applicationProductToken():string
					{
						var token:string = <any>this.applicationProduct;
						if(this.applicationVersion != "")
						{
							token = token + ("/" + this.applicationVersion);
						}
						return token;
					}

					public set applicationProduct(value:string)
					{
						this._applicationProduct = value;
					}

					public get applicationProduct():string
					{
						return this._applicationProduct;
					}

				}
			}
		}
	}
}

com.google.analytics.utils.UserAgent.minimal = false;
