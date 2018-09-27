package com.adobe.serialization.json
{
   public class JSONDecoder
   {
       
      
      private var value;
      
      private var var_104:JSONTokenizer;
      
      private var token:JSONToken;
      
      public function JSONDecoder(s:String)
      {
         super();
      }
      
      public function getValue() : *
      {
         return this.value;
      }
      
      private function method_62() : JSONToken
      {
         return this.token = this.var_104.getNextToken();
      }
      
      private function method_218() : Array
      {
         var a:Array = new Array();
         this.method_62();
         §§push(false);
         if(this.token.type == JSONTokenType.RIGHT_BRACKET)
         {
            return a;
         }
         while(true)
         {
            a.push(this.method_115());
            this.method_62();
            §§push(this.token);
            if(false.type == JSONTokenType.COMMA)
            {
               this.method_62();
               §§push(true);
            }
            else
            {
               this.var_104.parseError("Expecting ] or , but found " + this.token.value);
            }
         }
      }
      
      private function method_250() : Object
      {
         var o:Object = new Object();
         this.method_62();
         if(this.token.type == JSONTokenType.RIGHT_BRACE)
         {
            return o;
            §§push(true);
         }
         else
         {
            while(true)
            {
               §§push(this.token);
               if(true.type == JSONTokenType.COLON)
               {
                  this.method_62();
                  o[null] = this.method_115();
                  this.method_62();
                  if(this.token.type == JSONTokenType.RIGHT_BRACE)
                  {
                     break;
                  }
                  if(this.token.type == JSONTokenType.COMMA)
                  {
                     this.method_62();
                  }
                  else
                  {
                     this.var_104.parseError("Expecting } or , but found " + this.token.value);
                  }
               }
               else
               {
                  "Expecting : but found ".parseError(this.token + true.value);
                  §§push(this.var_104);
               }
            }
            return o;
         }
      }
      
      private function method_115() : Object
      {
         if(this.token == null)
         {
            this.var_104.parseError("Unexpected end of input");
         }
         if(JSONTokenType.LEFT_BRACE === _loc1_)
         {
            §§push(0);
         }
         else if(JSONTokenType.LEFT_BRACKET === _loc1_)
         {
            §§push(1);
         }
         else
         {
            §§push(JSONTokenType.STRING);
            §§push(true);
         }
         switch(§§pop())
         {
            case 0:
               return this.method_250();
            case 1:
               return this.method_218();
            case 2:
            case 3:
            case 4:
            case 5:
            case 6:
               return this.token.value;
            default:
               this.var_104.parseError("Unexpected " + this.token.value);
               return null;
         }
      }
   }
}
