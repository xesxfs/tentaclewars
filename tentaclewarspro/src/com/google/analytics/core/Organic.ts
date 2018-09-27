module com {
	export module google {
		export module analytics {
			export module core {
				export class Organic extends egret.HashObject {
					public static throwErrors:boolean;
					private _sourcesCache:Array<any>;
					private _sourcesEngine:Array<any>;
					private _ignoredKeywords:Array<any>;
					private _ignoredReferralsCache:any;
					private _ignoredReferrals:Array<any>;
					private _ignoredKeywordsCache:any;
					private _sources:Array<any>;

					public constructor()
					{
						super();
						super();
						this._sources = [];
						this._sourcesCache = [];
						this._sourcesEngine = [];
						this._ignoredReferrals = [];
						this._ignoredReferralsCache = {};
						this._ignoredKeywords = [];
						this._ignoredKeywordsCache = {};
					}

					public static getKeywordValueFromPath(keyword:string,path:string):string
					{
						var value:string = <any>null;
						var vars:com.google.analytics.utils.Variables = <any>null;
						if(path.indexOf(keyword + "=") > -1)
						{
							if(path.charAt(0) == "?")
							{
								path = path.substr(1);
							}
							path = path.split("+").join("%20");
							vars = new com.google.analytics.utils.Variables(path);
							value = vars[keyword];
						}
						return value;
					}

					public isIgnoredKeyword(keyword:string):boolean
					{
						if(this._ignoredKeywordsCache.hasOwnProperty(keyword))
						{
							return true;
						}
						return false;
					}

					public getKeywordValue(or:com.google.analytics.core.OrganicReferrer,path:string):string
					{
						var keyword:string = <any>or.keyword;
						return com.google.analytics.core.Organic.getKeywordValueFromPath(keyword,path);
					}

					public isIgnoredReferral(referrer:string):boolean
					{
						if(this._ignoredReferralsCache.hasOwnProperty(referrer))
						{
							return true;
						}
						return false;
					}

					public clear()
					{
						this.clearEngines();
						this.clearIgnoredReferrals();
						this.clearIgnoredKeywords();
					}

					public get count():number
					{
						return this._sources.length;
					}

					public get ignoredKeywordsCount():number
					{
						return this._ignoredKeywords.length;
					}

					public match(name:string):boolean
					{
						if(name == "")
						{
							return false;
						}
						name = name.toLowerCase();
						if(this._sourcesEngine[name] != undefined)
						{
							return true;
						}
						return false;
					}

					public clearIgnoredKeywords()
					{
						this._ignoredKeywords = [];
						this._ignoredKeywordsCache = {};
					}

					public addSource(engine:string,keyword:string)
					{
						var orgref:com.google.analytics.core.OrganicReferrer = new com.google.analytics.core.OrganicReferrer(engine,keyword);
						if(this._sourcesCache[orgref.toString()] == undefined)
						{
							this._sources.push(orgref);
							this._sourcesCache[orgref.toString()] = this._sources.length - 1;
							if(this._sourcesEngine[orgref.engine] == undefined)
							{
								this._sourcesEngine[orgref.engine] = [this._sources.length - 1];
							}
							else
							{
								this._sourcesEngine[orgref.engine].push(this._sources.length - 1);
							}
						}
						else if(com.google.analytics.core.Organic.throwErrors)
						{
							throw new flash.Error(orgref.toString() + " already exists, we don\'t add it.").message;
						}
					}

					public clearEngines()
					{
						this._sources = [];
						this._sourcesCache = [];
						this._sourcesEngine = [];
					}

					public get ignoredReferralsCount():number
					{
						return this._ignoredReferrals.length;
					}

					public addIgnoredReferral(referrer:string)
					{
						if(this._ignoredReferralsCache[referrer] == undefined)
						{
							this._ignoredReferrals.push(referrer);
							this._ignoredReferralsCache[referrer] = this._ignoredReferrals.length - 1;
						}
						else if(com.google.analytics.core.Organic.throwErrors)
						{
							throw new flash.Error("\"" + referrer + "\" already exists, we don\'t add it.").message;
						}
					}

					public clearIgnoredReferrals()
					{
						this._ignoredReferrals = [];
						this._ignoredReferralsCache = {};
					}

					public getReferrerByName(name:string):com.google.analytics.core.OrganicReferrer
					{
						var index:number = flash.checkInt(0);
						if(this.match(name))
						{
							index = flash.checkInt(this._sourcesEngine[name][0]);
							return this._sources[index];
						}
						return null;
					}

					public addIgnoredKeyword(keyword:string)
					{
						if(this._ignoredKeywordsCache[keyword] == undefined)
						{
							this._ignoredKeywords.push(keyword);
							this._ignoredKeywordsCache[keyword] = this._ignoredKeywords.length - 1;
						}
						else if(com.google.analytics.core.Organic.throwErrors)
						{
							throw new flash.Error("\"" + keyword + "\" already exists, we don\'t add it.").message;
						}
					}

					public get sources():Array<any>
					{
						return this._sources;
					}

				}
			}
		}
	}
}

com.google.analytics.core.Organic.throwErrors = false;
