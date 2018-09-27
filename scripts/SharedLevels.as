package
{
   import com.bit101.components.HBox;
   import com.bit101.components.Label;
   import com.bit101.components.NumericStepper;
   import com.bit101.components.Panel;
   import com.bit101.components.PushButton;
   import com.gameallianz.api.as3.GameAllianzApi;
   import com.gamezhero.api.as3.GamezheroGlobal;
   import com.gamezhero.as3.remoting.RemotingLevelsGateway;
   import com.gamezhero.as3.remoting.events.RemotingLevelsEvent;
   import flash.display.BitmapData;
   import flash.display.Graphics;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import ui.StarRating;
   
   public class SharedLevels extends Sprite
   {
       
      
      private var var_354:String = null;
      
      private var var_85:RemotingLevelsGateway;
      
      private var var_253:uint = 830;
      
      private var _onExitClbk:Function = null;
      
      private var var_344:String = null;
      
      private var var_335:Main = null;
      
      private var var_42:Panel = null;
      
      private var var_37:Panel = null;
      
      private var var_126:Sprite = null;
      
      private var var_397:Sprite = null;
      
      private var var_193:Function = null;
      
      private var _page:NumericStepper = null;
      
      private var var_321:Function = null;
      
      private var var_280:Label = null;
      
      private var _sortBy:uint;
      
      private var var_324:uint = 10;
      
      public function SharedLevels(game:Main, onStartLevel:Function, onExit:Function)
      {
         this._sortBy = RemotingLevelsGateway.SORT_BY_RATE_DEC;
         this.var_85 = new RemotingLevelsGateway("http://www.gamezhero.com/chat/gateway.php");
         super();
         this.var_335 = game;
         this.var_321 = onStartLevel;
         this._onExitClbk = onExit;
         this.var_85.addEventListener(RemotingLevelsEvent.ERROR,this.method_319);
         this.var_85.addEventListener(RemotingLevelsEvent.GET_PAGE_AMOUNT,this.method_290);
         this.var_85.addEventListener(RemotingLevelsEvent.GET_PAGE_LIST,this.method_287);
         true.addEventListener(RemotingLevelsEvent.SET_LEVEL_RATE,this.method_244);
         this.var_85.addEventListener(RemotingLevelsEvent.SET_LEVEL,this.method_317);
      }
      
      private function method_290(event:RemotingLevelsEvent = null) : void
      {
         if(this._page)
         {
            this._page.maximum = event.value;
         }
         if(this.var_280)
         {
            (GUI.TXT_OF + " ").text = true;
            §§push(this.var_280);
         }
      }
      
      private function getPagesAmount() : void
      {
         this.var_85.getPagesAmount(this.var_253,this.var_324);
      }
      
      public function setLevelRate(levelId:String, rating:uint) : void
      {
      }
      
      public function showLevelsChooser() : void
      {
         var topTab:int = 0;
         /*UnknownSlot*/.downColor = 3377203;
         butLatest.toggle = true;
         hbox.x = this.var_42.width - hbox.width - 5;
         var hbox:HBox = new HBox(this.var_42,5,this.var_42.height - 20);
         new Label(hbox,0,0,GUI.TXT_PAGE);
         this._page = new NumericStepper(hbox,0,0,function(e:Event):void
         {
            trace("get page: " + _page.value);
            getLevels(_page.value - 1,_sortBy);
         });
         true.width = 60;
         this.var_280 = new Label(hbox,0,0,"");
         new PushButton(this.var_42,365,this.var_42.height - 22,GUI.TXT_MENU,function(e:MouseEvent):void
         {
            if(_onExitClbk != null)
            {
               _onExitClbk();
            }
         });
         §§push(showLevelsChooser$0);
         §§push(this._page);
         if(!this.var_126.parent)
         {
            addChild(this.var_126);
         }
         this.getPagesAmount();
         this.getLevels(this._page.value - 1,this._sortBy);
      }
      
      private function getLevels(pageNum:uint, sortBy:uint) : void
      {
         this.var_85.getPageList(this.var_253,pageNum,this.var_324,sortBy);
      }
      
      public function submitLevel(levelData:String, name:String = "Noname", author:String = "Unknown", email:String = "", onComplete:Function = null) : void
      {
         §§push(true);
         if(author == null || author.length == 0)
         {
            author = "Unknown";
         }
         this.var_193 = onComplete;
         var levelBitmapData:BitmapData = new BitmapData(this.stage.width,this.stage.width,false,0);
         var lvlBox:Sprite = new Sprite();
         var lvl:Level = new Level(this.var_335);
         lvlBox.addChild(lvl);
         lvl.initFromCode(levelData);
         lvl.y = 80;
         levelBitmapData.draw(lvlBox);
         GameAllianzApi.sendLevel(levelData,levelBitmapData);
         trace(name + ", " + author + ": " + levelData);
         if(this.var_193 != null)
         {
            this.var_193();
         }
      }
      
      private function method_319(event:RemotingLevelsEvent = null) : void
      {
         trace(event.value);
      }
      
      private function method_317(event:RemotingLevelsEvent = null) : void
      {
         var url:String = event.value;
         trace(url);
         if(this.var_193 != null)
         {
            this.var_193();
         }
      }
      
      private function method_222(event:RemotingLevelsEvent = null) : void
      {
         var levelData:String = event.value;
         trace(levelData);
         §§push(true);
         if(this.var_321 != null && levelData != null && levelData != "-1")
         {
            this.var_321(levelData,this.var_344,GUI.TXT_SHARED,this.var_354);
         }
      }
      
      public function hideLevelsChooser() : void
      {
         if(this.var_126 && this.var_126.parent)
         {
            removeChild(this.var_126);
         }
      }
      
      private function method_287(event:RemotingLevelsEvent = null) : void
      {
         var pageList:Array = null;
         var row:Object = null;
         var field:String = null;
         var grid:Sprite = null;
         var g:Graphics = null;
         var lvlId:int = 0;
         var /*UnknownSlot*/:* = uint(0);
         §§push(true);
         §§push(getPageListResult$0);
         if(i < pageList.length)
         {
            row = pageList[i];
            for(field in row)
            {
               trace(field,"=",row[field]);
            }
            trace("-----------");
            grid = new Sprite();
            this.var_37.addChild(grid);
            g = grid.graphics;
            g.beginFill(16777215,0.05);
            g.drawRect(0,VTAB * i + TOP_TAB - 2,38,VTAB - 2);
            g.beginFill(16777215,0.1);
            g.drawRect(38,VTAB * i + TOP_TAB - 2,141,VTAB - 2);
            g.beginFill(16777215,0.15);
            var /*UnknownSlot*/:* = null;
            var /*UnknownSlot*/:* = new StarRating(this.var_37,372,VTAB * i + TOP_TAB + 10);
            true.setEnable(false);
            var but:PushButton = new PushButton(this.var_37,410,VTAB * i + TOP_TAB - 1,GUI.TXT_PLAY,function(e:MouseEvent):void
            {
               var b:* = e.target;
               var index:* = int(b.name);
               trace("run level: " + pageList[index]["level_id"] + " | " + pageList[index]["level_name"]);
               if(GamezheroGlobal.domain.indexOf("gamezhero.com") >= 0)
               {
                  getLevel(pageList[index]["level_id"],pageList[index]["level_name"]);
                  hideLevelsChooser();
               }
               else
               {
                  GamezheroGlobal.getURL(GUI.URL_SHARED_LEVEL + pageList[index]["level_id"] + "&utm_campaign=" + GamezheroGlobal.gameName + "&utm_source=" + GamezheroGlobal.domain + "&utm_medium=shared_levels","_blank");
               }
            });
            but.normalColor = 3377203;
            but.width = 50;
            §§push(getPageListResult$0);
            §§push(getPageListResult$0);
            §§push(stars);
            §§push(true);
         }
      }
      
      public function getLevel(levelId:String, levelName:String) : void
      {
         this.var_344 = levelId;
         this.var_354 = levelName;
      }
      
      private function method_244(event:RemotingLevelsEvent = null) : void
      {
         var new_rating:Number = event.value;
      }
   }
}
