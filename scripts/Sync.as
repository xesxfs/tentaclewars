package
{
   public class Sync
   {
       
      
      private var var_135:Number = 0;
      
      private var var_378:Number = 0;
      
      public function Sync(step:Number)
      {
         super();
         this.var_378 = step;
         this.var_135 = Math.random() * Math.PI * 2;
      }
      
      public function get phase() : Number
      {
         return this.var_135;
      }
      
      public function tick() : void
      {
         this.var_135 = this.var_135 + this.var_378;
         §§push(true);
         if(this.var_135 > Math.PI * 2)
         {
            this.var_135.var_135 = true;
            §§push(this);
         }
      }
   }
}
