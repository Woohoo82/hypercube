// Megjelenítési tranzformációk =============================================== 
class drawer {
  
  private
  
    int cx;  // ablak középpontja, virtuális origó
    int cy;
    
    int ox;  // offset, a kép eltolása
    int oy;
    Matrix NezetM;
    
    // Constructor1 ----------------------------------------------------------- 
    drawer(int numOfDimension){
      ox = 0;
      oy = 0;
      
      NezetM = new Matrix(numOfDimension, 1.0);
      
      //NezetM.setRotation(2, 3, -0.6);
      NezetM.m[0][0] = 0.8253356149;
      NezetM.m[0][1] = 0.0;
      NezetM.m[0][2] = 0.5646424734;
      
      NezetM.m[1][0] = 0.1668632604;
      NezetM.m[1][1] = 0.9553364891;
      NezetM.m[1][2] = -0.2439033515;
      
      NezetM.m[2][0] = -0.5394235581;
      NezetM.m[2][1] = 0.2955202067;
      NezetM.m[2][2] = 0.7884732287;

    }
    
    // nézeti tranzformáció --------------------------------------------------- 
    Point wievT(int dim, Matrix M, Point p){      
      Point R = M.MmulV(p);    // a kocka saját forgása
      
      R = NezetM.MmulV(R);     // a nézethez tartozó elfordítás
      
      int delta = 300;
      
      for (int i=dim-1; i>=2; i--){    // reverse for loop
        R.coord[i] += delta;
        for (int j=0; j<i; j++){       // do perspective to lower dimension
          R.coord[j] = R.coord[j] / R.coord[i] * delta;
                                       // divide coords from first to n by n+1 
                                       // and scaling compensation
        }                              // until n reaches 2
        
      }
      
      return R;
    }
    
  public
    
    void setOffset(int offsetX, int offsetY){
      ox = offsetX;
      oy = offsetY;
    }
    
    // vonal vetületes rajzolása ---------------------------------------------- 
    void putLine(int dim, Matrix M, Point p1, Point p2){
      cx = width / 2;
      cy = height / 2;
      
      p1 = wievT(dim, M, p1);
      p2 = wievT(dim, M, p2);
      
      line( p1.coord[0] + cx + ox, 
            p1.coord[1] + cy + oy, 
            p2.coord[0] + cx + ox, 
            p2.coord[1] + cy + oy); 
    }
    
}