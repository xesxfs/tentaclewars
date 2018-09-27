module mx {
	export module core {
		export class ByteArrayAsset extends flash.ByteArray implements mx.core.IFlexAsset {
			public static VERSION:string;

			public constructor()
			{
				super();
			}

		}
	}
}

mx.core.ByteArrayAsset.VERSION = "3.5.0.12683";
flash.extendsClass("mx.core.ByteArrayAsset","flash.ByteArray")
flash.implementsClass("mx.core.ByteArrayAsset",["mx.core.IFlexAsset"]);