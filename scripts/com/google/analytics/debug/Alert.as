package com.google.analytics.debug
{
   import flash.events.TextEvent;
   
   public class Alert extends Label
   {
       
      
      public var autoClose:Boolean = true;
      
      public var actionOnNextLine:Boolean = true;
      
      private var _actions:Array;
      
      public function Alert(text:String, actions:Array, tag:String = "uiAlert", color:uint = 0, alignement:Align = null, stickToEdge:Boolean = false, actionOnNextLine:Boolean = true)
      {
         if(color == 0)
         {
            color = Style.alertColor;
         }
         if(alignement == null)
         {
            alignement = Align.center;
         }
         super(text,tag,color,alignement,stickToEdge);
         this.selectable = true;
         super.mouseChildren = true;
         this.buttonMode = true;
         this.mouseEnabled = true;
         this.useHandCursor = true;
         this.actionOnNextLine = actionOnNextLine;
         this._actions = [];
         for(var i:int = 0; i < actions.length; i++)
         {
            actions[i].container = this;
            this._actions.push(actions[i]);
         }
      }
      
      private function _defineActions() : void
      {
         var action:AlertAction = null;
         var str:* = "";
         if(this.actionOnNextLine)
         {
            str = str + "\n";
         }
         else
         {
            str = str + " |";
         }
         str = str + " ";
         var actions:Array = [];
         for(var i:int = 0; i < this._actions.length; i++)
         {
            action = this._actions[i];
            actions.push("<a href=\"event:" + action.activator + "\">" + action.name + "</a>");
         }
         str = str + actions.join(" | ");
         appendText(str,"uiAlertAction");
      }
      
      protected function isValidAction(action:String) : Boolean
      {
         for(var i:int = 0; i < this._actions.length; )
         {
            if(action == this._actions[i].activator)
            {
               return true;
            }
            i++;
         }
         return false;
      }
      
      override protected function layout() : void
      {
         super.layout();
         this._defineActions();
      }
      
      protected function getAction(name:String) : AlertAction
      {
         for(var i:int = 0; i < this._actions.length; )
         {
            if(name == this._actions[i].activator)
            {
               return this._actions[i];
            }
            i++;
         }
         return null;
      }
      
      protected function spaces(num:int) : String
      {
         var str:String = "";
         var spc:String = "          ";
         for(var i:int = 0; i < num + 1; i++)
         {
            str = str + spc;
         }
         return str;
      }
      
      override public function onLink(event:TextEvent) : void
      {
         var action:AlertAction = null;
         if(this.isValidAction(event.text))
         {
            action = this.getAction(event.text);
            if(action)
            {
               action.execute();
            }
         }
         if(this.autoClose)
         {
            this.close();
         }
      }
      
      public function close() : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
   }
}
