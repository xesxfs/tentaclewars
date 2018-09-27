module com {
	export module google {
		export module analytics {
			export module core {
				export class OrganicReferrer extends egret.HashObject {
					private _engine:string;
					private _keyword:string;

					public constructor(engine:string,keyword:string)
					{
						super();
						super();
						this.engine = engine;
						this.keyword = keyword;
					}

					public get keyword():string
					{
						return this._keyword;
					}

					public get engine():string
					{
						return this._engine;
					}

					public set engine(value:string)
					{
						this._engine = value.toLowerCase();
					}

					public toString():string
					{
						return this.engine + "?" + this.keyword;
					}

					public set keyword(value:string)
					{
						this._keyword = value.toLowerCase();
					}

				}
			}
		}
	}
}

