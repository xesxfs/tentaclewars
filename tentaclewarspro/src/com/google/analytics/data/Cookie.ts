module com {
	export module google {
		export module analytics {
			export module data {
				export interface Cookie {
					fromSharedObject(param1:any);
					toURLString():string;
					creation:flash.As3Date;
					toSharedObject():any;
					isExpired():boolean;
					expiration:flash.As3Date;
				}
			}
		}
	}
}

