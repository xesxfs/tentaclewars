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
var Rendril2 = (function (_super) {
    __extends(Rendril2, _super);
    function Rendril2() {
        var _this = _super.call(this) || this;
        _this.step = Math.PI / 5 / 20;
        _this.ang = -Math.PI / 10;
        _this.angOffsize = Math.PI / 4;
        _this.r = 50;
        _this.addEventListener(egret.Event.ENTER_FRAME, _this.tick, _this);
        return _this;
        // egret.setInterval(this.tick,this,50);
    }
    Rendril2.prototype.tick = function () {
        var g = this.graphics;
        g.clear();
        g.lineStyle(2, 0xFFFFFF);
        this.ang += this.step;
        var bX = 0;
        var bY = 0;
        g.moveTo(bX, bY);
        var r = this.r;
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
    };
    return Rendril2;
}(egret.Sprite));
__reflect(Rendril2.prototype, "Rendril2");
//# sourceMappingURL=Rendril2.js.map