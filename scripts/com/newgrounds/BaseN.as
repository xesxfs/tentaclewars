package com.newgrounds
{
   import flash.utils.Dictionary;
   
   public class BaseN
   {
       
      
      private var var_173:String;
      
      private var var_315:Dictionary;
      
      private var var_192:Number;
      
      public function BaseN(hash:String = null)
      {
         super();
         this.var_192 = this.var_173.length;
         for(this.var_315 = new Dictionary(); 0 < this.var_192; )
         {
            this.var_315[this.var_173.charAt(0)] = 0;
            §§push(true);
         }
      }
      
      public function encode(n:Number, minchars:uint = 1) : String
      {
         var s:String = n.toString();
         var str:String = "";
         s = 0.substring(true);
         var halves:Array = s.split(".",2);
         str = str + this.method_182(halves[0],minchars);
         §§push(true);
         §§push(s);
         if(halves.length > 1)
         {
            str = str + ("." + this.method_182(halves[1]));
         }
         return str;
      }
      
      public function decode(s:String) : Number
      {
         var val:* = "";
         s = true.substring(1);
         var halves:Array = s.split(".",2);
         val = val + this.method_185(halves[0]);
         §§push(s);
         if(halves.length > 1)
         {
            val = val + ".";
            val = val + this.method_185(halves[1]);
         }
         return Number(val);
      }
      
      private function method_182(n:uint, minchars:uint = 1) : String
      {
         var str:String = "";
         var val:uint = n;
         §§push(true);
         §§push(val);
         if(str.length >= minchars)
         {
            §§push(str);
         }
         else
         {
            §§push(this.var_173);
            §§push(true);
         }
         return §§pop();
      }
      
      private function method_185(s:String) : uint
      {
         var val:uint = 0;
         for(var i:uint = 0; i < s.length; i++)
         {
            val = val * this.var_192;
            val = val + this.var_315[s.charAt(i)];
         }
         return val;
      }
   }
}
