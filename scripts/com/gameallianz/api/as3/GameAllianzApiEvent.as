package com.gameallianz.api.as3
{
   import com.gameallianz.api.as3.classes.GameAllianzApiMessage;
   import flash.events.Event;
   
   public class GameAllianzApiEvent extends Event
   {
      
      public static const API_INITIALISED:String = "event_api_initialised";
      
      public static const API_ACCESS_DENIED:String = "event_api_access_denied";
      
      public static const LANGUAGE_ON_CHANGE:String = "event_language_on_change";
      
      public static const MUSIC_ON_CHANGE:String = "event_music_on_change";
      
      public static const SOUND_ON_CHANGE:String = "event_sound_on_change";
      
      public static const MEDALS_ON_CHANGE:String = "event_medals_on_change";
      
      public static const CURRENT_SET_ON_DATA:String = "event_current_set_on_data";
      
      public static const CURRENT_LEVEL_ON_DATA:String = "event_current_level_on_data";
      
      public static const CURRENT_AVATAR_ON_DATA:String = "event_current_avatar_on_data";
      
      public static const MEDALS_ON_DATA:String = "event_medals_on_data";
      
      public static const SEND_AVATAR_DONE:String = "event_send_avatar_done";
      
      public static const SEND_AVATAR_CANCELED:String = "event_send_avatar_canceled";
      
      public static const SEND_SET_DONE:String = "event_send_set_done";
      
      public static const SEND_SET_CANCELED:String = "event_send_set_canceled";
      
      public static const SEND_GALLERY_DONE:String = "event_send_gallery_done";
      
      public static const SEND_GALLERY_CANCELED:String = "event_send_gallery_canceled";
      
      public static const SEND_LEVEL_DONE:String = "event_send_level_done";
      
      public static const SEND_LEVEL_CANCELED:String = "event_send_level_canceled";
      
      public static const RATE_LEVEL_DONE:String = "event_rate_level_done";
      
      public static const RATE_LEVEL_CANCELED:String = "event_rate_level_canceled";
      
      public static const SEND_SCORE_DONE:String = "event_send_score_done";
      
      public static const SEND_SCORE_CANCELED:String = "event_send_score_canceled";
      
      public static const VIEW_SCORE_DONE:String = "event_view_score_done";
      
      public static const VIEW_MEDALS_DONE:String = "event_view_medals_done";
      
      public static const PAUSE_OFF:String = "event_pause_off";
      
      public static const PAUSE_ON:String = "event_pause_on";
      
      public static const ERROR:String = "event_error";
       
      
      private var _message:GameAllianzApiMessage;
      
      private var _value;
      
      public function GameAllianzApiEvent(type:String)
      {
         super(type);
      }
      
      public function set message_1(_val:GameAllianzApiMessage) : void
      {
         this._message = _val;
      }
      
      public function get message_1() : GameAllianzApiMessage
      {
         return this._message;
      }
      
      public function set value_1(_val:*) : void
      {
         this._value = _val;
      }
      
      public function get value_1() : *
      {
         return this._value;
      }
      
      override public function toString() : String
      {
         return formatToString("GameAllianzApiEvent");
      }
   }
}
