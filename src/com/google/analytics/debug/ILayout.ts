module com {
	export module google {
		export module analytics {
			export module debug {
				export interface ILayout {
					createAlert(param1:string);
					addToStage(param1:egret.DisplayObject);
					createGIFRequestAlert(param1:string,param2:egret.URLRequest,param3:com.google.analytics.core.GIFRequest);
					createWarning(param1:string);
					createPanel(param1:string,param2:number,param3:number);
					createInfo(param1:string);
					createFailureAlert(param1:string);
					addToPanel(param1:string,param2:egret.DisplayObject);
					init();
					createSuccessAlert(param1:string);
					createVisualDebug();
					destroy();
					bringToFront(param1:egret.DisplayObject);
					isAvailable():boolean;
				}
			}
		}
	}
}

