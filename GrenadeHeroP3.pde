Player myPlayer;
float gravity;
int delta,lastTime;
ArrayList<DisplayObject> map;
PImage ground;
HashMap<String,Dirt> dirtMap;
BufferedReader mapReader;
int x,y,x2,y2;
int a;
int d;
int w;

void setup(){
  map = new ArrayList<DisplayObject>();
  mapReader = createReader("map.txt");
  a = 0;
  d = 0;
  w = 0;
  x=0;
  y=0;
  x2=0;
  y2=0;
  dirtMap = new HashMap<String, Dirt>();
  ground = loadImage("dirt.png");
  
  int ver = 0;
  int hor = 0;
  boolean hasNext = true;
 try{
   while(hasNext){
     String line = mapReader.readLine();
     if(line == null){
       break;
     }
     for(int i = 0; i < line.length(); i++){
      if(line.charAt(i) == '1'){
        dirtMap.put(hor +" " + ver,new Dirt(new PVector(hor*15,ver*15),ground));
        map.add(dirtMap.get(hor +" " + ver));
      }
      hor ++;
     }
     hor = 0;
     ver++;
   }
 }catch(IOException e){
   hasNext = false;
 }
  
  delta = 0;
  lastTime = 0;
  size(1000,700);
  gravity = 0.2;
  myPlayer = new Player(new PVector(width/2,height/2), new PVector(0,0), loadImage("char.png"), gravity);
  map.add(myPlayer);
  println(map.size());
}

void draw(){
  background(0,0,0);
 delta = millis() - lastTime;
 text(float(delta)/10, 20,20);
 for(DisplayObject p : map){
   p.draw();
 }
 text(myPlayer.pos.y,20,60);
 update();
 lastTime = millis();
}

void update(){
 for(DisplayObject p : map){
   if(p instanceof Player){
     Player P = (Player) p;
     P.update(delta, a,d,w); 
   }else{
     if(p instanceof Grenade){
       Grenade g = (Grenade) p;
       Dirt dirt = dirtMap.get(int(g.pos.x/15) + " " + int((g.pos.y/15)+1));
       if(dirt != null){
         g.collision(dirt); 
       }
     }
     p.update(delta); 
   }
   
 }
 x = int(myPlayer.pos.x/15);
 y = int(myPlayer.pos.y/15);
 x2 = int((myPlayer.pos.x+21)/15);
 y2 = int((myPlayer.pos.y+30)/15);
 //println(x + " " + y);
 Dirt[] d = new Dirt[] {dirtMap.get(x + " " + y),dirtMap.get(x2 + " " + y),dirtMap.get(x2 + " " + y2),dirtMap.get(x + " " + y2)};
 for(Dirt dirt: d){
   if(dirt != null){
    myPlayer.collision(dirt); 
   }
 }
}

void keyPressed(){
 if(key == 'a')
   a = 1;
  if(key == 'd')
  d = 1;
  if(key == 'w')
  w = 1;
}
void keyReleased(){
 if(key == 'a')
   a = 0;
  if(key == 'd')
  d = 0;
  if(key == 'w')
  w = 0;
}

void mouseReleased(){
  myPlayer.throwNade(map);
}