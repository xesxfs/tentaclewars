module com {
	export module google {
		export module analytics {
			export module ecommerce {
				export class Transaction extends egret.HashObject {
					private _items:Array<any>;
					private _total:string;
					private _vars:com.google.analytics.utils.Variables;
					private _shipping:string;
					private _city:string;
					private _state:string;
					private _country:string;
					private _tax:string;
					private _affiliation:string;
					private _id:string;

					public constructor(id:string,affiliation:string,total:string,tax:string,shipping:string,city:string,state:string,country:string)
					{
						super();
						super();
						this._id = id;
						this._affiliation = affiliation;
						this._total = total;
						this._tax = tax;
						this._shipping = shipping;
						this._city = city;
						this._state = state;
						this._country = country;
						this._items = new Array();
					}

					public get total():string
					{
						return this._total;
					}

					public getItemFromArray(i:number):com.google.analytics.ecommerce.Item
					{
						return this._items[i];
					}

					public set total(value:string)
					{
						this._total = value;
					}

					public getItem(sku:string):com.google.analytics.ecommerce.Item
					{
						var i:number = <any>NaN;
						for(i = 0; i < this._items.length; )
						{
							if(this._items[i].sku == sku)
							{
								return this._items[i];
							}
							i++;
						}
						return null;
					}

					public getItemsLength():number
					{
						return this._items.length;
					}

					public addItem(sku:string,name:string,category:string,price:string,quantity:string)
					{
						var newItem:com.google.analytics.ecommerce.Item = <any>null;
						newItem = this.getItem(sku);
						if(newItem == null)
						{
							newItem = new com.google.analytics.ecommerce.Item(this._id,sku,name,category,price,quantity);
							this._items.push(newItem);
						}
						else
						{
							newItem.name = name;
							newItem.category = category;
							newItem.price = price;
							newItem.quantity = quantity;
						}
					}

					public set shipping(value:string)
					{
						this._shipping = value;
					}

					public get country():string
					{
						return this._country;
					}

					public get state():string
					{
						return this._state;
					}

					public set tax(value:string)
					{
						this._tax = value;
					}

					public set affiliation(value:string)
					{
						this._affiliation = value;
					}

					public set state(value:string)
					{
						this._state = value;
					}

					public get id():string
					{
						return this._id;
					}

					public get tax():string
					{
						return this._tax;
					}

					public toGifParams():com.google.analytics.utils.Variables
					{
						var vars:com.google.analytics.utils.Variables = new com.google.analytics.utils.Variables();
						vars.URIencode = true;
						vars["utmt"] = "tran";
						vars["utmtid"] = this.id;
						vars["utmtst"] = this.affiliation;
						vars["utmtto"] = this.total;
						vars["utmttx"] = this.tax;
						vars["utmtsp"] = this.shipping;
						vars["utmtci"] = this.city;
						vars["utmtrg"] = this.state;
						vars["utmtco"] = this.country;
						vars.post = ["utmtid","utmtst","utmtto","utmttx","utmtsp","utmtci","utmtrg","utmtco"];
						return vars;
					}

					public get affiliation():string
					{
						return this._affiliation;
					}

					public get city():string
					{
						return this._city;
					}

					public get shipping():string
					{
						return this._shipping;
					}

					public set id(value:string)
					{
						this._id = value;
					}

					public set city(value:string)
					{
						this._city = value;
					}

					public set country(value:string)
					{
						this._country = value;
					}

				}
			}
		}
	}
}

