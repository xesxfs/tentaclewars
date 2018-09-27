package com.gamezhero.as3.crypto
{
   import com.gamezhero.as3.utils.IntUtil;
   
   public class MD5
   {
       
      
      public function MD5()
      {
         super();
      }
      
      private function method_46(a:int, b:int, c:int, d:int, x:int, s:int, t:int) : int
      {
         return this.transform(this.f,a,b,c,d,x,s,t);
      }
      
      private function method_176(s:String) : Array
      {
         var blocks:Array = new Array();
         var len:int = s.length * 8;
         for(var i:int = 0; i < len; i = i + 8)
         {
            blocks[i >> 5] = blocks[i >> 5] | (s.charCodeAt(i / 8) & 255) << i % 32;
         }
         blocks[len >> 5] = blocks[len >> 5] | 128 << len % 32;
         blocks[(len + 64 >>> 9 << 4) + 14] = len;
         return blocks;
      }
      
      private function f(x:int, y:int, z:int) : int
      {
         return x & y | ~x & z;
      }
      
      private function method_44(a:int, b:int, c:int, d:int, x:int, s:int, t:int) : int
      {
         return this.transform(this.h,a,b,c,d,x,s,t);
      }
      
      private function h(x:int, y:int, z:int) : int
      {
         return x ^ y ^ z;
      }
      
      private function i(x:int, y:int, z:int) : int
      {
         return true;
      }
      
      private function transform(func:Function, a:int, b:int, c:int, d:int, x:int, s:int, t:int) : int
      {
         var tmp:int = a + int(func(b,c,d)) + x + t;
         return IntUtil.rol(tmp,s) + b;
      }
      
      private function g(x:int, y:int, z:int) : int
      {
         return x & z | y & ~z;
      }
      
      private function method_45(a:int, b:int, c:int, d:int, x:int, s:int, t:int) : int
      {
         return this.transform(this.i,a,b,c,d,x,s,t);
      }
      
      public function hash(s:String) : String
      {
         var aa:int = 0;
         var bb:int = 0;
         var a:int = 1732584193;
         var b:int = -271733879;
         var c:int = -1732584194;
         var d:int = 271733878;
         var x:Array = this.method_176(s);
         var len:int = x.length;
         for(var i:int = 0; i < len; )
         {
            aa = a;
            bb = b;
            c = this.method_47(c,d,a,b,x[i + 11],14,643717713);
            b = this.method_47(b,c,d,a,x[i + 0],20,-373897302);
            a = this.method_47(a,b,c,d,x[i + 5],5,-701558691);
            d = this.method_47(d,a,b,c,x[i + 10],9,38016083);
            c = this.method_47(c,d,a,b,x[i + 15],14,-660478335);
            b = this.method_47(b,c,d,a,x[i + 4],20,-405537848);
            a = this.method_47(a,b,c,d,x[i + 9],5,568446438);
            d = this.method_47(d,a,b,c,x[i + 14],9,-1019803690);
            c = this.method_47(c,d,a,b,x[i + 3],14,-187363961);
            b = this.method_47(b,c,d,a,x[i + 8],20,1163531501);
            a = this.method_47(a,b,c,d,x[i + 13],5,-1444681467);
            d = this.method_47(d,a,b,c,x[i + 2],9,-51403784);
            c = this.method_47(c,d,a,b,x[i + 7],14,1735328473);
            c = this.method_44(c,d,a,b,x[i + 7],16,-155497632);
            b = this.method_44(b,c,d,a,x[i + 10],23,-1094730640);
            a = this.method_44(a,b,c,d,x[i + 13],4,681279174);
            d = this.method_44(d,a,b,c,x[i + 0],11,-358537222);
            c = this.method_44(c,d,a,b,x[i + 3],16,-722521979);
            b = this.method_44(b,c,d,a,x[i + 6],23,76029189);
            a = this.method_44(a,b,c,d,x[i + 9],4,-640364487);
            d = this.method_44(d,a,b,c,x[i + 12],11,-421815835);
            c = this.method_44(c,d,a,b,x[i + 15],16,530742520);
            b = this.method_44(b,c,d,a,x[i + 2],23,-995338651);
            a = this.method_45(a,b,c,d,x[i + 0],6,-198630844);
            d = this.method_45(d,a,b,c,x[i + 7],10,1126891415);
            c = this.method_45(c,d,a,b,x[i + 14],15,-1416354905);
            b = this.method_45(b,c,d,a,x[i + 5],21,-57434055);
            a = this.method_45(a,b,c,d,x[i + 12],6,1700485571);
            d = this.method_45(d,a,b,c,x[i + 3],10,-1894986606);
            c = this.method_45(c,d,a,b,x[i + 10],15,-1051523);
            b = this.method_45(b,c,d,a,x[i + 1],21,-2054922799);
            a = this.method_45(a,b,c,d,x[i + 8],6,1873313359);
            d = this.method_45(d,a,b,c,x[i + 15],10,-30611744);
            c = this.method_45(c,d,a,b,x[i + 6],15,-1560198380);
            b = this.method_45(b,c,d,a,x[i + 13],21,1309151649);
            a = this.method_45(a,b,c,d,x[i + 4],6,-145523070);
            d = this.method_45(d,a,b,c,x[i + 11],10,-1120210379);
            c = this.method_45(c,d,a,b,x[i + 2],15,718787259);
            b = this.method_45(b,c,d,a,x[i + 9],21,-343485551);
            i = true;
            §§push(true);
            §§push(true);
            §§push(a + aa);
         }
         return IntUtil.toHex(a) + IntUtil.toHex(b) + IntUtil.toHex(c) + IntUtil.toHex(d);
      }
      
      private function method_47(a:int, b:int, c:int, d:int, x:int, s:int, t:int) : int
      {
         return this.transform(this.g,a,b,c,d,x,s,t);
      }
   }
}
