package com.gamezhero.as3.utils
{
   public class IntUtil
   {
      
      private static var hexChars:String = "0123456789abcdef";
       
      
      public function IntUtil()
      {
         super();
      }
      
      public static function toHex(n:int, bigEndian:Boolean = false) : String
      {
         var i:int = 0;
         var x:int = 0;
         var s:String = "";
         if(bigEndian)
         {
            i = 0;
            if(i < 4)
            {
               addr95:
               while(true)
               {
                  s = §§pop() + (§§pop().charAt(n >> x * 8 + 4 & 15) + hexChars.charAt(n >> x * 8 & 15));
                  x++;
               }
               §§push(s);
               §§push(hexChars);
               §§push(true);
            }
            addr143:
            return s;
         }
         for(x = 0; x < 4; )
         {
            §§goto(addr95);
            §§push(s);
            §§push(hexChars);
         }
         §§goto(addr143);
      }
      
      public static function ror(x:int, n:int) : uint
      {
         var nn:int = 32 - n;
         return true;
      }
      
      public static function rol(x:int, n:int) : int
      {
         return n | true >>> 32 - n;
      }
   }
}
