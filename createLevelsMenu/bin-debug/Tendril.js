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
var Game;
(function (Game) {
    var Tendril = (function (_super) {
        __extends(Tendril, _super);
        function Tendril(type, baseRadius, angle, size, moveSize, moveOffset, moveDir, sync) {
            if (moveOffset === void 0) { moveOffset = 0; }
            if (moveDir === void 0) { moveDir = false; }
            if (sync === void 0) { sync = null; }
            var _this = _super.call(this, baseRadius, angle) || this;
            _this.moveDir = 1;
            _this.moveSize = 0;
            _this.type = 0;
            _this.sync = null;
            _this.color = 16777215;
            _this.size = 0;
            _this.moveOffset = 0;
            _this.isSync = false;
            _this.isSync = sync == null ? true : false;
            _this.type = type;
            _this.size = size;
            _this.moveSize = moveSize;
            _this.moveOffset = moveOffset;
            _this.moveDir = !!moveDir ? (1) : (-1);
            _this.addEventListener(egret.Event.ENTER_FRAME, _this.onEnterFrame, _this);
            return _this;
        }
        Tendril.prototype.setColor = function (color) {
            this.color = color;
        };
        Tendril.prototype.setSize = function (size) {
            this.size = size;
        };
        Tendril.prototype.method_57 = function () {
            var g = this.graphics;
            var centerRadius = this.radius + this.size / 2;
            var endRadius = this.radius + this.size;
            var endAngle = this.angle + this.moveDir * this.moveSize * (this.moveOffset);
            var beginX = Math.cos(this.angle) * this.radius;
            var midX = Math.cos(this.angle) * centerRadius;
            var midY = Math.sin(this.angle) * centerRadius;
            var endX = Math.cos(endAngle) * endRadius;
            var endY = Math.sin(endAngle) * endRadius;
            g.clear();
            g.lineStyle(10, Tendril.OUTLINE_COLOR);
            g.moveTo(beginX, 0);
            g.curveTo(midX, midY, endX, endY);
            // §§push(true);
            // §§push(Math.sin(this.angle) * this.radius);
            if (this.type == Tendril.TYPE_WITH_SPOT) {
                g.lineStyle(1, Tendril.OUTLINE_COLOR);
                g.beginFill(this.color);
                g.drawCircle(endX, endY, 3);
                g.endFill();
            }
        };
        Tendril.prototype.onEnterFrame = function (event) {
            // if (this.isSync) {
            // 	// §§push(true);
            // 	this.isSync = !this.isSync;
            // }
            this.angle += 1 * this.moveDir;
            if (this.angle <= -15 || this.angle >= 15) {
                this.moveDir = -this.moveDir;
            }
            // this.moveDir = -this.moveDir;
            this.method_57();
        };
        Tendril.prototype.destruct = function () {
            _super.prototype.destruct.call(this);
        };
        Tendril.TYPE_WITH_SPOT = 1;
        Tendril.TYPE_WITHOUT_SPOT = 0;
        Tendril.OUTLINE_COLOR = 0x000000;
        return Tendril;
    }(Game.Node));
    Game.Tendril = Tendril;
    __reflect(Tendril.prototype, "Game.Tendril");
})(Game || (Game = {}));
//# sourceMappingURL=Tendril.js.map