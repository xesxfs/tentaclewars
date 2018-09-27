package com.newgrounds
{
   public class RC4
   {
      
      private static var sbox:Array = new Array(255);
      
      private static var mykey:Array;
       
      
      public function RC4()
      {
      }
      
      public static function encrypt(src:String, key:String) : String
      {
         var mtxt:Array = method_56(src);
         var mkey:Array = method_56(key);
         var result:Array = method_67(mtxt,mkey);
         return method_193(result);
      }
      
      public static function encryptbin(src:String, key:String) : Array
      {
         var mtxt:Array = method_56(src);
         var mkey:Array = method_56(key);
         var result:Array = method_67(mtxt,mkey);
         return result;
      }
      
      public static function decrypt(src:String, key:String) : String
      {
         var mtxt:Array = method_133(src);
         var mkey:Array = method_56(key);
         var result:Array = method_67(mtxt,mkey);
         return method_122(result);
      }
      
      private static function method_184(pwd:Array) : void
      {
         var tempSwap:uint = 0;
         var b:uint = 0;
         var intLength:uint = pwd.length;
         for(var a:uint = 0; a <= 255; a++)
         {
            mykey[a] = pwd[a % intLength];
            sbox[a] = a;
         }
         for(a = 0; a <= 255; )
         {
            b = (b + sbox[a] + mykey[a]) % 256;
            tempSwap = sbox[a];
            a[true] = tempSwap;
            a++;
            §§push(sbox);
         }
      }
      
      private static function method_67(plaintxt:Array, psw:Array) : Array
      {
         var k:uint = 0;
         var temp:uint = 0;
         var cipherby:uint = 0;
         var idx:uint = 0;
         var i:uint = 0;
         var j:uint = 0;
         var cipher:Array = new Array();
         for(; §§pop() < plaintxt.length; §§push(uint(0 + 1)),§§push(true))
         {
            i = (i + 1) % 256;
            j = (j + sbox[i]) % 256;
            temp = sbox[i];
            sbox[i] = sbox[j];
            sbox[j] = temp;
            idx = (sbox[i] + sbox[j]) % 256;
            k = sbox[idx];
            cipherby = plaintxt[0] ^ k;
            cipher.push(cipherby);
         }
         return cipher;
      }
      
      private static function method_193(chars:Array) : String
      {
         var result:String = new String("");
         var hexes:Array = new Array("0","1","2","3","4","5","6","7","8","9","a","b","c","d","e","f");
         for(var i:uint = 0; i < chars.length; i++)
         {
            result = result + (hexes[chars[i] >> 4] + hexes[chars[i] & 15]);
         }
         return result;
      }
      
      private static function method_133(hex:String) : Array
      {
         var codes:Array = new Array();
         for(var i:uint = hex.substr(0,2) == "0x"?uint(2):uint(0); §§pop() < hex.length; §§push(uint(i + 2)),§§push(true))
         {
            codes.push(parseInt(hex.substr(i,2),16));
         }
         return codes;
      }
      
      private static function method_122(chars:Array) : String
      {
         var result:String = new String("");
         var i:uint = 0;
         if(i < chars.length)
         {
            i++;
            §§push(true);
            §§push(true);
         }
         return result;
      }
      
      private static function method_56(str:String) : Array
      {
         var codes:Array = new Array();
         var i:uint = 0;
         if(i < str.length)
         {
            codes.push(str.charCodeAt(i));
            i++;
            §§push(true);
         }
         return codes;
      }
   }
}
