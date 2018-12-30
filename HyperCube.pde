// Többdimenziós hyperkocka ===================================================
class HyperCube {
  
  private
    
    int    dim;          //dimenzió száma
    int    num_of_edges; //élek száma
    int    ec;           //él számláló
    float  scale;        //méretezési szorzó
    Matrix trM;          //tranzformációs mátrix
    float  rot = 0;      //forgatási szög
    color  my_color = color(255);  //szín
    Point  PListA[];     
    Point  PListB[];     //élek tömbjei (kezdő és végpontok)
    
    // Csúcsok vizsgálata, hogy mely éleknek tagjai ---------------------------
    void find_Edges(int max_p, int inDim){
      int n = (int)Math.pow(2, inDim);  // lépésköz, n=2^x
      boolean isEndpoint = false;       // kezdő, vagy végpont-e
      int startPoint = 0;
      int endPoint;
      
      for (int j=0; j<max_p; j++){  // a csúcsok vizsgálata
        if (j%n == 0) {             // éldetektálási minta számítás
                                    // ha j pont részt vesz egy élben
            if (isEndpoint){        // és végpont
              endPoint = j;
              
              for (int k=0; k<n; k++) {  // dimenziónkénti élek ciklusa    
                 PListA[ec] = getPoint_byId(startPoint);
                 PListB[ec] = getPoint_byId(endPoint  );
                 ec++;
                 
                 startPoint += 1;
                 endPoint   += 1;
              }
            }
            
            startPoint = j;
            isEndpoint = !isEndpoint;  // kezdő, vagy végpont alternálása
        }
      }
    }
    
    // pont koordinátáinak kiszámítása sorszáma alapján -----------------------
    Point getPoint_byId(int n){
      Point P = new Point(dim);
      
      int d = 0;
      
      while (n>0) {      // bináris konverter
          if((n&1)==1){
            P.coord[d] = 1;
          }
          
          n>>=1;
          d++;
      }
      
      for (int i=0; i<dim; i++)
        if (P.coord[i] == 0) P.coord[i] = -1;    // hogy az origó a közepén legyen, ne a sarkában
      
      return P;
    }
    
  public

    // Constructor ------------------------------------------------------------  
    HyperCube(int numOfDimension, color cl, float Scale){
      my_color = cl;
      scale    = Scale;
      dim      = numOfDimension;
      trM      = new Matrix(dim, scale);    // dimenzió és egységmátrix esetén az átlóérték
      num_of_edges = dim * (int)Math.pow(2,dim-1);  // = n*2^(n-1)
      ec       = 0;                         //éltömb indexelés     
      PListA   = new Point[num_of_edges];
      PListB   = new Point[num_of_edges];
      
      int max_points = (int)Math.pow(2,dim);  // number of vertexes is 2^dimensions
      
      for (int i=0; i<dim; i++)      // dimenziótengelyek ciklusa
        find_Edges(max_points, i);
    }
    
    // Tranzformáció ----------------------------------------------------------
    void rotate(int t1, int t2, float phi){
      //forgatási mátrix felépítése
      rot += phi;
      trM.setRotation(t1, t2, rot, scale);
    }
    
    // Egyéni kirajzolás ------------------------------------------------------ 
    void paint(){
      stroke(my_color);
      
      for (int i=0; i<num_of_edges; i++)
        Drawer.putLine( dim, trM, PListA[i], PListB[i]);
    }
    
}