module com {
	export module adobe {
		export module serialization {
			export module json {
				export class JSONToken extends egret.HashObject {
					private _type:number = 0;
					private _value:any;

					public constructor(type:number = -1,value:any = null)
					{
						super();
					}

					public get type():number
					{
						return this._type;
					}

					public set type(value:number)
					{
						value = flash.checkInt(value);
						this._type = flash.checkInt(value);
					}

					public get value():any
					{
						return this._value;
					}

					public set value(v:any)
					{
					}

				}
			}
		}
	}
}

