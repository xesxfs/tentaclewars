package
{
   import flash.display.Loader;
   import flash.display.LoaderInfo;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.net.URLRequest;
   import flash.system.Security;
   
   public class KongAPI
   {
      
      private static var _kong = null;
       
      
      public function KongAPI()
      {
         super();
      }
      
      public static function init(parent:Sprite) : void
      {
         var paramObj:Object = LoaderInfo(parent.root.loaderInfo).parameters;
         var apiPath:String = paramObj.kongregate_api_path || "http://www.kongregate.com/flash/API_AS3_Local.swf";
         Security.allowDomain(apiPath);
         var request:URLRequest = new URLRequest(apiPath);
         var loader:Loader = new Loader();
         loader.contentLoaderInfo.addEventListener(Event.COMPLETE,loadComplete);
         loader.load(request);
         parent.addChild(loader);
      }
      
      private static function loadComplete(event:Event) : void
      {
         _kong = event.target.content;
         _kong.services.connect();
         trace("KongAPI.loadComplete");
      }
      
      public static function submitLevel(id:int) : void
      {
         if(_kong)
         {
            _kong.stats.submit("level",id);
            trace("KongAPI.submitLevel: OK");
         }
         else
         {
            trace("KongAPI.submitLevel: non initialized");
         }
      }
      
      public static function submitHighScore(value:int) : void
      {
      }
   }
}
