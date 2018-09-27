module com {
	export module gameallianz {
		export module api {
			export module as3 {
				export module classes {
					export class GameAllianzApiMessage extends egret.HashObject {
						private n_id:number = NaN;
						private st_message:string;
						private st_event:string;
						private st_action:string;
						private obj_value:any;

						public constructor(_event:string,_value:any = null,_error_id:number = -1)
						{
							super();
							super();
							this.st_event = _event;
							this.obj_value = _value;
							this.n_id = _error_id;
							this.st_message = GameAllianzApiLocalization.getTranslationById(_error_id);
						}

						private set error_id_43(_id:number)
						{
						}

						public get error_id_1():number
						{
							return this.n_id;
						}

						private set message_43(_message:string)
						{
							this.st_message = _message;
						}

						public get message_1():string
						{
							return this.st_message;
						}

						public get event_1():string
						{
							return this.st_event;
						}

						private set event_43(_event:string)
						{
							this.st_event = _event;
						}

						private set value_43(_value:any)
						{
						}

						public get value_1():any
						{
							return this.obj_value;
						}

						private set error_43(_value:any)
						{
							this.n_id = _value;
						}

						public get error_1():number
						{
							return this.n_id;
						}

						public toString():string
						{
							return this.st_event + true + "\", Value:" + this.obj_value;
						}

					}
				}
			}
		}
	}
}

