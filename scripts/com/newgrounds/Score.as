package com.newgrounds
{
   public class Score
   {
       
      
      private var var_343:ScoreBoard;
      
      private var var_381:uint;
      
      private var var_353:String;
      
      private var _value:String;
      
      private var var_374:uint;
      
      private var _tag:String;
      
      public function Score(board:ScoreBoard, position:Number, username:String, value:String, numeric_value:uint, tag:String)
      {
         super();
         this.var_343 = board;
         this.var_381 = position;
         this.var_353 = username;
         this._value = value;
         this.var_374 = numeric_value;
         this._tag = tag;
      }
      
      public function get board() : ScoreBoard
      {
         return this.var_343;
      }
      
      public function get position() : uint
      {
         return this.var_381;
      }
      
      public function get username() : String
      {
         return this.var_353;
      }
      
      public function get value() : String
      {
         return this._value;
      }
      
      public function get numeric_value() : uint
      {
         return this.var_374;
      }
      
      public function get tag() : String
      {
         return this._tag;
      }
   }
}
