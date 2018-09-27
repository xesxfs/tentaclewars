module com {
	export module google {
		export module analytics {
			export module debug {
				export class _Style extends egret.HashObject {
					public failureColor:number = 0;
					public borderColor:number = 0;
					public backgroundColor:number = 0;
					private _sheet:flash.text.StyleSheet;
					public roundedCorner:number = 0;
					public warningColor:number = 0;
					public infoColor:number = 0;
					public alertColor:number = 0;
					public successColor:number = 0;
					private _loader:egret.URLLoader;
					private _defaultSheet:string;

					public constructor()
					{
						super();
						super();
						this._sheet = new StyleSheet();
						this._loader = new egret.URLLoader();
						this._init();
					}

					private _parseSheet(data:string)
					{
						this._sheet["parseCSS"](data);
					}

					public get sheet():flash.text.StyleSheet
					{
						return this._sheet;
					}

					private _init()
					{
						this._defaultSheet = "";
						this._defaultSheet = this._defaultSheet + "a{text-decoration: underline;}\n";
						this._defaultSheet = this._defaultSheet + ".uiLabel{color: #000000;font-family: Arial;font-size: 12;margin-left: 2;margin-right: 2;}\n";
						this._defaultSheet = this._defaultSheet + ".uiWarning{color: #ffffff;font-family: Arial;font-size: 14;font-weight: bold;margin-left: 6;margin-right: 6;}\n";
						this._defaultSheet = this._defaultSheet + ".uiAlert{color: #ffffff;font-family: Arial;font-size: 14;font-weight: bold;margin-left: 6;margin-right: 6;}\n";
						this._defaultSheet = this._defaultSheet + ".uiInfo{color: #000000;font-family: Arial;font-size: 14;font-weight: bold;margin-left: 6;margin-right: 6;}\n";
						this._defaultSheet = this._defaultSheet + ".uiSuccess{color: #ffffff;font-family: Arial;font-size: 12;font-weight: bold;margin-left: 6;margin-right: 6;}\n";
						this._defaultSheet = this._defaultSheet + ".uiFailure{color: #ffffff;font-family: Arial;font-size: 12;font-weight: bold;margin-left: 6;margin-right: 6;}\n";
						this._defaultSheet = this._defaultSheet + ".uiAlertAction{color: #ffffff;text-align: center;font-family: Arial;font-size: 12;font-weight: bold;margin-left: 6;margin-right: 6;}\n";
						this._defaultSheet = this._defaultSheet + ".uiAlertTitle{color: #ffffff;font-family: Arial;font-size: 16;font-weight: bold;margin-left: 6;margin-right: 6;}\n";
						this._defaultSheet = this._defaultSheet + "\n";
						this.roundedCorner = flash.checkUint(6);
						this.backgroundColor = flash.checkUint(13421772);
						this.borderColor = flash.checkUint(5592405);
						this.infoColor = flash.checkUint(16777113);
						this.alertColor = flash.checkUint(16763904);
						this.warningColor = flash.checkUint(13369344);
						this.successColor = flash.checkUint(65280);
						this.failureColor = flash.checkUint(16711680);
						this._parseSheet(this._defaultSheet);
					}

				}
			}
		}
	}
}

