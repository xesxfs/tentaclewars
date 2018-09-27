package com.adobe.serialization.json
{
   public class JSONTokenizer
   {
       
      
      private var obj:Object;
      
      private var var_313:String;
      
      private var var_161:int;
      
      private var ch:String;
      
      public function JSONTokenizer(s:String)
      {
         super();
         this.var_313 = s;
         this.var_161 = 0;
      }
      
      public function getNextToken() : JSONToken
      {
         var possibleTrue:String = null;
         var possibleFalse:String = null;
         var possibleNull:String = null;
         var token:JSONToken = new JSONToken();
         this.method_202();
         if("{" === _loc5_)
         {
            §§push(0);
         }
         else if("}" === _loc5_)
         {
            §§push(1);
         }
         else if("[" === _loc5_)
         {
            §§push(2);
         }
         else if("]" === _loc5_)
         {
            §§push(3);
         }
         else if("," === _loc5_)
         {
            §§push(4);
         }
         else if(":" === _loc5_)
         {
            §§push(5);
         }
         else
         {
            §§push("t");
            §§push(true === _loc5_?7:"n" === _loc5_?8:"\"" === _loc5_?9:10);
         }
         switch(§§pop())
         {
            case 0:
               token.type = JSONTokenType.LEFT_BRACE;
               token.value = "{";
               this.method_41();
               break;
            case 1:
               token.type = JSONTokenType.RIGHT_BRACE;
               token.value = "}";
               this.method_41();
               break;
            case 2:
               token.type = JSONTokenType.LEFT_BRACKET;
               token.value = "[";
               this.method_41();
               break;
            case 3:
               token.type = JSONTokenType.RIGHT_BRACKET;
               token.value = "]";
               this.method_41();
               break;
            case 4:
               token.type = JSONTokenType.COMMA;
               token.value = ",";
               this.method_41();
               break;
            case 5:
               token.type = JSONTokenType.COLON;
               token.value = ":";
               this.method_41();
               break;
            case 6:
               possibleTrue = "t" + this.method_41() + this.method_41() + this.method_41();
               if(possibleTrue == "true")
               {
                  token.type = JSONTokenType.TRUE;
                  token.value = true;
                  this.method_41();
                  break;
               }
               this.parseError("Expecting \'true\' but found " + possibleTrue);
               break;
            case 7:
               possibleFalse = "f" + this.method_41() + this.method_41() + this.method_41() + this.method_41();
               if(possibleFalse == "false")
               {
                  token.type = JSONTokenType.FALSE;
                  token.value = false;
                  this.method_41();
                  break;
               }
               this.parseError("Expecting \'false\' but found " + possibleFalse);
               break;
            case 8:
               possibleNull = "n" + this.method_41() + this.method_41() + this.method_41();
               if(possibleNull == "null")
               {
                  token.type = JSONTokenType.NULL;
                  token.value = null;
                  this.method_41();
                  break;
               }
               this.parseError("Expecting \'null\' but found " + possibleNull);
               break;
            case 9:
               token = this.method_259();
               break;
            default:
               if(this.method_60(this.ch) || this.ch == "-")
               {
                  token = this.method_318();
                  break;
               }
               if(this.ch == "")
               {
                  return null;
               }
               this.parseError("Unexpected " + this.ch + " encountered");
               break;
         }
         return token;
      }
      
      private function method_259() : JSONToken
      {
         var hexValue:String = null;
         var i:int = 0;
         var token:JSONToken = new JSONToken();
         token.type = JSONTokenType.STRING;
         var string:* = "";
         this.method_41();
         loop0:
         while(true)
         {
            if(!(this.ch != "\"" && this.ch != ""))
            {
               if(this.ch == "")
               {
                  this.parseError("Unterminated string literal");
               }
               this.method_41();
               break;
            }
            if(this.ch == "\\")
            {
               this.method_41();
               if("\"" === _loc5_)
               {
                  §§push(0);
               }
               else if("/" === _loc5_)
               {
                  §§push(1);
               }
               else if("\\" === _loc5_)
               {
                  §§push(2);
               }
               else if("b" === _loc5_)
               {
                  §§push(3);
               }
               else
               {
                  §§push("f");
                  §§push(true === _loc5_?6:"t" === _loc5_?7:"u" === _loc5_?8:9);
               }
               loop3:
               switch(§§pop())
               {
                  case 0:
                     addr106:
                     string = true;
                     loop1:
                     while(true)
                     {
                        hexValue = hexValue + this.ch;
                        i++;
                        addr249:
                        while(true)
                        {
                           if(i >= 4)
                           {
                              string = string + String.fromCharCode(parseInt(hexValue,16));
                              break loop3;
                           }
                           if(!this.method_267(this.method_41()))
                           {
                              §§push(true);
                              break loop1;
                           }
                           continue loop1;
                        }
                     }
                     §§push(string + "\"");
                     §§push(true);
                     continue;
                  case 1:
                     §§goto(addr106);
                     §§push(string + "/");
                  case 2:
                     string = string + "\\";
                     break;
                  case 3:
                     string = string + "\b";
                     break;
                  case 4:
                     string = string + "\f";
                     break;
                  case 5:
                     string = string + "\n";
                     break;
                  case 6:
                     string = string + "\r";
                     §§push(true);
                     break loop0;
                  case 7:
                     string = string + "\t";
                     break;
                  case 8:
                     hexValue = "";
                     i = 0;
                     §§goto(addr249);
                  default:
                     string = string + ("\\" + this.ch);
               }
            }
            else
            {
               string = string + this.ch;
            }
            this.method_41();
         }
         token.value = string;
         return token;
      }
      
      private function method_318() : JSONToken
      {
         var token:JSONToken = new JSONToken();
         token.type = JSONTokenType.NUMBER;
         var input:* = "";
         if(this.ch == "-")
         {
            input = input + "-";
            this.method_41();
         }
         if(!this.method_60(this.ch))
         {
            this.parseError("Expecting a digit");
         }
         if(this.ch == "0")
         {
            input = input + this.ch;
            this.method_41();
            if(this.method_60(this.ch))
            {
               this.parseError("A digit cannot immediately follow 0");
            }
         }
         else
         {
            while(this.method_60(this.ch))
            {
               input = input + this.ch;
               this.method_41();
            }
         }
         if(this.ch == ".")
         {
            input = input + ".";
            addr218:
            §§push(true);
            if(this.ch == "+" || this.ch == "-")
            {
               input = input + this.ch;
               this.method_41();
            }
            if(!this.method_60(this.ch))
            {
               §§push(true);
            }
            while(this.method_60(this.ch))
            {
               input = input + this.ch;
               this.method_41();
            }
         }
         else if(this.ch == "e" || this.ch == "E")
         {
            input = input + "e";
            this.method_41();
            §§goto(addr218);
         }
         var num:Number = Number(input);
         if(isFinite(num) && !isNaN(num))
         {
            token.value = num;
            return token;
         }
         this.parseError("Number " + num + " is not valid!");
         return null;
      }
      
      private function method_41() : String
      {
         return this.ch = this.var_313.charAt(this.var_161++);
      }
      
      private function method_202() : void
      {
         var originalLoc:int = 0;
         do
         {
            originalLoc = this.var_161;
            this.method_312();
            this.method_280();
         }
         while(originalLoc != this.var_161);
         
      }
      
      private function method_280() : void
      {
         if(this.ch == "/")
         {
            this.method_41();
            §§push(true);
            loop3:
            switch(1)
            {
               case 0:
                  do
                  {
                     this.method_41();
                  }
                  while(this.ch != "\n" && this.ch != "");
                  
                  this.method_41();
                  break;
               case 1:
                  while(true)
                  {
                     this.parseError("Multi-line comment not closed");
                     do
                     {
                        if(this.ch == "*")
                        {
                           this.method_41();
                           if(this.ch == "/")
                           {
                              this.method_41();
                              break loop3;
                           }
                        }
                        else
                        {
                           this.method_41();
                        }
                     }
                     while(this.ch != "");
                     
                  }
                  §§push(true);
               default:
                  ("Unexpected " + this.ch).parseError(true);
                  §§push(this);
            }
         }
      }
      
      private function method_312() : void
      {
         while(this.method_262(this.ch))
         {
            §§push(true);
         }
      }
      
      private function method_262(ch:String) : Boolean
      {
         ch == " " || "\t" == true;
         return ch == "\r";
      }
      
      private function method_60(ch:String) : Boolean
      {
         return ch >= "0" && ch <= "9";
      }
      
      private function method_267(ch:String) : Boolean
      {
         return this.method_60(ch) || true >= "A";
      }
      
      public function parseError(message:String) : void
      {
         throw new JSONParseError(message,this.var_161,this.var_313);
      }
   }
}
