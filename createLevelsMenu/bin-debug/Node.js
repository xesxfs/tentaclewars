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
    var Node = (function (_super) {
        __extends(Node, _super);
        function Node(baseRadius, baseAngle) {
            var _this = _super.call(this) || this;
            _this.angle = 0;
            _this.radius = 0;
            _this.children = null;
            _this.mouseEnabled = true;
            _this.radius = baseRadius;
            _this.angle = baseAngle * Math.PI / 180;
            _this.children = new Array();
            _this.mouseEnabled = false;
            return _this;
        }
        Node.prototype.method_153 = function (radius) {
            for (var child = null, i = 0; i < this.children.length;) {
                child = this.children[i];
                child.node.setBaseRadius(radius + child.baseRadiusOffset);
                i++;
            }
        };
        Node.prototype.onEnterFrame = function (event) {
        };
        Node.prototype.destruct = function () {
            this.graphics.clear();
            if (this.children.length > 0) {
                this.children = [];
            }
        };
        Node.prototype.setBaseRadius = function (radius) {
        };
        Node.prototype.addChildNode = function (node, baseRadiusOffset) {
            if (baseRadiusOffset === void 0) { baseRadiusOffset = 0; }
        };
        return Node;
    }(egret.Sprite));
    Game.Node = Node;
    __reflect(Node.prototype, "Game.Node");
    var NodeChild = (function () {
        function NodeChild() {
        }
        NodeChild.prototype.NodeChild = function (node, baseRadiusOffset) {
            this.node = node;
            this.baseRadiusOffset = baseRadiusOffset;
        };
        return NodeChild;
    }());
    __reflect(NodeChild.prototype, "NodeChild");
})(Game || (Game = {}));
//# sourceMappingURL=Node.js.map