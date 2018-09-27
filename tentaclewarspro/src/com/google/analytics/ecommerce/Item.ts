module com {
	export module google {
		export module analytics {
			export module ecommerce {
				export class Item extends egret.HashObject {
					private _price:string;
					private _id:string;
					private _sku:string;
					private _category:string;
					private _quantity:string;
					private _name:string;

					public constructor(id:string,sku:string,name:string,category:string,price:string,quantity:string)
					{
						super();
						super();
						this._id = id;
						this._sku = sku;
						this._name = name;
						this._category = category;
						this._price = price;
						this._quantity = quantity;
					}

					public set sku(value:string)
					{
						this._sku = value;
					}

					public get price():string
					{
						return this._price;
					}

					public get name():string
					{
						return this._name;
					}

					public get quantity():string
					{
						return this._quantity;
					}

					public set name(value:string)
					{
						this._name = value;
					}

					public set price(value:string)
					{
						this._price = value;
					}

					public get id():string
					{
						return this._id;
					}

					public get sku():string
					{
						return this._sku;
					}

					public set quantity(value:string)
					{
						this._quantity = value;
					}

					public toGifParams():com.google.analytics.utils.Variables
					{
						var vars:com.google.analytics.utils.Variables = new com.google.analytics.utils.Variables();
						vars.URIencode = true;
						vars.post = ["utmt","utmtid","utmipc","utmipn","utmiva","utmipr","utmiqt"];
						vars["utmt"] = "item";
						vars["utmtid"] = this._id;
						vars["utmipc"] = this._sku;
						vars["utmipn"] = this._name;
						vars["utmiva"] = this._category;
						vars["utmipr"] = this._price;
						vars["utmiqt"] = this._quantity;
						return vars;
					}

					public set id(value:string)
					{
						this._id = value;
					}

					public set category(value:string)
					{
						this._category = value;
					}

					public get category():string
					{
						return this._category;
					}

				}
			}
		}
	}
}

