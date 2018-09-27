package com.google.analytics.external
{
   import com.google.analytics.debug.DebugConfiguration;
   
   public class HTMLDOM extends JavascriptProxy
   {
      
      public static var cache_properties_js:XML = <script>
            <![CDATA[
                    function()
                    {
                        var obj = {};
                            obj.host         = document.location.host;
                            obj.language     = navigator.language ? navigator.language : navigator.browserLanguage;
                            obj.characterSet = document.characterSet ? document.characterSet : document.charset;
                            obj.colorDepth   = window.screen.colorDepth;
                            obj.location     = document.location.toString();
                            obj.pathname     = document.location.pathname;
                            obj.protocol     = document.location.protocol;
                            obj.search       = document.location.search;
                            obj.referrer     = document.referrer;
                            obj.title        = document.title;
                        
                        return obj;
                    }
                ]]>
         </script>;
       
      
      private var _referrer:String;
      
      private var _language:String;
      
      private var _host:String;
      
      private var _pathname:String;
      
      private var _location:String;
      
      private var _search:String;
      
      private var _characterSet:String;
      
      private var _title:String;
      
      private var _protocol:String;
      
      private var _colorDepth:String;
      
      public function HTMLDOM(debug:DebugConfiguration)
      {
         super(debug);
      }
      
      public function get search() : String
      {
         if(this._search)
         {
            return this._search;
         }
         if(!isAvailable())
         {
            return null;
         }
         this._search = getProperty("document.location.search");
         return this._search;
      }
      
      public function get location() : String
      {
         if(this._location)
         {
            return this._location;
         }
         if(!isAvailable())
         {
            return null;
         }
         this._location = getPropertyString("document.location");
         return this._location;
      }
      
      public function get pathname() : String
      {
         if(this._pathname)
         {
            return this._pathname;
         }
         if(!isAvailable())
         {
            return null;
         }
         this._pathname = getProperty("document.location.pathname");
         return this._pathname;
      }
      
      public function cacheProperties() : void
      {
         if(!isAvailable())
         {
            return;
         }
         var obj:Object = call(cache_properties_js);
         if(obj)
         {
            this._host = obj.host;
            this._language = obj.language;
            this._characterSet = obj.characterSet;
            this._colorDepth = obj.colorDepth;
            this._location = obj.location;
            this._pathname = obj.pathname;
            this._protocol = obj.protocol;
            this._search = obj.search;
            this._referrer = obj.referrer;
            this._title = obj.title;
         }
      }
      
      public function get language() : String
      {
         if(this._language)
         {
            return this._language;
         }
         if(!isAvailable())
         {
            return null;
         }
         var lang:String = getProperty("navigator.language");
         if(lang == null)
         {
            lang = getProperty("navigator.browserLanguage");
         }
         this._language = lang;
         return this._language;
      }
      
      public function get colorDepth() : String
      {
         if(this._colorDepth)
         {
            return this._colorDepth;
         }
         if(!isAvailable())
         {
            return null;
         }
         this._colorDepth = getProperty("window.screen.colorDepth");
         return this._colorDepth;
      }
      
      public function get referrer() : String
      {
         if(this._referrer)
         {
            return this._referrer;
         }
         if(!isAvailable())
         {
            return null;
         }
         this._referrer = getProperty("document.referrer");
         return this._referrer;
      }
      
      public function get protocol() : String
      {
         if(this._protocol)
         {
            return this._protocol;
         }
         if(!isAvailable())
         {
            return null;
         }
         this._protocol = getProperty("document.location.protocol");
         return this._protocol;
      }
      
      public function get host() : String
      {
         if(this._host)
         {
            return this._host;
         }
         if(!isAvailable())
         {
            return null;
         }
         this._host = getProperty("document.location.host");
         return this._host;
      }
      
      public function get characterSet() : String
      {
         if(this._characterSet)
         {
            return this._characterSet;
         }
         if(!isAvailable())
         {
            return null;
         }
         var cs:String = getProperty("document.characterSet");
         if(cs == null)
         {
            cs = getProperty("document.charset");
         }
         this._characterSet = cs;
         return this._characterSet;
      }
      
      public function get title() : String
      {
         if(this._title)
         {
            return this._title;
         }
         if(!isAvailable())
         {
            return null;
         }
         this._title = getProperty("document.title");
         return this._title;
      }
   }
}
