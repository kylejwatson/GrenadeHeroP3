class PhysicsObject extends DisplayObject{
 PVector vel;
 float gravity;
 PhysicsObject(PVector pos, PImage img, PVector vel, float gravity){
   super(pos, img);
   this.vel = vel;
   this.gravity = gravity;
 }
 
 void update(float delta){
   vel.y += (gravity/10) * delta;
   pos.add(vel);
   super.update(delta);
 }
}