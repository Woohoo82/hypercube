// Tetszőleges dimenziójú pont vagy vektor ==================================== 
class Point {
  
  public
  
    float coord[];
    
    // Constructor1 ----------------------------------------------------------- 
    Point(int numOfDimension){
      coord = new float[numOfDimension];
      
      for (int i=0; i<numOfDimension; i++)
        coord[i] = 0;
    }
    
    // Constructor2 ----------------------------------------------------------- 
    Point(int numOfDimension, float c[]){
      coord = new float[numOfDimension];
      
      for (int i=0; i<numOfDimension; i++)
        coord[i] = c[i];
    }
    
}
