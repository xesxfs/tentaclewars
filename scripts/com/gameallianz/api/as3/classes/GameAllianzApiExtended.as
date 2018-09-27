package com.gameallianz.api.as3.classes
{
   import com.gameallianz.api.as3.GameAllianzApiEvent;
   import com.gameallianz.api.as3.GameAllianzApiLocalization;
   import com.gameallianz.api.as3.gui.Background;
   import com.gameallianz.api.as3.utils.GlobalTrace;
   import flash.display.Loader;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.net.URLLoader;
   import flash.net.URLLoaderDataFormat;
   import flash.net.URLRequest;
   import flash.system.ApplicationDomain;
   import flash.system.Capabilities;
   import flash.system.LoaderContext;
   import flash.system.Security;
   import flash.text.TextField;
   import flash.utils.ByteArray;
   import flash.utils.Timer;
   
   public class GameAllianzApiExtended
   {
      
      private static var b_ini_flag:Boolean = false;
      
      private static var b_preloader_debug:Boolean = false;
      
      private static var b_engine_flag:Boolean = false;
      
      private static var b_modal_flag:Boolean = false;
      
      private static var arr_query:Array = new Array();
      
      private static var ed_listener:EventDispatcher;
      
      private static var loader_engine:Loader;
      
      private static var loader_engine_url:URLLoader;
      
      private static var t_preloder_timer:Timer;
      
      private static var n_preloder_loaded:Number;
      
      private static var n_preloder_total:Number;
      
      private static var sp_delay:Sprite;
      
      private static var sp_bg:Background;
      
      private static var b_debug_mode:Boolean = false;
      
      private static var n_total_frames:Number;
      
      private static var n_frames_loaded:Number;
      
      private static var tfErrors:TextField;
      
      private static var loaderSecure:Loader;
       
      
      public function GameAllianzApiExtended()
      {
      }
      
      public static function action(... arguments) : *
      {
         var value:* = undefined;
         var st_lng:String = null;
         var b_s:* = undefined;
         var b_m:* = undefined;
         var siteName:String = null;
         var patnerName:String = null;
         var multiLanguage:Boolean = false;
         var _act:String = arguments[0] as String;
         if(GameAllianzApiActions.INI === _loc11_)
         {
            §§push(0);
         }
         else
         {
            §§push(GameAllianzApiInternalActions.GET_GAME_PARAM);
            §§push(_loc11_ === true?2:GameAllianzApiActions.GET_SOUND === _loc11_?3:GameAllianzApiActions.GET_MUSIC === _loc11_?4:GameAllianzApiActions.NAVIGATE === _loc11_?5:6);
         }
         switch(§§pop())
         {
            case 0:
               GameAllianzApiGlobal.stage = arguments[1];
               if(GameAllianzApiGlobal.stage == null)
               {
                  method_2(new GameAllianzApiMessage(GameAllianzApiEvent.ERROR,null,1));
                  return;
               }
               if(b_ini_flag == false)
               {
                  GlobalTrace.ini(GameAllianzApiGlobal.stage,"GameAllianzApi",GlobalTrace.TYPE_ALL,GlobalTrace.CLASS_ALL);
                  if(Security.sandboxType != Security.APPLICATION)
                  {
                     Security.allowDomain("*");
                     Security.allowInsecureDomain("*");
                  }
                  siteName = arguments[2] as String;
                  patnerName = arguments[3] as String;
                  multiLanguage = true[5] as Boolean;
                  b_debug_mode = arguments[6] as Boolean;
                  GameAllianzApiGlobal.site_name = siteName;
                  GameAllianzApiGlobal.partner_name = patnerName;
                  GameAllianzApiGlobal.game_name = null;
                  GameAllianzApiGlobal.multilanguage = multiLanguage;
                  arr_query = new Array();
                  method_18(arguments);
                  method_25();
                  b_ini_flag = true;
                  method_10();
                  return;
                  §§push(arguments);
                  §§push(true);
               }
               else
               {
                  return method_3.apply(null,arguments);
               }
            case 1:
               value = method_3.apply(null,arguments);
               if(value == null)
               {
                  value = true;
               }
               return value;
            case 2:
               st_lng = method_3.apply(null,arguments);
               if(st_lng != null)
               {
                  return st_lng;
               }
               return GameAllianzApiGlobal.language;
            case 3:
               b_s = method_3.apply(null,arguments);
               if(b_s != null)
               {
                  return Boolean(b_s);
               }
               return GameAllianzApiGlobal.sound;
            case 4:
               b_m = method_3.apply(null,arguments);
               if(b_m != null)
               {
                  return Boolean(b_m);
               }
               return GameAllianzApiGlobal.music;
            case 5:
               if(method_3.apply(null,arguments) != true)
               {
                  try
                  {
                     GameAllianzApiGlobal.getURL("http://www." + GameAllianzApiGlobal.site_name + ".com/?utm_campaign=" + GameAllianzApiGlobal.game_name + "&utm_source=" + GameAllianzApiGlobal.domain + "&utm_medium=error_navigate_api[" + arguments[1] + "]");
                     return;
                  }
                  catch(e:Error)
                  {
                     return;
                  }
               }
               return;
            default:
               return method_3.apply(null,arguments);
         }
      }
      
      private static function method_3(... arguments) : *
      {
         var res:* = undefined;
         method_1("ACTION " + arguments[0]);
         try
         {
            if(arguments[0] == GameAllianzApiActions.INI)
            {
               arguments.push(GameAllianzApiGlobal.getGameInfo());
            }
            res = (GameAllianzApiGlobal.engine[GameAllianzApiGlobal.ENGINE_ACTION] as Function).apply(null,arguments);
            return res;
         }
         catch(e:Error)
         {
            method_2(new GameAllianzApiMessage(GameAllianzApiEvent.ERROR,arguments[0] + ": " + e.toString(),5));
            method_1(e.toString());
         }
         return null;
      }
      
      private static function method_19(event:GameAllianzApiEvent) : void
      {
         b_engine_flag = true;
         removeEventListener(GameAllianzApiInternalEvent.INI_ENGINE_COMPLETED,method_19);
      }
      
      private static function method_16() : String
      {
         var name:* = null;
         var obj:Object = new Object();
         var st:String = "";
         obj = GameAllianzApiGlobal.stage.loaderInfo.parameters;
         for(name in obj)
         {
            st = st + ("&" + name + "=" + obj[name]);
         }
         return st;
      }
      
      private static function method_10() : void
      {
         var request:URLRequest = null;
         var url:String = GameAllianzApiGlobal.st_url;
         var url_hash:String = "?" + GameAllianzApiGlobal.getCashDay();
         var /*UnknownSlot*/:* = new URLRequest(url);
         §§push(loadEngine$0);
         if(b_engine_flag == false)
         {
            loader_engine_url = new URLLoader();
            loaderSecure = new Loader();
            method_23();
            if(Security.sandboxType != Security.APPLICATION)
            {
               url = GameAllianzApiGlobal.st_securi_url + "?" + GameAllianzApiGlobal.st_api_version + "_" + GameAllianzApiGlobal.getCashDay();
               method_1(url);
               /*UnknownSlot*/.contentType = "application/octet-stream";
               loader_engine_url.dataFormat = URLLoaderDataFormat.BINARY;
               try
               {
                  loader_engine_url.load(request);
                  return;
               }
               catch(e:Error)
               {
                  method_1(e.toString());
                  §§push(false);
                  if(Security.sandboxType != Security.APPLICATION)
                  {
                     loadLocal();
                     §§push(false);
                  }
                  else
                  {
                     method_4();
                  }
                  return;
               }
            }
            else
            {
               method_6();
            }
         }
      }
      
      private static function loadLocal() : void
      {
         var ba:ByteArray = GameAllianzApiDepositary.engineByteArray();
         §§push(true);
         if(ba != null)
         {
            method_7(ba);
         }
         else
         {
            method_4();
         }
      }
      
      private static function method_23() : void
      {
         addEventListener(GameAllianzApiInternalEvent.INI_ENGINE_COMPLETED,method_19);
         loaderSecure.contentLoaderInfo.addEventListener(Event.COMPLETE,method_9);
         loaderSecure.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,method_4);
      }
      
      private static function method_5() : void
      {
         loader_engine_url.removeEventListener(Event.COMPLETE,method_21);
         loader_engine_url.removeEventListener(IOErrorEvent.IO_ERROR,method_13);
         loaderSecure.contentLoaderInfo.removeEventListener(Event.COMPLETE,method_9);
         loaderSecure.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,method_4);
      }
      
      private static function method_21(event:Event = null) : void
      {
         method_1("Event.COMPLETE - handlerEngineIni");
         method_5();
         method_7();
      }
      
      private static function method_7(_byte_array:ByteArray = null) : void
      {
         var b:ByteArray = null;
         if(_byte_array == null)
         {
            method_1("ENGINE FROM INET");
            b = loader_engine_url.data as ByteArray;
         }
         else
         {
            method_1("ENGINE FROM LOCAL");
            b = _byte_array;
         }
         b.uncompress();
         loaderSecure = new Loader();
         var loaderContext:LoaderContext = new LoaderContext(false,ApplicationDomain.currentDomain);
         try
         {
            loaderContext["allowCodeImport"] = true;
         }
         catch(e:Error)
         {
         }
         loaderSecure.contentLoaderInfo.addEventListener(Event.COMPLETE,method_9);
         loaderSecure.loadBytes(b,loaderContext);
      }
      
      private static function method_9(_event:Event = null, _sp:Sprite = null) : void
      {
         method_1("Event.COMPLETE iniEngineEventsSecure");
         GameAllianzApiGlobal.engine = loaderSecure.content as Sprite;
         §§push(false);
         if(_sp)
         {
            GameAllianzApiGlobal.engine = _sp;
         }
         GameAllianzApiGlobal.stage.addChild(GameAllianzApiGlobal.engine);
         GameAllianzApiGlobal.engine.addEventListener(GameAllianzApiInternalEvent.ENGINE_SEND_MESSAGE,handlerEngineMessage);
         GameAllianzApiGlobal.engine.addEventListener(GameAllianzApiInternalEvent.ENGINE_INI_EXTERNAL_DISPLAY_OBJECT,method_32);
         GameAllianzApiGlobal.engine.addEventListener(GameAllianzApiInternalEvent.ENGINE_MODAL_FORM,method_8);
         method_2(new GameAllianzApiMessage(GameAllianzApiInternalEvent.INI_ENGINE_COMPLETED));
      }
      
      private static function method_13(event:* = null) : void
      {
         loadLocal();
      }
      
      private static function method_4(event:* = null) : void
      {
         method_2(new GameAllianzApiMessage(GameAllianzApiEvent.ERROR,null,4));
         method_5();
      }
      
      private static function method_6() : void
      {
         GameAllianzApiGlobal.stage.addEventListener(Event.ENTER_FRAME,handlerDeafaultLoaderChecker);
      }
      
      private static function handlerDeafaultLoaderChecker(_event:Event = null) : void
      {
         var evt:GameAllianzApiInternalEvent = null;
         if(GameAllianzApiGlobal.stage.loaderInfo.bytesLoaded == GameAllianzApiGlobal.stage.loaderInfo.bytesTotal)
         {
            method_1("handlerDeafaultLoaderChecker");
            method_1("application loaded w/o GameAllianz API");
            GameAllianzApiGlobal.stage.removeEventListener(Event.ENTER_FRAME,handlerDeafaultLoaderChecker);
            method_2(new GameAllianzApiMessage(GameAllianzApiEvent.API_INITIALISED,"application loaded w/o GameAllianz API"));
            evt = new GameAllianzApiInternalEvent(GameAllianzApiInternalEvent.ENGINE_MODAL_FORM);
            method_8(evt);
            §§push(true);
         }
      }
      
      private static function method_18(arguments:Array) : void
      {
      }
      
      private static function method_27(... arguments) : void
      {
         if(b_engine_flag)
         {
            if(arr_query.length > 0)
            {
               action.apply(null,arr_query.shift());
            }
         }
      }
      
      private static function method_25() : void
      {
         addEventListener(GameAllianzApiEvent.LANGUAGE_ON_CHANGE,method_31);
         addEventListener(GameAllianzApiEvent.MUSIC_ON_CHANGE,method_29);
         addEventListener(GameAllianzApiEvent.SOUND_ON_CHANGE,method_34);
      }
      
      private static function method_31(_evnt:GameAllianzApiEvent) : void
      {
         var current_language:String = _evnt.message_1.value_1 as String;
         GameAllianzApiLocalization.language = current_language;
      }
      
      private static function method_29(_evnt:GameAllianzApiEvent) : void
      {
         var b_music:Boolean = Boolean(_evnt.message_1.value_1);
         GameAllianzApiGlobal.music = b_music;
      }
      
      private static function method_34(_evnt:GameAllianzApiEvent) : void
      {
         var b_sound:Boolean = Boolean(_evnt.message_1.value_1);
         GameAllianzApiGlobal.sound = b_sound;
      }
      
      public static function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:uint = 0, useWeakReference:Boolean = false) : void
      {
         if(!ed_listener)
         {
            ed_listener = new EventDispatcher();
         }
         ed_listener.addEventListener(type,listener,useCapture,priority,useWeakReference);
      }
      
      public static function removeEventListener(type:String, listener:Function, useCapture:Boolean = false) : void
      {
         if(!ed_listener)
         {
            ed_listener = new EventDispatcher();
         }
         ed_listener.removeEventListener(type,listener,useCapture);
      }
      
      private static function dispatchEvent(event:GameAllianzApiEvent) : void
      {
         if(!ed_listener)
         {
            ed_listener = new EventDispatcher();
         }
         ed_listener.dispatchEvent(event);
      }
      
      private static function method_8(_event:Event) : void
      {
         if(_event["value"] == 1)
         {
            b_modal_flag = true;
            sp_bg.active = true;
         }
         else
         {
            b_modal_flag = false;
            sp_bg.active = false;
            §§push(false);
         }
      }
      
      private static function method_32(_event:Event) : void
      {
         var name:String = null;
         var mc:MovieClip = null;
         /*UnknownSlot*/.addChild(loader);
      }
      
      private static function handlerEngineMessage(_event:Event) : void
      {
         "handlerEngineMessage".method_1(true);
         var msg:GameAllianzApiMessage = new GameAllianzApiMessage(_event["message"].event,_event["message"].value,_event["message"].error_id);
         method_2(msg);
      }
      
      private static function method_2(_message:GameAllianzApiMessage = null) : void
      {
         var event:GameAllianzApiEvent = new GameAllianzApiEvent(_message.event_1);
         event.message_1 = _message;
         dispatchEvent(event);
      }
      
      private static function method_1(_txt:String = null) : void
      {
      }
   }
}
