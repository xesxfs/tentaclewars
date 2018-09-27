package com.gamezhero.api.as3
{
   import com.gamezhero.api.as3.events.GamePreloaderEvent;
   import com.google.analytics.GATracker;
   import flash.display.MovieClip;
   import flash.display.Stage;
   import flash.events.ContextMenuEvent;
   import flash.events.Event;
   import flash.system.Security;
   import flash.text.TextField;
   import flash.ui.ContextMenu;
   import flash.ui.ContextMenuBuiltInItems;
   import flash.ui.ContextMenuItem;
   
   public class GamezheroApi
   {
      
      private static var params:Object = new Object();
      
      private static var _score_flag:Boolean = false;
      
      private static var _version:String = "4.0 (as3)";
      
      public static var MORE_GAMES_FROM_LOGO:String = "more_games_from_logo";
      
      private static var _preloader_flag:Boolean = false;
      
      public static var WALKTHROUGH:String = "walkthrough";
      
      private static var _score_target:MovieClip;
      
      public static var MORE_GAMES:String = "more_games";
      
      public static var FACEBOOK:String = "facebook";
      
      private static var _ini_flag:Boolean = false;
      
      public static var VIEW_TOP_SCORE:String = "view_top_score";
      
      public static var TWITTER:String = "twitter";
      
      private static var _preloader_target:MovieClip;
      
      private static var _preloader_next_step_function:Function;
      
      private static var _score_close_function:Function;
      
      public static var SHARE_GAME:String = "share_game";
      
      private static var SHARE_GAME_FROM_CONTEXT_MENU:String = "share_game_from_context_menu";
      
      public static var _tracker:GATracker;
      
      private static var MORE_GAMES_FROM_CONTEXT_MENU:String = "more_games_from_context_menu";
       
      
      public function GamezheroApi()
      {
         super();
      }
      
      private static function checkApp() : void
      {
         var g:MovieClip = GamezheroGlobal.root;
         §§push(true);
         §§push(true);
         §§push(true);
         if(0 < g.numChildren)
         {
            §§push(true);
         }
      }
      
      private static function method_305(evt:ContextMenuEvent = null) : void
      {
         navigateTo(MORE_GAMES_FROM_CONTEXT_MENU);
      }
      
      private static function method_300(evt:ContextMenuEvent = null) : void
      {
         navigateTo(SHARE_GAME_FROM_CONTEXT_MENU);
      }
      
      private static function method_256(evt:ContextMenuEvent = null) : void
      {
         navigateTo(TWITTER);
      }
      
      public static function trackEvent(action:String, level:String, value:Number = NaN) : void
      {
         try
         {
            _tracker.trackEvent(GamezheroGlobal.gameName,action,level,value);
            return;
         }
         catch(e:Error)
         {
            return;
         }
      }
      
      private static function method_325(event:GamePreloaderEvent = null) : void
      {
         var i:* = null;
         var obj:Object = event.value as Object;
         for(i in obj)
         {
            params[i] = obj[i];
         }
      }
      
      private static function method_242(evt:ContextMenuEvent = null) : void
      {
      }
      
      private static function method_154() : void
      {
         var gamezheroMenu:ContextMenu = new ContextMenu();
         gamezheroMenu.hideBuiltInItems();
         var defaultItems:ContextMenuBuiltInItems = gamezheroMenu.builtInItems;
         defaultItems.quality = true;
         defaultItems.print = true;
         defaultItems.save = true;
         var item1:ContextMenuItem = new ContextMenuItem(getTranslationByName(GamezheroDictionary.FOLLOW_US_ON_TWITTER));
         item1.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT,method_256);
         gamezheroMenu.customItems.push(item1);
         /*UnknownSlot*/.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT,method_300);
         gamezheroMenu.customItems.push(item4);
         var item5:ContextMenuItem = new ContextMenuItem("Gamezhero API v" + _version);
         item5.separatorBefore = true;
         item5.enabled = false;
         gamezheroMenu.customItems.push(item5);
         try
         {
            _preloader_target.contextMenu = gamezheroMenu;
            return;
         }
         catch(e:Error)
         {
            trace("Error: Ini context menu error");
            return;
         }
      }
      
      private static function method_164(target:MovieClip) : void
      {
         try
         {
            _tracker = new GATracker(target,"UA-262190-1","AS3",false);
            return;
         }
         catch(e:Error)
         {
            return;
         }
      }
      
      public static function navigateTo(from:String) : void
      {
         try
         {
            trackEvent("click",from);
            return;
         }
         catch(e:Error)
         {
         }
         if(WALKTHROUGH === _loc3_)
         {
            §§push(0);
         }
         else if(MORE_GAMES_FROM_LOGO === _loc3_)
         {
            §§push(1);
         }
         else if(VIEW_TOP_SCORE === _loc3_)
         {
            §§push(2);
         }
         else if(TWITTER === _loc3_)
         {
            §§push(3);
            §§push(true);
         }
         else
         {
            §§push(FACEBOOK === _loc3_?4:SHARE_GAME === _loc3_?5:MORE_GAMES_FROM_CONTEXT_MENU === _loc3_?6:SHARE_GAME_FROM_CONTEXT_MENU === _loc3_?7:8);
         }
         switch(§§pop())
         {
            case 0:
               if(!params["walkthrough"])
               {
                  GamezheroGlobal.getURL("http://www.gamezhero.com/walkthroughs/" + GamezheroGlobal.gameName + "-games.html?utm_campaign=" + GamezheroGlobal.gameName + "&utm_source=" + GamezheroGlobal.domain + "&utm_medium=walkthrough","_blank");
               }
               else
               {
                  GamezheroGlobal.getURL(params["logo"],"_blank");
               }
               addr556:
               return;
            case 1:
               §§push(true);
               break;
            case 2:
               if(!params["top_score"])
               {
                  GamezheroGlobal.getURL("http://www.gamezhero.com/topscore/" + GamezheroGlobal.gameName + "/top100.html?utm_campaign=" + GamezheroGlobal.gameName + "&utm_source=" + GamezheroGlobal.domain + "&utm_medium=submit_score","_blank");
               }
               else
               {
                  GamezheroGlobal.getURL(params["top_score"],"_blank");
               }
               §§goto(addr556);
            case 3:
               if(!params["folow_us_on_twitter"])
               {
                  GamezheroGlobal.getURL("http://twitter.com/gamezhero","_blank");
               }
               else
               {
                  GamezheroGlobal.getURL(params["folow_us_on_twitter"],"_blank");
               }
               §§goto(addr556);
            case 4:
               if(!params["became_a_fun_on_facebook"])
               {
                  GamezheroGlobal.getURL("http://www.facebook.com/apps/application.php?id=100609699984305","_blank");
               }
               else
               {
                  GamezheroGlobal.getURL(params["became_a_fun_on_facebook"],"_blank");
               }
               §§goto(addr556);
            case 5:
               break;
            case 6:
               if(!params["more_games_context_menu"])
               {
                  GamezheroGlobal.getURL("http://www.gamezhero.com/?utm_campaign=" + GamezheroGlobal.gameName + "&utm_source=" + GamezheroGlobal.domain + "&utm_medium=more_free_games_context_menu","_blank");
               }
               else
               {
                  GamezheroGlobal.getURL(params["more_games_context_menu"],"_blank");
               }
               §§goto(addr556);
            case 7:
               if(!params["share_game_context_menu"])
               {
                  GamezheroGlobal.getURL("http://www.gamezhero.com/?utm_campaign=" + GamezheroGlobal.gameName + "&utm_source=" + GamezheroGlobal.domain + "&utm_medium=share_game","_blank");
               }
               else
               {
                  GamezheroGlobal.getURL(params["share_game_context_menu"],"_blank");
               }
               §§goto(addr556);
            default:
               if(!params["more_games"])
               {
                  ("http://www.gamezhero.com/?utm_campaign=" + GamezheroGlobal.gameName).getURL(true + GamezheroGlobal.domain + "&utm_medium=more_free_games","_blank");
                  §§push(GamezheroGlobal);
               }
               else
               {
                  GamezheroGlobal.getURL(params["more_games"],"_blank");
               }
               §§goto(addr556);
         }
         if(!params["share_game"])
         {
            ("http://www.gamezhero.com/freewebsitegames/" + GamezheroGlobal.gameName + "-games.html?utm_campaign=" + GamezheroGlobal.gameName + "&utm_source=").getURL(true + "&utm_medium=share_game","_blank");
            §§push(GamezheroGlobal);
         }
         else
         {
            GamezheroGlobal.getURL(params["share_game"],"_blank");
         }
         §§goto(addr556);
      }
      
      public static function submitScore(gameCode:String, scoreValue:Number, closeAction:Function) : void
      {
         var score_value:Number = NaN;
         var scoreGamezheroForm:GameScore = null;
         scoreGamezheroForm = new GameScore(_score_target,GameScore.SUBMIT_MODE,score_value);
         scoreGamezheroForm.addEventListener(GameScore.CLOSE,method_101);
      }
      
      private static function method_101(event:GamePreloaderEvent = null) : void
      {
         _score_flag = false;
         try
         {
            (event.target as GameScore).removeEventListener(GameScore.CLOSE,method_101);
            return;
         }
         catch(e:Error)
         {
         }
         try
         {
            _score_close_function.call(null,event.value);
            return;
         }
         catch(e:Error)
         {
            _score_close_function.call(null);
            return;
         }
      }
      
      public static function getTranslationByName(name:String) : String
      {
         return GamezheroDictionary.getTranslationByName(name);
      }
      
      public static function viewScore(gameCode:String, closeAction:Function, showBackground:Boolean = true) : void
      {
         var scoreGamezheroForm:GameScore = null;
         §§push(true);
         if(_ini_flag != true)
         {
            trace("Error. GamezheroApi don\'t initialize.");
            return;
         }
         GamezheroGlobal.gameCode = gameCode;
         _score_target = GamezheroGlobal.root;
         _score_close_function = closeAction;
         §§push(GamezheroGlobal.gameName == "unset");
         if(GamezheroGlobal.gameName == "unset" == true)
         {
            trace("Error. GamezheroApi don\'t ini or score is opened");
         }
         else
         {
            _score_flag = true;
            scoreGamezheroForm = new GameScore(_score_target,GameScore.VIEW_MODE);
            scoreGamezheroForm.addEventListener(GameScore.CLOSE,method_101);
         }
      }
      
      public static function ini(appRoot:MovieClip, gameName:String, multiLanguage:Boolean = false) : void
      {
         var _stage:Stage = null;
         GamezheroGlobal.root = appRoot;
         GamezheroGlobal.multilanguage = multiLanguage;
         if(GamezheroGlobal.multilanguage == false)
         {
            GamezheroDictionary.language = GamezheroDictionary.ENG;
         }
         else
         {
            _stage = GamezheroGlobal.root.stage;
            if(_stage.root.loaderInfo.parameters["language"])
            {
               GamezheroDictionary.language = _stage.root.loaderInfo.parameters["language"];
            }
            else
            {
               GamezheroDictionary.language = GamezheroDictionary.ENG;
            }
         }
         Security.allowDomain("www.gamezhero.com","gamezhero.com","files.gamezhero.com","data.gamezhero.com","*.gamezhero.com");
         Security.allowInsecureDomain("www.gamezhero.com","gamezhero.com","files.gamezhero.com","data.gamezhero.com","*.gamezhero.com");
         GamezheroGlobal.gameName = gameName;
         if(GamezheroGlobal.root == null)
         {
            trace("Error Ini GamezheroApi. appRoot == null");
         }
         else
         {
            _ini_flag = true;
            method_164(GamezheroGlobal.root);
            checkApp();
         }
      }
      
      private static function method_228(event:Event = null) : void
      {
         method_154();
         _preloader_next_step_function.apply();
      }
      
      public static function preloader(nextStep:Function) : void
      {
         var gamePreloader:GamePreloader = null;
         if(_ini_flag != true)
         {
            trace("Error. GamezheroApi don\'t initialize.");
            return;
         }
         try
         {
            trackEvent("load_start","preloader");
         }
         catch(e:Error)
         {
         }
         _preloader_target = GamezheroGlobal.root;
         _preloader_next_step_function = nextStep;
         if(GamezheroGlobal.gameName == "unset" || _preloader_flag == true)
         {
            trace("Error. GamezheroApi don\'t ini or preloader is opened");
         }
         else
         {
            _preloader_flag = true;
            gamePreloader = new GamePreloader(_preloader_target,{"debug":false});
            GamePreloaderEvent.FINISH.addEventListener(true,method_325);
            §§push(gamePreloader);
         }
         var gamezheroMenu:ContextMenu = new ContextMenu();
         gamezheroMenu.hideBuiltInItems();
         _preloader_target.contextMenu = gamezheroMenu;
      }
   }
}
