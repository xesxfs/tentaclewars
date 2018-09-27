package com.newgrounds
{
   public class SaveRating
   {
       
      
      private var _id:uint;
      
      private var _name:String;
      
      private var var_380:Number;
      
      private var var_351:Number;
      
      private var var_363:Boolean;
      
      private var var_371:Boolean;
      
      public function SaveRating(id:uint, name:String, isFloat:Boolean, minValue:Number = -Infinity, maxValue:Number = Infinity)
      {
         super();
         this.var_351 = maxValue;
      }
      
      public function get rating_id() : uint
      {
         return this._id;
      }
      
      public function get rating_name() : String
      {
         return this._name;
      }
      
      public function get id() : uint
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get minValue() : Number
      {
         return this.var_380;
      }
      
      public function get maxValue() : Number
      {
         return this.var_351;
      }
      
      public function get isFloat() : Boolean
      {
         return this.var_363;
      }
      
      public function get voted() : Boolean
      {
         return this.var_371;
      }
      
      public function set voted(b:Boolean) : void
      {
         this.var_371 = b;
      }
      
      public function toString() : String
      {
         return this._name;
      }
   }
}
