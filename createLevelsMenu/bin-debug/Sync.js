var __reflect = (this && this.__reflect) || function (p, c, t) {
    p.__class__ = c, t ? t.push(c) : t = [c], p.__types__ = p.__types__ ? t.concat(p.__types__) : t;
};
var Game;
(function (Game) {
    var Sync = (function () {
        function Sync(step) {
            this._phase = 0;
            this.step = 0;
            this.step = step;
            this._phase = Math.random() * Math.PI * 2;
        }
        Object.defineProperty(Sync.prototype, "phase", {
            get: function () {
                return this._phase;
            },
            enumerable: true,
            configurable: true
        });
        Sync.prototype.tick = function () {
            this._phase = this._phase + this.step;
            // §§push(true);
            if (this._phase > Math.PI * 2) {
                // this._phase.var_135 = true;
                // §§push(this);
            }
        };
        return Sync;
    }());
    Game.Sync = Sync;
    __reflect(Sync.prototype, "Game.Sync");
})(Game || (Game = {}));
//# sourceMappingURL=Sync.js.map