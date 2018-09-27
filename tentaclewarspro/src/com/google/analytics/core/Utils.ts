module com {
	export module google {
		export module analytics {
			export module core {
				export class Utils extends egret.HashObject {

					public constructor()
					{
						super();
						super();
					}

					public static trim(raw:string,everything:boolean = false):string
					{
						var i:number = flash.checkInt(0);
						var iLeft:number = flash.checkInt(0);
						var iRight:number = flash.checkInt(0);
						if(raw == "")
						{
							return "";
						}
						var whitespaces:Array<any> = [" ","\n","\r","\t"];
						var str:string = raw;
						if(everything)
						{
							i = flash.checkInt(0);
							while(i < whitespaces.length && str.indexOf(whitespaces[i]) > -1)
							{
								str = str.split(whitespaces[i]).join("");
								i++;
							}
						}
						else
						{
							iLeft = flash.checkInt(0);
							while(iLeft < str.length && whitespaces.indexOf(str.charAt(iLeft)) > -1)
							{
								iLeft++;
							}
							str = str.substr(iLeft);
							iRight = flash.checkInt(str.length - 1);
							while(iRight >= 0 && whitespaces.indexOf(str.charAt(iRight)) > -1)
							{
								iRight--;
							}
							str = str.substring(0,iRight + 1);
						}
						return str;
					}

					public static generateHash(input:string):number
					{
						var pos:number = flash.checkInt(0);
						var current:number = flash.checkInt(0);
						var hash:any = 1;
						var leftMost7:any = 0;
						if(input != null && input != "")
						{
							hash = 0;
							for(pos = flash.checkInt(input.length - 1); pos >= 0; )
							{
								current = flash.checkInt(input.charCodeAt(pos));
								hash = flash.tranint((hash << 6 & 268435455) + current + (current << 14));
								leftMost7 = hash & 266338304;
								if(leftMost7 != 0)
								{
									hash = hash ^ leftMost7 >> 21;
								}
								pos--;
							}
						}
						return hash;
					}

					public static generate32bitRandom():number
					{
						return Math.round(Math.random() * 2147483647);
					}

					public static validateAccount(account:string):boolean
					{
						var rel:RegExp = /^UA-[0-9]*-[0-9]*$/;
						return rel.test(account);
					}

				}
			}
		}
	}
}

