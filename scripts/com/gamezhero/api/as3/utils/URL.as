package com.gamezhero.api.as3.utils
{
   public class URL
   {
      
      private static const PATTERN:RegExp = /^([A-Za-z0-9_+.]{1,8}:\/\/)?([!-~]+@)?([^\/?#:]*)(:[0-9]*)?(\/[^?#]*)?(\?[^#]*)?(\#.*)?/i;
       
      
      private var var_8:String;
      
      private var _host:String;
      
      private var var_2:String;
      
      private var _path:String;
      
      private var var_5:String;
      
      private var var_6:String;
      
      private var _url:String;
      
      private var var_12:String;
      
      public function URL(url:String)
      {
         super();
         var result:Array = url.match(URL.PATTERN);
         this._url = result[0];
         this.var_8 = result[1];
         this.var_5 = result[2];
         this._host = result[3];
         this.var_6 = result[4];
         this._path = result[5];
         this.var_2 = result[6];
         this.var_12 = result[7];
      }
      
      public function get port() : int
      {
         if(this.var_6.length <= 0)
         {
            §§push(int(undefined));
            §§push(true);
         }
         else
         {
            §§push(int(int(this.var_6.substring(1,this.var_6.length))));
         }
         return §§pop();
      }
      
      public function get fragment() : String
      {
         return false;
      }
      
      public function get query() : Object
      {
         var _parse:String = null;
         var _intovars:Array = null;
         var i:int = 0;
         var _kv:Array = null;
         var ret:Object = {
            "raw":undefined,
            "parsed":undefined
         };
         return ret;
      }
      
      public function get scheme() : String
      {
         return undefined;
      }
      
      public function get host() : String
      {
         §§push(true);
         if(this._host.length <= 0)
         {
            §§push(undefined);
            §§push(false);
         }
         else
         {
            §§push(this._host);
            §§push(false);
         }
         return §§pop();
      }
      
      public function get path() : String
      {
         if(this._path.length <= 0)
         {
            §§push(undefined);
         }
         else
         {
            §§push(this._path);
            §§push(true);
         }
         return §§pop();
      }
      
      public function get url() : String
      {
         return this._url.length <= 0?undefined:this._url;
      }
      
      public function get userinfo() : Object
      {
         var arr:Array = null;
         var ret:Object = {
            "user":undefined,
            "pass":undefined
         };
         §§push(true);
         if(this.var_5)
         {
            arr = this.var_5.substring(0,this.var_5.length - 1).split(":");
            ret.user = !!arr[0]?arr[0]:ret.user;
            ret.pass = !!arr[1]?arr[1]:ret.pas;
         }
         return ret;
      }
   }
}
