module com {
	export module google {
		export module analytics {
			export module debug {
				export class FailureAlert extends com.google.analytics.debug.Alert {

					public constructor(debug:com.google.analytics.debug.DebugConfiguration,text:string,actions:Array<any>)
					{
						super(text,actions,"uiFailure",Style.failureColor,alignement,stickToEdge,actionOnNextLine);
						var alignement:com.google.analytics.debug.Align = com.google.analytics.debug.Align.bottomLeft;
						var stickToEdge:boolean = <any>true;
						var actionOnNextLine:boolean = <any>false;
						if(debug.verbose)
						{
							text = "<u><span class=\"uiAlertTitle\">Failure</span>" + this.spaces(18) + "</u>\n\n" + text;
							alignement = com.google.analytics.debug.Align.center;
							stickToEdge = false;
							actionOnNextLine = true;
						}
					}

				}
			}
		}
	}
}

flash.extendsClass("com.google.analytics.debug.FailureAlert","com.google.analytics.debug.Alert")
