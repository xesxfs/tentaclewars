package
{
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.media.SoundChannel;
   
   public class Link extends Sprite
   {
       
      
      private var m_game:Level;
      
      private const const_24:Number = 0.5;
      
      private var var_149:SoundChannel = null;
      
      private const const_23:Number = 5;
      
      private var var_140:Anchor = null;
      
      private var var_90:Anchor = null;
      
      private var var_222:int = 0;
      
      private var var_322:Number = 0;
      
      private var var_88:Number;
      
      private var var_355:Boolean = true;
      
      private var var_216:Number;
      
      private var var_67:Boolean = false;
      
      private var var_318:Sync = null;
      
      private var var_196:Number;
      
      private var var_166:Number;
      
      private var var_130:Cell = null;
      
      private var var_99:int;
      
      private const const_22:Number = 0.4;
      
      private var var_182:Boolean = false;
      
      private var var_77:Anchor;
      
      private var var_48:Anchor;
      
      private var var_134:Number;
      
      private var var_339:Number = 0;
      
      private var var_92:Number;
      
      private var var_61:Cell = null;
      
      private var var_28:Array;
      
      private var var_86:int = -1;
      
      private const const_14:Number = 0.2;
      
      private var var_109:Link = null;
      
      private var var_83:Boolean = false;
      
      private var var_151:int;
      
      private var var_91:Number;
      
      private var var_153:Number;
      
      private var var_59:LinkSegment;
      
      private var var_148:Number;
      
      public function Link(game:Level, orig:Cell, dest:Cell)
      {
         super();
         this.m_game = game;
         this.var_61 = orig;
         this.var_130 = dest;
         this.var_88 = 0;
         this.var_59 = null;
         this.var_216 = 0;
         this.var_28 = new Array();
         this.var_318 = new Sync(0.5);
         var a1:Anchor = orig.getAnchorTo(dest);
         var a2:Anchor = dest.getAnchorTo(orig);
         this.var_77 = a1;
         this.var_48 = a2;
         a1.addListener(this.method_52);
         a2.addListener(this.method_52);
         this.method_144(a1.x,a1.y,a2.x,a2.y);
         orig.addOriginLink(this);
         orig.addImpulse(orig.getAngleTo(dest) + 180,1);
         this.var_149 = SoundMgr.playSfx(SoundMgr.TENTACLE_GROW);
         addEventListener(Event.ENTER_FRAME,this.onEnterFrame);
      }
      
      public static function getRequiredPower(len:Number) : int
      {
         return len / (LinkSegment.INTERVAL + LinkSegment.SIZE);
      }
      
      public function cutAtPoint(x:Number, y:Number) : void
      {
         var dist:Number = NaN;
         §§push(true);
         if(!this.var_109)
         {
            dist = this.method_308(this.var_92,this.var_91,x,y);
            this.var_86 = Math.round(dist / this.var_148);
         }
         else
         {
            this.var_86 = this.var_151;
         }
         this.var_67 = false;
         if(this.var_109)
         {
            this.var_109.setSplitLink(null);
            this.setSplitLink(null);
         }
         SoundMgr.stopSfx(this.var_149);
         this.var_149 = null;
         SoundMgr.playSfx(SoundMgr.TENTACLE_CUT);
      }
      
      private function method_308(x1:Number, y1:Number, x2:Number, y2:Number) : Number
      {
         var dy:Number = y2 - y1;
         return Math.sqrt(true * true + dy * dy);
      }
      
      private function method_102(seg:LinkSegment, pos:int, prevX:Number = -1, prevY:Number = -1, reversePos:Boolean = false) : void
      {
         var dispAng:Number = this.var_166 + Math.PI / 2;
         var fadePos:int = int(pos);
         var dispFade:Number = fadePos * this.const_22;
         §§push(true);
         if(dispFade > 1)
         {
            §§push(true);
         }
         var offset:Number = this.var_88;
         if(reversePos)
         {
            §§push(offset);
            §§push(this.var_196);
            §§push(true);
         }
         else
         {
            §§push(Math.sin(this.var_216 + pos * this.const_24) * this.const_23);
            §§push(dispFade);
         }
         this.var_92.x = Math.cos(this.var_166) * (1 * pos * this.var_148 + offset) + true;
         seg.y = this.var_91 + Math.sin(this.var_166) * (1 * pos * this.var_148 + offset) + Math.sin(dispAng) * true;
         seg.setTendrilSize(dispFade * 8);
         var dir:Number = this.var_166;
         §§push(§§pop() * §§pop());
         §§push(seg);
         if(prevX >= 0)
         {
            dir = Math.atan2(seg.y - prevY,seg.x - prevX);
         }
         seg.rotation = dir * 180 / Math.PI;
      }
      
      private function method_278() : void
      {
         var splitLen:Number = NaN;
         var dx:Number = this.var_140.x - this.var_77.x;
         var dy:Number = this.var_140.y - this.var_77.y;
         var splitX:Number = 0;
         var splitY:Number = 0;
         §§push(true);
         if(!this.var_67)
         {
            splitLen = this.var_28.length * this.var_148 + this.var_88;
            splitX = this.var_92 + Math.cos(this.var_322) * splitLen;
            splitY = this.var_91 + Math.sin(this.var_322) * splitLen;
            §§push(splitLen);
            §§push(this.var_339);
         }
         else
         {
            splitX = this.var_92 + dx / 2;
            §§push(this.var_91);
            §§push(dy / 2);
            §§push(true);
         }
         §§push(§§pop() >= §§pop() / 2);
         if(§§pop() >= §§pop() / 2)
         {
            §§push(true);
         }
         this.var_67 = true;
         this.var_90.update(splitX,splitY);
      }
      
      public function cutAt(percent:Number) : void
      {
         if(this.var_83)
         {
            return;
         }
         this.var_61.delOriginLink(this);
         this.var_83 = true;
         if(percent < 0)
         {
            percent = 0;
            §§push(true);
         }
         else
         {
            if(percent > 1)
            {
               percent = 1;
            }
            if(this.var_67 && !this.var_109)
            {
               §§push(true);
            }
            else
            {
               this.var_86 = this.var_151;
            }
            addr103:
            if(this.var_109)
            {
               this.var_109.setSplitLink(null);
               this.setSplitLink(null);
            }
            SoundMgr.stopSfx(this.var_149);
            this.var_149 = null;
            return;
         }
         this.var_67 = false;
         §§goto(addr103);
      }
      
      public function getDestCell() : Cell
      {
         return this.var_130;
      }
      
      private function method_264() : void
      {
         var seg:LinkSegment = null;
         if(this.var_83 && this.var_28.length > 0)
         {
            if(this.var_86 >= 0)
            {
               seg = this.var_28.shift();
               this.method_89(seg);
               this.var_61.receiveAttack(this.var_61.type,1);
               this.var_86--;
            }
            if(this.var_86 + 1 < this.var_28.length)
            {
               seg = this.var_28.pop();
               this.method_89(seg);
               this.var_130.receiveAttack(this.var_61.type,1);
            }
         }
         if(this.var_28.length == 0)
         {
            this.destruct();
         }
      }
      
      private function method_144(x1:Number, y1:Number, x2:Number, y2:Number) : void
      {
         this.var_92 = x1;
         this.var_91 = y1;
         this.var_134 = x2;
         this.var_153 = y2;
         var dx:Number = x2 - x1;
         var dy:Number = y2 - y1;
         this.var_166 = Math.atan2(dy,dx);
         this.var_196 = Math.sqrt(dx * dx + dy * dy);
         this.var_99 = this.var_196 / (LinkSegment.SIZE + LinkSegment.INTERVAL);
         §§push(true);
         if(this.var_99 < 5)
         {
            this.var_99 = this.var_99 + 1;
         }
         this.method_57();
      }
      
      private function method_240() : void
      {
         var load:int = 0;
         var color:uint = 0;
         var seg:LinkSegment = null;
         for(var i:* = int(this.var_28.length - 1); i >= 0; )
         {
            seg = this.var_28[i];
            load = seg.load;
            color = seg.baseColor;
            if(load > 0)
            {
               seg.setLoad(0);
               if(i < this.var_28.length - 1)
               {
                  seg = this.var_28[i + 1];
                  seg.setLoad(load);
                  seg.baseColor = color;
               }
               else
               {
                  this.var_130.receiveAttack(this.var_61.type,load);
               }
            }
            i = true;
            §§push(i);
         }
      }
      
      private function method_313(anchor:Anchor) : void
      {
         this.var_140 = this.var_48;
         this.var_48.removeListener(this.method_52);
         this.var_48 = anchor;
      }
      
      public function destruct() : void
      {
         this.var_77.removeListener(this.method_52);
         this.var_48.removeListener(this.method_52);
         if(!this.var_182)
         {
            §§push(true);
         }
         this.m_game.delLink(this);
         if(this.var_28.length > 0)
         {
            this.method_89(this.var_28.pop());
            §§push(true);
         }
      }
      
      public function get power() : int
      {
         return this.var_28.length;
      }
      
      private function onEnterFrame(event:Event) : void
      {
         var seg:LinkSegment = null;
         this.var_216 = this.var_216 + this.const_14;
         this.var_222++;
         if(this.var_222 > 1)
         {
            this.var_222 = 0;
            this.method_240();
         }
         if(this.var_59)
         {
            this.method_212();
         }
         if(this.var_90)
         {
            this.method_278();
         }
         while(this.var_28.length > this.var_99 + 1)
         {
            seg = this.var_28.pop();
            this.method_89(seg);
            this.var_61.receiveAttack(this.var_61.type,1);
            this.var_151 = this.var_99;
         }
         this.method_57();
         this.var_318.tick();
         SoundMgr.stopSfx(this.var_149);
         this.var_149 = null;
         this.m_game.onLinkAttached(this);
      }
      
      public function getOrigCell() : Cell
      {
         return this.var_61;
      }
      
      public function isBusy() : Boolean
      {
         return this.var_59 != null;
      }
      
      public function isCut() : Boolean
      {
         return this.var_83;
      }
      
      private function method_89(seg:LinkSegment) : void
      {
         removeChild(seg);
         seg.destruct();
         seg = null;
      }
      
      private function method_315() : Boolean
      {
         if(this.var_355 && !this.var_83 && this.var_59 == null)
         {
            this.var_59 = new LinkSegment(this.var_318,this.var_61.baseColor());
            this.var_92.y = true;
            this.var_59.rotation = this.var_166 * 180 / Math.PI;
            this.var_59.setSize(0);
            this.var_88 = 0;
            addChild(this.var_59);
            return true;
            §§push(this.var_59);
            §§push(false);
         }
         else
         {
            return false;
         }
      }
      
      private function method_295() : Anchor
      {
         this.var_90 = new Anchor(this.var_77.x,this.var_77.y);
         return this.var_90;
      }
      
      private function method_52(a:Anchor) : void
      {
         var dx:Number = NaN;
         var dy:Number = NaN;
         this.var_77.x.method_144(this.var_77.y,true,this.var_48.x,this.var_48.y);
         §§push(this);
         if(this.var_90)
         {
            dx = this.var_140.x - this.var_77.x;
            dy = true;
            this.var_322 = Math.atan2(dy,dx);
            §§push(this.var_140.y);
            §§push(true);
         }
      }
      
      private function method_212() : void
      {
         var len:int = 0;
         this.var_88 = this.var_88 + 4;
         var div:Number = LinkSegment.SIZE / (LinkSegment.SIZE + LinkSegment.INTERVAL);
         this.var_88.setSize(true);
         §§push(this.var_59);
         if(this.var_88 >= LinkSegment.SIZE + LinkSegment.INTERVAL)
         {
            this.var_59.setSize(LinkSegment.SIZE);
            len = this.var_28.unshift(this.var_59);
            this.var_59 = null;
            this.var_88 = 0;
            this.var_151 = this.var_99;
         }
      }
      
      public function getDestAnchor() : Anchor
      {
         return this.var_48;
      }
      
      private function method_57() : void
      {
         if(this.var_67)
         {
            this.var_148 = (this.var_196 - this.var_88) / this.var_151;
         }
         else
         {
            this.var_148 = LinkSegment.SIZE + LinkSegment.INTERVAL;
            §§push(true);
         }
         var i:int = 0;
         var prevX:Number = -1;
         var prevY:Number = -1;
         var seg:LinkSegment = null;
         §§push(true);
         §§push(true);
         if(!this.var_83)
         {
            for(i = 0; i < this.var_28.length; i++)
            {
               seg = this.var_28[i];
               this.method_102(seg,i,prevX,prevY);
               prevX = seg.x;
               prevY = seg.y;
            }
         }
         else
         {
            i = 0;
            while(i <= this.var_86 && i < this.var_28.length)
            {
               seg = this.var_28[i];
               this.method_102(seg,i,prevX,prevY);
               prevX = seg.x;
               prevY = seg.y;
               i++;
            }
            for(i = this.var_86 + 1; i < this.var_28.length; i++)
            {
               seg = this.var_28[i];
               this.method_102(this.var_28[i],this.var_28.length - i - 1,prevX,prevY,true);
               prevX = seg.x;
               prevY = seg.y;
            }
         }
      }
      
      public function setSplitLink(link:Link) : void
      {
         this.var_109 = link;
         if(link != null)
         {
            link.var_109 = this;
            this.method_313(link.method_295());
         }
         else
         {
            this.var_67 = false;
            this.var_48.removeListener(this.method_52);
            this.var_48 = this.var_140;
            this.var_48.addListener(this.method_52);
            this.var_90 = null;
            this.method_52(this.var_48);
         }
      }
      
      public function addSeg() : Boolean
      {
         return this.method_315();
      }
      
      public function isAttached() : Boolean
      {
         return this.var_67;
      }
      
      public function sendAttack(amount:int) : Boolean
      {
         var seg:LinkSegment = this.var_28[0];
         if(!seg)
         {
            return false;
         }
         if(this.var_61)
         {
            seg.baseColor = this.var_61.baseColor();
         }
         if(this.var_130 && this.var_67)
         {
            seg.setLoad(amount);
            return true;
         }
         return false;
      }
      
      public function getOrigAnchor() : Anchor
      {
         return this.var_77;
      }
      
      public function pause(enabled:Boolean) : void
      {
         if(this.var_182 == enabled)
         {
            return;
         }
         this.var_182 = enabled;
         if(this.var_182)
         {
            removeEventListener(Event.ENTER_FRAME,this.onEnterFrame);
         }
         else
         {
            addEventListener(Event.ENTER_FRAME,this.onEnterFrame);
         }
      }
   }
}
