package com.gameallianz.api.as3.classes
{
   import com.gameallianz.api.as3.GameAllianzApiEvent;
   
   public class GameAllianzApiInternalEvent extends GameAllianzApiEvent
   {
      
      public static const INI_ENGINE_COMPLETED:String = "api_ini_engine";
      
      public static const ENGINE_SEND_MESSAGE:String = "api_engine_message";
      
      public static const ENGINE_MODAL_FORM:String = "api_engine_modal";
      
      public static const ENGINE_INI_EXTERNAL_DISPLAY_OBJECT:String = "api_external_display_object";
      
      public static const GET_GAME_INFO:String = "api_get_game_info";
       
      
      public function GameAllianzApiInternalEvent(type:String)
      {
         super(type);
      }
   }
}
