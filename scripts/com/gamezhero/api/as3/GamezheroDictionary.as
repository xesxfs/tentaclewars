package com.gamezhero.api.as3
{
   public class GamezheroDictionary
   {
      
      public static const SUBMIT_TOP_SCORE:String = "submit_top_score";
      
      public static const UKR:String = "UKR";
      
      public static const MUSIC:String = "music";
      
      public static const GAME_OVER:String = "game_over";
      
      public static const PRT:String = "PRT";
      
      public static var user_texts:Array = new Array();
      
      public static const SUBMIT:String = "submit";
      
      private static var _languages:Array = [ENG,ESP,UKR,RUS];
      
      public static const PLAY_GAME:String = "play_game";
      
      public static const SETTINGS:String = "settings";
      
      public static const MAIN_MENU:String = "main_menu";
      
      public static const FOLLOW_US_ON_TWITTER:String = "folow_us_on_twitter";
      
      public static const CONTINUE:String = "continue";
      
      public static const POL:String = "POL";
      
      public static const CONGRATULATIONS:String = "congratulate";
      
      public static const WALKTHROUGH:String = "walkthrough";
      
      private static var _current_language:String = ENG;
      
      public static const ENG:String = "ENG";
      
      public static const HELP:String = "help";
      
      public static const SEND_TO_FRIENDS:String = "send_to friends";
      
      private static var _dictionary:XML = <dictionary>
                                        <languages>
                                                        <language id="{ENG}"><![CDATA[English]]></language>
                                                        <language id="{UKR}"><![CDATA[Українська]]></language>
                                                        <language id="{RUS}"><![CDATA[Русский]]></language>
                                                        <language id="{ESP}"><![CDATA[Español]]></language>
                                                        <language id="{PRT}"><![CDATA[Portugues]]></language>                        
                                                        <language id="{ITA}"><![CDATA[Italiano]]></language>
                                        </languages>
                                        <texts>
                                                        <phrase id="1" name="{NEW_GAME}">
                                                                        <translation id="{ENG}"><![CDATA[New Game]]></translation>
                                                                        <translation id="{UKR}"><![CDATA[Нова Гра]]></translation>
                                                                        <translation id="{RUS}"><![CDATA[Новая Игра]]></translation>
                                                                        <translation id="{ESP}"><![CDATA[Nuevo juego]]></translation>
                                                                        <translation id="{PRT}"><![CDATA[Novo jogo]]></translation>
                                                                        <translation id="{ITA}"><![CDATA[Nuovo gioco]]></translation>
                                                        </phrase>
                                                        <phrase id="2" name="{CONTINUE}">
                                                                        <translation id="{ENG}"><![CDATA[Continue]]></translation>
                                                                        <translation id="{UKR}"><![CDATA[Продовжити]]></translation>
                                                                        <translation id="{RUS}"><![CDATA[Продолжить]]></translation>
                                                                        <translation id="{ESP}"><![CDATA[Continuar]]></translation>
                                                                        <translation id="{PRT}"><![CDATA[Continuar]]></translation>
                                                                        <translation id="{ITA}"><![CDATA[Continuare]]></translation>
                                                        </phrase>
                                                        <phrase id="3" name="{TOP_SCORE}">
                                                                        <translation id="{ENG}"><![CDATA[Top Score]]></translation>
                                                                        <translation id="{UKR}"><![CDATA[Результати]]></translation>
                                                                        <translation id="{RUS}"><![CDATA[Результаты]]></translation>
                                                                        <translation id="{ESP}"><![CDATA[Resultados]]></translation>
                                                                        <translation id="{PRT}"><![CDATA[Resultados]]></translation>
                                                                        <translation id="{ITA}"><![CDATA[Risultati]]></translation>
                                                        </phrase>
                                                        <phrase id="4" name="{SETTINGS}">
                                                                        <translation id="{ENG}"><![CDATA[Settings]]></translation>
                                                                        <translation id="{UKR}"><![CDATA[Налаштування]]></translation>
                                                                        <translation id="{RUS}"><![CDATA[Настройки]]></translation>
                                                                        <translation id="{ESP}"><![CDATA[Ajustes]]></translation>
                                                                        <translation id="{PRT}"><![CDATA[Especificações]]></translation>
                                                                        <translation id="{ITA}"><![CDATA[Impostazioni]]></translation>
                                                        </phrase>       
                                                        <phrase id="5" name="{HELP}">
                                                                        <translation id="{ENG}"><![CDATA[Help]]></translation>
                                                                        <translation id="{UKR}"><![CDATA[Порадник]]></translation>
                                                                        <translation id="{RUS}"><![CDATA[Помощь]]></translation>
                                                                        <translation id="{ESP}"><![CDATA[Ayuda]]></translation>
                                                                        <translation id="{PRT}"><![CDATA[Ajuda]]></translation>
                                                                        <translation id="{ITA}"><![CDATA[Aiuto]]></translation>
                                                        </phrase>                               
                                                        <phrase id="6" name="{MAIN_MENU}">
                                                                        <translation id="{ENG}"><![CDATA[Menu]]></translation>
                                                                        <translation id="{UKR}"><![CDATA[Меню]]></translation>
                                                                        <translation id="{RUS}"><![CDATA[Меню]]></translation>
                                                                        <translation id="{ESP}"><![CDATA[Menú]]></translation>
                                                                        <translation id="{PRT}"><![CDATA[Menú]]></translation>
                                                                        <translation id="{ITA}"><![CDATA[Menu]]></translation>
                                                        </phrase>                               
                                                        <phrase id="7" name="{SOUND}">
                                                                        <translation id="{ENG}"><![CDATA[Sound]]></translation>
                                                                        <translation id="{UKR}"><![CDATA[Звук]]></translation>
                                                                        <translation id="{RUS}"><![CDATA[Звук]]></translation>
                                                                        <translation id="{ESP}"><![CDATA[Sonido]]></translation>
                                                                        <translation id="{PRT}"><![CDATA[Sonido]]></translation>
                                                                        <translation id="{ITA}"><![CDATA[Suono]]></translation>
                                                        </phrase>                               
                                                        <phrase id="8" name="{MUSIC}">
                                                                        <translation id="{ENG}"><![CDATA[Music]]></translation>
                                                                        <translation id="{UKR}"><![CDATA[Музика]]></translation>
                                                                        <translation id="{RUS}"><![CDATA[Музыка]]></translation>
                                                                        <translation id="{ESP}"><![CDATA[Música]]></translation>
                                                                        <translation id="{PRT}"><![CDATA[Música]]></translation>
                                                                        <translation id="{ITA}"><![CDATA[Musica]]></translation>
                                                        </phrase>                               
                                                        <phrase id="9" name="{LANGUAGE}">
                                                                        <translation id="{ENG}"><![CDATA[Language]]></translation>
                                                                        <translation id="{UKR}"><![CDATA[Мова]]></translation>
                                                                        <translation id="{RUS}"><![CDATA[Язык]]></translation>
                                                                        <translation id="{ESP}"><![CDATA[Idioma]]></translation>
                                                                        <translation id="{PRT}"><![CDATA[Lengua]]></translation>
                                                                        <translation id="{ITA}"><![CDATA[Lingua]]></translation>
                                                        </phrase>       
                                                        <phrase id="10" name="{LEVEL_FAILED}">
                                                                        <translation id="{ENG}"><![CDATA[Level Failed]]></translation>
                                                                        <translation id="{UKR}"><![CDATA[Халепа]]></translation>
                                                                        <translation id="{RUS}"><![CDATA[Неудача]]></translation>
                                                                        <translation id="{ESP}"><![CDATA[Nivel fracasado]]></translation>
                                                                        <translation id="{PRT}"><![CDATA[Nível fracassado]]></translation>
                                                                        <translation id="{ITA}"><![CDATA[Livello falito ]]></translation>
                                                        </phrase>                               
                                                        <phrase id="11" name="{REPLAY}">
                                                                        <translation id="{ENG}"><![CDATA[Replay]]></translation>
                                                                        <translation id="{UKR}"><![CDATA[Грати Знов]]></translation>
                                                                        <translation id="{RUS}"><![CDATA[Играть Снова]]></translation>
                                                                        <translation id="{ESP}"><![CDATA[Jugar de nuevo]]></translation>
                                                                        <translation id="{PRT}"><![CDATA[Jogar de novo]]></translation>
                                                                        <translation id="{ITA}"><![CDATA[Giocare di nuovo]]></translation>
                                                        </phrase>                               
                                                        <phrase id="12" name="{MORE_GAMES}">
                                                                        <translation id="{ENG}"><![CDATA[More Games]]></translation>
                                                                        <translation id="{UKR}"><![CDATA[Більше Ігор]]></translation>
                                                                        <translation id="{RUS}"><![CDATA[Больше Игр]]></translation>
                                                                        <translation id="{ESP}"><![CDATA[Más juegos gratis]]></translation>
                                                                        <translation id="{PRT}"><![CDATA[Mais jogos gratuitos]]></translation>
                                                                        <translation id="{ITA}"><![CDATA[Di più giochi gratis]]></translation>
                                                        </phrase>
                                                        <phrase id="13" name="{SEND_TO_FRIENDS}">
                                                                        <translation id="{ENG}"><![CDATA[Send To Friends]]></translation>
                                                                        <translation id="{UKR}"><![CDATA[Надіслати Гру Другові]]></translation>
                                                                        <translation id="{RUS}"><![CDATA[Послать Игру Другу]]></translation>
                                                                        <translation id="{ESP}"><![CDATA[Enviar a los amigos]]></translation>
                                                                        <translation id="{PRT}"><![CDATA[Mandar aos amigos]]></translation>
                                                                        <translation id="{ITA}"><![CDATA[Inviare agli amici]]></translation>
                                                        </phrase>               
                                                        <phrase id="14" name="{FOLLOW_US_ON_TWITTER}">
                                                                        <translation id="{ENG}"><![CDATA[Follow us on Twitter]]></translation>
                                                                        <translation id="{UKR}"><![CDATA[Ми на Twitter]]></translation>
                                                                        <translation id="{RUS}"><![CDATA[Мы на Twitter]]></translation>
                                                                        <translation id="{ESP}"><![CDATA[Siga con nosotros en Twitter]]></translation>
                                                                        <translation id="{PRT}"><![CDATA[Sigam-nós no Twitter]]></translation>
                                                                        <translation id="{ITA}"><![CDATA[Siamo su Twitter]]></translation>
                                                        </phrase>                       
                                                        <phrase id="15" name="{BECOME_A_FUN_ON_FACEBOOK}">
                                                                        <translation id="{ENG}"><![CDATA[Become a Fan on Facebook]]></translation>
                                                                        <translation id="{UKR}"><![CDATA[Ми на Facebook]]></translation>
                                                                        <translation id="{RUS}"><![CDATA[Мы на Facebook]]></translation>
                                                                        <translation id="{ESP}"><![CDATA[Estamos en Facebook]]></translation>
                                                                        <translation id="{PRT}"><![CDATA[Seja o fan no Facebook]]></translation>
                                                                        <translation id="{ITA}"><![CDATA[Siamo su Facebook]]></translation>
                                                        </phrase>                       
                                                        <phrase id="16" name="{SHARE_GAME}">
                                                                        <translation id="{ENG}"><![CDATA[Share Game]]></translation>
                                                                        <translation id="{UKR}"><![CDATA[Запропонувати Гру]]></translation>
                                                                        <translation id="{RUS}"><![CDATA[Поделиться Игрой]]></translation>
                                                                        <translation id="{ESP}"><![CDATA[Compartir el juego]]></translation>
                                                                        <translation id="{PRT}"><![CDATA[Compartilhar o jogo]]></translation>
                                                                        <translation id="{ITA}"><![CDATA[Comunicare il gioco]]></translation>
                                                        </phrase>
                                                        <phrase id="17" name="{CONGRATULATIONS}">
                                                                        <translation id="{ENG}"><![CDATA[Congratulations]]></translation>
                                                                        <translation id="{UKR}"><![CDATA[Вітаємо]]></translation>
                                                                        <translation id="{RUS}"><![CDATA[Поздравляем]]></translation>
                                                                        <translation id="{ESP}"><![CDATA[Felicidades]]></translation>
                                                                        <translation id="{PRT}"><![CDATA[Parabéns]]></translation>
                                                                        <translation id="{ITA}"><![CDATA[Molti auguri]]></translation>
                                                        </phrase>
                                                        <phrase id="18" name="{PLAY_GAME}">
                                                                        <translation id="{ENG}"><![CDATA[Play Game]]></translation>
                                                                        <translation id="{UKR}"><![CDATA[Грати]]></translation>
                                                                        <translation id="{RUS}"><![CDATA[Играть]]></translation>
                                                                        <translation id="{ESP}"><![CDATA[Jugar]]></translation>
                                                                        <translation id="{PRT}"><![CDATA[Jogar]]></translation>
                                                                        <translation id="{ITA}"><![CDATA[Giocare]]></translation>
                                                        </phrase>       
                                                        <phrase id="19" name="{SUBMIT_TOP_SCORE}">
                                                                        <translation id="{ENG}"><![CDATA[Submit Top Score]]></translation>
                                                                        <translation id="{UKR}"><![CDATA[Надіслати Результат]]></translation>
                                                                        <translation id="{RUS}"><![CDATA[Отправить Результат]]></translation>
                                                                        <translation id="{ESP}"><![CDATA[Enviar el resultado]]></translation>
                                                                        <translation id="{PRT}"><![CDATA[Mandar o resultado]]></translation>
                                                                        <translation id="{ITA}"><![CDATA[Inviare il risultato]]></translation>
                                                        </phrase>
                                                        <phrase id="20" name="{ENTER_YOUR_NAME}">
                                                                        <translation id="{ENG}"><![CDATA[Enter Your Name]]></translation>
                                                                        <translation id="{UKR}"><![CDATA[Введіть Ваше Ім'я]]></translation>
                                                                        <translation id="{RUS}"><![CDATA[Введите Ваше Имя]]></translation>
                                                                        <translation id="{ESP}"><![CDATA[Entre su nombre]]></translation>
                                                                        <translation id="{PRT}"><![CDATA[Entre o seu nome]]></translation>
                                                                        <translation id="{ITA}"><![CDATA[Entre il suo nome]]></translation>
                                                        </phrase>
                                                        <phrase id="21" name="{SUBMIT}">
                                                                        <translation id="{ENG}"><![CDATA[Submit]]></translation>
                                                                        <translation id="{UKR}"><![CDATA[Надіслати]]></translation>
                                                                        <translation id="{RUS}"><![CDATA[Отправить]]></translation>
                                                                        <translation id="{ESP}"><![CDATA[Enviar]]></translation>
                                                                        <translation id="{PRT}"><![CDATA[Mandar]]></translation>
                                                                        <translation id="{ITA}"><![CDATA[Inviare]]></translation>
                                                        </phrase>               
                                                        <phrase id="22" name="{GAME_OVER}">
                                                                        <translation id="{ENG}"><![CDATA[Game Over]]></translation>
                                                                        <translation id="{UKR}"><![CDATA[Кінець Гри]]></translation>
                                                                        <translation id="{RUS}"><![CDATA[Конец Игры]]></translation>
                                                                        <translation id="{ESP}"><![CDATA[Juego Terminado]]></translation>
                                                                        <translation id="{PRT}"><![CDATA[Jogo Terminado]]></translation>
                                                                        <translation id="{ITA}"><![CDATA[Gioco Finito]]></translation>
                                                        </phrase>       
                                                        <phrase id="23" name="{WALKTHROUGH}">
                                                                        <translation id="{ENG}"><![CDATA[Walkthrough]]></translation>
                                                                        <translation id="{UKR}"><![CDATA[Проходження]]></translation>
                                                                        <translation id="{RUS}"><![CDATA[Прохождение]]></translation>
                                                                        <translation id="{ESP}"><![CDATA[Tutorial]]></translation>
                                                                        <translation id="{PRT}"><![CDATA[Passo a passo]]></translation>
                                                                        <translation id="{ITA}"><![CDATA[Passo passo]]></translation>
                                                        </phrase>       
                                        </texts>
                        </dictionary>;
      
      public static const MORE_GAMES:String = "more_games";
      
      public static const NEW_GAME:String = "new_game";
      
      public static const ENTER_YOUR_NAME:String = "enter_your_name";
      
      public static const LANGUAGE:String = "language";
      
      public static const BECOME_A_FUN_ON_FACEBOOK:String = "became_a_fun_on_facebook";
      
      public static const ESP:String = "ESP";
      
      public static const REPLAY:String = "replay";
      
      public static const SOUND:String = "sound";
      
      public static const SHARE_GAME:String = "share_game";
      
      public static const DEU:String = "DEU";
      
      public static const FRA:String = "FRS";
      
      public static const ITA:String = "ITA";
      
      public static const TOP_SCORE:String = "top_score";
      
      public static const LEVEL_FAILED:String = "level_failed";
      
      public static const RUS:String = "RUS";
      
      {
         user_texts[ENG] = [];
         user_texts[UKR] = [];
         user_texts[RUS] = [];
         user_texts[ESP] = [];
         PRT[[]] = true;
         user_texts[ENG]["Achievements 0"] = "Achievements";
         user_texts[UKR]["Achievements 0"] = "Досягнення";
         user_texts[RUS]["Achievements 0"] = "Достижения";
         user_texts[RUS]["zone"] = "Зона";
         user_texts[ESP]["zone"] = "Zona";
         ENG[true]["neutral"] = "Neutral";
         user_texts[ENG]["game-text-3"] = "To increase your power - cut your tentacle close to an alien microbe.";
         user_texts[UKR]["game-text-3"] = "Щоб підвищити силу — відріж щупальце близько до іноземного мікроба";
         user_texts[RUS]["game-text-3"] = "Чтобы повысить силу — отрежь своё щупальце близко к чужому микробу";
         user_texts[ESP]["game-text-3"] = "Corta tu tentáculo cerca de microbio para aumentar tu poder";
         user_texts[ENG]["game-text-4"] = "To capture faster - cut a tentacle close to your microbe";
         user_texts[UKR]["game-text-4"] = "Захопи скоріше — відріж своє щупальце ближче до свого мікроба";
         user_texts[RUS]["game-text-4"] = "Захвати быстрее — отрежь своё щупальце около своего микроба";
         true[ENG]["game-text-5"] = "Warning! Purple microbes have better instincts";
         user_texts[UKR]["game-text-5"] = "Увага: у фіолетових мікробів кращі інстинкти";
         user_texts[RUS]["game-text-5"] = "Внимание: у фиолетовых микробов лучше инстинкты";
         user_texts[ESP]["game-text-5"] = "Atención: los microbios púrpuras tienen mejores instintos";
      }
      
      public function GamezheroDictionary()
      {
         super();
      }
      
      public static function get languages() : Array
      {
         return _languages;
      }
      
      public static function get language() : String
      {
         return _current_language;
      }
      
      public static function set language(_name:String) : void
      {
         _name = _name.toUpperCase();
         var how:Boolean = false;
         for(var i:Number = 0; i < _languages.length; )
         {
            if(_languages[i] == _name)
            {
               how = true;
               _current_language = _name;
               break;
            }
            i++;
         }
         if(how == false)
         {
            _current_language = ENG;
         }
      }
      
      public static function getTranslationByName(_name:String) : String
      {
         var val:String = null;
         val = _dictionary.texts.phrase.(@name == _name).translation.(@id == _current_language);
         if(!val)
         {
            val = user_texts[_current_language][_name];
            if(!val)
            {
               val = "";
               trace("error translate " + _name);
            }
         }
         return val;
      }
   }
}
