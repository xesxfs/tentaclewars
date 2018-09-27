module mx {
	export module core {
		export class SoundAsset extends flash.Sound implements mx.core.IFlexAsset {
			public static VERSION:string;

			public constructor()
			{
				super();
			}

		}
	}
}

mx.core.SoundAsset.VERSION = "3.5.0.12683";
flash.extendsClass("mx.core.SoundAsset","flash.Sound")
flash.implementsClass("mx.core.SoundAsset",["mx.core.IFlexAsset"]);