//////////////////////////////////////////////////////////////////////////////////////
//
//  Copyright (c) 2014-present, Egret Technology.
//  All rights reserved.
//  Redistribution and use in source and binary forms, with or without
//  modification, are permitted provided that the following conditions are met:
//
//     * Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in the
//       documentation and/or other materials provided with the distribution.
//     * Neither the name of the Egret nor the
//       names of its contributors may be used to endorse or promote products
//       derived from this software without specific prior written permission.
//
//  THIS SOFTWARE IS PROVIDED BY EGRET AND CONTRIBUTORS "AS IS" AND ANY EXPRESS
//  OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
//  OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
//  IN NO EVENT SHALL EGRET AND CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
//  INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
//  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;LOSS OF USE, DATA,
//  OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
//  LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
//  NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
//  EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//
//////////////////////////////////////////////////////////////////////////////////////

class Main extends eui.UILayer {


    protected createChildren(): void {
        super.createChildren();

        egret.lifecycle.addLifecycleListener((context) => {
            // custom lifecycle plugin
        })

        egret.lifecycle.onPause = () => {
            egret.ticker.pause();
        }

        egret.lifecycle.onResume = () => {
            egret.ticker.resume();
        }

        //inject the custom material parser
        //注入自定义的素材解析器
        let assetAdapter = new AssetAdapter();
        egret.registerImplementation("eui.IAssetAdapter", assetAdapter);
        egret.registerImplementation("eui.IThemeAdapter", new ThemeAdapter());


        this.runGame().catch(e => {
            console.log(e);
        })
    }

    private async runGame() {
        await this.loadResource()
        this.createGameScene();
        await platform.login();
        const userInfo = await platform.getUserInfo();
        console.log(userInfo);

    }

    private async loadResource() {
        try {
            const loadingView = new LoadingUI();
            this.stage.addChild(loadingView);
            await RES.loadConfig("resource/default.res.json", "resource/");
            await this.loadTheme();
            await RES.loadGroup("preload", 0, loadingView);
            this.stage.removeChild(loadingView);
        }
        catch (e) {
            console.error(e);
        }
    }

    private loadTheme() {
        return new Promise((resolve, reject) => {
            // load skin theme configuration file, you can manually modify the file. And replace the default skin.
            //加载皮肤主题配置文件,可以手动修改这个文件。替换默认皮肤。
            let theme = new eui.Theme("resource/default.thm.json", this.stage);
            theme.addEventListener(eui.UIEvent.COMPLETE, () => {
                resolve();
            }, this);

        })
    }

    private textfield: egret.TextField;
    /**
     * 创建场景界面
     * Create scene interface
     */


    protected createGameScene(): void {
        // this.creteShare();
        // this.addChild(new Rendril2());
        this.createLevelsMenu();
        // let tendril = new Game.Tendril(Game.Tendril.TYPE_WITHOUT_SPOT, 0, 0, 100, 30);
        // this.addChild(tendril);
        // tendril.x = this.stage.stageWidth / 2;
        // tendril.y = this.stage.stageHeight / 2;
    }
    public step: number = Math.PI / 5 / 20;
    public ang = -Math.PI / 10;
    public angOffsize = Math.PI / 4;
    public lineShare: egret.Shape;
    public creteShare() {
        var lineSprite = new egret.Shape();
        lineSprite.graphics.lineStyle(2, 0x000000);
        let bX = this.stage.stageWidth / 2;
        let bY = this.stage.stageHeight / 2;
        lineSprite.x = bX;
        lineSprite.y = bY;
        // lineSprite.graphics.moveTo(bX, bY);
        // let r = 100;

        // let midX = bX + r / 2;
        // let midY = bY;

        // let endX = Math.cos(this.ang) * r + bX;
        // let endY = Math.sin(this.ang) * r + bY;

        // lineSprite.graphics.curveTo(midX, midY, endX, endY);
        // lineSprite.graphics.lineTo(endX, endY);
        this.addChild(lineSprite);
        this.lineShare = lineSprite;
        // egret.setInterval(this.tick, this, 50);
        this.addEventListener(egret.Event.ENTER_FRAME, this.tick, this);
        // this.tick();
        // lineSprite.rotation = 20;

    }

    public tick() {
        let g = this.lineShare.graphics;
        g.clear();
        g.lineStyle(2, 0xFFFFFF);
        this.ang += this.step;
        let bX = 0;
        let bY = 0;
        g.moveTo(bX, bY);
        let r = 50;

        let midX = Math.cos(this.angOffsize) * r / 2;
        let midY = Math.sin(this.angOffsize) * r / 2;

        let endX = Math.cos(this.ang + this.angOffsize) * r + bX;
        let endY = Math.sin(this.ang + this.angOffsize) * r + bY;
        g.curveTo(midX, midY, endX, endY);
        // g.lineTo(endX, endY);

        g.beginFill(0x000000)
        g.drawCircle(endX, endY, 5);
        g.endFill();

        if (this.ang < -Math.PI / 10 || this.ang > Math.PI / 10) {
            this.step = -this.step;
        }
        this.addChild(this.lineShare);

    }

    public createLevelsMenu() {
        var levelsNum: number = 20;
        var i = 0;
        var m_openLevel = 2;
        let rendir: Rendril2;
        while (i < levelsNum) {
            var ang: number = 0;
            var open: boolean = false;
            var r2: number = 0;
            var g2: egret.Graphics = null;
            var color: number = 0xffff00;
            var dialog: egret.Sprite = new egret.Sprite();
            var top: egret.Sprite = new egret.Sprite();
            dialog.addChild(top);
            var g: egret.Graphics = top.graphics;
            var r: number = 140;

            var step: number = Math.PI * 2 / levelsNum;
            var x: number = this.stage.stageWidth / 2;
            var y = this.stage.stageHeight / 2;

            ang = i * step - Math.PI / 2;
            open = i < m_openLevel;
            r2 = !!open ? (r + 80) : (r + 55);
            g.lineStyle(2, 0x00ff00);
            g.moveTo(Math.cos(ang) * r + x, Math.sin(ang) * r + y);
            g.lineTo(Math.cos(ang) * r2 + x, Math.sin(ang) * r2 + y);

            var but: egret.Sprite = new egret.Sprite();
            but.x = Math.cos(ang) * (r2 + 15) + x;
            but.y = Math.sin(ang) * (r2 + 15) + y;
            but.name = !!open ? String(i) : String(-1);
            g2 = but.graphics;
            if (i + 1 == m_openLevel) {
                color = 0xFFFFFF;
            }
            g2.beginFill(color, 0.5);
            g2.drawCircle(0, 0, 15);
            g2.endFill();

            rendir = new Rendril2();
            rendir.angOffsize = ang;
            rendir.x = Math.cos(ang)  + x;
            rendir.y = Math.sin(ang)  + y;

            dialog.addChild(rendir);
            dialog.addChild(but);
            this.addChild(dialog);
            i++;
        }
    }

    public createTextSpite():eui.Image|eui.Label|eui.Group {
        return
    }

    // public createText(str: String, size: int, color: uint, alpha: Number = 1, outline: Boolean = false, outlineColor: uint = 16777215, fontName: String = "default", isCentered: Boolean = true): TextSprite {
    //     return new TextSprite(str, size, color, alpha, outline, outlineColor, fontName, isCentered);
    // }
    /**
     * 根据name关键字创建一个Bitmap对象。name属性请参考resources/resource.json配置文件的内容。
     * Create a Bitmap object according to name keyword.As for the property of name please refer to the configuration file of resources/resource.json.
     */

}
