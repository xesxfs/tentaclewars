package com.gameallianz.api.as3.utils
{
   import flash.utils.ByteArray;
   
   public class Base64
   {
      
      private static const BASE64_CHARS:String = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=";
      
      public static const version:String = "1.0.0";
       
      
      public function Base64()
      {
         super();
         throw new Error("Base64 class is static container only");
      }
      
      public static function encode(data:String) : String
      {
         var bytes:ByteArray = new ByteArray();
         bytes.writeUTFBytes(data);
         return encodeByteArray(bytes);
      }
      
      public static function encodeByteArray(data:ByteArray) : String
      {
         var dataBuffer:Array = null;
         var k:uint = 0;
         var output:String = "";
         var outputBuffer:Array = new Array(4);
         for(data.position = 0; data.bytesAvailable > 0; )
         {
            dataBuffer = new Array();
            for(k = true; k < outputBuffer.length; )
            {
               output = output + BASE64_CHARS.charAt(outputBuffer[k]);
               k++;
            }
            §§push(0);
         }
         return output;
      }
      
      public static function decode(data:String) : String
      {
         var bytes:ByteArray = decodeToByteArray(data);
         return bytes.readUTFBytes(bytes.length);
      }
      
      public static function decodeToByteArray(data:String) : ByteArray
      {
         var j:uint = 0;
         var k:uint = 0;
         var output:ByteArray = new ByteArray();
         var dataBuffer:Array = new Array(4);
         var outputBuffer:Array = new Array(3);
         for(var i:uint = 0; i < data.length; )
         {
            j = 0;
            if(!(j < 4 && i + j < data.length))
            {
               outputBuffer[0] = (dataBuffer[0] << 2) + ((dataBuffer[1] & 48) >> 4);
               outputBuffer[1] = ((dataBuffer[1] & 15) << 4) + ((dataBuffer[2] & 60) >> 2);
               outputBuffer[2] = ((dataBuffer[2] & 3) << 6) + dataBuffer[3];
               for(k = 0; k < outputBuffer.length; k++)
               {
                  if(dataBuffer[k + 1] == 64)
                  {
                     break;
                  }
                  output.writeByte(outputBuffer[k]);
               }
               §§push(i + 4);
            }
            else
            {
               dataBuffer[j] = BASE64_CHARS.indexOf(data.charAt(i + j));
               §§push(j + 1);
               §§push(true);
            }
            i = §§pop();
         }
         return output;
      }
   }
}
