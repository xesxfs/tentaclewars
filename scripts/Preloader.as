package
{
   import com.gameallianz.api.as3.GameAllianzApi;
   import com.gameallianz.api.as3.GameAllianzApiEvent;
   import com.gameallianz.api.as3.GameAllianzApiLocalization;
   import com.gameallianz.api.as3.GameAllianzApiMultilanguageWord;
   import com.gameallianz.api.as3.GameAllianzApiPortals;
   import com.gameallianz.api.as3.utils.NumberCrypto;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.utils.getDefinitionByName;
   
   public class Preloader extends Sprite
   {
      
      public static var arrLeaderBoards:Array = [{
         "id":"068e4ba655e0ac6352b61e48954eb64d",
         "name":"Top Score"
      }];
      
      public static const MAIN_CLASS_NAME:String = "Main";
      
      public static var arrMedals:Array = [{
         "id":"db4bf8501e92356e35e478bcab8d69d0",
         "name":"Level 01"
      },{
         "id":"4310af8bc10f4b215a3eca47c602a831",
         "name":"Level 02"
      },{
         "id":"91893cda5e83c295a6dcb0e4a6aa7e5d",
         "name":"Level 03"
      },{
         "id":"b8f2dd9641bd4a67fcbae13154bfe7a8",
         "name":"Level 04"
      },{
         "id":"1628e8825cef35ba03f3ca7c33baba3a",
         "name":"Level 05"
      },{
         "id":"dcf4cd4050a050f0ff55a5f4c291ba7b",
         "name":"Level 06"
      },{
         "id":"fc8562a03e5d6a889775a67d70c43416",
         "name":"Level 07"
      },{
         "id":"561c1ee5f5dbd9a36f5170227eb6418f",
         "name":"Level 08"
      },{
         "id":"67fd616525e53aa819d3debe7d0a3be6",
         "name":"Level 09"
      },{
         "id":"0c1e966aa1f0542e2b5c602d3adb0709",
         "name":"Level 10"
      },{
         "id":"b5817e343a23381875b125f1743f75f3",
         "name":"Level 11"
      },{
         "id":"fb3c7fcbbf6e28d2ac90697d6c12955d",
         "name":"Level 12"
      },{
         "id":"a3fcecbcca3dbb81d146076a02246972",
         "name":"Level 13"
      },{
         "id":"0a7720406419d074b212fefce2bc699e",
         "name":"Level 14"
      },{
         "id":"03b90291431bbec1c5ed4a7fc1ef36de",
         "name":"Level 15"
      },{
         "id":"f2d91525bfe8ed4ee1dde76c734cb48c",
         "name":"Level 16"
      },{
         "id":"cf6e5803ddc2b0fd94c007c4edec179e",
         "name":"Level 17"
      },{
         "id":"4039f0fcb4baaaaf8df4f237277045d7",
         "name":"Level 18"
      },{
         "id":"003388ddead685862cd999fd1b4ea370",
         "name":"Level 19"
      },{
         "id":"f8c26a34913efa29af31b9da454643c0",
         "name":"Level 20"
      }];
       
      
      public function Preloader()
      {
         super();
         this.addEventListener(Event.ADDED_TO_STAGE,this.method_15);
      }
      
      public static function sendScore(_leader_board_index:Number, _score:Number) : void
      {
         var value:NumberCrypto = null;
         var lb:Object = arrLeaderBoards[_leader_board_index];
         if(lb)
         {
            value = new NumberCrypto();
            value.setValue(_score);
            GameAllianzApi.sendScore(lb.id,lb.name,value);
         }
         else
         {
            trace("error send score");
         }
      }
      
      public static function unlockMedal(_medal_index:Number) : void
      {
         var mdl:Object = arrMedals[_medal_index];
         if(mdl)
         {
            GameAllianzApi.unlockMedal(mdl.id,mdl.name);
         }
         else
         {
            trace("error send medal");
            §§push(true);
         }
      }
      
      public static function sendTemporaryScore(_leader_board_index:Number, _score:Number) : void
      {
         var value:NumberCrypto = null;
         var lb:Object = arrLeaderBoards[_leader_board_index];
         §§push(true);
         if(lb)
         {
            value = new NumberCrypto();
            value.setValue(_score);
            GameAllianzApi.sendTemporaryScore(lb.id,lb.name,value);
         }
         else
         {
            trace("error send temporary score");
         }
      }
      
      private function init() : void
      {
         var app:DisplayObject = null;
         var mainClass:Class = getDefinitionByName(MAIN_CLASS_NAME) as Class;
         if(mainClass)
         {
            app = new mainClass() as DisplayObject;
            §§push(true);
         }
      }
      
      private function method_36(_event:GameAllianzApiEvent = null) : void
      {
      }
      
      private function method_37(_event:GameAllianzApiEvent = null) : void
      {
      }
      
      private function method_33() : void
      {
         var name:* = null;
         var word2:GameAllianzApiMultilanguageWord = null;
         var user_texts:Array = [];
         var ENG:String = GameAllianzApiLocalization.ENG;
         var UKR:String = GameAllianzApiLocalization.UKR;
         var ESP:String = GameAllianzApiLocalization.ESP;
         var RUS:String = GameAllianzApiLocalization.RUS;
         user_texts[ENG] = [];
         user_texts[UKR] = [];
         user_texts[ESP] = [];
         user_texts[RUS] = [];
         user_texts[ENG]["In-game hints 1"] = "It\'s time to learn some tricks";
         user_texts[UKR]["In-game hints 1"] = "Настав час навчитися деяким трюкам";
         user_texts[RUS]["In-game hints 1"] = "Время научиться некоторым трюкам";
         user_texts[ESP]["In-game hints 1"] = "Es hora de aprender algunos trucos";
         user_texts[ENG]["In-game hints 2"] = "Team: step back then protect front line";
         user_texts[UKR]["In-game hints 2"] = "Команда: відступай - потім прикрий фронт";
         user_texts[RUS]["In-game hints 2"] = "Команда: отступай - затем прикрой фронт";
         user_texts[UKR]["In-game hints 4"] = "Ріж! в потріний час, у потрібному місці";
         user_texts[RUS]["In-game hints 4"] = "Режь! В правильном месте, в нужное время";
         user_texts[ESP]["In-game hints 4"] = "¡Corta! En el lugar correcto, en el momento adecuado";
         user_texts[RUS]["Achievements 0"] = "Достижения";
         user_texts[ESP]["Achievements 0"] = "Logros";
         user_texts[ENG]["Achievements 1"] = "Enemy Attack";
         user_texts[ESP]["Achievements 4"] = "Victoria Rápida";
         user_texts[ENG]["Achievements 5"] = "Minimal Defeat";
         user_texts[UKR]["Achievements 5"] = "Мінимум Поразок";
         user_texts[RUS]["Achievements 5"] = "Минимум Поражений";
         user_texts[ESP]["Achievements 5"] = "Mínima Derrota";
         user_texts[ENG]["Achievements 6"] = "Top Life Form";
         user_texts[UKR]["Achievements 6"] = "Найвища Форма Життя";
         user_texts[RUS]["Achievements 6"] = "Высшая Форма Жизни";
         user_texts[ESP]["Achievements 6"] = "Forma Superior De Vida";
         user_texts[ENG]["Interface Items 1"] = "Select Zones";
         user_texts[UKR]["Interface Items 1"] = "Обрати Зони";
         user_texts[RUS]["Interface Items 1"] = "Выбрать Зоны";
         user_texts[UKR]["The final screen 3"] = "яка виявилась слабкою,а маленькими створіннями, яких створив Бог та";
         user_texts[RUS]["The final screen 3"] = "которое оказалось бессильным,а маленькими существами, которых Бог";
         user_texts[ESP]["The final screen 3"] = "que no resulataron y con la ayuda de las criaturas más minúsculas que Dios";
         user_texts[ENG]["The final screen 4"] = "upon this earth.\n\n";
         for(name in user_texts[ENG])
         {
            word2 = new GameAllianzApiMultilanguageWord(name);
            word2.ENG = user_texts[ENG][name];
            word2.UKR = user_texts[UKR][name];
            word2.RUS = user_texts[RUS][name];
            word2.ESP = user_texts[ESP][name];
            GameAllianzApiLocalization.addWord(word2);
         }
      }
      
      private function method_15(_event:Event = null) : void
      {
         MochiBot.track(this,"1f9115df");
         this.removeEventListener(Event.ADDED_TO_STAGE,this.method_15);
         GameAllianzApi.addEventListener(GameAllianzApiEvent.MUSIC_ON_CHANGE,this.method_36);
         GameAllianzApi.addEventListener(GameAllianzApiEvent.SOUND_ON_CHANGE,this.method_35);
         this.method_33();
      }
      
      private function method_35(_event:GameAllianzApiEvent = null) : void
      {
         trace("iniSound",GameAllianzApi.sound);
      }
   }
}
