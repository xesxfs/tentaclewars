package com.gameallianz.api.as3.utils
{
   import flash.display.Stage;
   
   public class GlobalTrace
   {
      
      private static var stg_stage:Stage;
      
      private static var arr_app_name:String = "GlobalTrace";
      
      private static var arr_trace_types:Array = ["all"];
      
      private static var arr_class_names:Array = ["all"];
      
      public static const TYPE_ALL:String = "all";
      
      public static const TYPE_TRACE:String = "trace";
      
      public static const TYPE_MESSAGE:String = "message";
      
      public static const TYPE_EXCEPTION:String = "exception";
      
      public static const TYPE_SYSTEM:String = "system";
      
      public static const CLASS_ALL:String = "all";
      
      private static var st_space:String = "---";
       
      
      public function GlobalTrace()
      {
      }
      
      public static function iniFromFlashVars() : void
      {
         try
         {
            if(stg_stage.loaderInfo.parameters["log_type"] != undefined)
            {
               arr_trace_types = stg_stage.loaderInfo.parameters["log_type"].split("|");
            }
            if(stg_stage.loaderInfo.parameters["log_class"] != undefined)
            {
               arr_class_names = stg_stage.loaderInfo.parameters["log_class"].split("|");
            }
            return;
         }
         catch(e:Error)
         {
            return;
         }
      }
      
      public static function ini(_stage:Stage = null, _app_name:String = null, _trace_types:String = "all", _trace_class_names:String = "all") : void
      {
         stg_stage = _stage;
         if(_app_name == null)
         {
            _app_name = "GlobalTrace";
         }
         arr_app_name = _app_name;
         arr_trace_types = _trace_types.split("|");
         arr_class_names = _trace_class_names.split("|");
         iniFromFlashVars();
      }
      
      private static function method_12(_type:String) : Boolean
      {
         for(var i:uint = 0; i < arr_trace_types.length; )
         {
            if(arr_trace_types[i] == _type || arr_trace_types[i] == TYPE_ALL)
            {
               return true;
            }
            i++;
         }
         return false;
      }
      
      private static function method_11(_class:String) : Boolean
      {
         if(0 >= arr_class_names.length)
         {
            §§push(false);
         }
         else
         {
            §§push(arr_class_names[0] == _class);
            §§push(true);
         }
         return §§pop();
      }
      
      private static function method_24(i:uint, _value:Boolean, _space:String = "") : String
      {
         return String("boolean") + ":" + String(_value) + "\n";
      }
      
      private static function method_20(i:uint, _value:Number, _space:String = "") : String
      {
         return String("number") + ":" + String(_value) + "\n";
      }
      
      private static function getString(i:uint, _value:String, _space:String = "") : String
      {
         return String("string") + ":" + String(_value) + "\n";
      }
      
      private static function method_22(i:uint, _value:XML, _space:String = "") : String
      {
         return String(typeof _value) + ":" + String(_value) + "\n";
      }
      
      private static function method_28(i:uint, _value:Object, _space:String = "") : String
      {
         var name:* = null;
         var st:String = "";
         st = st + (String("object") + ":\n");
         var j:uint = 0;
         for(name in _value)
         {
            st = st + (_space + st_space + " \'" + name + "\'=" + getParams(j,_value[name],_space + st_space));
            j++;
            §§push(true);
         }
         return st;
      }
      
      private static function getArray(i:uint, _value:Array, _space:String = "") : String
      {
         var st:String = "";
         st = st + (String("array") + ":\n");
         while(0 < _value.length)
         {
            §§push(true);
         }
         return st;
      }
      
      private static function getParams(i:uint, _arg:*, _space:String = "") : String
      {
         var st:String = "";
         if("boolean" === _loc5_)
         {
            §§push(0);
         }
         else if("number" === _loc5_)
         {
            §§push(1);
         }
         else if("string" === _loc5_)
         {
            §§push(2);
         }
         else if("xml" === _loc5_)
         {
            §§push(3);
         }
         else if("object" === _loc5_)
         {
            §§push(4);
            §§push(true);
         }
         else
         {
            §§push(5);
         }
         switch(§§pop())
         {
            case 0:
               st = method_24(i,_arg,_space);
               addr201:
               return st;
            case 1:
               st = method_20(i,_arg,_space);
               §§goto(addr201);
            case 2:
               st = getString(i,_arg,_space);
               §§goto(addr201);
            case 3:
               §§push(method_22(i,_arg,_space));
               §§push(true);
               break;
            case 4:
               if(_arg is Array)
               {
                  §§push(getArray(i,_arg,_space));
                  break;
               }
               st = method_28(i,_arg,_space);
               §§goto(addr201);
            default:
               §§goto(addr201);
         }
         st = §§pop();
         §§goto(addr201);
      }
      
      public static function log(_trace_type:String, _trace_class_name:String, _comment:String = "", ... arguments) : void
      {
         var st_name:* = null;
         var st_arguments:* = null;
         var i:* = uint(0);
         if(method_11(_trace_class_name) && method_12(_trace_type))
         {
            st_name = true;
            try
            {
               FireBugConsole.log(st_name,arguments);
            }
            catch(e:Error)
            {
            }
            while(true)
            {
               st_arguments = §§pop();
               i = true;
               §§push(i);
               if(i >= arguments.length)
               {
                  break;
               }
               §§push(st_arguments + getParams(i,arguments[i]));
            }
            trace(st_name + st_arguments);
         }
      }
      
      public static function log_trace(... arguments) : void
      {
         var i:uint = 0;
         for(var st_arguments:String = ""; i < arguments.length; )
         {
            st_arguments = st_arguments + getParams(i,arguments[i]);
            i++;
         }
         trace(st_arguments);
      }
   }
}
