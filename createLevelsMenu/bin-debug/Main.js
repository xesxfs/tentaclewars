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
var __reflect = (this && this.__reflect) || function (p, c, t) {
    p.__class__ = c, t ? t.push(c) : t = [c], p.__types__ = p.__types__ ? t.concat(p.__types__) : t;
};
var __extends = this && this.__extends || function __extends(t, e) { 
 function r() { 
 this.constructor = t;
}
for (var i in e) e.hasOwnProperty(i) && (t[i] = e[i]);
r.prototype = e.prototype, t.prototype = new r();
};
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : new P(function (resolve) { resolve(result.value); }).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __generator = (this && this.__generator) || function (thisArg, body) {
    var _ = { label: 0, sent: function() { if (t[0] & 1) throw t[1]; return t[1]; }, trys: [], ops: [] }, f, y, t, g;
    return g = { next: verb(0), "throw": verb(1), "return": verb(2) }, typeof Symbol === "function" && (g[Symbol.iterator] = function() { return this; }), g;
    function verb(n) { return function (v) { return step([n, v]); }; }
    function step(op) {
        if (f) throw new TypeError("Generator is already executing.");
        while (_) try {
            if (f = 1, y && (t = y[op[0] & 2 ? "return" : op[0] ? "throw" : "next"]) && !(t = t.call(y, op[1])).done) return t;
            if (y = 0, t) op = [0, t.value];
            switch (op[0]) {
                case 0: case 1: t = op; break;
                case 4: _.label++; return { value: op[1], done: false };
                case 5: _.label++; y = op[1]; op = [0]; continue;
                case 7: op = _.ops.pop(); _.trys.pop(); continue;
                default:
                    if (!(t = _.trys, t = t.length > 0 && t[t.length - 1]) && (op[0] === 6 || op[0] === 2)) { _ = 0; continue; }
                    if (op[0] === 3 && (!t || (op[1] > t[0] && op[1] < t[3]))) { _.label = op[1]; break; }
                    if (op[0] === 6 && _.label < t[1]) { _.label = t[1]; t = op; break; }
                    if (t && _.label < t[2]) { _.label = t[2]; _.ops.push(op); break; }
                    if (t[2]) _.ops.pop();
                    _.trys.pop(); continue;
            }
            op = body.call(thisArg, _);
        } catch (e) { op = [6, e]; y = 0; } finally { f = t = 0; }
        if (op[0] & 5) throw op[1]; return { value: op[0] ? op[1] : void 0, done: true };
    }
};
var Main = (function (_super) {
    __extends(Main, _super);
    function Main() {
        var _this = _super !== null && _super.apply(this, arguments) || this;
        _this.step = Math.PI / 5 / 20;
        _this.ang = -Math.PI / 10;
        _this.angOffsize = Math.PI / 4;
        return _this;
        // public createText(str: String, size: int, color: uint, alpha: Number = 1, outline: Boolean = false, outlineColor: uint = 16777215, fontName: String = "default", isCentered: Boolean = true): TextSprite {
        //     return new TextSprite(str, size, color, alpha, outline, outlineColor, fontName, isCentered);
        // }
        /**
         * 根据name关键字创建一个Bitmap对象。name属性请参考resources/resource.json配置文件的内容。
         * Create a Bitmap object according to name keyword.As for the property of name please refer to the configuration file of resources/resource.json.
         */
    }
    Main.prototype.createChildren = function () {
        _super.prototype.createChildren.call(this);
        egret.lifecycle.addLifecycleListener(function (context) {
            // custom lifecycle plugin
        });
        egret.lifecycle.onPause = function () {
            egret.ticker.pause();
        };
        egret.lifecycle.onResume = function () {
            egret.ticker.resume();
        };
        //inject the custom material parser
        //注入自定义的素材解析器
        var assetAdapter = new AssetAdapter();
        egret.registerImplementation("eui.IAssetAdapter", assetAdapter);
        egret.registerImplementation("eui.IThemeAdapter", new ThemeAdapter());
        this.runGame().catch(function (e) {
            console.log(e);
        });
    };
    Main.prototype.runGame = function () {
        return __awaiter(this, void 0, void 0, function () {
            var userInfo;
            return __generator(this, function (_a) {
                switch (_a.label) {
                    case 0: return [4 /*yield*/, this.loadResource()];
                    case 1:
                        _a.sent();
                        this.createGameScene();
                        return [4 /*yield*/, platform.login()];
                    case 2:
                        _a.sent();
                        return [4 /*yield*/, platform.getUserInfo()];
                    case 3:
                        userInfo = _a.sent();
                        console.log(userInfo);
                        return [2 /*return*/];
                }
            });
        });
    };
    Main.prototype.loadResource = function () {
        return __awaiter(this, void 0, void 0, function () {
            var loadingView, e_1;
            return __generator(this, function (_a) {
                switch (_a.label) {
                    case 0:
                        _a.trys.push([0, 4, , 5]);
                        loadingView = new LoadingUI();
                        this.stage.addChild(loadingView);
                        return [4 /*yield*/, RES.loadConfig("resource/default.res.json", "resource/")];
                    case 1:
                        _a.sent();
                        return [4 /*yield*/, this.loadTheme()];
                    case 2:
                        _a.sent();
                        return [4 /*yield*/, RES.loadGroup("preload", 0, loadingView)];
                    case 3:
                        _a.sent();
                        this.stage.removeChild(loadingView);
                        return [3 /*break*/, 5];
                    case 4:
                        e_1 = _a.sent();
                        console.error(e_1);
                        return [3 /*break*/, 5];
                    case 5: return [2 /*return*/];
                }
            });
        });
    };
    Main.prototype.loadTheme = function () {
        var _this = this;
        return new Promise(function (resolve, reject) {
            // load skin theme configuration file, you can manually modify the file. And replace the default skin.
            //加载皮肤主题配置文件,可以手动修改这个文件。替换默认皮肤。
            var theme = new eui.Theme("resource/default.thm.json", _this.stage);
            theme.addEventListener(eui.UIEvent.COMPLETE, function () {
                resolve();
            }, _this);
        });
    };
    /**
     * 创建场景界面
     * Create scene interface
     */
    Main.prototype.createGameScene = function () {
        // this.creteShare();
        // this.addChild(new Rendril2());
        this.createLevelsMenu();
        // let tendril = new Game.Tendril(Game.Tendril.TYPE_WITHOUT_SPOT, 0, 0, 100, 30);
        // this.addChild(tendril);
        // tendril.x = this.stage.stageWidth / 2;
        // tendril.y = this.stage.stageHeight / 2;
    };
    Main.prototype.creteShare = function () {
        var lineSprite = new egret.Shape();
        lineSprite.graphics.lineStyle(2, 0x000000);
        var bX = this.stage.stageWidth / 2;
        var bY = this.stage.stageHeight / 2;
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
    };
    Main.prototype.tick = function () {
        var g = this.lineShare.graphics;
        g.clear();
        g.lineStyle(2, 0xFFFFFF);
        this.ang += this.step;
        var bX = 0;
        var bY = 0;
        g.moveTo(bX, bY);
        var r = 50;
        var midX = Math.cos(this.angOffsize) * r / 2;
        var midY = Math.sin(this.angOffsize) * r / 2;
        var endX = Math.cos(this.ang + this.angOffsize) * r + bX;
        var endY = Math.sin(this.ang + this.angOffsize) * r + bY;
        g.curveTo(midX, midY, endX, endY);
        // g.lineTo(endX, endY);
        g.beginFill(0x000000);
        g.drawCircle(endX, endY, 5);
        g.endFill();
        if (this.ang < -Math.PI / 10 || this.ang > Math.PI / 10) {
            this.step = -this.step;
        }
        this.addChild(this.lineShare);
    };
    Main.prototype.createLevelsMenu = function () {
        var levelsNum = 20;
        var i = 0;
        var m_openLevel = 2;
        var rendir;
        while (i < levelsNum) {
            var ang = 0;
            var open = false;
            var r2 = 0;
            var g2 = null;
            var color = 0xffff00;
            var dialog = new egret.Sprite();
            var top = new egret.Sprite();
            dialog.addChild(top);
            var g = top.graphics;
            var r = 140;
            var step = Math.PI * 2 / levelsNum;
            var x = this.stage.stageWidth / 2;
            var y = this.stage.stageHeight / 2;
            ang = i * step - Math.PI / 2;
            open = i < m_openLevel;
            r2 = !!open ? (r + 80) : (r + 55);
            g.lineStyle(2, 0x00ff00);
            g.moveTo(Math.cos(ang) * r + x, Math.sin(ang) * r + y);
            g.lineTo(Math.cos(ang) * r2 + x, Math.sin(ang) * r2 + y);
            var but = new egret.Sprite();
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
            rendir.x = Math.cos(ang) + x;
            rendir.y = Math.sin(ang) + y;
            dialog.addChild(rendir);
            dialog.addChild(but);
            this.addChild(dialog);
            i++;
        }
    };
    Main.prototype.createTextSpite = function () {
    };
    return Main;
}(eui.UILayer));
__reflect(Main.prototype, "Main");
//# sourceMappingURL=Main.js.map