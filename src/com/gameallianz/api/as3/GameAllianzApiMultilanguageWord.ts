module com {
	export module gameallianz {
		export module api {
			export module as3 {
				export class GameAllianzApiMultilanguageWord extends egret.HashObject {
					private var_13:string;
					private var_1:any;

					public constructor(_id:string)
					{
						super();
						super();
						this.var_13 = _id;
						this.var_1 = new Object();
					}

					public get id():string
					{
						return this.var_13;
					}

					public set id(_value:string)
					{
					}

					public get ENG():string
					{
						return this.var_1[GameAllianzApiLocalization.ENG];
					}

					public set ENG(_value:string)
					{
						this.var_1[GameAllianzApiLocalization.ENG] = _value;
					}

					public get ESP():string
					{
						return this.var_1[GameAllianzApiLocalization.ESP];
					}

					public set ESP(_value:string)
					{
						this.var_1[GameAllianzApiLocalization.ESP] = _value;
					}

					public get ITA():string
					{
						return this.var_1[GameAllianzApiLocalization.ITA];
					}

					public set ITA(_value:string)
					{
					}

					public get RUS():string
					{
						return this.var_1[GameAllianzApiLocalization.RUS];
					}

					public set RUS(_value:string)
					{
					}

					public get DEU():string
					{
						return this.var_1[GameAllianzApiLocalization.DEU];
					}

					public set DEU(_value:string)
					{
						this.var_1[GameAllianzApiLocalization.DEU] = _value;
					}

					public get FRA():string
					{
						return this.var_1[GameAllianzApiLocalization.FRA];
					}

					public set FRA(_value:string)
					{
						this.var_1[GameAllianzApiLocalization.FRA] = _value;
					}

					public get POL():string
					{
						return this.var_1[GameAllianzApiLocalization.POL];
					}

					public set POL(_value:string)
					{
						this.var_1[GameAllianzApiLocalization.POL] = _value;
					}

					public get UKR():string
					{
						return this.var_1[GameAllianzApiLocalization.UKR];
					}

					public set UKR(_value:string)
					{
						this.var_1[GameAllianzApiLocalization.UKR] = _value;
					}

					public get PRT():string
					{
						return this.var_1[GameAllianzApiLocalization.PRT];
					}

					public set PRT(_value:string)
					{
						this.var_1[GameAllianzApiLocalization.PRT] = _value;
					}

					public get value_1():string
					{
						return this.var_1[GameAllianzApiLocalization.language];
					}

				}
			}
		}
	}
}

