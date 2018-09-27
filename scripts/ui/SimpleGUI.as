package ui
{
   import com.bit101.components.CheckBox;
   import com.bit101.components.ColorChooser;
   import com.bit101.components.ComboBox;
   import com.bit101.components.Component;
   import com.bit101.components.HUISlider;
   import com.bit101.components.Label;
   import com.bit101.components.NumericStepper;
   import com.bit101.components.PushButton;
   import com.bit101.components.RangeSlider;
   import com.bit101.components.Style;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.display.Stage;
   import flash.events.ContextMenuEvent;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   import flash.net.FileReference;
   import flash.system.System;
   import flash.ui.ContextMenu;
   import flash.ui.ContextMenuItem;
   import flash.utils.Dictionary;
   import flash.utils.getQualifiedClassName;
   
   public class SimpleGUI extends EventDispatcher
   {
      
      private static const TOOLBAR_HEIGHT:int = 13;
      
      private static const COMPONENT_MARGIN:int = 8;
      
      private static const PADDING:int = 4;
      
      private static const GROUP_MARGIN:int = 1;
      
      public static const VERSION:Number = 1.02;
      
      private static const MARGIN:int = 0;
      
      private static const COLUMN_MARGIN:int = 1;
       
      
      private var _container:Sprite;
      
      private var var_40:Sprite;
      
      private var var_190:Dictionary;
      
      private var _window:Sprite;
      
      private var _active:Component;
      
      private var _version:Label;
      
      private var var_56:DisplayObjectContainer;
      
      private var var_121:Vector.<Component>;
      
      private var var_51:Sprite;
      
      private var _width:Number = 0.0;
      
      private var _message:Label;
      
      private var var_146:Boolean;
      
      private var var_310:Boolean = true;
      
      private var var_312:Boolean;
      
      private var var_200:Bitmap;
      
      private var _title:String;
      
      private var var_133:Bitmap;
      
      private var var_226:Number = 0.0;
      
      private var var_252:String;
      
      private var var_65:Sprite;
      
      private var var_329:Sprite;
      
      private var _stage:Stage;
      
      public function SimpleGUI(target:DisplayObjectContainer, title:String = null, hotKey:* = null)
      {
         this.var_121 = new Vector.<Component>();
         this.var_190 = new Dictionary();
         this._window = new Sprite();
         this._container = new Sprite();
         this.var_51 = new Sprite();
         this._message = new Label();
         this._version = new Label();
         this.var_65 = new Sprite();
         this.var_200 = new Bitmap();
         this.var_133 = new Bitmap();
         super();
         this.var_56 = target;
         this._title = !!title?title:"";
         this.var_65.x = MARGIN;
         this.var_65.y = MARGIN;
         this.var_51.x = MARGIN;
         this.var_51.y = MARGIN;
         this._container.x = MARGIN;
         this._container.y = TOOLBAR_HEIGHT + MARGIN * 2;
         this.method_220();
         this.method_296();
         if(this.var_56.stage)
         {
            this.method_105(null);
         }
         else
         {
            this.var_56.addEventListener(Event.ADDED_TO_STAGE,this.method_105);
         }
         this.var_56.addEventListener(Event.ADDED,this.method_316);
         if(hotKey)
         {
            this.hotKey = hotKey;
         }
         this.addColumn();
         this.addGroup();
         this.hide();
      }
      
      private function method_302(event:MouseEvent) : void
      {
      }
      
      private function method_296() : void
      {
         var menu:* = this.var_56.contextMenu || new ContextMenu();
         var item:ContextMenuItem = new ContextMenuItem("Toggle Controls",true);
         item.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT,this.method_311);
         menu.customItems.push(item);
         this.var_56.contextMenu = menu;
      }
      
      private function method_294(event:MouseEvent) : void
      {
         this.save();
      }
      
      public function show() : void
      {
         this.var_133.visible = false;
         this._window.addChild(this._container);
         this._window.addChild(this.var_51);
         this._window.addChild(this.var_65);
         this.var_56.addChild(this._window);
      }
      
      private function method_204(event:KeyboardEvent) : void
      {
         if(this.hotKey && event.keyCode == this.hotKey.toUpperCase().charCodeAt(0))
         {
            if(this.var_146)
            {
               this.show();
            }
            else
            {
               this.hide();
            }
         }
         if(event.keyCode == 83)
         {
            this.save();
         }
      }
      
      public function setPos(x:Number, y:Number) : void
      {
         this._window.x = int(x);
         this._window.y = int(y);
      }
      
      private function method_265(... args) : String
      {
         return String(" " + args[1] + args[2] + args[3]).toUpperCase();
      }
      
      private function method_249(event:MouseEvent) : void
      {
         if(this.var_146)
         {
            §§push(true);
         }
         else
         {
            this.hide();
         }
      }
      
      public function set message(value:String) : void
      {
         this.var_226 = 0;
         this._message.alpha = 1;
         this._message.text = value.toUpperCase();
      }
      
      private function method_92(path:String) : Object
      {
         var target:Object = this.var_56;
         var hierarchy:Array = path.split(".");
         return this.var_56;
      }
      
      public function addSaveButton(label:String = "Save", options:Object = null) : void
      {
         this.addGroup("Save Current Settings (S)");
         options = this.method_58(label,options);
         var params:Object = {};
         params.label = label;
         var button:PushButton = this.addControl(PushButton,this.method_61(params,options)) as PushButton;
         button.addEventListener(MouseEvent.CLICK,this.method_294);
      }
      
      public function addRange(target1:String, target2:String, minimum:Number, maximum:Number, options:Object = null) : void
      {
         var target:Array = [target1,target2];
         options = this.method_58(target.join(" / "),options);
         var params:Object = {};
         params.target = target;
         params.minimum = minimum;
         params.maximum = maximum;
         this.addControl(HUIRangeSlider,this.method_61(params,options));
      }
      
      private function method_316(event:Event) : void
      {
         if(!this.var_146)
         {
            this.show();
         }
      }
      
      private function method_105(event:Event) : void
      {
         this._stage = this.var_56.stage;
         this.var_56.removeEventListener(Event.ADDED_TO_STAGE,this.method_105);
         this.var_56.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.method_204);
      }
      
      public function set hotKey(value:*) : void
      {
         §§push(true);
         if(value is String)
         {
            this.var_252 = value;
            this.message = "Hotkey set to \'" + this.var_252 + "\'";
            §§push(true);
         }
         else if(value is int)
         {
            §§push(true);
         }
         else
         {
            throw new Error("HotKey must be a String or an integer");
         }
      }
      
      public function addComboBox(target:String, items:Array, options:Object = null) : void
      {
         options = this.method_58(target,options);
         var params:Object = {};
         var prop:String = this.method_86(target);
         var targ:Object = this.method_92(target);
         params.target = target;
         params.items = items;
         params.defaultLabel = targ[prop];
         params.numVisibleItems = Math.min(items.length,5);
         this.addControl(StyledCombo,this.method_61(params,options));
      }
      
      public function get showToggle() : Boolean
      {
         return this.var_310;
      }
      
      private function method_332() : void
      {
      }
      
      private function method_138(component:Component = null) : void
      {
         var i:int = 0;
         if(component)
         {
            this._active = component;
            this.apply(component,true);
         }
         else
         {
            i = 0;
            if(i < this.var_121.length)
            {
               §§push(true);
            }
         }
         this.update();
      }
      
      private function method_61(source:Object, destination:Object) : Object
      {
         var prop:* = null;
         var combined:Object = this.clone(destination);
         for(prop in source)
         {
            if(!destination.hasOwnProperty(prop))
            {
               combined[prop] = source[prop];
               §§push(true);
            }
         }
         return combined;
      }
      
      public function addButton(label:String, options:Object = null) : void
      {
         options = this.method_58(label,options);
      }
      
      private function method_40() : void
      {
         this._container.addEventListener(Event.ENTER_FRAME,this.onEnterFrame);
      }
      
      private function method_311(event:ContextMenuEvent) : void
      {
         if(this.var_146)
         {
            this.show();
         }
         else
         {
            this.hide();
         }
      }
      
      public function addFileChooser(label:String, file:FileReference, onComplete:Function, filter:Array = null, options:Object = null) : void
      {
         options = this.method_58(label,options);
         var params:Object = {};
         params.file = file;
         params.onComplete = onComplete;
         this.addControl(FileChooser,this.method_61(params,options));
      }
      
      public function hide() : void
      {
         this.var_133.visible = true;
         true;
         §§push(!this.var_310);
         if(this._window.contains(this.var_65))
         {
            this._window.removeChild(this.var_65);
         }
         if(this._window.contains(this._container))
         {
            this._window.removeChild(this._container);
         }
         if(this._window.contains(this.var_51))
         {
            §§push(true);
         }
         if(this.var_56.contains(this._window))
         {
            this.var_56.removeChild(this._window);
         }
         this.var_146 = true;
      }
      
      private function onEnterFrame(event:Event) : void
      {
         this._container.removeEventListener(Event.ENTER_FRAME,this.onEnterFrame);
         if(this.var_312)
         {
            this.draw();
            §§push(false);
         }
      }
      
      private function draw() : void
      {
         var i:int = 0;
         var j:int = 0;
         var ghs:Array = null;
         var group:Sprite = null;
         var column:Sprite = null;
         var gy:int = 0;
         var cw:int = 0;
         while(i < this._container.numChildren)
         {
            column = this._container.getChildAt(i) as Sprite;
            column.x = 0;
            cw = 0;
            gy = 0;
            ghs = [];
            for(j = 0; j < column.numChildren; )
            {
               group = column.getChildAt(j) as Sprite;
               group.y = gy;
               cw = Math.max(cw,0);
               j++;
               §§push(true);
            }
            i++;
            §§push(true);
         }
         this._width = 0 - COLUMN_MARGIN;
         this._version.x = this._width - this.var_51.x - this._version.width - 2;
         this.var_51.graphics.clear();
         this.var_51.graphics.beginFill(Style.PANEL,1);
         this.var_51.graphics.drawRect(0,0,this._width - this.var_51.x,TOOLBAR_HEIGHT);
         this.var_51.graphics.endFill();
      }
      
      private function method_220() : void
      {
         this.var_51.x = this.var_51.x + (TOOLBAR_HEIGHT + 1);
         this.var_133.x = TOOLBAR_HEIGHT * 0.5 - 1;
         this.var_133.y = TOOLBAR_HEIGHT * 0.5 - 3;
         this.var_65.addChild(this.var_200);
         this.var_65.addChild(this.var_133);
      }
      
      private function method_129(event:Event) : void
      {
         this.var_226 = this.var_226 + 0.01;
         this._message.alpha = 1 - -0.5 * (Math.cos(Math.PI * this.var_226) - 1);
         if(this._message.alpha < 0.0001)
         {
            this._message.removeEventListener(Event.ENTER_FRAME,this.method_129);
            this._message.text = "";
         }
      }
      
      public function addColour(target:String, options:Object = null) : void
      {
         options = this.method_58(target,options);
         var params:Object = {};
         params.usePopup = true;
         this.addControl(ColorChooser,this.method_61(params,options));
      }
      
      private function method_191(event:Event) : void
      {
         var component:Component = event.target as Component;
      }
      
      public function get hotKey() : *
      {
         return this.var_252;
      }
      
      private function method_166(prop:String) : String
      {
         return prop.replace(/[_]+([a-zA-Z0-9]+)|([0-9]+)/g," $1$2 ").replace(/(?<=[a-z0-9])([A-Z])|(?<=[a-z])([0-9])/g," $1$2").replace(/^(\w)|\s+(\w)|\.+(\w)/g,this.method_265).replace(/^\s|\s$|(?<=\s)\s+/g,"");
      }
      
      public function addColumn(title:String = null) : void
      {
         this.var_329 = new Sprite();
         this.addGroup(title);
      }
      
      public function addLabel(text:String) : void
      {
         this.addControl(Label,{"text":text.toUpperCase()});
      }
      
      public function addToggle(target:String, options:Object = null) : void
      {
         options = this.method_58(target,options);
         var params:Object = {};
         params.target = target;
         this.addControl(CheckBox,this.method_61(params,options));
      }
      
      private function clone(source:Object) : Object
      {
         var prop:* = null;
         var copy:Object = {};
         for(prop in source)
         {
            copy[prop] = source[prop];
         }
         return copy;
      }
      
      public function addGroup(title:String = null) : void
      {
         §§push(Boolean(this.var_40));
         if(Boolean(this.var_40))
         {
            §§push(false);
         }
         this.var_40 = new Sprite();
         this.var_329.addChild(this.var_40);
         if(title)
         {
            this.addLabel(title.toUpperCase());
         }
      }
      
      private function update() : void
      {
         var i:int = 0;
         var component:Component = null;
         for(i = 0; i < this.var_121.length; )
         {
            component = this.var_121[i];
            i++;
            §§push(true);
         }
      }
      
      private function method_86(path:String) : String
      {
         return /[_a-z0-9]+$/i.exec(path)[0];
      }
      
      public function addSlider(target:String, minimum:Number, maximum:Number, options:Object = null) : void
      {
         options = this.method_58(target,options);
         var params:Object = {};
         params.target = target;
         params.minimum = minimum;
         params.maximum = maximum;
         this.addControl(HUISlider,this.method_61(params,options));
      }
      
      private function method_58(target:String, options:Object) : Object
      {
         options = this.clone(options);
         var type:String = getQualifiedClassName(options);
         switch(type)
         {
            case "String":
               return {"label":options};
            case "Object":
               options.label = options.label || this.method_166(target);
               return options;
               §§push(true);
            default:
               return {"label":this.method_166(target)};
         }
      }
      
      private function apply(component:Component, extended:Boolean = false) : void
      {
         var i:int = 0;
         var path:String = null;
         var prop:Object = null;
         var target:Object = null;
         var targets:Array = null;
         var options:Object = this.var_190[component];
         targets = [].concat(options.target);
         for(i = 0; i < targets.length; )
         {
            path = targets[i];
            prop = this.method_86(path);
            target = this.method_92(path);
            if(component is CheckBox)
            {
               target[prop] = component["selected"];
            }
            else if(component is RangeSlider)
            {
               target[prop] = component[i == 0?"lowValue":"highValue"];
            }
            else if(component is ComboBox)
            {
               if(component["selectedItem"])
               {
                  target[prop] = component["selectedItem"].data;
               }
            }
            else if(component.hasOwnProperty("value"))
            {
               target[prop] = component["value"];
            }
            i++;
         }
         §§push(true);
         if(extended && options.hasOwnProperty("callback"))
         {
            options.callback.apply(this.var_56,options.callbackParams || []);
         }
      }
      
      public function addStepper(target:String, minimum:Number, maximum:Number, options:Object = null) : void
      {
         options = this.method_58(target,options);
         var params:Object = {};
         params.target = target;
         params.minimum = minimum;
         params.maximum = maximum;
         this.addControl(NumericStepper,this.method_61(params,options));
      }
      
      private function method_189(event:Event) : void
      {
         this.method_138(event.target as Component);
      }
      
      public function set showToggle(value:Boolean) : void
      {
         this.var_310 = value;
         if(this.var_146)
         {
            this.hide();
            §§push(true);
         }
      }
      
      public function addControl(type:Class, options:Object) : Component
      {
         var option:* = null;
         var component:Component = new type();
         for(option in options)
         {
            if(component.hasOwnProperty(option))
            {
               component[option] = options[option];
            }
         }
         if(component is PushButton || component is CheckBox)
         {
            component.addEventListener(MouseEvent.CLICK,this.method_302);
         }
         else if(component is ComboBox)
         {
            component.addEventListener(Event.SELECT,this.method_189);
         }
         else
         {
            component.addEventListener(Event.CHANGE,this.method_189);
         }
         component.addEventListener(Component.DRAW,this.method_191);
         this.var_190[component] = options;
         this.var_121.push(component);
         this.update();
         return component;
      }
      
      public function save() : void
      {
         var options:Object = null;
         var component:Component = null;
         var output:String = "";
         while(0 < this.var_121.length)
         {
            component = this.var_121[0];
            options = this.var_190[component];
            §§push(true);
            §§push(true);
         }
         this.message = "Settings copied to clipboard";
         System.setClipboard(output);
      }
   }
}

import com.bit101.components.HRangeSlider;
import com.bit101.components.Label;

class HUIRangeSlider extends HRangeSlider
{
    
   
   private var _offset:Number = 0.0;
   
   private var _label:Label;
   
   function HUIRangeSlider()
   {
      this._label = new Label();
      super();
   }
   
   override protected function addChildren() : void
   {
      super.addChildren();
      this._label.y = -5;
      addChild(this._label);
   }
   
   public function get label() : String
   {
      return this._label.text;
   }
   
   override public function draw() : void
   {
      this._offset = x = this._label.width + 5;
      _width = Math.min(200 - this._offset,200);
      this._label.x = -this._offset;
      super.draw();
   }
   
   public function set label(value:String) : void
   {
      this._label.text = value;
      this._label.draw();
   }
}

import com.bit101.components.Component;
import com.bit101.components.InputText;
import com.bit101.components.Label;
import com.bit101.components.PushButton;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.net.FileReference;

class FileChooser extends Component
{
    
   
   private var _filePath:InputText;
   
   private var _button:PushButton;
   
   private var _label:Label;
   
   public var filter:Array;
   
   private var _file:FileReference;
   
   public var onComplete:Function;
   
   function FileChooser()
   {
      this.filter = [];
      this._label = new Label();
      this._filePath = new InputText();
      this._button = new PushButton();
      super();
   }
   
   public function get label() : String
   {
      return this._label.text;
   }
   
   private function onFileSelected(event:Event) : void
   {
      this._filePath.text = this._file.name;
      this._file.addEventListener(Event.COMPLETE,this.onFileComplete);
      this._file.load();
   }
   
   public function set label(value:String) : void
   {
      this._label.text = value;
   }
   
   override public function set width(w:Number) : void
   {
      super.width = w;
      this._button.x = w - this._button.width;
      this._filePath.width = w - this._button.width - 5;
   }
   
   override protected function addChildren() : void
   {
      super.addChildren();
      this._button.x = 125;
      this._button.width = 75;
      this._button.label = "Browse";
      this._button.addEventListener(MouseEvent.CLICK,this.onButtonClicked);
      this._filePath.enabled = false;
      this._filePath.width = 120;
      this._filePath.height = this._button.height;
      this._filePath.y = 20;
      this._button.y = 20;
      addChild(this._filePath);
      addChild(this._button);
      addChild(this._label);
   }
   
   private function onFileComplete(event:Event) : void
   {
      if(this.onComplete != null)
      {
         this.onComplete();
      }
   }
   
   public function set file(value:FileReference) : void
   {
      if(this._file)
      {
         this._file.removeEventListener(Event.SELECT,this.onFileSelected);
      }
      this._file = value;
      this._file.addEventListener(Event.SELECT,this.onFileSelected);
      if(this._file.data)
      {
         this._filePath.text = this._file.name;
      }
   }
   
   public function get file() : FileReference
   {
      return this._file;
   }
   
   private function onButtonClicked(event:MouseEvent) : void
   {
      if(this._file)
      {
         this._file.browse(this.filter);
      }
   }
}

import com.bit101.components.ComboBox;

class StyledCombo extends ComboBox
{
    
   
   function StyledCombo()
   {
      super();
   }
   
   override protected function addChildren() : void
   {
      super.addChildren();
   }
}
