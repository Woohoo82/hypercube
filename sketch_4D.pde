/*****************************************************************************
 * tetszőleges dimenziójú hyperkocka forgatása abármely dimenziótengely mentén
 * Vér Zoltán 2015 május
 *****************************************************************************/

drawer Drawer;   //megjelenítési tranzformációkért felelős osztály
HyperCube HC[];  //hyperkocka példány, tetszőleges dimenziós lehet

// indítás utáni inicializáció -----------------------------------------------
void setup() {
  int ennyiD = 4;
  
  Drawer = new drawer(ennyiD);
  
  // hyperkocka  -   dim      szín           nagyítás
  HC = new HyperCube[6];
  HC[0] = new HyperCube(ennyiD, color(255,  99,  99), 50);
  HC[1] = new HyperCube(ennyiD, color(  0, 255,   0), 50);
  HC[2] = new HyperCube(ennyiD, color(  0,   0, 255), 50);
  HC[3] = new HyperCube(ennyiD, color( 99,  99, 255), 50);
  HC[4] = new HyperCube(ennyiD, color( 99, 255,  99), 50);
  HC[5] = new HyperCube(ennyiD, color(255,   0,   0), 50);
  
  size(640, 480);
}

// újrarajzolás --------------------------------------------------------------
void draw() {
  background(0);
  
  for (int i=0; i<6; i++) {
    Drawer.setOffset((i%3)*200-200, ((i<3)?1:-1)*100);
    
    HC[i].rotate(0.01, i);
    HC[i].paint();
  }
}


