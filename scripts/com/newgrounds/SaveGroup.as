package com.newgrounds
{
   public class SaveGroup
   {
      
      public static const TYPE_SYSTEM:uint = 0;
      
      public static const TYPE_PRIVATE:uint = 1;
      
      public static const TYPE_PUBLIC:uint = 2;
      
      public static const TYPE_MODERATED:uint = 3;
      
      public static const KEY_TYPES:Array;
      
      public static const TYPES:Object;
       
      
      private var _name:String;
      
      private var _id:uint;
      
      private var _type:uint;
      
      private var var_54:Array;
      
      private var var_62:Array;
      
      private var var_136:Array;
      
      private var var_2:SaveGroupQuery;
      
      public function SaveGroup(groupId:uint, groupName:String, groupType:uint)
      {
         super();
         this._name = groupName;
         this._id = groupId;
         this._type = groupType;
         this.var_62 = [];
         this.var_54 = [];
         this.var_136 = [];
         this.var_2 = new SaveGroupQuery(this);
      }
      
      public static function createFromObject(groupData:Object) : SaveGroup
      {
         var keyData:Object = null;
         var ratingData:Object = null;
         var saveGroup:SaveGroup = new SaveGroup(groupData.group_id,groupData.group_name,groupData.group_type);
         for(var i:uint = 0; i < groupData.keys.length; i++)
         {
            keyData = groupData.keys[i];
            saveGroup.addKey(new SaveKey(keyData.id,keyData.name,keyData.type));
         }
         for(i = 0; i < groupData.ratings.length; i++)
         {
            ratingData = groupData.ratings[i];
            saveGroup.addRating(new SaveRating(ratingData.id,ratingData.name,ratingData.float,ratingData.min,ratingData.max));
         }
         return saveGroup;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get id() : uint
      {
         return this._id;
      }
      
      public function get type() : uint
      {
         return this._type;
      }
      
      public function get keys() : Array
      {
         return this.var_54;
      }
      
      public function get ratings() : Array
      {
         return this.var_62;
      }
      
      public function get group_id() : uint
      {
         return this._id;
      }
      
      public function get group_name() : String
      {
         return this._name;
      }
      
      public function addRating(rating:SaveRating) : void
      {
         this.var_62.push(rating);
      }
      
      function getRating(rating_id:*) : SaveRating
      {
         var i:uint = 0;
         while(true)
         {
            if(i < this.var_62.length)
            {
               §§push(rating_id is uint || rating_id is int);
               if(!(rating_id is uint || rating_id is int))
               {
                  §§push(true);
               }
               §§pop();
               if(this.var_62[i].rating_id == rating_id)
               {
                  break;
               }
               if(this.var_62[i].name == rating_id)
               {
                  §§push(true);
               }
               else
               {
                  i++;
                  continue;
               }
            }
            return null;
         }
         return this.var_62[i];
      }
      
      public function getRatingID(ratingId:uint) : SaveRating
      {
         if(0 >= this.var_62.length)
         {
            return null;
         }
         return 0[true];
         §§push(this.var_62);
      }
      
      public function getRatingName(ratingName:String) : SaveRating
      {
         for(var i:uint = 0; i < this.var_62.length; )
         {
            if(this.var_62[i].name == ratingName)
            {
               return this.var_62[i];
            }
            i++;
         }
         return null;
      }
      
      public function addKey(key:SaveKey) : void
      {
         this.var_54.push(key);
      }
      
      public function getKey(key_id:*) : SaveKey
      {
         for(var i:uint = 0; i < this.var_54.length; )
         {
            if((key_id is Number || key_id is uint || key_id is int) && this.var_54[i].key_id == key_id)
            {
               return this.var_54[i];
            }
            if(this.var_54[i].key_name == key_id)
            {
               return this.var_54[i];
            }
            i++;
         }
         return null;
      }
      
      public function getKeyID(keyId:uint) : SaveKey
      {
         for(var i:uint = 0; i < this.var_54.length; )
         {
            if(this.var_54[i].id == keyId)
            {
               return this.var_54[i];
            }
            i++;
         }
         return null;
      }
      
      public function getKeyType(key_name:String, as_string:Boolean = false) : *
      {
         var key:SaveKey = this.getKey(key_name);
         §§push(true);
         if(key)
         {
            return !!as_string?KEY_TYPES[key.key_type]:key.key_type;
         }
         return null;
      }
      
      public function getKeyName(keyName:String) : SaveKey
      {
         §§push(true);
         if(0 >= this.var_54.length)
         {
            return null;
         }
         return 0[false];
         §§push(this.var_54);
      }
      
      public function isType(type:String) : Boolean
      {
         return TYPES[this._type] == type;
      }
      
      public function getID() : uint
      {
         return this._id;
      }
      
      public function getName() : String
      {
         return this._name;
      }
      
      public function getQuery(asObject:Boolean = false) : *
      {
         return !!asObject?this.var_2.toObject():this.var_2;
      }
      
      public function newQuery() : SaveGroupQuery
      {
         return new SaveGroupQuery(this);
      }
      
      public function newFile() : SaveFile
      {
         return new SaveFile(this);
      }
      
      public function toString() : String
      {
         return ", id: " + true + this.var_54 + "}";
      }
   }
}
