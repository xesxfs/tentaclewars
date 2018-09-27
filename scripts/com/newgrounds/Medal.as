package com.newgrounds
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Loader;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLRequest;
   import flash.system.LoaderContext;
   
   public class Medal
   {
      
      private static const DEFAULT_ICON:BitmapData;
      
      private static const DIFFICULT_NAMES:Array;
       
      
      private var _id:uint;
      
      private var _name:String;
      
      private var _value:uint;
      
      private var var_261:uint;
      
      private var var_211:Boolean = false;
      
      private var var_292:URLRequest;
      
      private var var_53:Loader;
      
      private var var_287:BitmapData;
      
      public function Medal(id:uint, name:String, value:uint, difficulty:uint, unlocked:Boolean, iconUrl:String)
      {
         try
         {
            this.var_53.load(this.var_292,new LoaderContext(true));
            return;
         }
         catch(e:Error)
         {
            method_83(null);
            return;
         }
      }
      
      public static function createFromObject(medalData:Object) : Medal
      {
         return new Medal(medalData.medal_id,medalData.medal_name,medalData.medal_value,medalData.medal_difficulty,medalData.medal_unlocked,medalData.medal_icon);
      }
      
      public function get difficulty() : String
      {
         return DIFFICULT_NAMES[this.var_261];
      }
      
      public function get difficultyId() : uint
      {
         return this.var_261;
      }
      
      public function get icon() : BitmapData
      {
         return this.var_287;
      }
      
      public function get id() : uint
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get unlocked() : Boolean
      {
         return this.var_211;
      }
      
      public function isUnlocked() : Boolean
      {
         return this.var_211;
      }
      
      public function set unlocked(b:Boolean) : void
      {
      }
      
      public function get value() : uint
      {
         return this._value;
      }
      
      public function get bytesLoaded() : uint
      {
         return !!this.var_53?uint(this.var_53.contentLoaderInfo.bytesLoaded):uint(0);
      }
      
      public function get bytesTotal() : uint
      {
         return !!this.var_53?uint(this.var_53.contentLoaderInfo.bytesTotal):uint(0);
      }
      
      public function getID() : uint
      {
         return this._id;
      }
      
      public function getName() : String
      {
         return this._name;
      }
      
      public function getValue() : uint
      {
         return this._value;
      }
      
      public function getDifficulty() : String
      {
         return DIFFICULT_NAMES[this.var_261];
      }
      
      private function method_214(e:Event) : void
      {
      }
      
      private function method_83(e:IOErrorEvent) : void
      {
         trace("[NewgroundsAPI WARNING] :: Failed to load medal icon for " + this.name + " (" + this.var_292.url.split("/").pop() + ")");
         this.var_53.unload();
         this.var_53 = null;
      }
      
      private function method_230(e:Event) : void
      {
         var bitmap:Bitmap = this.var_53.content as Bitmap;
         this.var_287 = bitmap.bitmapData;
         this.var_53.unload();
         this.var_53 = null;
      }
      
      public function unlock() : void
      {
         if(!this.var_211)
         {
            §§push(true);
         }
      }
      
      public function createIconBitmap() : Bitmap
      {
         return new Bitmap(this.icon);
      }
      
      public function toString() : String
      {
         return this._name;
      }
   }
}
