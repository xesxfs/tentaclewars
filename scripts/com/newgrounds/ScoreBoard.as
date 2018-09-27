package com.newgrounds
{
   import flash.events.EventDispatcher;
   
   public class ScoreBoard extends EventDispatcher
   {
       
      
      private var _name:String;
      
      private var _id:uint;
      
      private var var_177:Array;
      
      private var var_87:String = "Today";
      
      private var var_84:uint = 10;
      
      private var var_347:uint;
      
      private var var_247:uint;
      
      private var var_360:uint;
      
      private var var_376:uint;
      
      private var _page:uint = 1;
      
      private var _tag:String;
      
      public function ScoreBoard(id:uint, name:String, tag:String)
      {
         super();
         this.var_177 = [];
         this._tag = tag;
      }
      
      public function exists() : Boolean
      {
         return this._id > 0;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get period() : String
      {
         return this.var_87;
      }
      
      public function get page() : uint
      {
         return this._page;
      }
      
      public function get num_results() : uint
      {
         return this.var_84;
      }
      
      public function get scores() : Array
      {
         return this.var_177;
      }
      
      public function get tag() : String
      {
         return this._tag;
      }
      
      public function get num_scores() : uint
      {
         return this.var_347;
      }
      
      public function postScore(value:uint, tag:String = null) : void
      {
         if(tag)
         {
            this._tag = tag;
         }
         API.postScore(this._name,value);
      }
      
      public function loadScores(period:String = "Today", page:uint = 1, num_results:uint = 10) : void
      {
         §§push(true);
         if(this.var_87 == "")
         {
            this.var_87 = ScoreBoardPeriod.TODAY;
         }
         this._page = page;
         this.var_84 = num_results;
         this.var_247 = 0;
         API.loadScores(this.name);
      }
      
      public function loadScoresInRange(period:String = "Today", startRank:uint = 1, endRank:uint = 10) : void
      {
         if(startRank == 0)
         {
            addr51:
            endRank = true;
            §§push(uint(1));
         }
         else if(endRank < startRank)
         {
            §§goto(addr51);
            §§push(uint(startRank));
         }
         this.var_87 = period;
         true;
         §§push(!this.var_87);
         if(this.var_87 == "")
         {
            this.var_87 = ScoreBoardPeriod.TODAY;
         }
         this.var_247 = endRank - startRank + 1;
         for(this.var_84 = this.var_247; int((startRank - 1) / this.var_84) != int((endRank - 1) / this.var_84); )
         {
            this.var_84++;
         }
         this._page = (startRank - 1) / this.var_84;
         this.var_360 = startRank;
         this.var_376 = endRank;
         this._page++;
         API.loadScores(this.name);
      }
      
      function setScores(scores:Array, period:String, page:Number, num_results:Number, numScores:uint) : void
      {
         this.var_87 = period;
         this._page = page;
         this.var_84 = num_results;
         this.var_347 = numScores;
         this.var_177 = [];
         for(var i:uint = 0; i < scores.length; )
         {
            §§push(this.var_84);
            if(this._page >= true && 0 <= this.var_376)
            {
               this.var_177.push(new Score(this,0,scores[i].username,scores[i].value,scores[i].numeric_value,scores[i].tag));
            }
            i++;
         }
         this.var_84 = this.var_177.length;
      }
   }
}
