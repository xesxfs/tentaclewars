module com {
	export module google {
		export module analytics {
			export module core {
				export class RequestObject extends egret.HashObject {
					public start:number = 0;
					public end:number = 0;
					public request:egret.URLRequest;

					public constructor(request:egret.URLRequest)
					{
						super();
						super();
						this.start = flash.checkInt(egret.getTimer());
						this.request = request;
					}

					public hasCompleted():boolean
					{
						return this.end > 0;
					}

					public toString():string
					{
						var data:Array<any> = [];
						data.push("duration: " + this.duration + "ms");
						data.push("url: " + this.request.url);
						return "{ " + data.join(", ") + " }";
					}

					public complete()
					{
						this.end = flash.checkInt(egret.getTimer());
					}

					public get duration():number
					{
						if(<any>!this.hasCompleted())
						{
							return 0;
						}
						return this.end - this.start;
					}

				}
			}
		}
	}
}

