class PhysicsObject{
 PVector pos;
 PImage img;
 
 PhysicsObject(PVector pos, PImage img){
   this.pos = pos;
   this.img = img;
 }
 
 
 void draw(){
   image(img, pos.x,pos.y);
 }
 
 void update(float delta, int a, int d, int w){
   
 }
}