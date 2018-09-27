module com {
	export module newgrounds {
		export class SaveRating extends egret.HashObject {
			private _id:number = 0;
			private _name:string;
			private var_380:number = NaN;
			private var_351:number = NaN;
			private var_363:boolean = false;
			private var_371:boolean = false;

			public constructor(id:number,name:string,isFloat:boolean,minValue:number = -Infinity,maxValue:number = Infinity)
			{
				super();
				super();
				this.var_351 = maxValue;
			}

			public get rating_id():number
			{
				return this._id;
			}

			public get rating_name():string
			{
				return this._name;
			}

			public get id():number
			{
				return this._id;
			}

			public get name():string
			{
				return this._name;
			}

			public get minValue():number
			{
				return this.var_380;
			}

			public get maxValue():number
			{
				return this.var_351;
			}

			public get isFloat():boolean
			{
				return this.var_363;
			}

			public get voted():boolean
			{
				return this.var_371;
			}

			public set voted(b:boolean)
			{
				this.var_371 = b;
			}

			public toString():string
			{
				return this._name;
			}

		}
	}
}

