package
{
   public class Anchor
   {
       
      
      private var var_298:Number = 0;
      
      private var var_328:Number = 0;
      
      private var var_145:Array = null;
      
      public function Anchor(x:Number = 0, y:Number = 0)
      {
         super();
         this.var_298 = x;
         this.var_328 = y;
         this.var_145 = new Array();
      }
      
      public function get x() : Number
      {
         return this.var_298;
      }
      
      public function update(x:Number, y:Number) : void
      {
         var func:Function = null;
         this.var_298 = x;
         this.var_328 = y;
         for(var i:uint = 0; i < this.var_145.length; i++)
         {
            func = this.var_145[i];
            func(this);
         }
      }
      
      public function addListener(func:Function) : void
      {
         this.removeListener(func);
         this.var_145.push(func);
      }
      
      public function removeListener(func:Function) : void
      {
         while(§§pop() < this.var_145.length)
         {
            if(this.var_145[0] == func)
            {
               this.var_145.splice(0,1);
            }
            §§push(uint(0 + 1));
            §§push(true);
         }
      }
      
      public function get y() : Number
      {
         return this.var_328;
      }
   }
}
