package com.gameallianz.api.as3.gui
{
   import com.gameallianz.api.as3.classes.GameAllianzApiGlobal;
   import flash.display.Sprite;
   import flash.display.Stage;
   import flash.events.Event;
   
   public class Background extends Sprite
   {
       
      
      private var stg_stage:Stage;
      
      private var var_4:AssetLoadingIndicator;
      
      public function Background(_stage:Stage = null)
      {
         super();
         this.stg_stage = _stage;
         this.ini();
         this.method_14();
      }
      
      private function ini() : void
      {
         this.var_4 = new AssetLoadingIndicator();
         this.graphics.beginFill(0,1);
         this.graphics.lineStyle(0,0,0);
         this.graphics.moveTo(0,0);
         this.graphics.lineTo(4096,0);
         this.graphics.lineTo(4096,4096);
         this.graphics.lineTo(0,4096);
         this.graphics.lineTo(0,0);
         this.graphics.endFill();
         this.addChild(this.var_4);
         this.handlerResize();
      }
      
      private function method_14() : void
      {
         try
         {
            if(!this.stg_stage)
            {
               GameAllianzApiGlobal.stage.addEventListener(Event.ENTER_FRAME,this.handlerResize);
            }
            else
            {
               this.stg_stage.addEventListener(Event.ENTER_FRAME,this.handlerResize);
            }
            return;
         }
         catch(e:Error)
         {
            return;
         }
      }
      
      private function method_30() : void
      {
         try
         {
            if(!this.stg_stage)
            {
               GameAllianzApiGlobal.stage.removeEventListener(Event.ENTER_FRAME,this.handlerResize);
            }
            else
            {
               this.stg_stage.removeEventListener(Event.ENTER_FRAME,this.handlerResize);
            }
            return;
         }
         catch(e:Error)
         {
            return;
         }
      }
      
      public function handlerApiAction(GameAllianzApiInternalEvent:Event) : void
      {
      }
      
      public function handlerResize(event:Event = null) : void
      {
         this.x = 0;
         this.y = 0;
         if(!this.stg_stage)
         {
            §§push(true);
         }
         else
         {
            this.x = (this.stg_stage.stageWidth - this.width) / 2;
            this.y = (this.stg_stage.stageHeight - this.height) / 2;
            this.var_4.x = this.width / 2;
         }
         this.var_4.y = this.height / 2;
      }
      
      public function set active(_value:Boolean) : void
      {
         try
         {
            if(!this.stg_stage)
            {
               GameAllianzApiGlobal.stage.removeChild(this);
            }
            else
            {
               this.stg_stage.removeChild(this);
            }
            this.method_30();
         }
         catch(e:Error)
         {
         }
         if(_value)
         {
            try
            {
               if(!this.stg_stage)
               {
                  GameAllianzApiGlobal.stage.addChild(this);
               }
               else
               {
                  this.stg_stage.addChild(this);
               }
               this.method_14();
               return;
            }
            catch(e:Error)
            {
               return;
            }
         }
      }
   }
}
