module com {
	export module google {
		export module analytics {
			export module core {
				export class Domain extends egret.HashObject {
					private _mode:com.google.analytics.core.DomainNameMode;
					private _debug:com.google.analytics.debug.DebugConfiguration;
					private _name:string;

					public constructor(mode:com.google.analytics.core.DomainNameMode = null,name:string = "",debug:com.google.analytics.debug.DebugConfiguration = null)
					{
						super();
						super();
						this._debug = debug;
						if(mode == null)
						{
							mode = com.google.analytics.core.DomainNameMode.auto;
						}
						this._mode = mode;
						if(mode == com.google.analytics.core.DomainNameMode.custom)
						{
							this.name = name;
						}
						else
						{
							this._name = name;
						}
					}

					public get mode():com.google.analytics.core.DomainNameMode
					{
						return this._mode;
					}

					public set mode(value:com.google.analytics.core.DomainNameMode)
					{
						this._mode = value;
						if(this._mode == com.google.analytics.core.DomainNameMode.none)
						{
							this._name = "";
						}
					}

					public get name():string
					{
						return this._name;
					}

					public set name(value:string)
					{
						if(value.charAt(0) != "." && this._debug)
						{
							this._debug.warning("missing leading period \".\", cookie will only be accessible on " + value,com.google.analytics.debug.VisualDebugMode.geek);
						}
						this._name = value;
					}

				}
			}
		}
	}
}

