class Grenade extends PhysicsObject{
  boolean floored;
  int timer;
  int exp;
  boolean explode;
  Grenade(PVector pos, PImage img, PVector vel, float grav){
    super(pos,img,vel,grav);
    exp = 60;
    explode = false;
  }
  
  void grenadeMethod(){
   println("grenade: " + pos.toString()); 
  }
  
  void update(float delta){
    timer ++;
    explode = timer>exp;
    super.update(delta);
     if(vel.x != 0 && floored){
       vel.x -= 0.1*vel.x/abs(vel.x);
     }
     if(abs(this.vel.x) < 0.01){
      this.vel.x = 0; 
     }
   floored = false;
  }
  void collision(Dirt dirt){
   /*
   AABB solution
   */
   //println("hit");
   this.pos.y = dirt.pos.y-6;
   this.vel.y = 0;
   floored = true;
 }
 void blow(HashMap<String, Dirt> dMap,ArrayList<DisplayObject> map){
   removeMap(0,0,dMap,map);
   removeMap(1,0,dMap,map);
   removeMap(1,1,dMap,map);
   removeMap(1,-1,dMap,map);
   removeMap(-1,0,dMap,map);
   removeMap(-1,1,dMap,map);
   removeMap(-1,-1,dMap,map);
   removeMap(0,1,dMap,map);
   removeMap(0,-1,dMap,map);
   map.remove(this);
 }
 void removeMap(int i, int k, HashMap<String, Dirt> dMap,ArrayList<DisplayObject> map){
   String key = int(this.pos.x/15)+i + " " + int((this.pos.y/15)+k);
   map.remove(dMap.get(key));
   dMap.remove(key);
 }
}