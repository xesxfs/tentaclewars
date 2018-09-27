module com {
	export module google {
		export module analytics {
			export module campaign {
				export class CampaignInfo extends egret.HashObject {
					private _new:boolean = false;
					private _empty:boolean = false;

					public constructor(empty:boolean = true,newCampaign:boolean = false)
					{
						super();
						super();
						this._empty = empty;
						this._new = newCampaign;
					}

					public toURLString():string
					{
						var v:com.google.analytics.utils.Variables = this.toVariables();
						return v.toString();
					}

					public isNew():boolean
					{
						return this._new;
					}

					public get utmcn():string
					{
						return "1";
					}

					public isEmpty():boolean
					{
						return this._empty;
					}

					public toVariables():com.google.analytics.utils.Variables
					{
						var variables:com.google.analytics.utils.Variables = new com.google.analytics.utils.Variables();
						variables.URIencode = true;
						if(<any>!this.isEmpty() && this.isNew())
						{
							variables["utmcn"] = this.utmcn;
						}
						if(<any>!this.isEmpty() && <any>!this.isNew())
						{
							variables["utmcr"] = this.utmcr;
						}
						return variables;
					}

					public get utmcr():string
					{
						return "1";
					}

				}
			}
		}
	}
}

