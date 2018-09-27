module com {
	export module gameallianz {
		export module api {
			export module as3 {
				export module classes {
					export class GameAllianzApiGameInfo extends egret.HashObject {
						private obj:any;

						public constructor(...arguments)
						{
							super();
							super();
							this.obj = new Object();
						}

						public ini(...arguments)
						{
							this.obj = new Object();
							this.obj["site_name"] = <string>arguments[0];
							this.obj["partner_name"] = <string>arguments[1];
						}

						public toObject():any
						{
							return this.obj;
						}

						public fromObject(_obj:any)
						{
							this.obj = new Object();
							this.obj["site_name"] = <string>_obj["site_name"];
							this.obj["partner_name"] = <string>_obj["partner_name"];
							this.obj["game_name"] = <string>_obj["game_name"];
							this.obj["game_multilanguage"] = <boolean>_obj["game_multilanguage"];
							this.obj["game_languages"] = flash.As3As(_obj["game_languages"],Array);
							this.obj["game_language"] = <string>_obj["game_language"];
							this.obj["api_version"] = <string>_obj["api_version"];
							this.obj["capabilities"] = <string>_obj["capabilities"];
							this.obj["url"] = <string>_obj["url"];
						}

						public get site_name():string
						{
							return this.obj["site_name"];
						}

						public get partner_name():string
						{
							return this.obj["partner_name"];
						}

						public get game_name():string
						{
							return this.obj["game_name"];
						}

						public get language():string
						{
							return this.obj["game_language"];
						}

						public set language(_value:string)
						{
							this.obj["game_language"] = _value;
						}

						public get multilanguage():boolean
						{
							return this.obj["game_multilanguage"];
						}

						public get languages():Array<any>
						{
							return this.obj["game_languages"];
						}

						public get version():string
						{
							return this.obj["api_version"];
						}

						public get capabilities():string
						{
							return this.obj["capabilities"];
						}

						public get url():string
						{
							return this.obj["url"];
						}

						public get object():any
						{
							return this.obj;
						}

					}
				}
			}
		}
	}
}

