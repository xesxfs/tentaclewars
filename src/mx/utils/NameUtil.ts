module mx {
	export module utils {
		export class NameUtil extends egret.HashObject {
			public static VERSION:string;
			public static counter:number;

			public constructor()
			{
				super();
				super();
			}

			public static displayObjectToString(displayObject:egret.DisplayObject):string
			{
				var result:string = <any>null;
				var o:egret.DisplayObject = <any>null;
				var s:string = <any>null;
				var indices:Array<any> = <any>null;
				try 
				{
					o = displayObject;
					while(true)
					{
						if(o != null)
						{
							if(o.parent && o.stage && o.parent == o.stage)
							{
								break;
							}
							s = o.name;
							if(flash.As3is(o,null,"mx.core.IRepeaterClient"))
							{
								indices = (<mx.core.IRepeaterClient>(o)).instanceIndices;
								if(indices)
								{
									s = s + ("[" + indices.join("][") + "]");
								}
							}
							result = result == null?s:s + "." + result;
							o = o.parent;
							continue;
						}
					}
				}
				catch(e)
				{}
				break loop0;
			}

			public static createUniqueName(object:any):string
			{
				if(<any>!object)
				{
					return null;
				}
				var name:any = <any>egret.getQualifiedClassName(object);
				var index:number = flash.checkInt(name.indexOf("::"));
				if(index != -1)
				{
					name = name.substr(index + 2);
				}
				var charCode:number = flash.checkInt(name.charCodeAt(name.length - 1));
				if(charCode >= 48 && charCode <= 57)
				{
					name = name + "_";
				}
				return name + mx.utils.NameUtil.counter++;
			}

		}
	}
}

mx.utils.NameUtil.VERSION = "3.5.0.12683";
mx.utils.NameUtil.counter = 0;
