module com {
	export module gamezhero {
		export module api {
			export module as3 {
				export module gui {
					export class Background extends egret.SwfMovie {
						private var_63:egret.SwfMovie;
						private var_291:egret.SwfMovie;

						public constructor(g:egret.SwfMovie)
						{
							super();
							this.var_63 = g;
							this.var_63.addChild(this);
							this.ini();
							this.method_14();
						}

						public remove()
						{
						}

						private method_30()
						{
						}

						public update(w:number,h:number)
						{
							this.x = 0;
							this.y = 0;
							this.width = w + 100;
							this.height = h + 100;
						}

						private method_206():egret.SwfMovie
						{
							var mc:egret.SwfMovie = new egret.SwfMovie();
							mc.graphics.beginFill(0,1);
							mc.graphics.lineStyle(0,0,0);
							mc.graphics.moveTo(0,0);
							mc.graphics.lineTo(1000,0);
							mc.graphics.lineTo(1000,1000);
							mc.graphics.lineTo(0,1000);
							mc.graphics.lineTo(0,0);
							mc.graphics.endFill();
							return mc;
						}

						private ini()
						{
						}

						private method_14()
						{
						}

					}
				}
			}
		}
	}
}

flash.extendsClass("com.gamezhero.api.as3.gui.Background","egret.SwfMovie")
