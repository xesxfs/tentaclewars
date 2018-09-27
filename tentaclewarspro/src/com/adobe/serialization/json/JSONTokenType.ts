module com {
	export module adobe {
		export module serialization {
			export module json {
				export class JSONTokenType extends egret.HashObject {
					public static UNKNOWN:number;
					public static COMMA:number;
					public static LEFT_BRACE:number;
					public static RIGHT_BRACE:number;
					public static LEFT_BRACKET:number;
					public static RIGHT_BRACKET:number;
					public static COLON:number;
					public static TRUE:number;
					public static FALSE:number;
					public static NULL:number;
					public static STRING:number;
					public static NUMBER:number;

					public constructor()
					{
						super();
						super();
					}

				}
			}
		}
	}
}

com.adobe.serialization.json.JSONTokenType.UNKNOWN = -1;
com.adobe.serialization.json.JSONTokenType.COMMA = 0;
com.adobe.serialization.json.JSONTokenType.LEFT_BRACE = 1;
com.adobe.serialization.json.JSONTokenType.RIGHT_BRACE = 2;
com.adobe.serialization.json.JSONTokenType.LEFT_BRACKET = 3;
com.adobe.serialization.json.JSONTokenType.RIGHT_BRACKET = 4;
com.adobe.serialization.json.JSONTokenType.COLON = 6;
com.adobe.serialization.json.JSONTokenType.TRUE = 7;
com.adobe.serialization.json.JSONTokenType.FALSE = 8;
com.adobe.serialization.json.JSONTokenType.NULL = 9;
com.adobe.serialization.json.JSONTokenType.STRING = 10;
com.adobe.serialization.json.JSONTokenType.NUMBER = 11;
