package com.newgrounds
{
   public class SaveKey
   {
      
      public static const TYPE_FLOAT:uint = 1;
      
      public static const TYPE_INTEGER:uint = 2;
      
      public static const TYPE_STRING:uint = 3;
      
      public static const TYPE_BOOLEAN:uint = 4;
       
      
      private var _id:uint;
      
      private var _name:String;
      
      private var _type:uint;
      
      public function SaveKey(id:uint, name:String, type:uint)
      {
         this._id = id;
         this._name = name;
         this._type = type;
      }
      
      public function get id() : uint
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get type() : uint
      {
         return this._type;
      }
      
      public function get key_id() : uint
      {
         return this._id;
      }
      
      public function get key_name() : String
      {
         return this._name;
      }
      
      public function get key_type() : uint
      {
         return this._type;
      }
      
      public function isValueValid(value:*) : Boolean
      {
         if(this._type == TYPE_INTEGER)
         {
            §§push(value is int || true);
         }
         else
         {
            if(this._type == TYPE_FLOAT)
            {
               addr134:
               value is int || value is uint;
               §§push(value is int || value is uint);
               §§push(value === 1);
               §§push(value === 1);
            }
            else if(this._type != TYPE_STRING)
            {
               if(this._type == TYPE_BOOLEAN)
               {
                  §§push(value is Boolean || true);
               }
               else
               {
                  return false;
               }
            }
            §§pop();
            return value == "";
         }
         return value is String;
      }
      
      public function toString() : String
      {
         return this._name;
      }
   }
}
