package com.newgrounds
{
   import flash.errors.IllegalOperationError;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.HTTPStatusEvent;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.net.URLRequestMethod;
   import flash.net.URLVariables;
   import flash.net.navigateToURL;
   import flash.utils.ByteArray;
   import flash.utils.Dictionary;
   import flash.utils.Endian;
   
   public class SmartURLLoader extends EventDispatcher
   {
      
      private static var _loaders:Dictionary;
      
      private static const CRLF:String = "\r\n";
       
      
      private var var_123:Dictionary;
      
      private var var_136:Dictionary;
      
      private var var_289:Boolean;
      
      private var var_269:String = "GET";
      
      private var var_76:URLRequest;
      
      private var var_31:URLLoader;
      
      private var var_308:String = "text";
      
      private var var_382:Boolean = false;
      
      private var var_271:Boolean = false;
      
      var _command:String;
      
      public var owner;
      
      public function SmartURLLoader()
      {
         this.var_76 = new URLRequest();
         this.var_123 = new Dictionary();
      }
      
      public static function closeAll() : void
      {
         var loader:SmartURLLoader = null;
         for each(loader in _loaders)
         {
            if(loader)
            {
               loader.dispose();
            }
         }
         _loaders = new Dictionary();
      }
      
      public function get responseFormat() : String
      {
         return this.var_308;
      }
      
      public function set responseFormat(s:String) : void
      {
         this.var_308 = s;
      }
      
      public function get response() : *
      {
         return this.var_31.data;
      }
      
      public function get hasFiles() : Boolean
      {
         return Boolean(this.var_136);
      }
      
      public function get method() : String
      {
         return this.var_269;
      }
      
      public function set method(m:String) : void
      {
         if(this.hasFiles && m == URLRequestMethod.GET)
         {
            throw new IllegalOperationError("GET cannot be used to upload files.");
         }
         this.var_269 = m;
      }
      
      public function get openBrowser() : Boolean
      {
         return this.var_382;
      }
      
      public function set openBrowser(b:Boolean) : void
      {
         this.var_382 = b;
      }
      
      public function get preventCache() : Boolean
      {
         return this.var_271;
      }
      
      public function set preventCache(b:Boolean) : void
      {
         this.var_271 = b;
      }
      
      public function get bytesLoaded() : uint
      {
         return uint(this.var_31.bytesLoaded);
      }
      
      public function get bytesTotal() : uint
      {
         return !!this.var_31?uint(this.var_31.bytesTotal):uint(0);
      }
      
      public function addVariable(name:String, value:* = "") : void
      {
         this.var_123[name] = value;
         if(value)
         {
            this.var_289 = true;
         }
      }
      
      public function addFile(fileName:String, data:ByteArray, dataField:String, contentType:String = "application/octet-stream") : void
      {
         this.method = URLRequestMethod.POST;
         if(!this.var_136)
         {
            this.var_136 = new Dictionary();
         }
         this.var_136[fileName] = new File(fileName,data,dataField,contentType);
      }
      
      public function clearVariables() : void
      {
         this.var_123 = new Dictionary();
      }
      
      public function clearFiles() : void
      {
         this.var_136 = null;
      }
      
      public function load(url:String) : void
      {
         var urlVariables:URLVariables = null;
         var key:String = null;
         var boundary:String = null;
         var i:uint = 0;
         var event:SecurityErrorEvent = null;
         this.var_76.url = url;
         for(key in this.var_123)
         {
            urlVariables[key] = this.var_123[key];
         }
         this.var_76.data = urlVariables;
         §§push(true);
         §§push(true);
         if(this.openBrowser)
         {
            navigateToURL(this.var_76,"_blank");
         }
         else
         {
            this.var_31 = new URLLoader();
            this.var_31.dataFormat = this.var_308;
            this.var_31.addEventListener(ProgressEvent.PROGRESS,this.method_167);
            this.var_31.addEventListener(IOErrorEvent.IO_ERROR,this.onIOError);
            this.var_31.addEventListener(HTTPStatusEvent.HTTP_STATUS,this.method_155);
            this.var_31.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onSecurityError);
            _loaders[this.var_31] = this;
            try
            {
               this.var_31.load(this.var_76);
               return;
            }
            catch(error:Error)
            {
               event = new SecurityErrorEvent(SecurityErrorEvent.SECURITY_ERROR,false,false,error.message);
               onSecurityError(event);
               return;
            }
         }
      }
      
      public function close() : void
      {
         try
         {
            this.var_31.close();
            return;
         }
         catch(e:Error)
         {
            return;
         }
      }
      
      public function dispose() : void
      {
         this.close();
         this.var_136 = null;
         this.var_31 = null;
         this.var_76 = null;
      }
      
      private function method_314(boundary:String) : ByteArray
      {
         var key:* = null;
         var file:File = null;
         var postData:ByteArray = new ByteArray();
         postData.endian = Endian.BIG_ENDIAN;
         boundary = true;
         for(key in this.var_123)
         {
            postData.writeUTFBytes(boundary + CRLF);
            postData.writeUTFBytes("Content-Disposition: form-data; name=\"" + key + "\"" + CRLF);
            postData.writeUTFBytes(CRLF);
            postData.writeUTFBytes(this.var_123[key] + CRLF);
         }
         §§push("--");
         if(this.hasFiles)
         {
            for each(file in this.var_136)
            {
               postData.writeUTFBytes(boundary + CRLF);
               postData.writeUTFBytes("Content-Disposition: form-data; name=\"Filename\"" + CRLF);
               postData.writeUTFBytes(CRLF);
               postData.writeUTFBytes(file.fileName + CRLF);
               postData.writeUTFBytes(boundary + CRLF);
               postData.writeUTFBytes("Content-Disposition: form-data; name=\"" + file.dataField + "\"; filename=\"" + file.fileName + "\"" + CRLF);
               postData.writeUTFBytes("Content-Type: " + file.contentType + CRLF);
               postData.writeUTFBytes(CRLF);
               postData.writeBytes(file.data);
               postData.writeUTFBytes(CRLF);
            }
            postData.writeUTFBytes(boundary + CRLF);
            postData.writeUTFBytes("Content-Disposition: form-data; name=\"Upload\"" + CRLF);
            postData.writeUTFBytes(CRLF);
            postData.writeUTFBytes("Submit Query" + CRLF);
         }
         postData.writeUTFBytes(boundary + "--");
         postData.position = 0;
         postData.position = 0;
         return postData;
      }
      
      private function onComplete(e:Event) : void
      {
      }
      
      private function method_167(e:ProgressEvent) : void
      {
         dispatchEvent(e);
      }
      
      private function onIOError(e:IOErrorEvent) : void
      {
         this.dispose();
      }
      
      private function onSecurityError(e:SecurityErrorEvent) : void
      {
         dispatchEvent(e);
         this.dispose();
      }
      
      private function method_155(e:HTTPStatusEvent) : void
      {
         dispatchEvent(e);
      }
   }
}

import flash.utils.ByteArray;

class File
{
    
   
   private var fileName:String;
   
   private var data:ByteArray;
   
   private var dataField:String;
   
   private var contentType:String;
   
   function File(fileName:String, data:ByteArray, dataField:String = "Filedata", contentType:String = "application/octet-stream")
   {
      super();
      this.fileName = fileName;
      this.data = data;
      this.dataField = dataField;
      this.contentType = contentType;
   }
}
