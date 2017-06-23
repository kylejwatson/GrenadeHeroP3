class DisplayObject{
 PVector pos;
 PImage img;
 
 DisplayObject(PVector pos, PImage img){
   this.pos = pos;
   this.img = img;
 }
 
 void draw(){
   image(img, pos.x,pos.y);
 }
 
 void update(float delta){
  /*anim stuff*/ 
 }
}