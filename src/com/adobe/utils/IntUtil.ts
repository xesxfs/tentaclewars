module com {
	export module adobe {
		export module utils {
			export class IntUtil extends egret.HashObject {
				public static hexChars:string;

				public constructor()
				{
					super();
					super();
				}

				public static rol(x:number,n:number):number
				{
					x = flash.checkInt(x);
					n = flash.checkInt(n);
					return x << n | x >>> 32 - n;
				}

				public static ror(x:number,n:number):number
				{
					x = flash.checkInt(x);
					n = flash.checkInt(n);
					var nn:number = flash.checkInt(32 - n);
					return x << nn | x >>> 32 - nn;
				}

				public static toHex(n:number,bigEndian:boolean = false):string
				{
					var i:number = flash.checkInt(0);
					var x:number = flash.checkInt(0);
					var s:string = "";
					if(bigEndian)
					{
						for(i = flash.checkInt(0); i < 4; i++)
						{
							s = s + (com.adobe.utils.IntUtil.hexChars.charAt(n >> (3 - i) * 8 + 4 & 15) + com.adobe.utils.IntUtil.hexChars.charAt(n >> (3 - i) * 8 & 15));
						}
					}
					else
					{
						for(x = flash.checkInt(0); x < 4; )
						{
							s = s + (com.adobe.utils.IntUtil.hexChars.charAt(n >> x * 8 + 4 & 15) + com.adobe.utils.IntUtil.hexChars.charAt(n >> x * 8 & 15));
							x++;
						}
					}
					return s;
				}

			}
		}
	}
}

com.adobe.utils.IntUtil.hexChars = "0123456789abcdef";
