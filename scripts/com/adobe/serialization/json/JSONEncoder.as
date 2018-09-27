package com.adobe.serialization.json
{
   import flash.utils.describeType;
   
   public class JSONEncoder
   {
       
      
      private var var_313:String;
      
      public function JSONEncoder(value:*)
      {
         super();
      }
      
      public function getString() : String
      {
         return this.var_313;
      }
      
      private function method_91(value:*) : String
      {
         §§push(true);
         if(value != null)
         {
            return this.method_292(value);
         }
         return "null";
      }
      
      private function method_107(str:String) : String
      {
         var ch:String = null;
         var hexCode:String = null;
         var zeroPad:String = null;
         var s:* = "";
         var len:Number = str.length;
         for(var i:int = 0; i < len; )
         {
            ch = str.charAt(i);
            switch(ch)
            {
               case "\"":
                  s = s + "\\\"";
                  break;
               case "\\":
                  s = s + "\\\\";
                  break;
               case "\b":
                  s = s + "\\b";
                  break;
               case "\f":
                  s = s + "\\f";
                  break;
               case "\n":
                  s = s + "\\n";
                  break;
               case "\r":
                  s = s + "\\r";
                  break;
               case "\t":
                  s = s + "\\t";
                  break;
               default:
                  if(ch < " ")
                  {
                     hexCode = ch.charCodeAt(0).toString(16);
                     zeroPad = hexCode.length == 2?"00":"000";
                     s = s + ("\\u" + zeroPad + hexCode);
                     break;
                  }
                  s = s + ch;
                  break;
            }
            i++;
         }
         return "\"" + s + "\"";
      }
      
      private function method_236(a:Array) : String
      {
         var s:String = "";
         var i:int = 0;
         while(true)
         {
            if(i >= a.length)
            {
               §§push("[");
               break;
            }
            if(s.length > 0)
            {
               §§push(s + ",");
               §§push(true);
               break;
            }
            s = s + this.method_91(a[i]);
            i++;
         }
         return true;
      }
      
      private function method_292(o:Object) : String
      {
         var value:Object = null;
         var key:String = null;
         var s:String = "";
         §§push(true);
         §§push(true);
         §§push(objectToString$0);
         if(/*UnknownSlot*/.@name.toString() == "Object")
         {
            for(key in o)
            {
               value = o[key];
               if(!(value is Function))
               {
                  var /*UnknownSlot*/:* = true;
                  §§push(objectToString$0);
                  §§push(true);
               }
            }
            §§push(true);
         }
         for each(v in classInfo..name_1.(name() == "variable" || name() == "accessor"))
         {
            if(s.length > 0)
            {
               s = s + ",";
            }
            s = s + (this.method_107(v.@name.toString()) + ":" + this.method_91(o[v.@name]));
         }
         return "{" + s + "}";
      }
   }
}
