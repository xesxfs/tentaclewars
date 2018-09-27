package com.gameallianz.api.as3
{
   public class GameAllianzApiMultilanguageWord
   {
       
      
      private var var_13:String;
      
      private var var_1:Object;
      
      public function GameAllianzApiMultilanguageWord(_id:String)
      {
         this.var_13 = _id;
         this.var_1 = new Object();
         super();
      }
      
      public function get id() : String
      {
         return this.var_13;
      }
      
      public function set id(_value:String) : void
      {
      }
      
      public function get ENG() : String
      {
         return this.var_1[GameAllianzApiLocalization.ENG];
      }
      
      public function set ENG(_value:String) : void
      {
         this.var_1[GameAllianzApiLocalization.ENG] = _value;
      }
      
      public function get ESP() : String
      {
         return this.var_1[GameAllianzApiLocalization.ESP];
      }
      
      public function set ESP(_value:String) : void
      {
         this.var_1[GameAllianzApiLocalization.ESP] = _value;
      }
      
      public function get ITA() : String
      {
         return this.var_1[GameAllianzApiLocalization.ITA];
      }
      
      public function set ITA(_value:String) : void
      {
      }
      
      public function get RUS() : String
      {
         return this.var_1[GameAllianzApiLocalization.RUS];
      }
      
      public function set RUS(_value:String) : void
      {
      }
      
      public function get DEU() : String
      {
         return this.var_1[GameAllianzApiLocalization.DEU];
      }
      
      public function set DEU(_value:String) : void
      {
         this.var_1[GameAllianzApiLocalization.DEU] = _value;
      }
      
      public function get FRA() : String
      {
         return this.var_1[GameAllianzApiLocalization.FRA];
      }
      
      public function set FRA(_value:String) : void
      {
         this.var_1[GameAllianzApiLocalization.FRA] = _value;
      }
      
      public function get POL() : String
      {
         return this.var_1[GameAllianzApiLocalization.POL];
      }
      
      public function set POL(_value:String) : void
      {
         this.var_1[GameAllianzApiLocalization.POL] = _value;
      }
      
      public function get UKR() : String
      {
         return this.var_1[GameAllianzApiLocalization.UKR];
      }
      
      public function set UKR(_value:String) : void
      {
         this.var_1[GameAllianzApiLocalization.UKR] = _value;
      }
      
      public function get PRT() : String
      {
         return this.var_1[GameAllianzApiLocalization.PRT];
      }
      
      public function set PRT(_value:String) : void
      {
         this.var_1[GameAllianzApiLocalization.PRT] = _value;
      }
      
      public function get value_1() : String
      {
         return this.var_1[GameAllianzApiLocalization.language];
      }
   }
}
