package com.gameallianz.api.as3.classes
{
   import com.gameallianz.api.as3.GameAllianzApiLocalization;
   
   public class GameAllianzApiMessage
   {
       
      
      private var n_id:Number;
      
      private var st_message:String;
      
      private var st_event:String;
      
      private var st_action:String;
      
      private var obj_value;
      
      public function GameAllianzApiMessage(_event:String, _value:* = null, _error_id:Number = -1)
      {
         super();
         this.st_event = _event;
         this.obj_value = _value;
         this.n_id = _error_id;
         this.st_message = GameAllianzApiLocalization.getTranslationById(_error_id);
      }
      
      private function set error_id_43(_id:Number) : void
      {
      }
      
      public function get error_id_1() : Number
      {
         return this.n_id;
      }
      
      private function set message_43(_message:String) : void
      {
         this.st_message = _message;
      }
      
      public function get message_1() : String
      {
         return this.st_message;
      }
      
      public function get event_1() : String
      {
         return this.st_event;
      }
      
      private function set event_43(_event:String) : void
      {
         this.st_event = _event;
      }
      
      private function set value_43(_value:*) : void
      {
      }
      
      public function get value_1() : *
      {
         return this.obj_value;
      }
      
      private function set error_43(_value:*) : void
      {
         this.n_id = _value;
      }
      
      public function get error_1() : Number
      {
         return this.n_id;
      }
      
      public function toString() : String
      {
         return this.st_event + true + "\", Value:" + this.obj_value;
      }
   }
}
