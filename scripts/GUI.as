package
{
   import com.bit101.components.HBox;
   import com.bit101.components.PushButton;
   import com.bit101.components.Style;
   import com.bit101.components.Text;
   import com.bit101.components.VBox;
   import com.bit101.components.Window;
   import com.gameallianz.api.as3.GameAllianzApi;
   import com.gameallianz.api.as3.GameAllianzApiLinks;
   import com.gameallianz.api.as3.assets.AssetFacebookButton;
   import com.gameallianz.api.as3.assets.AssetPortalLogo;
   import com.gameallianz.api.as3.assets.AssetTwitterButton;
   import com.gamezhero.api.as3.GamezheroDictionary;
   import com.gamezhero.api.as3.GamezheroGlobal;
   import com.newgrounds.API;
   import com.newgrounds.components.MedalPopup;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Graphics;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.filters.GlowFilter;
   import flash.net.SharedObject;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   
   public class GUI
   {
      
      public static const INNER_COLOR:int = 8947848;
      
      public static const TXT_RED:String;
      
      private static var m_openLevel:int = 0;
      
      public static const MAX_X:int = 640;
      
      public static const MAX_Y:int = 480;
      
      private static var m_fadeInProgress:Boolean = false;
      
      public static const TXT_ZONE_OCCUPIED:String;
      
      public static const TXT_OF:String;
      
      private static var m_sharedLvl:SharedLevels = null;
      
      private static var m_currScore:int = 0;
      
      public static const TXT_GREEN:String;
      
      public static const TXT_POWER:String;
      
      public static const TXT_ZONE:String;
      
      public static const TXT_DISABLE_AI:String;
      
      private static var m_fadeEnabled:Boolean = true;
      
      public static const TXT_LATEST:String;
      
      public static const TXT_WALL:String = GamezheroDictionary.getTranslationByName("wall");
      
      public static const TXT_AUTHOR:String;
      
      public static const TXT_DELETE_WALL:String;
      
      private static const BUTTON_GLOW:GlowFilter;
      
      private static var m_game:Main = null;
      
      public static const TXT_MORE_GAMES:String;
      
      public static const TXT_PURPLE:String;
      
      public static const TXT_EDIT:String;
      
      public static const TXT_EXTERMINATION:String;
      
      public static const TXT_CLASS:String;
      
      public static const URL_ORIGINAL_GAME:String;
      
      public static const TXT_TOP_RATED:String = GamezheroDictionary.getTranslationByName("top-rated");
      
      public static const TXT_INSTANT_AI:String;
      
      public static const TXT_REPLAY:String;
      
      private static var m_parent:Sprite = null;
      
      public static const TXT_NEUTRAL:String;
      
      public static const TXT_LEVEL_URL:String;
      
      private static const BG_COLOR:uint = 1122850;
      
      public static const TXT_SHARED_LEVELS:String;
      
      public static const TXT_SUBMIT_LVL_HINT_ERROR:String;
      
      public static const TXT_SUBMIT:String;
      
      public static const OUTLINE_COLOR:int = 15658734;
      
      private static var m_fadeAlpha:Number = 1;
      
      public static const TXT_MICROBE:String = GamezheroDictionary.getTranslationByName("microbe");
      
      private static var m_sharedObj:SharedObject = null;
      
      public static const TXT_OPEN_URL:String = GamezheroDictionary.getTranslationByName("open-link");
      
      public static const TXT_FINAL_SCREEN:String = "Created by Lumarama";
      
      public static const TXT_MAX_POWER:String;
      
      public static const TXT_QUICK_AI:String;
      
      public static const TXT_COPY_TO_CLIPBOARD:String = GamezheroDictionary.getTranslationByName("copy-clipboard");
      
      private static var m_fade:Sprite = null;
      
      public static const TXT_SUBMIT_SCORE:String;
      
      public static const TXT_PAGE:String;
      
      private static var m_currLevel:int = 0;
      
      public static const TXT_TEST:String;
      
      public static const TXT_DELETE_MICROBE:String;
      
      public static const TXT_BLACK:String;
      
      public static const TXT_SHARED:String = "X";
      
      public static const TXT_ERROR:String;
      
      public static const TXT_LEVEL_URL_LONG1:String;
      
      public static const TXT_LEVEL_URL_LONG2:String = GamezheroDictionary.getTranslationByName("share-level-long-2");
      
      public static const BOTTOM_Y:int = 480;
      
      public static const TXT_CANCEL:String;
      
      public static const TXT_GAME_HINT1:String;
      
      public static const TXT_WALKTHROUGH:String;
      
      public static const TXT_GAME_HINT3:String;
      
      public static const TXT_NORMAL_AI:String;
      
      public static const TXT_GAME_HINT2:String;
      
      private static const ADD_THIS_X_DELTA:uint = 0;
      
      public static const TXT_TIME:String;
      
      public static const TXT_TUTORIAL1:String;
      
      public static const TXT_TUTORIAL2:String;
      
      private static var m_items:Array;
      
      public static const TXT_SAVE_LEVEL:String;
      
      public static const TXT_CREATE_MICROBE:String;
      
      private static const BmpTitleBack:Class;
      
      private static var m_soundOn:Boolean = true;
      
      public static const TXT_CONTINUE:String;
      
      public static const TXT_CREATE_WALL:String;
      
      public static const TXT_PLAY:String;
      
      private static var m_totalTries:int = 0;
      
      public static const TXT_SCORE:String;
      
      private static var m_fadeCompleteFunc:Function = null;
      
      public static const TXT_LEVEL_NAME:String;
      
      private static var m_successTries:int = 0;
      
      public static const BACK_COLOR:int = 3355443;
      
      public static const BmpBack:Class;
      
      public static const TXT_MENU:String;
      
      public static const TXT_SELECT_LEVEL:String = GamezheroDictionary.getTranslationByName("select-level");
      
      public static const TXT_ORIGINAL_GAME:String = "Tentacle Wars 1".toLocaleUpperCase();
      
      private static const BmpSponsor:Class;
      
      public static const URL_SHARED_LEVEL:String = "http://www.gamezhero.com/online-games/strategy-games/tentaclewarsthepurplemenace-games.html?level_id=";
      
      public static const TXT_SUBMIT_LVL_HINT_OK:String;
       
      
      public function GUI()
      {
      }
      
      private static function method_134(isLevelPassed:Boolean, time:int) : Sprite
      {
         var dialogX:int = 280;
         var dialog:Sprite = new Sprite();
         var g:Graphics = dialog.graphics;
         removeAll();
         dialog.x = MAX_X / 2;
         dialog.y = MAX_Y / 2 - 30;
         g.beginFill(BG_COLOR,1);
         g.lineStyle(1,5592405);
         g.drawRect(-dialogX / 2,-300 / 2 + 30,dialogX,300);
         g.endFill();
         var hdr:Sprite = createText((!!isLevelPassed?TXT_ZONE_OCCUPIED:TXT_EXTERMINATION).toUpperCase(),30,!!isLevelPassed?uint(5635925):uint(16733525),1,false,16777215,GamezheroDictionary.language == GamezheroDictionary.ENG?"header":"translate");
         hdr.x = 0;
         hdr.y = -80;
         dialog.addChild(hdr);
         var but:Sprite = null;
         but = method_43(TXT_MENU,0,90,onGameMenu);
         dialog.addChild(but);
         var btn:DisplayObject = new BtnGamezhero();
         btn.scaleX = 0.8;
         btn.scaleY = 0.8;
         btn.x = -(btn.width / 2) - 10;
         btn.y = -(btn.height / 2) + 25;
         btn.addEventListener(MouseEvent.CLICK,method_73);
         dialog.addChild(btn);
         return dialog;
      }
      
      private static function method_195() : void
      {
         if(m_currLevel >= 0)
         {
            if(m_game)
            {
               removeAll();
               m_game.initLevel(m_currLevel);
               §§push(true);
            }
         }
         fade(false);
      }
      
      private static function method_234(evt:MouseEvent) : void
      {
         var but:Sprite = null;
         §§push(true);
         if(m_game && evt.target is Sprite)
         {
            but = evt.target as Sprite;
            m_currLevel = int(but.name);
            if(m_currLevel >= 0)
            {
               SoundMgr.playSfx(SoundMgr.BEGIN_GAME);
               fade(true,method_195);
            }
         }
      }
      
      public static function createText(str:String, size:int, color:uint, alpha:Number = 1, outline:Boolean = false, outlineColor:uint = 16777215, fontName:String = "default", isCentered:Boolean = true) : TextSprite
      {
         return new TextSprite(str,size,color,alpha,outline,outlineColor,fontName,isCentered);
      }
      
      private static function onSubmitScoreClick(evt:MouseEvent = null) : void
      {
         Preloader.sendScore(0,m_currScore);
      }
      
      public static function showInGamePanel(levelName:String, maxPower:int, time:int, testLevel:Boolean = false) : void
      {
         removeByName("ingame-panel");
         var dialog:Sprite = new Sprite();
         var /*UnknownSlot*/:* = method_43(TXT_WALKTHROUGH,MAX_X - 70,MAX_Y - 15,method_73);
         but.name = GameAllianzApiLinks.TO_GAME_WALKTHROUGH;
         but.x = MAX_X - but.width / 2 - 10;
         dialog.addChild(but);
         m_parent.addChild(dialog);
         m_items.push(dialog);
      }
      
      private static function method_128() : void
      {
         onGameMenu();
      }
      
      public static function onStartSharedLevel(levelData:String, levelId:String, levelName:String, hint:String) : void
      {
         SoundMgr.playSfx(SoundMgr.BEGIN_GAME);
         fade(true,function():void
         {
            removeAll();
            m_game.initSharedLevel(levelData,levelName,levelId);
            showInGameStatus(hint);
            fade(false);
         });
      }
      
      private static function fade(enable:Boolean, completeFunc:Function = null) : void
      {
         if(!m_fadeInProgress)
         {
            m_fade.addEventListener(Event.ENTER_FRAME,GUI.onEnterFrame);
         }
         m_fadeEnabled = enable;
         m_fadeInProgress = true;
         m_fadeCompleteFunc = completeFunc;
      }
      
      private static function method_209(event:MouseEvent) : void
      {
         var but:DisplayObject = event.target as DisplayObject;
         if(but != null && but.name.length > 0)
         {
            trace(but.name);
            gotoUrl(but.name);
         }
      }
      
      public static function removeAll() : void
      {
         for(m_sharedLvl.hideLevelsChooser(); §§pop().length > 0; )
         {
            §§push(m_items);
            §§push(true);
         }
      }
      
      private static function method_142(evt:MouseEvent) : void
      {
         fade(true,replayLevel);
      }
      
      private static function onEnterFrame(event:Event) : void
      {
         var done:Boolean = false;
         done = true;
         m_fade.alpha = m_fadeAlpha;
         §§push(m_fadeInProgress);
         if(done)
         {
            m_fade.removeEventListener(Event.ENTER_FRAME,onEnterFrame);
            m_fadeInProgress = false;
            if(m_fadeCompleteFunc != null)
            {
               m_fadeCompleteFunc();
            }
         }
      }
      
      public static function createInterSharedLevelMenu(levelId:String, isLevelPassed:Boolean, time:int) : void
      {
         SoundMgr.playSfx(!!isLevelPassed?int(SoundMgr.LEVEL_PASSED):int(SoundMgr.LEVEL_FAILED));
         GameAllianzApi.rateLevel();
      }
      
      public static function createSharedLevelsMenu() : void
      {
         removeAll();
         fade(false);
         var dialog:Sprite = method_93();
         m_sharedLvl.showLevelsChooser();
         m_parent.addChild(dialog);
         m_items.push(dialog);
      }
      
      public static function createFinalScreen() : void
      {
         removeAll();
         m_game.clearLevel();
         fade(true);
         var logo:Sprite = new Sprite();
         /*UnknownSlot*/.addChild(bmp);
         logo.scaleX = 0.7;
         logo.scaleY = 0.7;
         var but:Sprite = null;
         but = method_43(TXT_SUBMIT_SCORE,MAX_X / 2,MAX_Y - 80,function(evt:MouseEvent):void
         {
            if(m_soundOn)
            {
               SoundMgr.musicEnable(true);
            }
            onSubmitScoreClick(evt);
         });
         m_fade.addChild(but);
         m_items.push(but);
         m_fade.addChild(but);
         m_items.push(but);
      }
      
      public static function hideHint() : void
      {
         removeByName("hint");
      }
      
      private static function method_99(evt:MouseEvent) : void
      {
         var but:Sprite = evt.target as Sprite;
         switch(evt.type)
         {
            case MouseEvent.ROLL_OVER:
               but.filters = [BUTTON_GLOW];
               break;
            case MouseEvent.ROLL_OUT:
               but.filters = [];
         }
      }
      
      public static function createInfoPopup(x:Number, y:Number, str:String, name:String = "info-popup", isCentered:Boolean = true, fontSize:int = 12) : void
      {
         var text:TextSprite = createText(str.toUpperCase(),fontSize,11184810,1,false,16777215,"translate",isCentered);
         text.x = x;
         var g:Graphics = text.graphics;
         var begx:Number = -3;
         var begy:Number = 0;
         §§push(true);
         if(isCentered)
         {
            begx = -(text.width + 6) / 2;
            begy = -text.height / 2;
         }
         var sizex:Number = text.width + 10;
         var sizey:Number = text.height;
         g.beginFill(BG_COLOR,0.9);
         g.lineStyle(1,5592405);
         g.lineTo(begx,begy + sizey);
         g.lineTo(begx + sizex - 8,begy + sizey);
         g.lineTo(begx + sizex,begy + sizey - 8);
         g.lineTo(begx + sizex,begy);
         g.lineTo(begx,begy);
         g.endFill();
         m_parent.addChild(text);
         m_items.push(text);
      }
      
      private static function method_162(event:MouseEvent) : void
      {
         m_soundOn = !m_soundOn;
         SoundMgr.musicEnable(m_soundOn);
         SoundMgr.sfxEnable(m_soundOn);
         var but:MovieClip = event.target as MovieClip;
      }
      
      public static function init(game:Main, parent:Sprite) : void
      {
         Style.setStyle(Style.CUSTOM);
         m_game = game;
         m_parent = new Sprite();
         m_fade = new Sprite();
         m_fade.mouseChildren = true;
         m_fade.mouseEnabled = false;
         m_fade.alpha = m_fadeAlpha;
         m_sharedLvl = new SharedLevels(m_game,onStartSharedLevel,function():void
         {
            createLevelsMenu();
         });
         var g:Graphics = m_fade.graphics;
         g.beginFill(0);
         g.drawRect(0,0,MAX_X,BOTTOM_Y);
         g.endFill();
         parent.addChild(m_parent);
         parent.addChild(m_sharedLvl);
         parent.addChild(m_fade);
         m_sharedObj = SharedObject.getLocal("lumarama.tentacle_wars_purple_menace");
         if(m_sharedObj.data.levelsOpened == null)
         {
            m_openLevel = 1;
            m_sharedObj.data.levelsOpened = m_openLevel;
            m_sharedObj.flush(256);
         }
         else
         {
            m_openLevel = m_sharedObj.data.levelsOpened;
            if(m_openLevel > 1)
            {
               KongAPI.submitLevel(m_openLevel - 1);
               Preloader.unlockMedal(m_openLevel - 2);
            }
         }
         fade(false);
      }
      
      private static function gotoUrl(url:String) : void
      {
         try
         {
            navigateToURL(new URLRequest(url),"_blank");
            return;
         }
         catch(e:Error)
         {
            trace(e.message);
            return;
         }
      }
      
      public static function showHint(x:Number, y:Number, str:String, isCentered:Boolean = false) : void
      {
         var text:TextSprite = createText(str,12,11184810,1,false,16777215,"translate",isCentered);
         text.x = x;
         text.y = y;
         text.name = "hint";
         m_items.push(text);
      }
      
      public static function showInGameStatus(str:String, color:uint = 15658666) : void
      {
         var text:Sprite = null;
         removeByName("ingame-status");
         if(str != null && str.length > 0)
         {
            text = new "> ".TypingText(true,11,color);
            text.x = 190 + text.width / 2;
            text.y = 15;
            text.name = "ingame-status";
            m_parent.addChild(text);
            m_items.push(text);
            §§push();
         }
      }
      
      public static function removeByName(name:String) : void
      {
         var item:Sprite = null;
         for(var i:int = 0; i < m_items.length; )
         {
            item = m_items[i];
            if(item.name == name)
            {
               item.parent.removeChild(item);
               method_79(item);
               item = null;
               m_items.splice(i,1);
               if(i > 0)
               {
                  i--;
               }
            }
            i++;
         }
      }
      
      private static function method_97(dialog:Sprite, isEditor:Boolean) : void
      {
         var g:Graphics = dialog.graphics;
         g.beginFill(0,0.5);
         g.drawRect(0,BOTTOM_Y - 30,MAX_X,30);
         g.endFill();
         var but:DisplayObject = null;
         if(!isEditor)
         {
            but = new BtnRestart();
            but.scaleX = 0.7;
            but.scaleY = 0.7;
            but.x = 110;
            but.y = BOTTOM_Y - 15;
            but.addEventListener(MouseEvent.CLICK,method_142);
            dialog.addChild(but);
            but = new BtnPause();
            but.scaleX = 0.7;
            but.scaleY = 0.7;
            but.x = 80;
            but.y = BOTTOM_Y - 15;
            but.addEventListener(MouseEvent.CLICK,method_291);
            dialog.addChild(but);
            §§push(true);
         }
         var clp:MovieClip = new BtnSound();
         clp.scaleX = 0.7;
         clp.scaleY = 0.7;
         clp.x = 50;
         clp.y = BOTTOM_Y - 15;
         clp.gotoAndStop(!!m_soundOn?2:1);
         clp.addEventListener(MouseEvent.CLICK,method_162);
         clp.buttonMode = true;
         dialog.addChild(clp);
         but = new BtnExit();
         but.scaleX = 0.7;
         but.scaleY = 0.7;
         but.x = 20;
         but.y = BOTTOM_Y - 15;
         but.addEventListener(MouseEvent.CLICK,onGameMenu);
         dialog.addChild(but);
         var btn:Sprite = method_43(TXT_MORE_GAMES,MAX_X / 2,BOTTOM_Y - 15,method_73);
      }
      
      public static function createSaveDialog(levelData:String) : void
      {
         if(levelData != null)
         {
            true.submitLevel(levelData,"","","",function():void
            {
               createLevelsMenu();
            });
            return;
            §§push(m_sharedLvl);
         }
         else
         {
            var win:Window = new Window(m_parent,0,0,levelData != null?TXT_SAVE_LEVEL:TXT_ERROR);
            win.draggable = false;
            win.width = 250;
            new hbox.PushButton(5,0,TXT_CANCEL,true,function(e:MouseEvent):void
            {
               removeByName("save-dialog");
               if(levelData != null)
               {
                  m_game.initLevelEditor();
               }
            });
            hbox.x = win.width / 2 - hbox.width / 2;
            win.x = GUI.MAX_X / 2 - win.width / 2;
            win.y = GUI.MAX_Y / 2 - win.height / 2;
            return;
            §§push(true);
            §§push();
            §§push(true);
         }
      }
      
      public static function showEditorPanel() : void
      {
         /*UnknownSlot*/.x = 0;
         dialog.y = 0;
         dialog.name = "ingame-panel";
         method_97(dialog,true);
         var but:DisplayObject = null;
         but = method_43(TXT_TEST,0,MAX_Y - 15,function(e:MouseEvent):void
         {
            m_game.testEditorLevel();
         });
         but.x = MAX_X - but.width / 2 - 10;
         dialog.addChild(but);
         m_parent.addChild(dialog);
         m_items.push(dialog);
      }
      
      private static function method_43(str:String, x:Number, y:Number, onClick:Function, fontSize:int = 14, fontName:String = "translate") : Sprite
      {
         var but:Sprite = createText(str,fontSize,16777215,1,false,16777215,fontName);
         but.x = x;
         but.y = y;
         return but;
      }
      
      private static function method_219(evt:MouseEvent) : void
      {
         m_currLevel++;
         SoundMgr.playSfx(SoundMgr.BEGIN_GAME);
         fade(true,method_195);
      }
      
      private static function onGameMenu(evt:MouseEvent = null) : void
      {
         §§push(false);
         if(m_game)
         {
            m_game.clearLevel();
            §§push(false);
         }
         else
         {
            fade(true,createLevelsMenu);
         }
      }
      
      private static function method_170(e:MouseEvent = null) : void
      {
         for(var spr:DisplayObject = null; m_fade.numChildren > 0; )
         {
            spr = m_fade.getChildAt(0);
            spr.parent.removeChild(spr);
         }
         m_fade.alpha = 0;
         m_fade.mouseEnabled = false;
         m_fade.removeEventListener(MouseEvent.CLICK,method_170);
         m_game.pause(false);
         SoundMgr.musicEnable(m_soundOn);
      }
      
      public static function createLevelsMenu() : void
      {
         var ang:Number = NaN;
         var open:Boolean = false;
         var r2:Number = NaN;
         var g2:Graphics = null;
         var color:uint = 0;
         var tendril:Tendril = null;
         removeAll();
         fade(false);
         var dialog:Sprite = method_93();
         var top:Sprite = new Sprite();
         dialog.addChild(top);
         var g:Graphics = top.graphics;
         var r:Number = 80;
         var levelsNum:int = 20;
         var step:Number = Math.PI * 2 / levelsNum;
         var x:Number = MAX_X / 2;
         var /*UnknownSlot*/:* = true;
         §§push(true);
         §§push(createLevelsMenu$0);
         if(i >= levelsNum)
         {
            §§push(createLevelsMenu$0);
         }
         else
         {
            ang = i * step - Math.PI / 2;
            open = i < m_openLevel;
            r2 = !!open?Number(r + 50):Number(r + 25);
            g.moveTo(Math.cos(ang) * r + x,Math.sin(ang) * r + y);
            g.lineTo(Math.cos(ang) * r2 + x,Math.sin(ang) * r2 + y);
            var but:Sprite = method_43(String(i + 1),Math.cos(ang) * (r2 + 15) + x,Math.sin(ang) * (r2 + 15) + y,method_234,18,"default");
            but.name = !!open?String(i):String(-1);
            g2 = but.graphics;
            var /*UnknownSlot*/:* = uint(uint(3385907));
            §§push(createLevelsMenu$0);
            if(i + 1 == m_openLevel)
            {
               color = 8947848;
            }
            g2.beginFill(color,0.5);
            g2.drawCircle(0,0,15);
            g2.endFill();
            §§push(createLevelsMenu$0);
            §§push(true);
         }
         var /*UnknownSlot*/:* = method_43(TXT_EDIT,MAX_X / 2,MAX_Y / 2 - 30,function(e:MouseEvent):void
         {
            m_game.initLevelEditor();
         });
         dialog.addChild(but);
         but = method_43(TXT_SHARED_LEVELS,MAX_X / 2,MAX_Y / 2,function(e:MouseEvent):void
         {
            gotoUrl("http://www.gamezhero.com/games/tentaclewarsthepurplemenace/levels");
         });
         dialog.addChild(but);
         but = method_43(TXT_ORIGINAL_GAME,MAX_X / 2,MAX_Y / 2 + 30,function(e:MouseEvent):void
         {
            GameAllianzApi.getUrl("http://www.gamezhero.com/games/tentaclewars","_blank","tentaclewars");
         });
         dialog.addChild(but);
         m_parent.addChild(dialog);
         m_items.push(dialog);
      }
      
      private static function method_93() : Sprite
      {
         var clp:MovieClip = null;
         var dialog:Sprite = new Sprite();
         dialog.x = 0;
         dialog.y = 0;
         dialog.name = "main-menu";
         var back:Bitmap = new BmpTitleBack();
         dialog.addChild(back);
         var logo:Bitmap = new BmpSponsor();
         logo.smoothing = true;
         var logoSpr:Sprite = new Sprite();
         logoSpr.graphics.beginFill(1,1);
         logoSpr.graphics.drawRect(0,0,logo.width,logo.height);
         logoSpr.x = 10;
         logoSpr.y = 10;
         logoSpr.scaleX = 0.7;
         logoSpr.scaleY = 0.7;
         logoSpr.name = "http://lumarama.com/blog";
         logoSpr.buttonMode = true;
         logoSpr.addEventListener(MouseEvent.ROLL_OVER,method_99);
         dialog.addChild(logoSpr);
         var hdr:Sprite = createText("Tentacle Wars",50,16777215,1,true,0,"header");
         hdr.x = MAX_X / 2;
         hdr.y = 45;
         hdr = createText("Lumarama\'s",14,16777215,1,true,0,"header");
         hdr.x = MAX_X / 2 - 153;
         hdr.y = 15;
         dialog.addChild(hdr);
         hdr = createText("The Purple Menace",14,11171788,1,true,0,"header");
         hdr.x = MAX_X / 2 + 123;
         hdr.y = 15;
         dialog.addChild(hdr);
         var btn1:Sprite = new AssetPortalLogo(dialog,MAX_X / 2 - 90,BOTTOM_Y - 70,0.6);
         var btn2:Sprite = new AssetFacebookButton(dialog,MAX_X - 60,BOTTOM_Y - 60,0.5);
         var btn3:Sprite = new AssetTwitterButton(dialog,20,BOTTOM_Y - 60,0.5);
         clp = new BtnSound();
         clp.x = MAX_X - 30;
         clp.y = 30;
         clp.gotoAndStop(!!m_soundOn?2:1);
         clp.addEventListener(MouseEvent.CLICK,method_162);
         clp.buttonMode = true;
         dialog.addChild(clp);
         return dialog;
      }
      
      public static function createInterLevelMenu(isLevelPassed:Boolean, time:int, achieve:Achievements) : void
      {
         m_currScore = achieve.getScore();
         if(isLevelPassed)
         {
            KongAPI.submitHighScore(m_currScore);
            Preloader.sendTemporaryScore(0,m_currScore);
            Preloader.unlockMedal(m_openLevel - 2);
            §§push(true);
            if(m_currLevel + 2 > 20)
            {
               createFinalScreen();
               return;
            }
         }
         else if(m_currLevel + 1 == m_openLevel)
         {
            m_totalTries++;
         }
         true;
         §§push(m_currLevel == 5);
         if(time <= 40)
         {
            m_game.newAchievement(Achievements.ID_FAST_VICTORY);
         }
         if(m_successTries >= 10 && m_totalTries <= m_successTries * 2)
         {
            m_game.newAchievement(Achievements.ID_MIN_FAILS);
            §§push(true);
         }
         else
         {
            SoundMgr.playSfx(!!isLevelPassed?int(SoundMgr.LEVEL_PASSED):int(SoundMgr.LEVEL_FAILED));
         }
         var dialog:Sprite = method_134(isLevelPassed,time);
         dialog.name = "inter-level";
         var but:Sprite = null;
         var timeSpr:Sprite = createText(true.toUpperCase(),14,15658666,1,false,16777215,"translate",true);
         timeSpr.x = 0;
         timeSpr.y = -45;
         dialog.addChild(timeSpr);
         §§push(TXT_TIME);
         if(isLevelPassed)
         {
            but = method_43(TXT_SUBMIT_SCORE,0,-25,onSubmitScoreClick);
            §§push(true);
         }
         if(isLevelPassed)
         {
            but = method_43(TXT_MORE_GAMES,0,120,method_73);
            but.name = GameAllianzApiLinks.TO_PORTAL_BY_MORE_GAMES;
         }
         else
         {
            but = method_43(TXT_WALKTHROUGH,0,120,method_73);
            but.name = GameAllianzApiLinks.TO_GAME_WALKTHROUGH;
         }
         dialog.addChild(but);
         if(isLevelPassed)
         {
            but = method_43(TXT_CONTINUE,0,150,method_219);
         }
         else
         {
            but = method_43(TXT_REPLAY,0,150,method_142);
         }
         dialog.addChild(but);
         m_parent.addChild(dialog);
         m_items.push(dialog);
      }
      
      private static function method_291(e:MouseEvent = null) : void
      {
         m_fade.alpha = 0.7;
         m_fade.mouseEnabled = true;
         m_fade.addEventListener(MouseEvent.CLICK,method_170);
         m_game.pause(true);
         SoundMgr.musicEnable(false);
         var pause:Sprite = createText("PAUSED",50,16777215,1,true,0,"header");
         pause.x = MAX_X / 2;
         pause.y = MAX_Y / 2;
         pause.mouseEnabled = false;
      }
      
      private static function method_79(item:Sprite) : void
      {
         var tendril:Tendril = null;
         var text:TypingText = null;
         var cell:Cell = null;
         if(item is Tendril)
         {
            tendril = item as Tendril;
            tendril.destruct();
            tendril = null;
         }
         else if(item is TypingText)
         {
            text = item as TypingText;
            text.destruct();
            text = null;
            §§push(true);
         }
         else if(item is Cell)
         {
            cell = item as Cell;
            cell.destruct();
            cell = null;
            §§push(true);
         }
      }
      
      public static function startSharedLevelById(levelId:String) : void
      {
         m_sharedLvl.getLevel(levelId,"");
      }
      
      private static function replayLevel() : void
      {
         if(m_currLevel >= 0)
         {
            if(m_game)
            {
               removeAll();
               m_game.replayLevel();
            }
         }
         fade(false);
      }
      
      private static function method_73(event:MouseEvent) : void
      {
         var but:DisplayObject = event.target as DisplayObject;
         if(but != null && but.name.length > 0)
         {
            GameAllianzApi.navigateTo(but.name);
         }
      }
   }
}
