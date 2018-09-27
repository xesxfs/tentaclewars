module com {
	export module google {
		export module analytics {
			export module campaign {
				export class CampaignTracker extends egret.HashObject {
					public content:string;
					public source:string;
					public clickId:string;
					public name:string;
					public term:string;
					public medium:string;
					public id:string;

					public constructor(id:string = "",source:string = "",clickId:string = "",name:string = "",medium:string = "",term:string = "",content:string = "")
					{
						super();
						super();
						this.id = id;
						this.source = source;
						this.clickId = clickId;
						this.name = name;
						this.medium = medium;
						this.term = term;
						this.content = content;
					}

					public isValid():boolean
					{
						if(this.id != "" || this.source != "" || this.clickId != "")
						{
							return true;
						}
						return false;
					}

					public toTrackerString():string
					{
						var data:Array<any> = [];
						this._addIfNotEmpty(data,"utmcid=",this.id);
						this._addIfNotEmpty(data,"utmcsr=",this.source);
						this._addIfNotEmpty(data,"utmgclid=",this.clickId);
						this._addIfNotEmpty(data,"utmccn=",this.name);
						this._addIfNotEmpty(data,"utmcmd=",this.medium);
						this._addIfNotEmpty(data,"utmctr=",this.term);
						this._addIfNotEmpty(data,"utmcct=",this.content);
						return data.join(com.google.analytics.campaign.CampaignManager.trackingDelimiter);
					}

					private _addIfNotEmpty(arr:Array<any>,field:string,value:string)
					{
						if(value != "")
						{
							value = value.split("+").join("%20");
							value = value.split(" ").join("%20");
							arr.push(field + value);
						}
					}

					public fromTrackerString(tracker:string)
					{
						var data:string = tracker.split(com.google.analytics.campaign.CampaignManager.trackingDelimiter).join("&");
						var vars:com.google.analytics.utils.Variables = new com.google.analytics.utils.Variables(data);
						if(vars.hasOwnProperty("utmcid"))
						{
							this.id = vars["utmcid"];
						}
						if(vars.hasOwnProperty("utmcsr"))
						{
							this.source = vars["utmcsr"];
						}
						if(vars.hasOwnProperty("utmccn"))
						{
							this.name = vars["utmccn"];
						}
						if(vars.hasOwnProperty("utmcmd"))
						{
							this.medium = vars["utmcmd"];
						}
						if(vars.hasOwnProperty("utmctr"))
						{
							this.term = vars["utmctr"];
						}
						if(vars.hasOwnProperty("utmcct"))
						{
							this.content = vars["utmcct"];
						}
						if(vars.hasOwnProperty("utmgclid"))
						{
							this.clickId = vars["utmgclid"];
						}
					}

				}
			}
		}
	}
}

