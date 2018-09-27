module com {
	export module google {
		export module analytics {
			export module core {
				export class Ecommerce extends egret.HashObject {
					private _debug:com.google.analytics.debug.DebugConfiguration;
					private _trans:Array<any>;

					public constructor(debug:com.google.analytics.debug.DebugConfiguration)
					{
						super();
						super();
						this._debug = debug;
						this._trans = new Array();
					}

					public getTransLength():number
					{
						return this._trans.length;
					}

					public getTransFromArray(i:number):com.google.analytics.ecommerce.Transaction
					{
						return this._trans[i];
					}

					public addTransaction(id:string,affiliation:string,total:string,tax:string,shipping:string,city:string,state:string,country:string):com.google.analytics.ecommerce.Transaction
					{
						var newTrans:com.google.analytics.ecommerce.Transaction = <any>null;
						newTrans = this.getTransaction(id);
						if(newTrans == null)
						{
							newTrans = new com.google.analytics.ecommerce.Transaction(id,affiliation,total,tax,shipping,city,state,country);
							this._trans.push(newTrans);
						}
						else
						{
							newTrans.affiliation = affiliation;
							newTrans.total = total;
							newTrans.tax = tax;
							newTrans.shipping = shipping;
							newTrans.city = city;
							newTrans.state = state;
							newTrans.country = country;
						}
						return newTrans;
					}

					public getTransaction(orderId:string):com.google.analytics.ecommerce.Transaction
					{
						var i:number = <any>NaN;
						for(i = 0; i < this._trans.length; )
						{
							if(this._trans[i].id == orderId)
							{
								return this._trans[i];
							}
							i++;
						}
						return null;
					}

				}
			}
		}
	}
}

