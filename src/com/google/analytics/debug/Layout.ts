module com {
	export module google {
		export module analytics {
			export module debug {
				export class Layout extends egret.HashObject implements com.google.analytics.debug.ILayout {
					private _display:egret.DisplayObject;
					private _infoQueue:Array<any>;
					private _maxCharPerLine:number = 85;
					private _hasInfo:boolean = false;
					private _warningQueue:Array<any>;
					private _hasDebug:boolean = false;
					private _hasWarning:boolean = false;
					private _mainPanel:com.google.analytics.debug.Panel;
					private _GRAlertQueue:Array<any>;
					private _debug:com.google.analytics.debug.DebugConfiguration;
					public visualDebug:com.google.analytics.debug.Debug;
					private _hasGRAlert:boolean = false;

					public constructor(debug:com.google.analytics.debug.DebugConfiguration,display:egret.DisplayObject)
					{
						super();
						super();
						this._display = display;
						this._debug = debug;
						this._hasWarning = false;
						this._hasInfo = false;
						this._hasDebug = false;
						this._hasGRAlert = false;
						this._warningQueue = [];
						this._infoQueue = [];
						this._GRAlertQueue = [];
					}

					private onKey(event:flash.KeyboardEvent = null)
					{
						switch(event.keyCode)
						{
						case this._debug.showHideKey :
							this._mainPanel.visible = <any>!this._mainPanel.visible;
							break;
						case this._debug.destroyKey :
							this.destroy();
						}
					}

					public createWarning(message:string)
					{
						if(this._hasWarning || <any>!this.isAvailable())
						{
							this._warningQueue.push(message);
							return ;
						}
						message = this._filterMaxChars(message);
						this._hasWarning = true;
						var w:com.google.analytics.debug.Warning = new com.google.analytics.debug.Warning(message,this._debug.warningTimeout);
						this.addToPanel("analytics",w);
						w.addEventListener(egret.Event.REMOVED_FROM_STAGE,flash.bind(this._clearWarning,this),null,false,0);
						if(this._hasDebug)
						{
							this.visualDebug.writeBold(message);
						}
					}

					public bringToFront(visual:egret.DisplayObject)
					{
						this._display.stage.setChildIndex(visual,this._display.stage.numChildren - 1);
					}

					public createFailureAlert(message:string)
					{
						var actionClose:com.google.analytics.debug.AlertAction = <any>null;
						if(this._debug.verbose)
						{
							message = this._filterMaxChars(message);
							actionClose = new com.google.analytics.debug.AlertAction("Close","close","close");
						}
						else
						{
							actionClose = new com.google.analytics.debug.AlertAction("X","close","close");
						}
						var fa:com.google.analytics.debug.Alert = <any>new com.google.analytics.debug.FailureAlert(this._debug,message,[actionClose]);
						this.addToPanel("analytics",fa);
						if(this._hasDebug)
						{
							if(this._debug.verbose)
							{
								message = message.split("\n").join("");
								message = this._filterMaxChars(message,66);
							}
							this.visualDebug.writeBold(message);
						}
					}

					public init()
					{
						var W:number = flash.checkUint(this._display.stage.stageWidth - 10 * 2);
						var H:number = flash.checkUint(this._display.stage.stageHeight - 10 * 2);
						var mp:com.google.analytics.debug.Panel = new com.google.analytics.debug.Panel("analytics",W,H);
						mp.alignement = com.google.analytics.debug.Align.top;
						mp.stickToEdge = false;
						mp.title = "Google Analytics v" + com.google.analytics.GATracker.version;
						this._mainPanel = mp;
						this.addToStage(mp);
						this.bringToFront(mp);
						if(this._debug.minimizedOnStart)
						{
							this._mainPanel.onToggle();
						}
						this.createVisualDebug();
						this._display.stage.addEventListener(flash.KeyboardEvent.KEY_DOWN,flash.bind(this.onKey,this),null,false,0);
					}

					public addToPanel(name:string,visual:egret.DisplayObject)
					{
						var panel:com.google.analytics.debug.Panel = <any>null;
						var d:egret.DisplayObject = this._display.stage.getChildByName(name);
						if(d)
						{
							panel = flash.As3As(d,com.google.analytics.debug.Panel);
							panel.addData(visual);
						}
						else
						{
							console.log("panel \"" + name + "\" not found");
						}
					}

					private _clearInfo(event:egret.Event)
					{
						this._hasInfo = false;
						if(this._infoQueue.length > 0)
						{
							this.createInfo(this._infoQueue.shift());
						}
					}

					private _filterMaxChars(message:string,maxCharPerLine:number = 0):string
					{
						var line:string = <any>null;
						var CRLF:string = "\n";
						var output:Array<any> = [];
						var lines:Array<any> = message.split(CRLF);
						if(maxCharPerLine == 0)
						{
							maxCharPerLine = flash.checkInt(this._maxCharPerLine);
						}
						for(var i:number = flash.checkInt(0);i < lines.length; )
						{
							for(line = lines[i]; line.length > maxCharPerLine; )
							{
								output.push(line.substr(0,maxCharPerLine));
								line = line.substring(maxCharPerLine);
							}
							output.push(line);
							i++;
						}
						return output.join(CRLF);
					}

					private _clearGRAlert(event:egret.Event)
					{
						this._hasGRAlert = false;
						if(this._GRAlertQueue.length > 0)
						{
							this.createGIFRequestAlert.apply(this,this._GRAlertQueue.shift());
						}
					}

					public createSuccessAlert(message:string)
					{
						var actionClose:com.google.analytics.debug.AlertAction = <any>null;
						if(this._debug.verbose)
						{
							message = this._filterMaxChars(message);
							actionClose = new com.google.analytics.debug.AlertAction("Close","close","close");
						}
						else
						{
							actionClose = new com.google.analytics.debug.AlertAction("X","close","close");
						}
						var sa:com.google.analytics.debug.Alert = <any>new com.google.analytics.debug.SuccessAlert(this._debug,message,[actionClose]);
						this.addToPanel("analytics",sa);
						if(this._hasDebug)
						{
							if(this._debug.verbose)
							{
								message = message.split("\n").join("");
								message = this._filterMaxChars(message,66);
							}
							this.visualDebug.writeBold(message);
						}
					}

					public isAvailable():boolean
					{
						return this._display.stage != null;
					}

					public createAlert(message:string)
					{
						message = this._filterMaxChars(message);
						var a:com.google.analytics.debug.Alert = new com.google.analytics.debug.Alert(message,[new com.google.analytics.debug.AlertAction("Close","close","close")]);
						this.addToPanel("analytics",a);
						if(this._hasDebug)
						{
							this.visualDebug.writeBold(message);
						}
					}

					public createInfo(message:string)
					{
						if(this._hasInfo || <any>!this.isAvailable())
						{
							this._infoQueue.push(message);
							return ;
						}
						message = this._filterMaxChars(message);
						this._hasInfo = true;
						var i:com.google.analytics.debug.Info = new com.google.analytics.debug.Info(message,this._debug.infoTimeout);
						this.addToPanel("analytics",i);
						i.addEventListener(egret.Event.REMOVED_FROM_STAGE,flash.bind(this._clearInfo,this),null,false,0);
						if(this._hasDebug)
						{
							this.visualDebug.write(message);
						}
					}

					public createGIFRequestAlert(message:string,request:egret.URLRequest,ref:com.google.analytics.core.GIFRequest)
					{
						if(this._hasGRAlert)
						{
							this._GRAlertQueue.push([message,request,ref]);
							return ;
						}
						this._hasGRAlert = true;
						var f:Function = <any>function ()
						{
							ref.sendRequest(request);
						};
						var message:string = this._filterMaxChars(message);
						var gra:com.google.analytics.debug.GIFRequestAlert = new com.google.analytics.debug.GIFRequestAlert(message,[new com.google.analytics.debug.AlertAction("OK","ok",f),new com.google.analytics.debug.AlertAction("Cancel","cancel","close")]);
						this.addToPanel("analytics",gra);
						gra.addEventListener(egret.Event.REMOVED_FROM_STAGE,flash.bind(this._clearGRAlert,this),null,false,0);
						if(this._hasDebug)
						{
							if(this._debug.verbose)
							{
								message = message.split("\n").join("");
								message = this._filterMaxChars(message,66);
							}
							this.visualDebug.write(message);
						}
					}

					public createVisualDebug()
					{
						if(<any>!this.visualDebug)
						{
							this.visualDebug = new com.google.analytics.debug.Debug();
							this.visualDebug.alignement = com.google.analytics.debug.Align.bottom;
							this.visualDebug.stickToEdge = true;
							this.addToPanel("analytics",this.visualDebug);
							this._hasDebug = true;
						}
					}

					public addToStage(visual:egret.DisplayObject)
					{
						this._display.stage.addChild(visual);
					}

					private _clearWarning(event:egret.Event)
					{
						this._hasWarning = false;
						if(this._warningQueue.length > 0)
						{
							this.createWarning(this._warningQueue.shift());
						}
					}

					public createPanel(name:string,width:number,height:number)
					{
						width = flash.checkUint(width);
						height = flash.checkUint(height);
						var p:com.google.analytics.debug.Panel = new com.google.analytics.debug.Panel(name,width,height);
						p.alignement = com.google.analytics.debug.Align.center;
						p.stickToEdge = false;
						this.addToStage(p);
						this.bringToFront(p);
					}

					public destroy()
					{
						this._mainPanel.close();
						this._debug.layout = null;
					}

				}
			}
		}
	}
}

flash.implementsClass("com.google.analytics.debug.Layout",["com.google.analytics.debug.ILayout"]);