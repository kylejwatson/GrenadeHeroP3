class Player extends PhysicsObject{
 boolean floored;
 float jump;
 float walkspeed;
 PImage grenImg;
 PImage aimImg;
 
 Player(PVector pos, PVector vel, PImage img, float gravity){
   super(pos,img,vel,gravity);
   grenImg =  loadImage("gren.png");
   aimImg =  loadImage("aim.png");
   floored = false;
   jump = 5;
   walkspeed = 2;
 }
 
 void draw(){
   super.draw();
    float angle = atan2(mouseX-this.pos.x, mouseY-this.pos.y);
    PVector newVel = new PVector(sin(angle),cos(angle));
    newVel.mult(30);
    newVel.add(this.pos);
   image(aimImg,newVel.x,newVel.y);
 }
 
 void update(float delta, int a, int d, int w){
   super.update(delta);
   if(floored){
     if(w==1){
       this.pos.y -= 5;
       this.vel.y = -jump;
     }
   if(vel.x != 0){
     vel.x -= 0.1*vel.x/abs(vel.x);
   }
   }
   vel.x += walkspeed*(d - a);
   
   if(abs(this.vel.x) < 0.01){
    this.vel.x = 0; 
   }else if(this.vel.x > walkspeed*2){
     this.vel.x = walkspeed*2;
   }else if(this.vel.x < -walkspeed*2){
    this.vel.x = -walkspeed*2; 
   }
   floored = false;
 }
 
 void collision(Dirt dirt){
   /*
   AABB solution
   */
   floored = true;
   //println("hit");
   this.pos.y = dirt.pos.y-30;
   this.vel.y = 0;
 }
  void throwNade(ArrayList<DisplayObject> map){
    float angle = atan2(mouseX-this.pos.x, mouseY-this.pos.y);
    PVector newVel = new PVector(sin(angle),cos(angle));
    newVel.mult(6);
    newVel.add(this.vel);
    
    map.add(new Grenade(new PVector(this.pos.x,this.pos.y),grenImg, newVel,gravity));
  }
}