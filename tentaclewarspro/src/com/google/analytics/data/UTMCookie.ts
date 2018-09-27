module com {
	export module google {
		export module analytics {
			export module data {
				export class UTMCookie extends egret.HashObject implements com.google.analytics.data.Cookie {
					protected inURL:string;
					protected name:string;
					private _creation:flash.As3Date;
					private _expiration:flash.As3Date;
					public proxy:com.google.analytics.core.Buffer;
					protected fields:Array<any>;
					private _timespan:number = NaN;

					public constructor(name:string,inURL:string,fields:Array<any>,timespan:number = 0)
					{
						super();
						super();
						this.name = name;
						this.inURL = inURL;
						this.fields = fields;
						this._timestamp(timespan);
					}

					public isEmpty():boolean
					{
						var field:string = <any>null;
						var empty:number = flash.checkInt(0);
						for(var i:number = flash.checkInt(0);i < this.fields.length; )
						{
							field = this.fields[i];
							if(flash.As3is(this[field],"number") && isNaN(this[field]))
							{
								empty++;
							}
							else if(flash.As3is(this[field],"string") && this[field] == "")
							{
								empty++;
							}
							i++;
						}
						if(empty == this.fields.length)
						{
							return true;
						}
						return false;
					}

					public resetTimestamp(timespan:number = NaN)
					{
						if(<any>!isNaN(timespan))
						{
							this._timespan = timespan;
						}
						this._creation = null;
						this._expiration = null;
						this._timestamp(this._timespan);
					}

					protected update()
					{
						this.resetTimestamp();
						if(this.proxy)
						{
							this.proxy.update(this.name,this.toSharedObject());
						}
					}

					public reset()
					{
						var field:string = <any>null;
						for(var i:number = flash.checkInt(0);i < this.fields.length; )
						{
							field = this.fields[i];
							if(flash.As3is(this[field],"number"))
							{
								this[field] = NaN;
							}
							else if(flash.As3is(this[field],"string"))
							{
								this[field] = "";
							}
							i++;
						}
						this.resetTimestamp();
						this.update();
					}

					public fromSharedObject(data:any)
					{
						var field:string = <any>null;
						var len:number = flash.checkInt(this.fields.length);
						for(var i:number = flash.checkInt(0);i < len; )
						{
							field = this.fields[i];
							if(data[field])
							{
								this[field] = data[field];
							}
							i++;
						}
						if(data["creation"])
						{
							this.creation = data["creation"];
						}
						if(data["expiration"])
						{
							this.expiration = data["expiration"];
						}
					}

					private _timestamp(timespan:number)
					{
						this.creation = new flash.As3Date();
						this._timespan = timespan;
						if(timespan > 0)
						{
							this.expiration = new flash.As3Date(this.creation.valueOf() + timespan);
						}
					}

					public isExpired():boolean
					{
						var current:flash.As3Date = new flash.As3Date();
						var diff:number = this.expiration.valueOf() - current.valueOf();
						if(diff <= 0)
						{
							return true;
						}
						return false;
					}

					public set expiration(value:flash.As3Date)
					{
						this._expiration = value;
					}

					public get creation():flash.As3Date
					{
						return this._creation;
					}

					public valueOf():string
					{
						var field:string = <any>null;
						var value:any = undefined;
						var data:Array<any> = [];
						var testOut:string = "";
						for(var i:number = flash.checkInt(0);i < this.fields.length; )
						{
							field = this.fields[i];
							value = this[field];
							if(flash.As3is(value,"string"))
							{
								if(value == "")
								{
									value = "-";
									data.push(value);
								}
								else
								{
									data.push(value);
								}
							}
							else if(flash.As3is(value,"number"))
							{
								if(value == 0)
								{
									data.push(value);
								}
								else if(isNaN(value))
								{
									value = "-";
									data.push(value);
								}
								else
								{
									data.push(value);
								}
							}
							i++;
						}
						if(this.isEmpty())
						{
							return "-";
						}
						return "" + data.join(".");
					}

					public toURLString():string
					{
						return this.inURL + "=" + this.valueOf();
					}

					public get expiration():flash.As3Date
					{
						if(this._expiration)
						{
							return this._expiration;
						}
						return new flash.As3Date(new flash.As3Date().valueOf() + 1000);
					}

					public toSharedObject():any
					{
						var field:string = <any>null;
						var value:any = undefined;
						var data:any = {};
						for(var i:number = flash.checkInt(0);i < this.fields.length; i++)
						{
							field = this.fields[i];
							value = this[field];
							if(flash.As3is(value,"string"))
							{
								data[field] = value;
							}
							else if(value == 0)
							{
								data[field] = value;
							}
							else if(<any>!isNaN(value))
							{
								data[field] = value;
							}
						}
						data["creation"] = this.creation;
						data["expiration"] = this.expiration;
						return data;
					}

					public toString(showTimestamp:boolean = false):string
					{
						var field:string = <any>null;
						var value:any = undefined;
						var data:Array<any> = [];
						var len:number = flash.checkInt(this.fields.length);
						for(var i:number = flash.checkInt(0);i < len; i++)
						{
							field = this.fields[i];
							value = this[field];
							if(flash.As3is(value,"string"))
							{
								data.push(field + ": \"" + value + "\"");
							}
							else if(value == 0)
							{
								data.push(field + ": " + value);
							}
							else if(<any>!isNaN(value))
							{
								data.push(field + ": " + value);
							}
						}
						var str:any = <any>this.name.toUpperCase() + " {" + data.join(", ") + "}";
						if(showTimestamp)
						{
							str = str + (" creation:" + this.creation + ", expiration:" + this.expiration);
						}
						return str;
					}

					public set creation(value:flash.As3Date)
					{
						this._creation = value;
					}

				}
			}
		}
	}
}

flash.implementsClass("com.google.analytics.data.UTMCookie",["com.google.analytics.data.Cookie"]);