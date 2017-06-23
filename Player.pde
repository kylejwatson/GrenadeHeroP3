class Player extends PhysicsObject{
 PVector vel;
 float gravity;
 boolean floored;
 float jump;
 float walkspeed;
 
 Player(PVector pos, PVector vel, PImage img, float gravity){
   super(pos,img);
   this.vel = vel;
   this.gravity = gravity;
   floored = false;
   jump = 5;
   walkspeed = 2;
 }
 
 void update(float delta, int a, int d, int w){
   super.update(delta,a,d,w);
   vel.y += (gravity/10) * delta;
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
   super.pos.y += vel.y;
   super.pos.x += vel.x;
   //println(vel.x + " " + abs(vel.x) + " " + );
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
}