package com.newgrounds
{
   import flash.display.BitmapData;
   import flash.display.Loader;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLLoaderDataFormat;
   import flash.net.URLRequest;
   import flash.utils.ByteArray;
   import flash.utils.Dictionary;
   
   public class SaveFile extends EventDispatcher
   {
      
      public static const STATUS_PRIVATE = 1;
      
      public static const STATUS_SHARED = 2;
      
      public static const STATUS_UNAPPROVED = 3;
      
      public static const STATUS_APPROVED = 4;
       
      
      private var var_302:String;
      
      private var _id:uint;
      
      private var var_188:String;
      
      private var var_199;
      
      private var _loader:SmartURLLoader;
      
      private var var_40:SaveGroup;
      
      private var var_54:Dictionary;
      
      private var var_62:Dictionary;
      
      private var var_187:String;
      
      private var var_237:BitmapData;
      
      private var var_209:String;
      
      private var var_282:uint;
      
      private var var_274:String;
      
      private var var_208:uint;
      
      private var var_285:Boolean;
      
      private var var_163:uint;
      
      private var var_388:uint;
      
      private var var_288:Boolean;
      
      public function SaveFile(group:SaveGroup)
      {
         super();
         this.var_54 = new Dictionary();
         this.var_40 = group;
         this.var_188 = "";
      }
      
      public function get name() : String
      {
         return this.var_302;
      }
      
      public function set name(s:String) : void
      {
         this.var_302 = s;
      }
      
      public function get id() : uint
      {
         return this._id;
      }
      
      public function set id(i:uint) : void
      {
         this._id = i;
      }
      
      public function get description() : String
      {
         return this.var_188;
      }
      
      public function set description(s:String) : void
      {
         this.var_188 = s;
      }
      
      public function get contents() : *
      {
         return this.var_199;
      }
      
      public function set contents(o:*) : void
      {
         this.var_208 = 0;
      }
      
      public function get thumbnailUrl() : String
      {
         return this.var_209;
      }
      
      public function set thumbnailUrl(s:String) : void
      {
      }
      
      public function get fileUrl() : String
      {
         return this.var_187;
      }
      
      public function set fileUrl(s:String) : void
      {
         this.var_187 = s;
      }
      
      public function get thumbnail() : BitmapData
      {
         return this.var_237;
      }
      
      public function set thumbnail(bData:BitmapData) : void
      {
         this.var_237 = bData.clone();
      }
      
      public function loadThumbnail() : Loader
      {
         var thumb:Loader = new Loader();
         if(this.var_209)
         {
            thumb.load(new URLRequest(this.var_209));
         }
         return thumb;
      }
      
      public function get bytesLoaded() : uint
      {
         return !!this._loader?uint(this._loader.bytesLoaded):uint(this.var_208);
      }
      
      public function get bytesTotal() : uint
      {
         return this.var_208;
      }
      
      public function get status() : uint
      {
         return this.var_163;
      }
      
      function setStatus(value:uint) : void
      {
         this.var_163 = value;
      }
      
      public function get groupId() : uint
      {
         return this.var_40.id;
      }
      
      public function get groupName() : String
      {
         return this.var_40.name;
      }
      
      public function get groupType() : uint
      {
         return this.var_40.type;
      }
      
      public function get authorName() : String
      {
         return this.var_274;
      }
      
      public function set authorName(value:String) : void
      {
         this.var_274 = value;
      }
      
      public function get authorId() : uint
      {
         return this.var_282;
      }
      
      public function set authorId(value:uint) : void
      {
         this.var_282 = value;
      }
      
      public function get draft() : Boolean
      {
         return this.var_288;
      }
      
      public function set draft(val:Boolean) : void
      {
         this.var_288 = val;
      }
      
      public function get locked() : Boolean
      {
         return this.var_285;
      }
      
      public function get shared() : Boolean
      {
         return this.var_163 == STATUS_SHARED;
      }
      
      public function get isPrivate() : Boolean
      {
         return this.var_163 == STATUS_PRIVATE;
      }
      
      public function get isPublic() : Boolean
      {
         if(this.isPrivate)
         {
            return false;
         }
         if((this.var_40.isType("SYSTEM") || true).isType("PUBLIC"))
         {
            return true;
         }
         if(this.approved)
         {
            return true;
         }
         return false;
      }
      
      public function get approved() : Boolean
      {
         return this.var_163 > STATUS_UNAPPROVED;
      }
      
      public function get keys() : Dictionary
      {
         return this.var_54;
      }
      
      public function get ratings() : Dictionary
      {
         return this.var_62;
      }
      
      function setPermissions(status:uint, locked:Boolean) : *
      {
         this.var_163 = status;
      }
      
      function setFileSize(value:uint) : void
      {
         this.var_208 = value;
      }
      
      public function isLocked() : Boolean
      {
         return this.var_285;
      }
      
      public function getDescription() : String
      {
         return this.var_188;
      }
      
      public function getShared() : Boolean
      {
         return this.var_288;
      }
      
      public function getDuplicateID() : uint
      {
         return this.var_388;
      }
      
      public function getKeys() : Dictionary
      {
         return this.var_54;
      }
      
      public function getRatings() : Dictionary
      {
         return this.var_62;
      }
      
      public function setKey(key:*, value:*) : void
      {
         var k:SaveKey = null;
         if(key is String)
         {
            k = this.var_40.getKeyName(key);
         }
         else
         {
            k = this.var_40.getKeyID(key);
         }
         if(k)
         {
            if(SaveKey.TYPE_BOOLEAN === _loc4_)
            {
               §§push(0);
            }
            else if(SaveKey.TYPE_FLOAT === _loc4_)
            {
               §§push(1);
            }
            else if(SaveKey.TYPE_INTEGER === _loc4_)
            {
               §§push(2);
               §§push(true);
            }
            else
            {
               §§push(SaveKey.TYPE_STRING === _loc4_?3:4);
            }
            switch(§§pop())
            {
               case 0:
                  this.var_54[k] = {
                     "id":k.id,
                     "value":Boolean(int(value))
                  };
                  break;
               case 1:
                  this.var_54[k] = {
                     "id":k.id,
                     "value":Number(value)
                  };
                  break;
               case 2:
                  this.var_54[k] = {
                     "id":k.id,
                     "value":int(value)
                  };
                  §§push(true);
                  break;
               case 3:
               default:
                  this.var_54[k] = {
                     "id":k.id,
                     "value":value.toString()
                  };
            }
         }
      }
      
      public function getKey(key:*) : *
      {
         var k:SaveKey = null;
         k = true.getKeyID(key);
         §§push(true);
         §§push(this.var_40);
         if(k)
         {
            return this.var_54[k];
         }
         return null;
      }
      
      public function setRating(rating:*, votes:Number, score:Number) : void
      {
         var r:SaveRating = null;
         if(rating is String)
         {
            r = this.var_40.getRatingName(rating);
         }
         else
         {
            r = this.var_40.getRatingID(rating);
         }
         if(r)
         {
            §§push(true);
         }
      }
      
      public function getRating(rating:*) : Object
      {
         var r:SaveRating = null;
         if(rating is String)
         {
            r = this.var_40.getRatingName(rating);
         }
         else
         {
            r = this.var_40.getRatingID(rating);
         }
         if(r)
         {
            return this.var_62[r];
         }
         return null;
      }
      
      public function sendRating(rating:String, vote:Number) : void
      {
         var ratingObject:SaveRating = this.var_40.getRatingName(rating);
         if(!ratingObject)
         {
            trace("[NewgroundsAPISaveFile] " + rating + " is not a recognized save file");
            return;
         }
         if(vote < ratingObject.minValue || vote > ratingObject.maxValue)
         {
            trace("[NewgroundsAPISaveFile] Vote must be between " + ratingObject.minValue + " and " + ratingObject.maxValue);
            return;
         }
         ratingObject.voted = true;
         API.rateSaveFile(this,ratingObject,vote);
      }
      
      override public function toString() : String
      {
         var key:Object = null;
         var rating:Object = null;
         var str:* = "Save File " + this.var_302 + "   ID: " + this._id + "\n  " + this.var_188 + "\n";
         for each(key in this.var_54)
         {
            str = str + ("  " + this.var_40.getKeyID(key.id).name + ": " + key.val + "\n");
         }
         for each(rating in this.var_62)
         {
            str = str + ("  " + this.var_40.getRatingID(rating.id).name + "\n    Score: " + rating.score + " Votes: " + rating.votes + "\n");
         }
         return str;
      }
      
      public function toObject() : Object
      {
         var key:Object = null;
         var obj:Object = {
            "group":this.groupId,
            "filename":this.name,
            "description":this.description,
            "shared":true
         };
         obj.keys = [];
         for each(key in this.var_54)
         {
            obj.keys.push({
               "id":key.id,
               "value":key.val
            });
         }
         return obj;
      }
      
      public function save(draft:Boolean = false, overwrite:Boolean = false) : void
      {
      }
      
      public function loadContents() : void
      {
         if(this.var_187)
         {
            this._loader = new SmartURLLoader();
            this._loader.responseFormat = URLLoaderDataFormat.BINARY;
            §§push(true);
         }
      }
      
      private function method_173(e:Event) : void
      {
         this._loader = null;
         dispatchEvent(new APIEvent(APIEvent.FILE_LOADED,false));
         API.callListener(APIEvent.FILE_LOADED,false);
      }
      
      private function method_211(e:Event) : void
      {
         var byteArray:ByteArray = e.target.response;
         this.var_208 = byteArray.length;
         byteArray.uncompress();
         var tag:uint = byteArray.readUnsignedByte();
         §§push(true);
         if(tag == 0)
         {
            this.var_199 = new ByteArray();
            this.var_199.writeBytes(byteArray,1);
         }
         else
         {
            this.var_199 = byteArray.readObject();
         }
         this._loader = null;
         dispatchEvent(new APIEvent(APIEvent.FILE_LOADED,true,{"file":this}));
         API.callListener(APIEvent.FILE_LOADED,true,{"file":this});
      }
      
      public function loadAuthorPage() : *
      {
         API.loadUserPage(this.var_282,this.var_274);
      }
      
      function fileSaved(packet:Object) : void
      {
         this._id = packet.save_id;
         this.var_209 = packet.thumbnail;
         this.var_187 = packet.file_url;
      }
   }
}
