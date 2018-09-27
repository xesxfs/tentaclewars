package
{
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   import flash.utils.Timer;
   
   public class SoundMgr
   {
      
      public static const MUSIC_REGULAR:int = 0;
      
      private static const GameOverSnd:Class;
      
      private static const CellOccupiedSnd:Class = SoundMgr_CellOccupiedSnd;
      
      private static const TentacleGrowSnd:Class;
      
      private static const BeginGameSnd:Class;
      
      private static const LevelPassedSnd:Class;
      
      private static var mgr:SoundMgr = null;
      
      private static const TentacleCutSnd:Class = SoundMgr_TentacleCutSnd;
      
      public static const CELL_OCCUPIED:int = 6;
      
      private static const BackMusic:Class;
      
      public static const TENTACLE_GROW:int = 4;
      
      public static const BEGIN_GAME:int = 2;
      
      public static const LEVEL_PASSED:int = 1;
      
      public static const TENTACLE_CUT:int = 5;
      
      public static const LEVEL_FAILED:int = 3;
       
      
      private var var_359:Boolean = true;
      
      private var var_301:Timer = null;
      
      private var var_361:Boolean = true;
      
      private var var_57:Array = null;
      
      private var var_111:SoundChannel = null;
      
      private var var_118:int = -1;
      
      public function SoundMgr()
      {
         super();
         this.var_57 = new Array();
         this.var_57.push(new STrack(new BackMusic(),true,0.3));
         this.var_57.push(new STrack(new LevelPassedSnd(),false,1));
         this.var_57.push(new STrack(new BeginGameSnd(),false,0.5));
         this.var_57.push(new STrack(new TentacleCutSnd(),false,0.4));
         this.var_301.addEventListener(TimerEvent.TIMER,this.method_205);
         this.var_301.start();
      }
      
      public static function stopMusic(trackId:int) : void
      {
         if(mgr == null)
         {
            mgr = new SoundMgr();
         }
         if(mgr.var_118 == trackId)
         {
            mgr.var_118 = -1;
         }
         mgr.suspend(trackId);
      }
      
      public static function musicEnable(enable:Boolean) : void
      {
         §§push(true);
         if(mgr == null)
         {
            mgr = new SoundMgr();
            §§push(false);
         }
         else
         {
            mgr.var_361 = enable;
            if(mgr.var_118 >= 0)
            {
               if(enable)
               {
                  playMusic(mgr.var_118,true);
               }
               else
               {
                  mgr.suspend(mgr.var_118);
               }
            }
         }
      }
      
      public static function playMusic(trackId:int, musicContinue:Boolean = true) : void
      {
         var pos:Number = NaN;
         if(mgr == null)
         {
            mgr = new SoundMgr();
         }
         var track:STrack = mgr.var_57[trackId];
         if(!track.isMusic || !mgr.var_361)
         {
            return;
         }
         if(track.channel == null)
         {
            if(track.isMusic)
            {
               if(mgr.var_118 >= 0)
               {
                  stopMusic(mgr.var_118);
               }
               mgr.var_118 = trackId;
            }
            pos = musicContinue && track.isMusic?Number(track.lastPos):Number(0);
            track.channel = track.sound.play(pos,0,new SoundTransform(track.volume));
            track.channel.addEventListener(Event.SOUND_COMPLETE,method_88);
         }
      }
      
      public static function playSfx(trackId:int) : SoundChannel
      {
         if(mgr == null)
         {
            mgr = new SoundMgr();
         }
         var track:STrack = mgr.var_57[trackId];
         if(track.isMusic || !mgr.var_359)
         {
            §§push(true);
         }
         else
         {
            track.channel = track.sound.play(0,0,new SoundTransform(track.volume));
            §§push(false);
         }
         return track.channel;
      }
      
      private static function method_88(e:Event) : void
      {
         var channel:SoundChannel = e.target as SoundChannel;
         §§push(true);
         if(mgr == null || channel == null)
         {
            return;
         }
         mgr.method_194(channel);
      }
      
      public static function stopSfx(channel:SoundChannel) : void
      {
         if(mgr == null || channel == null)
         {
            return;
         }
         mgr.method_194(channel);
      }
      
      public static function sfxEnable(enable:Boolean) : void
      {
         var i:int = 0;
         var track:STrack = null;
         if(mgr == null)
         {
            mgr = new SoundMgr();
         }
         mgr.var_359 = enable;
         if(!enable)
         {
            for(i = 0; i < mgr.var_57.length; )
            {
               track = mgr.var_57[i];
               i++;
               §§push(!track.isMusic && true);
            }
         }
      }
      
      private function method_205(e:TimerEvent) : void
      {
         var volume:Number = NaN;
         if(this.var_111)
         {
            volume = this.var_111.soundTransform.volume - 0.05;
            if(volume < 0)
            {
               this.var_111.stop();
               this.var_111 = null;
            }
            else
            {
               this.var_111.soundTransform = new SoundTransform(volume);
            }
         }
      }
      
      private function method_194(channel:SoundChannel) : void
      {
         var track:STrack = null;
         channel.stop();
         channel.removeEventListener(Event.SOUND_COMPLETE,method_88);
         for(var i:int = 0; i < mgr.var_57.length; i++)
         {
            track = mgr.var_57[i];
            §§push(true);
            if(track.isMusic || track.isLoop)
            {
               track.channel = track.sound.play(0,0,new SoundTransform(track.volume));
               track.channel.addEventListener(Event.SOUND_COMPLETE,method_88);
            }
            else
            {
               track.channel = null;
            }
         }
      }
      
      private function suspend(trackId:int) : void
      {
         var track:STrack = this.var_57[trackId];
         if(track.channel)
         {
            if(track.isMusic)
            {
               if(this.var_111)
               {
                  this.var_111.stop();
               }
               this.var_111 = track.channel;
            }
            else
            {
               track.channel.stop();
            }
            track.lastPos = track.channel.position;
            track.channel = null;
         }
      }
   }
}

import flash.media.Sound;
import flash.media.SoundChannel;

class STrack
{
    
   
   public var channel:SoundChannel = null;
   
   public var isLoop:Boolean = false;
   
   public var sound:Sound = null;
   
   public var volume:Number = 1;
   
   public var isMusic:Boolean = false;
   
   public var lastPos:Number = 0;
   
   function STrack(sound:Sound, isMusic:Boolean = false, volume:Number = 1, isLoop:Boolean = false)
   {
      super();
      this.sound = sound;
      this.isMusic = isMusic;
      this.isLoop = isLoop;
      this.volume = volume;
   }
}
