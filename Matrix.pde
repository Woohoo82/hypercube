// Tranzformációs mátrix ============================================================ 
class Matrix {
  
  public
  
    float m[][];  // tetszőleges méretű lehet
    int dim;      // dimenziószám
    
    // Constructor, opc. egys. mátr. ------------------------------------------------ 
    Matrix(int numOfDimension, float Identity){
      dim = numOfDimension;
      m = new float[dim][dim];
      
      goIdentity(Identity);
    }
    
    // mátrix egy bizonyos cellájának beállítása index alapján ----------------------
    void setCell(int i, int j, float x){
      if (i<0) i += dim;
      if (j<0) j += dim;
      if (i>=dim) i -= dim;
      if (j>=dim) j -= dim;
      
      m[i][j] = x;
    }
    
    // Inicializálás egységmátrixként -----------------------------------------------
    void goIdentity(float Identity){
      for (int i=0; i<dim; i++)
        for (int j=0; j<dim; j++)
          m[i][j] = 0;
          
      for (int i=0; i<dim; i++)
        m[i][i] = Identity;
    }
    
    // forgatás beállítása a sík meghatározása alapján ------------------------------
    void setRotation(int t1, int t2, float alpha, float scale){
      // a két tengely (t1 és t2) meghatároz egy síkot
      
      float C = cos(alpha) * scale;
      float S = sin(alpha) * scale;
      
      setCell(t1, t1, C);
      setCell(t1, t2, S);
      setCell(t2, t1,-S);
      setCell(t2, t2, C);
    }

    // Vektor szorzása a mátrixszal ------------------------------------------------- 
    Point MmulV(Point p){
      Point R = new Point(dim);
      
      for (int i=0; i<dim; i++)
        for (int j=0; j<dim; j++)
          R.coord[i] += p.coord[j] * m[i][j];
      
      return R;
    }
    
    // Mátrixok összeszorzása ------------------------------------------------- 
    // !!! UNTESTED !!!
    Matrix MmulM(Matrix other){
      Matrix R = new Matrix(dim, 1.0);
      float sum;
      
      for (int c = 0; c < dim; c++) {
        for (int d = 0; d < dim; d++) {
          sum = 0;
          
          for (int k = 0; k < dim; k++) {
            sum = sum + m[c][k] * other.m[k][d];
          }
   
          R.m[c][d] = sum;
        }
      }
      
      return R;
    }
    
}