module com {
	export module adobe {
		export module serialization {
			export module json {
				export class JSONParseError extends flash.Error {
					private _location:number = 0;
					private _text:string;

					public constructor(message:string = "",location:number = 0,text:string = "")
					{
						super(message);
						this.name = "JSONParseError";
					}

					public get location():number
					{
						return this._location;
					}

					public get text():string
					{
						return this._text;
					}

				}
			}
		}
	}
}

flash.extendsClass("com.adobe.serialization.json.JSONParseError","flash.Error")
