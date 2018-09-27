module mx {
	export module core {
		export interface IFlexDisplayObject extends egret.IEventDispatcher {
			visible:boolean;
			rotation:number;
			localToGlobal(param1:egret.Point):egret.Point;
			name:string;
			width:number;
			measuredHeight:number;
			blendMode:string;
			scale9Grid:egret.Rectangle;
			scaleX:number;
			scaleY:number;
			measuredWidth:number;
			accessibilityProperties:egret.AccessibilityProperties;
			scrollRect:egret.Rectangle;
			cacheAsBitmap:boolean;
			globalToLocal(param1:egret.Point):egret.Point;
			height:number;
			parent:egret.DisplayObjectContainer;
			getBounds(param1:egret.DisplayObject):egret.Rectangle;
			opaqueBackground:any;
			setActualSize(param1:number,param2:number);
			alpha:number;
			hitTestPoint(param1:number,param2:number,param3?:boolean):boolean;
			mouseX:number;
			mouseY:number;
			mask:egret.DisplayObject;
			getRect(param1:egret.DisplayObject):egret.Rectangle;
			transform:flash.Transform;
			move(param1:number,param2:number);
			loaderInfo:flash.LoaderInfo;
			root:egret.DisplayObject;
			hitTestObject(param1:egret.DisplayObject):boolean;
			x:number;
			y:number;
			filters:Array<any>;
			stage:egret.Stage;
		}
	}
}

flash.extendsClass("mx.core.IFlexDisplayObject","egret.IEventDispatcher")
