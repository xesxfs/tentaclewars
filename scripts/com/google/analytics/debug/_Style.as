package com.google.analytics.debug
{
   import flash.net.URLLoader;
   import flash.text.StyleSheet;
   
   public class _Style
   {
       
      
      public var failureColor:uint;
      
      public var borderColor:uint;
      
      public var backgroundColor:uint;
      
      private var _sheet:StyleSheet;
      
      public var roundedCorner:uint;
      
      public var warningColor:uint;
      
      public var infoColor:uint;
      
      public var alertColor:uint;
      
      public var successColor:uint;
      
      private var _loader:URLLoader;
      
      private var _defaultSheet:String;
      
      public function _Style()
      {
         super();
         this._sheet = new StyleSheet();
         this._loader = new URLLoader();
         this._init();
      }
      
      private function _parseSheet(data:String) : void
      {
         this._sheet.parseCSS(data);
      }
      
      public function get sheet() : StyleSheet
      {
         return this._sheet;
      }
      
      private function _init() : void
      {
         this._defaultSheet = "";
         this._defaultSheet = this._defaultSheet + "a{text-decoration: underline;}\n";
         this._defaultSheet = this._defaultSheet + ".uiLabel{color: #000000;font-family: Arial;font-size: 12;margin-left: 2;margin-right: 2;}\n";
         this._defaultSheet = this._defaultSheet + ".uiWarning{color: #ffffff;font-family: Arial;font-size: 14;font-weight: bold;margin-left: 6;margin-right: 6;}\n";
         this._defaultSheet = this._defaultSheet + ".uiAlert{color: #ffffff;font-family: Arial;font-size: 14;font-weight: bold;margin-left: 6;margin-right: 6;}\n";
         this._defaultSheet = this._defaultSheet + ".uiInfo{color: #000000;font-family: Arial;font-size: 14;font-weight: bold;margin-left: 6;margin-right: 6;}\n";
         this._defaultSheet = this._defaultSheet + ".uiSuccess{color: #ffffff;font-family: Arial;font-size: 12;font-weight: bold;margin-left: 6;margin-right: 6;}\n";
         this._defaultSheet = this._defaultSheet + ".uiFailure{color: #ffffff;font-family: Arial;font-size: 12;font-weight: bold;margin-left: 6;margin-right: 6;}\n";
         this._defaultSheet = this._defaultSheet + ".uiAlertAction{color: #ffffff;text-align: center;font-family: Arial;font-size: 12;font-weight: bold;margin-left: 6;margin-right: 6;}\n";
         this._defaultSheet = this._defaultSheet + ".uiAlertTitle{color: #ffffff;font-family: Arial;font-size: 16;font-weight: bold;margin-left: 6;margin-right: 6;}\n";
         this._defaultSheet = this._defaultSheet + "\n";
         this.roundedCorner = 6;
         this.backgroundColor = 13421772;
         this.borderColor = 5592405;
         this.infoColor = 16777113;
         this.alertColor = 16763904;
         this.warningColor = 13369344;
         this.successColor = 65280;
         this.failureColor = 16711680;
         this._parseSheet(this._defaultSheet);
      }
   }
}
