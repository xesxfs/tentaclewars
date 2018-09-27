module com {
	export module adobe {
		export module serialization {
			export module json {
				export class JSON extends egret.HashObject {

					public constructor()
					{
						super();
						super();
					}

					public static encode(o:any):string
					{
						var encoder:JSONEncoder = <any>new JSONEncoder(o);
						return encoder["getString"]();
					}

					public static decode(s:string):any
					{
						var decoder:JSONDecoder = <any>new JSONDecoder(s);
						return decoder["getValue"]();
					}

				}
			}
		}
	}
}

