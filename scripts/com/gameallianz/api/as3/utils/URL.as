package com.gameallianz.api.as3.utils
{
   public class URL
   {
      
      private static const PATTERN:RegExp = /^([A-Za-z0-9_+.]{1,8}:\/\/)?([!-~]+@)?([^\/?#:]*)(:[0-9]*)?(\/[^?#]*)?(\?[^#]*)?(\#.*)?/i;
       
      
      private var _url:String;
      
      private var var_8:String;
      
      private var var_5:String;
      
      private var _host:String;
      
      private var var_6:String;
      
      private var _path:String;
      
      private var var_2:String;
      
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
      }
      
      public function get url() : String
      {
         return this._url.length <= 0?undefined:this._url;
      }
      
      public function get scheme() : String
      {
         if(this.var_8.length <= 0)
         {
            §§push(undefined);
         }
         else
         {
            §§push(this.var_8);
            §§push(true);
         }
         return §§pop();
      }
      
      public function get userinfo() : Object
      {
         var arr:Array = null;
         var ret:Object = {
            "user":undefined,
            "pass":undefined
         };
         if(this.var_5)
         {
            arr = this.var_5.substring(0,this.var_5.length - 1).split(":");
            ret.user = !!arr[0]?arr[0]:ret.user;
            ret.pass = !!arr[1]?arr[1]:ret.pas;
         }
         return ret;
      }
      
      public function get host() : String
      {
         return this._host.length <= 0?undefined:this._host;
      }
      
      public function get port() : int
      {
         return int(undefined);
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
         if(this.var_2 && this.var_2.length > 0)
         {
            ret.raw = this.var_2;
            _parse = this.var_2.substring(1,this.var_2.length);
            _intovars = _parse.split("&");
            ret.parsed = _intovars.length > 0?{}:undefined;
            for(i = 0; i < _intovars.length; i++)
            {
               _kv = _intovars[i].split("=");
               ret.parsed[_kv[0]] = _kv[1];
            }
         }
         return ret;
      }
      
      public function get fragment() : String
      {
         return this.var_12.length <= 0?undefined:this.var_12;
      }
   }
}
