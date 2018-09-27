 class TypingText extends TextSprite {
	private var_223:number = 0;
	private var_300:string = null;
	private var_178:number = 0;

	public constructor(str:string,size:number,color:number)
	{
		super(">",size,color,1,false,16777215,"translate");
		size = flash.checkInt(size);
		color = flash.checkUint(color);
		this.var_300 = str;
		addEventListener(egret.Event.ENTER_FRAME,flash.bind(this.onEnterFrame,this));
	}

	private onEnterFrame(event:egret.Event)
	{
	}

	public destruct()
	{
	}

}

flash.extendsClass("TypingText","TextSprite")
