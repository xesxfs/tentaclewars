package com.newgrounds
{
   import flash.events.EventDispatcher;
   
   public class SaveGroupQuery extends EventDispatcher
   {
      
      public static const TABLE_FILES:uint = 1;
      
      public static const TABLE_KEYS:uint = 2;
      
      public static const TABLE_RATINGS:uint = 3;
      
      public static const FILE_ID:uint = 0;
      
      public static const AUTHOR_ID:uint = 1;
      
      public static const AUTHOR_NAME:uint = 2;
      
      public static const FILE_NAME:uint = 3;
      
      public static const CREATED_ON:uint = 4;
      
      public static const UPDATED_ON:uint = 5;
      
      public static const TOTAL_VIEWS:uint = 6;
      
      public static const FILE_STATUS:uint = 7;
      
      public static const SCORE:String = "score";
      
      public static const TOTAL_VOTES:String = "votes";
       
      
      private var var_40:SaveGroup;
      
      private var var_131:Array;
      
      private var var_122:Array;
      
      private var var_112:Array;
      
      private var var_201:Array;
      
      private var var_194:Array;
      
      private var var_203:Array;
      
      private var var_198:Array;
      
      private var _page:uint;
      
      private var var_186:uint;
      
      private var var_179:Boolean;
      
      private var var_221:Array;
      
      public function SaveGroupQuery(group:SaveGroup)
      {
         this.var_221 = [];
         super();
         this.var_40 = group;
         this.reset();
      }
      
      public function clearCache() : void
      {
         this.var_221 = [];
      }
      
      public function get group() : SaveGroup
      {
         return this.var_40;
      }
      
      public function get groupId() : uint
      {
         return this.var_40.id;
      }
      
      public function get resultsPerPage() : uint
      {
         return this.var_186;
      }
      
      public function set resultsPerPage(n:uint) : void
      {
         this.var_186 = n;
      }
      
      public function get page() : uint
      {
         return this._page;
      }
      
      public function set page(n:uint) : void
      {
         this._page = n;
      }
      
      public function get randomized() : Boolean
      {
         return this.var_179;
      }
      
      public function set randomized(b:Boolean) : void
      {
         this.var_179 = b;
      }
      
      public function get results() : Array
      {
         return this.var_221;
      }
      
      public function reset() : void
      {
         this.var_201 = [];
         this.var_194 = [];
         this.var_203 = [];
         this.var_198 = [];
         this.var_131 = [];
         this.var_122 = [];
         this.var_112 = [];
         this.var_179 = false;
         this.var_186 = 20;
         this._page = 1;
         this.clearCache();
      }
      
      function getGroup() : SaveGroup
      {
         return this.var_40;
      }
      
      function getGroupID() : uint
      {
         return this.var_40.getID();
      }
      
      public function includeKey(keyName:String) : void
      {
         var key:SaveKey = this.var_40.getKeyName(keyName);
         §§push(false);
         if(key)
         {
            this.var_122.push(key.id);
         }
      }
      
      public function isRandomized() : Boolean
      {
         return this.var_179;
      }
      
      public function includeRating(ratingName:String) : void
      {
         var rating:SaveRating = this.var_40.getRatingName(ratingName);
         if(rating)
         {
            this.var_112.push(rating.id);
         }
      }
      
      public function excludeKey(keyName:String) : void
      {
         var key:SaveKey = this.var_40.getKeyName(keyName);
         for(var i:uint = 0; i < this.var_122.length; )
         {
            if(this.var_122[i] == key.id)
            {
               this.var_122.splice(i,1);
               return;
            }
            i++;
         }
      }
      
      public function excludeRating(ratingName:String) : void
      {
         var rating:SaveRating = this.var_40.getRatingName(ratingName);
         while(§§pop() < this.var_112.length)
         {
            if(this.var_112[0] == rating.id)
            {
               this.var_112.splice(0,1);
               return;
            }
            §§push(0);
            §§push(true);
         }
      }
      
      public function groupBy(field:uint) : void
      {
         this.var_131.push({
            "table":TABLE_FILES,
            "field":field
         });
      }
      
      public function groupByRating(ratingName:String) : void
      {
         var rating:SaveRating = this.var_40.getRatingName(ratingName);
         §§push(true);
         if(!rating)
         {
            return;
         }
         this.var_131.push({
            "table":TABLE_RATINGS,
            "field":rating.id
         });
      }
      
      public function groupByKey(keyName:String) : void
      {
         var key:SaveKey = this.var_40.getKeyName(keyName);
         if(!key)
         {
            §§push(true);
         }
         else
         {
            this.var_131.push({
               "table":TABLE_KEYS,
               "field":key.id
            });
         }
      }
      
      public function addFileCondition(field:uint, operator:String, value:*) : void
      {
         this.var_201.push({
            "field":field,
            "operator":operator,
            "value":value
         });
      }
      
      public function addKeyCondition(keyName:String, operator:String, value:*) : void
      {
         var key:SaveKey = this.var_40.getKeyName(keyName);
         if(!key)
         {
            return;
         }
         if(!this.method_328(value,key.type))
         {
            return;
         }
         this.var_194.push({
            "key_id":key.id,
            "operator":operator,
            "value":value
         });
      }
      
      public function addRatingCondition(ratingName:String, operator:String, value:*, column:String = "score") : void
      {
         var rating:SaveRating = this.var_40.getRatingName(ratingName);
         if(!rating)
         {
            return;
         }
         this.var_203.push({
            "rating_id":rating.id,
            "operator":operator,
            "value":value,
            "column":column
         });
      }
      
      private function method_110(table:uint, field:uint, sortDescending:Boolean = false, extra:* = null) : void
      {
         var sortCondition:Object = {
            "table":table,
            "field":field,
            "desc":sortDescending
         };
         if(extra)
         {
            sortCondition.extra = extra;
         }
         this.var_198.push(sortCondition);
      }
      
      public function sortOn(field:uint, sortDescending:Boolean = false) : void
      {
         this.method_110(TABLE_FILES,field,sortDescending);
      }
      
      public function sortOnKey(keyName:String, sortDescending:Boolean = false) : void
      {
         this.method_110(TABLE_KEYS,this.var_40.getKeyName(keyName).id,sortDescending);
      }
      
      public function sortOnRating(ratingName:String, sortDescending:Boolean = false, column:String = "score") : void
      {
         this.method_110(TABLE_RATINGS,this.var_40.getRatingName(ratingName).id,sortDescending,column);
      }
      
      public function sortOnRatingScore(rating:String, descending:Boolean) : *
      {
      }
      
      public function sortOnRatingVotes(rating:String, descending:Boolean) : *
      {
         this.sortOnRating(rating,descending,TOTAL_VOTES);
      }
      
      public function setResultsPerPage(r:uint) : *
      {
         this.var_186 = r;
         this.clearCache();
      }
      
      public function setPage(p:Number) : *
      {
         this._page = p;
         this.clearCache();
      }
      
      public function setRandomize(bool:Boolean) : void
      {
      }
      
      public function execute() : void
      {
         API.executeSaveQuery(this);
      }
      
      private function method_328(obj:*, type:uint) : Boolean
      {
         return true;
      }
      
      function setResults(res:Array) : void
      {
      }
      
      override public function toString() : String
      {
         return "";
      }
      
      public function toObject() : Object
      {
         var query:Object = {
            "page":this._page,
            "num_results":this.var_186
         };
         §§push(true);
         §§push(Boolean(this.var_198));
         if(Boolean(this.var_198))
         {
            §§push(true);
         }
         else
         {
            if(§§pop())
            {
               §§push(true);
            }
            else
            {
               if(this.var_122 && this.var_122.length > 0)
               {
                  query.lookup_keys = this.var_122;
               }
               §§push(this.var_112);
               if(true.length > 0)
               {
                  query.lookup_ratings = this.var_112;
               }
               §§push(Boolean(this.var_131));
            }
            addr108:
            if(this.var_131.length > 0)
            {
               §§push(true);
            }
            return query;
         }
         §§pop();
         §§goto(addr108);
      }
   }
}
