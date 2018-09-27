module com {
	export module gameallianz {
		export module api {
			export module as3 {
				export module classes {
					export class GameAllianzApiDepositary extends egret.HashObject {
						public static engineClass:any;

						public constructor()
						{
							super();
							super();
						}

						public static engineByteArray():flash.ByteArray
						{
							var byteArrayContent:flash.ByteArray = <any>null;
							try 
							{
								byteArrayContent = flash.As3As(new com.gameallianz.api.as3.classes.GameAllianzApiDepositary.engineClass(),flash.ByteArray);
							}
							catch(e)
							{}
							return byteArrayContent;
						}

					}
				}
			}
		}
	}
}

com.gameallianz.api.as3.classes.GameAllianzApiDepositary.engineClass = com.gameallianz.api.as3.classes.GameAllianzApiDepositary_engineClass;
