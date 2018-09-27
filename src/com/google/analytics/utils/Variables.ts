module com {
	export module google {
		export module analytics {
			export module utils {
				export class Variables extends egret.HashObject {
					public post:Array<any>;
					public URIencode:boolean = false;
					public pre:Array<any>;
					public sort:boolean = true;

					public constructor(source:string = null,pre:Array<any> = null,post:Array<any> = null)
					{
						super();
						super();
						this.pre = [];
						this.post = [];
						if(source)
						{
							this.decode(source);
						}
						if(pre)
						{
							this.pre = pre;
						}
						if(post)
						{
							this.post = post;
						}
					}

					private _join(vars:com.google.analytics.utils.Variables)
					{
						var prop:any = null;
						if(<any>!vars)
						{
							return ;
						}
						for(prop in vars)
						{
							this[prop] = vars[prop];
						}
					}

					public join(...variables)
					{
						var l:number = flash.checkInt(variables.length);
						for(var i:number = flash.checkInt(0);i < l; i++)
						{
							if(flash.As3is(variables[i],com.google.analytics.utils.Variables))
							{
								this._join(variables[i]);
							}
						}
					}

					public toString():string
					{
						var value:string = <any>null;
						var p:any = null;
						var component:string = <any>null;
						var i:number = flash.checkInt(0);
						var j:number = flash.checkInt(0);
						var priority:string = <any>null;
						var last:string = <any>null;
						var data:Array<any> = [];
						for(p in this)
						{
							value = this[p];
							if(this.URIencode)
							{
								value = encodeURI(value);
							}
							data.push(p + "=" + value);
						}
						if(this.sort)
						{
							data.sort();
						}
						if(this.pre.length > 0)
						{
							this.pre.reverse();
							for(i = flash.checkInt(0); i < this.pre.length; i++)
							{
								priority = this.pre[i];
								for(j = flash.checkInt(0); j < data.length; )
								{
									component = data[j];
									if(component.indexOf(priority) == 0)
									{
										data.unshift(data.splice(j,1)[0]);
									}
									j++;
								}
							}
							this.pre.reverse();
						}
						if(this.post.length > 0)
						{
							for(i = flash.checkInt(0); i < this.post.length; i++)
							{
								last = this.post[i];
								for(j = flash.checkInt(0); j < data.length; )
								{
									component = data[j];
									if(component.indexOf(last) == 0)
									{
										data.push(data.splice(j,1)[0]);
									}
									j++;
								}
							}
						}
						return data.join("&");
					}

					public decode(source:string)
					{
						var data:Array<any> = <any>null;
						var prop:string = <any>null;
						var name:string = <any>null;
						var value:string = <any>null;
						var tmp:Array<any> = <any>null;
						if(source == "")
						{
							return ;
						}
						if(source.charAt(0) == "?")
						{
							source = source.substr(1,source.length);
						}
						if(source.indexOf("&") > -1)
						{
							data = source.split("&");
						}
						else
						{
							data = [source];
						}
						for(var i:number = flash.checkInt(0);i < data.length; )
						{
							prop = data[i];
							if(prop.indexOf("=") > -1)
							{
								tmp = prop.split("=");
								name = tmp[0];
								value = decodeURI(tmp[1]);
								this[name] = value;
							}
							i++;
						}
					}

					public toURLVariables():egret.URLVariables
					{
						var p:any = null;
						var urlvars:egret.URLVariables = new egret.URLVariables();
						for(p in this)
						{
							urlvars[p] = this[p];
						}
						return urlvars;
					}

				}
			}
		}
	}
}

