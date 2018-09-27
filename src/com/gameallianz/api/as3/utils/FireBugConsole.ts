module com {
	export module gameallianz {
		export module api {
			export module as3 {
				export module utils {
					export class FireBugConsole extends egret.HashObject {
						public static enabled:boolean;
						public static _isExternalInterfaceAvailable:boolean = false;
						public static isInit:boolean = false;

						public constructor()
						{
							super();
							super();
						}

						public static get isExternalInterfaceAvailable():boolean
						{
							if(<any>!com.gameallianz.api.as3.utils.FireBugConsole.isInit)
							{
								com.gameallianz.api.as3.utils.FireBugConsole._isExternalInterfaceAvailable = flash.ExternalInterface.available;
								com.gameallianz.api.as3.utils.FireBugConsole.isInit = true;
							}
							return com.gameallianz.api.as3.utils.FireBugConsole._isExternalInterfaceAvailable;
						}

						public static log(...rest)
						{
							com.gameallianz.api.as3.utils.FireBugConsole.send("log",rest);
						}

						public static debug(...rest)
						{
							com.gameallianz.api.as3.utils.FireBugConsole.send("debug",rest);
						}

						public static warn(...rest)
						{
						}

						public static info(...rest)
						{
						}

						public static error_1(...rest)
						{
						}

						public static assert(...rest)
						{
							com.gameallianz.api.as3.utils.FireBugConsole.send("assert",rest);
						}

						public static dir(object:any)
						{
						}

						public static dirxml(object:flash.XML)
						{
							com.gameallianz.api.as3.utils.FireBugConsole.send("dirxml",[object]);
						}

						public static traceStack()
						{
							com.gameallianz.api.as3.utils.FireBugConsole.send("trace");
						}

						public static group(...rest)
						{
						}

						public static groupEnd()
						{
							com.gameallianz.api.as3.utils.FireBugConsole.send("groupEnd",[]);
						}

						public static time(name:string)
						{
							com.gameallianz.api.as3.utils.FireBugConsole.send("time",[name]);
						}

						public static timeEnd(name:string)
						{
							com.gameallianz.api.as3.utils.FireBugConsole.send("timeEnd",[name]);
						}

						public static profile(title:string)
						{
						}

						public static profileEnd()
						{
						}

						public static count(name:string = null)
						{
							com.gameallianz.api.as3.utils.FireBugConsole.send("count",<any>!<any>!name?[name]:[]);
						}

						public static dumpAvailableFonts()
						{
							var f:flash.Font = <any>null;
							com.gameallianz.api.as3.utils.FireBugConsole.debug("--- < Available Fonts > ---");
							var embeddedFonts:Array<any> = <any>flash.Font["enumerateFonts"](false);
							for(var i:number = flash.checkUint(0);i < embeddedFonts.length; i++)
							{
								f = embeddedFonts[i];
								com.gameallianz.api.as3.utils.FireBugConsole.debug(f.fontName);
							}
							com.gameallianz.api.as3.utils.FireBugConsole.debug("--- </Available Fonts > ---");
						}

						private static send(level:string,...rest)
						{
							if(com.gameallianz.api.as3.utils.FireBugConsole.enabled)
							{
								if(com.gameallianz.api.as3.utils.FireBugConsole.isExternalInterfaceAvailable)
								{
									try 
									{
										flash.ExternalInterface.call("console." + level,rest[0]);
										return ;
									}
									catch(e)
									{
										return ;
									}
								}
							}
						}

						public static describeObject(obj:any):string
						{
							return flash.describeType(obj).dotAlt("name").toString();
						}

						public static logDescribe(obj:any,...rest)
						{
							com.gameallianz.api.as3.utils.FireBugConsole.log(com.gameallianz.api.as3.utils.FireBugConsole.describeObject(obj),rest);
						}

						public static disable()
						{
							com.gameallianz.api.as3.utils.FireBugConsole.enabled = false;
						}

						public static enable()
						{
							com.gameallianz.api.as3.utils.FireBugConsole.enabled = true;
						}

						private static method_17(o:any):any
						{
							var n:any = undefined;
							if(flash.As3is(o,flash.XML))
							{
								o = o.toString();
							}
							else
							{
								for(n in o)
								{
									return com.gameallianz.api.as3.utils.FireBugConsole.method_17(o[n]);
								}
							}
							return o;
						}

					}
				}
			}
		}
	}
}

com.gameallianz.api.as3.utils.FireBugConsole.enabled = true;
