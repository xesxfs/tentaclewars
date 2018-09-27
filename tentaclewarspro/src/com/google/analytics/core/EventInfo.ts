module com {
	export module google {
		export module analytics {
			export module core {
				export class EventInfo extends egret.HashObject {
					private _ext10:com.google.analytics.data.X10;
					private _isEventHit:boolean = false;
					private _x10:com.google.analytics.data.X10;

					public constructor(isEventHit:boolean,xObject:com.google.analytics.data.X10,extObject:com.google.analytics.data.X10 = null)
					{
						super();
						super();
						this._isEventHit = isEventHit;
						this._x10 = xObject;
						this._ext10 = extObject;
					}

					public toURLString():string
					{
						var v:com.google.analytics.utils.Variables = this.toVariables();
						return v.toString();
					}

					public get utmt():string
					{
						return "event";
					}

					public get utme():string
					{
						return this._x10.renderMergedUrlString(this._ext10);
					}

					public toVariables():com.google.analytics.utils.Variables
					{
						var variables:com.google.analytics.utils.Variables = new com.google.analytics.utils.Variables();
						variables.URIencode = true;
						if(this._isEventHit)
						{
							variables["utmt"] = this.utmt;
						}
						variables["utme"] = this.utme;
						return variables;
					}

				}
			}
		}
	}
}

