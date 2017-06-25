class Grenade extends PhysicsObject{
  Grenade(PVector pos, PImage img, PVector vel, float grav){
    super(pos,img,vel,grav);
  }
  
  void grenadeMethod(){
   println("grenade: " + pos.toString()); 
  }
  
  void collision(Dirt dirt){
   /*
   AABB solution
   */
   //println("hit");
   this.pos.y = dirt.pos.y-6;
   this.vel.y = 0;
 }
}