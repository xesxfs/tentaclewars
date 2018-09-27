package com.gameallianz.api.as3.utils
{
   import com.gameallianz.api.as3.classes.GameAllianzApiGlobal;
   
   public final class NumberCrypto
   {
       
      
      private var var_9:Number;
      
      private var var_7:NumberCrypto;
      
      private var var_3:Number;
      
      public function NumberCrypto(digit:Number = 0, index:uint = 0)
      {
         super();
         this.var_3 = 0;
         this.setValue(digit,index);
      }
      
      public function set crypt_value(v:String) : void
      {
         var v2:Number = GameAllianzApiGlobal.uncryptObj(v)["value"];
         this.setValue(v2);
      }
      
      public function get crypt_value() : String
      {
         trace(">>>get crypt_value");
         return GameAllianzApiGlobal.cryptObj({"value":this.value_1});
      }
      
      public function get value_1() : Number
      {
         return Number(this.toString());
      }
      
      public function set value_1(v:Number) : void
      {
         trace("------------------- set value " + new Date().getTime());
         this.setValue(v);
      }
      
      public function addValue(inc:Number) : void
      {
         this.value_1 = this.value_1 + inc;
      }
      
      public function setValue(digit:Number = 0, index:uint = 0) : void
      {
         var s:String = digit.toString();
         this.var_9 = s.charCodeAt(index++) ^ this.var_3;
         §§push(true);
         if(index < s.length)
         {
            this.var_7 = new NumberCrypto(digit,index);
         }
         else
         {
            this.var_7 = null;
         }
         this.reencode();
      }
      
      public function reencode() : void
      {
         var newEncode:uint = int(2147483647 * Math.random());
         this.var_9 = this.var_9 ^ (newEncode ^ this.var_3);
      }
      
      public function toString() : String
      {
         var s:String = String.fromCharCode(this.var_9 ^ this.var_3);
         §§push(true);
         if(this.var_7 != null)
         {
            s = s + this.var_7.toString();
         }
         return s;
      }
   }
}
