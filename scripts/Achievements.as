package
{
   import com.gamezhero.api.as3.GamezheroDictionary;
   import flash.net.SharedObject;
   
   public class Achievements
   {
      
      public static const ID_MIN_FAILS:int = 4;
      
      public static const ID_CUT:int = 1;
      
      public static const ID_TODO:int = 6;
      
      public static const ID_ATTACK:int = 0;
      
      public static const ID_TEAM_WORK:int = 2;
      
      public static const ID_FAST_VICTORY:int = 3;
      
      public static const ID_TOP_LIFE_FORM:int = 5;
       
      
      private var m_sharedObj:SharedObject = null;
      
      private var m_items:Array = null;
      
      private var var_120:int = 0;
      
      private const const_21:Array = new Array("","Kid","Team Guy","Quick Victory","","Dominator");
      
      public function Achievements()
      {
         super();
         var i:int = 0;
         this.m_items = new Array();
         this.m_items[ID_ATTACK] = new AchieveItem(GamezheroDictionary.getTranslationByName("Achievements 1").toLocaleUpperCase(),50);
         this.m_items[ID_CUT] = new AchieveItem(GamezheroDictionary.getTranslationByName("Achievements 2").toLocaleUpperCase(),50);
         this.m_items[ID_TEAM_WORK] = new AchieveItem(GamezheroDictionary.getTranslationByName("Achievements 3").toLocaleUpperCase(),100);
         this.m_items[ID_FAST_VICTORY] = new AchieveItem(GamezheroDictionary.getTranslationByName("Achievements 4").toLocaleUpperCase(),300);
         this.m_items[ID_MIN_FAILS] = new AchieveItem(GamezheroDictionary.getTranslationByName("Achievements 5").toLocaleUpperCase(),300);
         this.m_items[ID_TOP_LIFE_FORM] = new AchieveItem(GamezheroDictionary.getTranslationByName("Achievements 6").toLocaleUpperCase(),100);
         this.m_sharedObj = SharedObject.getLocal("lumarama.tentacle_wars_purple_menace.achievements");
         §§push(true);
         if(this.m_sharedObj.data.items == null)
         {
            this.m_sharedObj.data.items = new Array();
            for(i = 0; i < this.m_items.length; i++)
            {
               this.m_sharedObj.data.items[i] = false;
            }
            this.m_sharedObj.data.score = 0;
            this.m_sharedObj.flush(256);
         }
         else
         {
            for(i = 0; i < this.m_sharedObj.data.items.length; )
            {
               this.m_items[i].done = this.m_sharedObj.data.items[i];
               i++;
            }
         }
         this.var_120 = this.m_sharedObj.data.score;
      }
      
      public function getHtml() : String
      {
         var item:AchieveItem = null;
         var html:* = "<font color=\'#FFFFFF\'>" + GamezheroDictionary.getTranslationByName("Achievements 0").toLocaleUpperCase() + ":</font><br>";
         for(var i:int = 0; i < this.m_items.length; i++)
         {
            item = this.m_items[i];
            html = html + "<br>";
            if(item.isNew)
            {
               §§push(html + ("<font color=\'#55FF55\'>" + item.name + " +</font>"));
               §§push(true);
            }
            else
            {
               §§push(html + ("<font color=\'#" + (!!item.done?"FFFF55":"888888") + "\'>" + item.name + "</font>"));
            }
            html = §§pop();
         }
         return html;
      }
      
      public function done(id:int) : void
      {
         var item:AchieveItem = null;
         true;
         §§push(id >= 0);
         if(id < this.m_items.length)
         {
            item = this.m_items[id];
            if(!item.done)
            {
               this.addScore(item.scoreDelta);
               item.done = true;
               item.isNew = true;
               GUI.showInGameStatus(item.name + " +",5635925);
               this.m_sharedObj.data.items[id] = true;
               this.m_sharedObj.flush(256);
            }
         }
      }
      
      public function getScore() : int
      {
         return this.var_120;
      }
      
      public function addScore(delta:int) : int
      {
         this.var_120 = this.var_120 + delta;
         if(this.var_120 < 0)
         {
            this.var_120 = 0;
         }
         this.m_sharedObj.data.score = this.var_120;
         this.m_sharedObj.flush(256);
         return this.var_120;
      }
   }
}

class AchieveItem
{
    
   
   public var done:Boolean;
   
   public var isNew:Boolean;
   
   public var scoreDelta:int;
   
   public var name:String;
   
   function AchieveItem(name:String, scoreDelta:int = 0)
   {
      super();
      this.name = name;
      this.scoreDelta = scoreDelta;
      this.done = false;
      this.isNew = false;
   }
}
