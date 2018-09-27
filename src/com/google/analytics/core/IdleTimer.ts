module com {
	export module google {
		export module analytics {
			export module core {
				export class IdleTimer extends egret.HashObject {
					private _stage:egret.Stage;
					private _loop:egret.Timer;
					private _lastMove:number = 0;
					private _inactivity:number = NaN;
					private _debug:com.google.analytics.debug.DebugConfiguration;
					private _session:egret.Timer;
					private _buffer:com.google.analytics.core.Buffer;

					public constructor(config:com.google.analytics.v4.Configuration,debug:com.google.analytics.debug.DebugConfiguration,display:egret.DisplayObject,buffer:com.google.analytics.core.Buffer)
					{
						super();
						super();
						var delay:number = config.idleLoop;
						var inactivity:number = config.idleTimeout;
						var sessionTimeout:number = config.sessionTimeout;
						this._loop = new egret.Timer(delay * 1000);
						this._session = new egret.Timer(sessionTimeout * 1000,1);
						this._debug = debug;
						this._stage = display.stage;
						this._buffer = buffer;
						this._lastMove = flash.checkInt(egret.getTimer());
						this._inactivity = inactivity * 1000;
						this._loop.addEventListener(egret.TimerEvent.TIMER,flash.bind(this.checkForIdle,this),null);
						this._session.addEventListener(egret.TimerEvent.TIMER_COMPLETE,flash.bind(this.endSession,this),null);
						this._stage.addEventListener(egret.TouchEvent.TOUCH_MOVE,flash.bind(this.onMouseMove,this),null);
						this._debug.info("delay: " + delay + "sec , inactivity: " + inactivity + "sec, sessionTimeout: " + sessionTimeout,com.google.analytics.debug.VisualDebugMode.geek);
						this._loop.start();
					}

					private onMouseMove(event:flash.MouseEvent)
					{
						this._lastMove = flash.checkInt(egret.getTimer());
						if(this._session.running)
						{
							this._debug.info("session timer reset",com.google.analytics.debug.VisualDebugMode.geek);
							this._session.reset();
						}
					}

					public endSession(event:egret.TimerEvent)
					{
						this._session.removeEventListener(egret.TimerEvent.TIMER_COMPLETE,flash.bind(this.endSession,this),null);
						this._debug.info("session timer end session",com.google.analytics.debug.VisualDebugMode.geek);
						this._session.reset();
						this._buffer.resetCurrentSession();
						this._debug.info(this._buffer.utmb.toString(),com.google.analytics.debug.VisualDebugMode.geek);
						this._debug.info(this._buffer.utmc.toString(),com.google.analytics.debug.VisualDebugMode.geek);
						this._session.addEventListener(egret.TimerEvent.TIMER_COMPLETE,flash.bind(this.endSession,this),null);
					}

					public checkForIdle(event:egret.TimerEvent)
					{
						var current:number = flash.checkInt(egret.getTimer());
						if(current - this._lastMove >= this._inactivity)
						{
							if(<any>!this._session.running)
							{
								this._debug.info("session timer start",com.google.analytics.debug.VisualDebugMode.geek);
								this._session.start();
							}
						}
					}

				}
			}
		}
	}
}

