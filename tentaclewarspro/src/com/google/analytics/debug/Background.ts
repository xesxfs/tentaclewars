module com {
	export module google {
		export module analytics {
			export module debug {
				export class Background extends egret.HashObject {

					public constructor()
					{
						super();
						super();
					}

					public static drawRounded(target:any,g:egret.Graphics,width:number = 0,height:number = 0)
					{
						var W:number = flash.checkUint(0);
						var H:number = flash.checkUint(0);
						var R:number = flash.checkUint(Style.roundedCorner);
						if(width > 0 && height > 0)
						{
							W = flash.checkUint(width);
							H = flash.checkUint(height);
						}
						else
						{
							W = flash.checkUint(target.width);
							H = flash.checkUint(target.height);
						}
						if(target.stickToEdge && target.alignement != com.google.analytics.debug.Align.none)
						{
							switch(target.alignement)
							{
							case com.google.analytics.debug.Align.top :
								g["drawRoundRectComplex"](0,0,W,H,0,0,R,R);
								break;
							case com.google.analytics.debug.Align.topLeft :
								g["drawRoundRectComplex"](0,0,W,H,0,0,0,R);
								break;
							case com.google.analytics.debug.Align.topRight :
								g["drawRoundRectComplex"](0,0,W,H,0,0,R,0);
								break;
							case com.google.analytics.debug.Align.bottom :
								g["drawRoundRectComplex"](0,0,W,H,R,R,0,0);
								break;
							case com.google.analytics.debug.Align.bottomLeft :
								g["drawRoundRectComplex"](0,0,W,H,0,R,0,0);
								break;
							case com.google.analytics.debug.Align.bottomRight :
								g["drawRoundRectComplex"](0,0,W,H,R,0,0,0);
								break;
							case com.google.analytics.debug.Align.left :
								g["drawRoundRectComplex"](0,0,W,H,0,R,0,R);
								break;
							case com.google.analytics.debug.Align.right :
								g["drawRoundRectComplex"](0,0,W,H,R,0,R,0);
								break;
							case com.google.analytics.debug.Align.center :
								g.drawRoundRect(0,0,W,H,R,R);
							}
						}
						else
						{
							g.drawRoundRect(0,0,W,H,R,R);
						}
					}

				}
			}
		}
	}
}

