/*****************************************************************************
 * tetszőleges dimenziójú hyperkocka forgatása bármely dimenziótengely mentén
 * Vér Zoltán 2015 május
 *****************************************************************************/

drawer Drawer;   //megjelenítési tranzformációkért felelős osztály
HyperCube HC[];  //hyperkocka példány, tetszőleges dimenziós lehet

// hyperkocka dimenzióinak száma
int num_of_dimensions = 4;
// kocka forgástengelyeinek száma  // n*(n+1) / 2 ,  n-1 -re
int num_of_axles = ((num_of_dimensions - 1) * num_of_dimensions) / 2;

// indítás utáni inicializáció -----------------------------------------------
void setup() {
  //size(640, 480);
  fullScreen();
  
  Drawer = new drawer(num_of_dimensions);
  
  // minden forgástengely mentén forgatunk egy kockát
  HC = new HyperCube[num_of_axles];
  // hyperkocka  -      dim                   szín           nagyítás
  HC[0] = new HyperCube(num_of_dimensions,  color(255,   0,   0),  50);
  HC[1] = new HyperCube(num_of_dimensions,  color(  0, 255,   0),  50);
  HC[2] = new HyperCube(num_of_dimensions,  color(255, 255,   0),  50);
  HC[3] = new HyperCube(num_of_dimensions,  color(  0,   0, 255),  50);
  HC[4] = new HyperCube(num_of_dimensions,  color(255,   0, 255),  50);
  HC[5] = new HyperCube(num_of_dimensions,  color(  0, 255, 255),  50);
}

// újrarajzolás --------------------------------------------------------------
void draw() {
  background(0);
  
  int offsX = (2 * width) / 7;  
  int offsY = height / 4;
  
  int i = 0;
  for (int a = 0; a < num_of_dimensions - 1; a++) {
    for (int b = a+1; b < num_of_dimensions; b++) {
      
      Drawer.setOffset( (i % 3) * offsX - offsX,
                       ((i < 3) ? 1 : -1) * offsY);
        
      HC[i].rotate(a, b, 0.01);
      HC[i].paint();
      i++;
    }
  }
}