package com.gameallianz.api.as3
{
   public class GameAllianzApiLocalization
   {
      
      public static const ENG:String = "ENG";
      
      public static const ESP:String = "ESP";
      
      public static const ITA:String = "ITA";
      
      public static const RUS:String = "RUS";
      
      public static const DEU:String = "DEU";
      
      public static const UKR:String = "UKR";
      
      public static const POL:String = "POL";
      
      public static const PRT:String = "PRT";
      
      public static const FRA:String = "FRA";
      
      public static const EN:String = "EN";
      
      public static const ES:String = "ES";
      
      public static const IT:String = "IT";
      
      public static const RU:String = "RU";
      
      public static const DE:String = "DE";
      
      public static const FR:String = "FR";
      
      public static const UK:String = "UK";
      
      public static const PO:String = "PO";
      
      public static const PR:String = "PR";
      
      private static var st_current_language:String = "ENG";
      
      private static var ar_languages:Array;
      
      private static var ar_languages_2:Object;
      
      public static const NEW_GAME:String = "new_game";
      
      public static const CONTINUE:String = "continue";
      
      public static const TOP_SCORE:String = "top_score";
      
      public static const SETTINGS:String = "settings";
      
      public static const HELP:String = "help";
      
      public static const MAIN_MENU:String = "main_menu";
      
      public static const SOUND:String = "sound";
      
      public static const MUSIC:String = "music";
      
      public static const LANGUAGE:String = "language";
      
      public static const LEVEL_FAILED:String = "level_failed";
      
      public static const REPLAY:String = "replay";
      
      public static const PAUSE:String = "pause";
      
      public static const PLAY_GAME:String = "play_game";
      
      public static const CONGRATULATIONS:String = "congratulate";
      
      public static const GAME_OVER:String = "game_over";
      
      public static const SUBMIT_TOP_SCORE:String = "submit_top_score";
      
      public static const ENTER_YOUR_NAME:String = "enter_your_name";
      
      public static const SUBMIT:String = "submit";
      
      public static const MORE_GAMES:String = "more_games";
      
      public static const SEND_TO_FRIENDS:String = "send_to friends";
      
      public static const FOLLOW_US_ON_TWITTER:String = "folow_us_on_twitter";
      
      public static const BECOME_A_FUN_ON_FACEBOOK:String = "became_a_fun_on_facebook";
      
      public static const SHARE_GAME:String = "share_game";
      
      public static const WALKTHROUGH:String = "walkthrough";
      
      public static const CREDITS:String = "credits";
      
      private static var xml_dictionary:XML;
      
      public static var user_texts:Array;
      
      {
         user_texts[ESP] = [];
         user_texts[PRT] = [];
         user_texts[ITA] = [];
         user_texts[POL] = [];
         user_texts[FRA] = [];
         user_texts[DEU] = [];
      }
      
      public function GameAllianzApiLocalization()
      {
         super();
      }
      
      public static function iniExternalTranslation(_arr:Array) : void
      {
         user_texts = _arr;
      }
      
      public static function addWord(_word:GameAllianzApiMultilanguageWord) : void
      {
         user_texts[ENG][_word.id] = _word.ENG;
         user_texts[UKR][_word.id] = _word.UKR;
         user_texts[RUS][_word.id] = _word.RUS;
         user_texts[ESP][_word.id] = _word.ESP;
         user_texts[PRT][_word.id] = _word.PRT;
         user_texts[ITA][_word.id] = _word.ITA;
         user_texts[POL][_word.id] = _word.POL;
         user_texts[FRA][_word.id] = _word.FRA;
         user_texts[DEU][_word.id] = _word.DEU;
      }
      
      public static function getTranslationByWordId(_id:String) : String
      {
         var val:String = null;
         val = xml_dictionary.texts.phrase.(@name == _id).translation.(@id == st_current_language);
         if(!val)
         {
            val = user_texts[st_current_language][_id];
            if(!val)
            {
               val = "";
            }
         }
         return val;
      }
      
      public static function getTranslationByWordIdAndLanguage(_id:String, _language:String) : String
      {
         var val:String = null;
         val = xml_dictionary.texts.phrase.(@name == _id).translation.(@id == _language);
         if(!val)
         {
            val = user_texts[_language][_id];
            §§push(val);
            §§push(true);
         }
         else
         {
            §§push(val);
         }
         return §§pop();
      }
      
      public static function getWordById(_id:String) : GameAllianzApiMultilanguageWord
      {
         var val:GameAllianzApiMultilanguageWord = null;
         val = new GameAllianzApiMultilanguageWord(_id);
         try
         {
            val.ENG = getTranslationByWordIdAndLanguage(_id,ENG);
            val.RUS = getTranslationByWordIdAndLanguage(_id,RUS);
            val.UKR = getTranslationByWordIdAndLanguage(_id,UKR);
            val.ESP = getTranslationByWordIdAndLanguage(_id,ESP);
            val.PRT = getTranslationByWordIdAndLanguage(_id,PRT);
            val.ITA = getTranslationByWordIdAndLanguage(_id,ITA);
            val.DEU = getTranslationByWordIdAndLanguage(_id,DEU);
         }
         catch(e:Error)
         {
            val.ENG = _id;
            val.RUS = _id;
            val.UKR = _id;
            val.FRA = _id;
         }
         return val;
      }
      
      public static function getTranslationById(_id:Number) : String
      {
         var val:String = null;
         for(; §§hasnext(xml_dictionary.texts.phrase.(@id == _id).translation,_loc4_); })
      {
         with(§§nextvalue(_loc4_,_loc5_))
         {
            
            if(@id == st_current_language)
            {
               §§push(true);
            }
         }
         val = _loc3_;
         return val;
      }
      
      public static function set language(_name:String) : void
      {
         _name = _name.toUpperCase();
         var how:Boolean = false;
         while(§§pop() < ar_languages.length)
         {
            if(ar_languages[0] == _name)
            {
               how = true;
               §§push(true);
               break;
            }
            if(ar_languages_2[st_current_language] == _name)
            {
               how = true;
               st_current_language = ar_languages[0];
               break;
            }
            §§push(0);
            §§push(true);
         }
         §§push(0);
         if(how == false)
         {
            st_current_language = ENG;
         }
      }
      
      public static function get language() : String
      {
         return st_current_language;
      }
      
      public static function get languages() : Array
      {
         return ar_languages;
      }
      
      public static function set languages(_arr:Array) : void
      {
         ar_languages = _arr;
      }
   }
}
