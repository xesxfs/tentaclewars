module com {
	export module newgrounds {
		export class Score extends egret.HashObject {
			private var_343:ScoreBoard;
			private var_381:number = 0;
			private var_353:string;
			private _value:string;
			private var_374:number = 0;
			private _tag:string;

			public constructor(board:ScoreBoard,position:number,username:string,value:string,numeric_value:number,tag:string)
			{
				super();
				numeric_value = flash.checkUint(numeric_value);
				super();
				this.var_343 = board;
				this.var_381 = flash.checkUint(position);
				this.var_353 = username;
				this._value = value;
				this.var_374 = flash.checkUint(numeric_value);
				this._tag = tag;
			}

			public get board():ScoreBoard
			{
				return this.var_343;
			}

			public get position():number
			{
				return this.var_381;
			}

			public get username():string
			{
				return this.var_353;
			}

			public get value():string
			{
				return this._value;
			}

			public get numeric_value():number
			{
				return this.var_374;
			}

			public get tag():string
			{
				return this._tag;
			}

		}
	}
}

