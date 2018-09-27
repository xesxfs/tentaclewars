module com {
	export module google {
		export module analytics {
			export module debug {
				export class GIFRequestAlert extends com.google.analytics.debug.Alert {

					public constructor(text:string,actions:Array<any>)
					{
						super(text,actions);
					}

				}
			}
		}
	}
}

flash.extendsClass("com.google.analytics.debug.GIFRequestAlert","com.google.analytics.debug.Alert")
