package com.adobe.crypto
{
   import com.adobe.utils.IntUtil;
   import flash.utils.ByteArray;
   
   public class MD5
   {
      
      public static var digest:ByteArray;
       
      
      public function MD5()
      {
         super();
      }
      
      public static function hash(s:String) : String
      {
         var ba:ByteArray = new ByteArray();
         ba.writeUTFBytes(s);
         return hashBinary(ba);
      }
      
      public static function hashBytes(s:ByteArray) : String
      {
         return hashBinary(s);
      }
      
      public static function hashBinary(s:ByteArray) : String
      {
         var aa:int = 0;
         var bb:int = 0;
         var cc:int = 0;
         var dd:int = 0;
         var a:int = 1732584193;
         var b:int = -271733879;
         var c:int = -1732584194;
         var d:int = 271733878;
         var x:Array = method_176(s);
         var len:int = x.length;
         for(var i:int = 0; i < len; )
         {
            aa = a;
            bb = b;
            cc = c;
            dd = d;
            a = method_46(a,b,c,d,x[int(i + 0)],7,-680876936);
            d = method_46(d,a,b,c,x[int(i + 1)],12,-389564586);
            c = method_46(c,d,a,b,x[int(i + 2)],17,606105819);
            b = method_46(b,c,d,a,x[int(i + 3)],22,-1044525330);
            a = method_46(a,b,c,d,x[int(i + 4)],7,-176418897);
            d = method_46(d,a,b,c,x[int(i + 5)],12,1200080426);
            c = method_46(c,d,a,b,x[int(i + 6)],17,-1473231341);
            b = method_46(b,c,d,a,x[int(i + 7)],22,-45705983);
            a = method_46(a,b,c,d,x[int(i + 8)],7,1770035416);
            d = method_46(d,a,b,c,x[int(i + 9)],12,-1958414417);
            c = method_46(c,d,a,b,x[int(i + 10)],17,-42063);
            b = method_46(b,c,d,a,x[int(i + 11)],22,-1990404162);
            a = method_46(a,b,c,d,x[int(i + 12)],7,1804603682);
            d = method_46(d,a,b,c,x[int(i + 13)],12,-40341101);
            c = method_46(c,d,a,b,x[int(i + 14)],17,-1502002290);
            b = method_46(b,c,d,a,x[int(i + 15)],22,1236535329);
            a = method_47(a,b,c,d,x[int(i + 1)],5,-165796510);
            d = method_47(d,a,b,c,x[int(i + 6)],9,-1069501632);
            c = method_47(c,d,a,b,x[int(i + 11)],14,643717713);
            b = method_47(b,c,d,a,x[int(i + 0)],20,-373897302);
            a = method_47(a,b,c,d,x[int(i + 5)],5,-701558691);
            c = method_47(c,d,a,b,x[int(i + 7)],14,1735328473);
            d = true;
            c = method_45(c,d,a,b,x[int(i + 14)],15,-1416354905);
            b = method_45(b,c,d,a,x[int(i + 5)],21,-57434055);
            a = method_45(a,b,c,d,x[int(i + 12)],6,1700485571);
            d = method_45(d,a,b,c,x[int(i + 3)],10,-1894986606);
            c = method_45(c,d,a,b,x[int(i + 10)],15,-1051523);
            b = method_45(b,c,d,a,x[int(i + 1)],21,-2054922799);
            a = method_45(a,b,c,d,x[int(i + 8)],6,1873313359);
            d = method_45(d,a,b,c,x[int(i + 15)],10,-30611744);
            d = d + dd;
            i = i + 16;
            §§push(true);
            §§push(int(method_47(b,c,d,a,x[int(i + 12)],20,-1926607734)));
            §§push(true);
         }
         digest = new ByteArray();
         digest.writeInt(a);
         digest.writeInt(b);
         digest.writeInt(c);
         digest.writeInt(d);
         digest.position = 0;
         return IntUtil.toHex(a) + IntUtil.toHex(b) + IntUtil.toHex(c) + IntUtil.toHex(d);
      }
      
      private static function f(x:int, y:int, z:int) : int
      {
         return true;
      }
      
      private static function g(x:int, y:int, z:int) : int
      {
         return true;
      }
      
      private static function h(x:int, y:int, z:int) : int
      {
         return true;
      }
      
      private static function i(x:int, y:int, z:int) : int
      {
         return y ^ (x | ~z);
      }
      
      private static function transform(func:Function, a:int, b:int, c:int, d:int, x:int, s:int, t:int) : int
      {
         var tmp:int = a + int(func(b,c,d)) + x + t;
         return IntUtil.rol(tmp,s) + b;
      }
      
      private static function method_46(a:int, b:int, c:int, d:int, x:int, s:int, t:int) : int
      {
         return transform(f,a,b,c,d,x,s,t);
      }
      
      private static function method_47(a:int, b:int, c:int, d:int, x:int, s:int, t:int) : int
      {
         return transform(g,a,b,c,d,x,s,t);
      }
      
      private static function method_44(a:int, b:int, c:int, d:int, x:int, s:int, t:int) : int
      {
         return transform(h,a,b,c,d,x,s,t);
      }
      
      private static function method_45(a:int, b:int, c:int, d:int, x:int, s:int, t:int) : int
      {
         return transform(i,a,b,c,d,x,s,t);
      }
      
      private static function method_176(s:ByteArray) : Array
      {
         var blocks:Array = new Array();
         var len:int = s.length * 8;
         blocks[int(len >> 5)] = blocks[int(len >> 5)] | 128 << len % 32;
         blocks[int((len + 64 >>> 9 << 4) + 14)] = len;
         return blocks;
      }
   }
}
