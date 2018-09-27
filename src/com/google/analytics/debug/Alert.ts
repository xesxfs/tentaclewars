module com {
	export module google {
		export module analytics {
			export module debug {
				export class Alert extends com.google.analytics.debug.Label {
					public autoClose:boolean = true;
					public actionOnNextLine:boolean = true;
					private _actions:Array<any>;

					public constructor(text:string,actions:Array<any>,tag:string = "uiAlert",color:number = 0,alignement:com.google.analytics.debug.Align = null,stickToEdge:boolean = false,actionOnNextLine:boolean = true)
					{
						super(text,tag,color,alignement,stickToEdge);
						if(color == 0)
						{
							color = flash.checkUint(Style.alertColor);
						}
						if(alignement == null)
						{
							alignement = com.google.analytics.debug.Align.center;
						}
						this.selectable = true;
						egret.superSetter(com.google.analytics.debug.Alert,this,"touchChildren",true);
						this["buttonMode"] = true;
						this.touchEnabled = true;
						this["useHandCursor"] = true;
						this.actionOnNextLine = actionOnNextLine;
						this._actions = [];
						for(var i:number = flash.checkInt(0);i < actions.length; i++)
						{
							actions[i].container = this;
							this._actions.push(actions[i]);
						}
					}

					private _defineActions()
					{
						var action:com.google.analytics.debug.AlertAction = <any>null;
						var str:any = <any>"";
						if(this.actionOnNextLine)
						{
							str = str + "\n";
						}
						else
						{
							str = str + " |";
						}
						str = str + " ";
						var actions:Array<any> = [];
						for(var i:number = flash.checkInt(0);i < this._actions.length; i++)
						{
							action = this._actions[i];
							actions.push("<a href=\"event:" + action.activator + "\">" + action.name + "</a>");
						}
						str = str + actions.join(" | ");
						this.appendText(str,"uiAlertAction");
					}

					protected isValidAction(action:string):boolean
					{
						for(var i:number = flash.checkInt(0);i < this._actions.length; )
						{
							if(action == this._actions[i].activator)
							{
								return true;
							}
							i++;
						}
						return false;
					}

					protected layout()
					{
						super.layout();
						this._defineActions();
					}

					protected getAction(name:string):com.google.analytics.debug.AlertAction
					{
						for(var i:number = flash.checkInt(0);i < this._actions.length; )
						{
							if(name == this._actions[i].activator)
							{
								return this._actions[i];
							}
							i++;
						}
						return null;
					}

					protected spaces(num:number):string
					{
						num = flash.checkInt(num);
						var str:string = "";
						var spc:string = "          ";
						for(var i:number = flash.checkInt(0);i < num + 1; i++)
						{
							str = str + spc;
						}
						return str;
					}

					public onLink(event:egret.TextEvent)
					{
						var action:com.google.analytics.debug.AlertAction = <any>null;
						if(this.isValidAction(event.text))
						{
							action = this.getAction(event.text);
							if(action)
							{
								action.execute();
							}
						}
						if(this.autoClose)
						{
							this.close();
						}
					}

					public close()
					{
						if(this.parent != null)
						{
							this.parent.removeChild(this);
						}
					}

				}
			}
		}
	}
}

flash.extendsClass("com.google.analytics.debug.Alert","com.google.analytics.debug.Label")
