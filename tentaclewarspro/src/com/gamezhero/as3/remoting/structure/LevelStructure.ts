module com {
	export module gamezhero {
		export module as3 {
			export module remoting {
				export module structure {
					export class LevelStructure extends egret.HashObject {
						public level_email:string;
						public level_name:string;
						public level_author:string;
						public level_value:string;
						public level_rate:number = NaN;

						public constructor(level_name_:string,level_value_:string,level_autor_:string,level_email_:string,level_rate_:number)
						{
							super();
							super();
							this.level_name = level_name_;
							this.level_value = level_value_;
							this.level_author = level_autor_;
							this.level_rate = level_rate_;
							this.level_email = level_email_;
						}

						public getArray():Array<any>
						{
							var arr:Array<any> = new Array();
							arr["level_name"] = this.level_name;
							arr["level_value"] = this.level_value;
							arr["level_author"] = this.level_author;
							return arr;
						}

						public toString():string
						{
							return true + " " + this.level_value;
						}

					}
				}
			}
		}
	}
}

