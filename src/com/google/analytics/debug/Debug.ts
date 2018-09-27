module com {
	export module google {
		export module analytics {
			export module debug {
				export class Debug extends com.google.analytics.debug.Label {
					public static count_static_com_google_analytics_debug_Debug:number = 0;
					private _lines:Array<any>;
					private _preferredForcedWidth:number = 540;
					private _linediff:number = 0;
					public maxLines:number = 16;

					public constructor(color:number = 0,alignement:com.google.analytics.debug.Align = null,stickToEdge:boolean = false)
					{
						super(						var _self__:any = this;
"","uiLabel",color,alignement,stickToEdge);
						if(alignement == null)
						{
							alignement = com.google.analytics.debug.Align.bottom;
						}
						this.name = "Debug" + com.google.analytics.debug.Debug.count_static_com_google_analytics_debug_Debug++;
						this._lines = [];
						this.selectable = true;
						_self__.addEventListener(flash.KeyboardEvent.KEY_DOWN,flash.bind(this.onKey,this),null);
					}

					public writeBold(message:string)
					{
						this.write(message,true);
					}

					private _getLinesToDisplay(direction:number = 0):Array<any>
					{
						var lines:Array<any> = <any>null;
						var start:number = flash.checkUint(0);
						var end:number = flash.checkUint(0);
						if(this._lines.length - 1 > this.maxLines)
						{
							if(this._linediff <= 0)
							{
								this._linediff = flash.checkInt(this._linediff + direction);
							}
							else if(this._linediff > 0 && direction < 0)
							{
								this._linediff = flash.checkInt(this._linediff + direction);
							}
							start = flash.checkUint(this._lines.length - this.maxLines + this._linediff);
							end = flash.checkUint(start + this.maxLines);
							lines = this._lines.slice(start,end);
						}
						else
						{
							lines = this._lines;
						}
						return lines;
					}

					private onKey(event:flash.KeyboardEvent = null)
					{
						var lines:Array<any> = <any>null;
						switch(event.keyCode)
						{
						case flash.Keyboard.DOWN :
							lines = this._getLinesToDisplay(1);
							break;
						case flash.Keyboard.UP :
							lines = this._getLinesToDisplay(-1);
							break;
						default :
							lines = null;
						}
						if(lines == null)
						{
							return ;
						}
						this.text = lines.join("\n");
					}

					public get forcedWidth():number
					{
						if(this.parent)
						{
							if((<com.google.analytics.debug.UISprite>(this.parent)).forcedWidth > this._preferredForcedWidth)
							{
								return this._preferredForcedWidth;
							}
							return (<com.google.analytics.debug.UISprite>(this.parent)).forcedWidth;
						}
						return egret.superGetter(com.google.analytics.debug.Debug,this,"forcedWidth");
					}

					public set forcedWidth(value:number)
		{
			egret.superSetter(com.google.analytics.debug.Debug, this, "forcedWidth", value);
		}
	
 					public write(message:string,bold:boolean = false)
					{
						var inputLines:Array<any> = <any>null;
						if(message.indexOf("") > -1)
						{
							inputLines = message.split("\n");
						}
						else
						{
							inputLines = [message];
						}
						var pre:string = "";
						var post:string = "";
						if(bold)
						{
							pre = "<b>";
							post = "</b>";
						}
						for(var i:number = flash.checkInt(0);i < inputLines.length; )
						{
							this._lines.push(pre + inputLines[i] + post);
							i++;
						}
						var lines:Array<any> = this._getLinesToDisplay();
						this.text = lines.join("\n");
					}

					public close()
					{
						this.dispose();
					}

					protected dispose()
					{
						var _self__:any = this;
						_self__.removeEventListener(flash.KeyboardEvent.KEY_DOWN,flash.bind(this.onKey,this),null);
						super.dispose();
					}

				}
			}
		}
	}
}

flash.extendsClass("com.google.analytics.debug.Debug","com.google.analytics.debug.Label")
