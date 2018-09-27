module com {
	export module google {
		export module analytics {
			export module debug {
				export class Warning extends com.google.analytics.debug.Label {
					private _timer:egret.Timer;

					public constructor(text:string = "",timeout:number = 3000)
					{
						super(text,"uiWarning",Style.warningColor,com.google.analytics.debug.Align.top,false);
						this.margin.top = flash.checkInt(32);
						if(timeout > 0)
						{
							this._timer = new egret.Timer(timeout,1);
							this._timer.start();
							this._timer.addEventListener(egret.TimerEvent.TIMER_COMPLETE,flash.bind(this.onComplete,this),null,false,0);
						}
					}

					public close()
					{
						if(this.parent != null)
						{
							this.parent.removeChild(this);
						}
					}

					public onLink(event:egret.TextEvent)
					{
						switch(event.text)
						{
						case "hide" :
							this.close();
						}
					}

					public onComplete(event:egret.TimerEvent)
					{
						this.close();
					}

				}
			}
		}
	}
}

flash.extendsClass("com.google.analytics.debug.Warning","com.google.analytics.debug.Label")
