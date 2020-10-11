  int resolution = 20;
  int cols;
  int rows;
  int [][] grid;
  int [][] next;

void setup(){
  size(800, 400);
  cols = width / resolution;
  rows = height / resolution;
  grid = new int[cols][rows];
  next = new int[cols][rows];
  for(int i=0; i<cols; i++){
    for(int j=0; j<rows; j++){
      grid[i][j] = floor(random(0, 2));
    }
  }
  
}

void draw(){

  for(int i=0; i<cols; i++){
    for(int j=0; j<rows; j++){
      int x = i*resolution;
      int y = j*resolution;
      if(grid[i][j] == 0){
        fill(255);
        rect(x, y, resolution, resolution);
      }
      else{
        fill(0);
        rect(x, y, resolution, resolution);
      }
    }
  }

  for(int i=0; i<cols; i++){
    for(int j=0; j<rows; j++){
      if(countNeighbours(grid, i, j) > 3 || countNeighbours(grid, i, j) < 2){
        if(grid[i][j] == 1){
          next[i][j] = 0;
        }
        else{
          next[i][j] = grid[i][j];
        }
      }

      else if(countNeighbours(grid, i, j) == 3){
        if(grid[i][j] == 0){
          next[i][j] = 1;
        }
        else{
          next[i][j] = grid[i][j];
        }
      }
      else{
        next[i][j] = grid[i][j];
      }
    }
  }

 for(int i=0; i<cols; i++){
    for(int j=0; j<rows; j++){
      int x = i*resolution;
      int y = j*resolution;
      if(next[i][j] == 0){
        fill(255);
        rect(x, y, resolution, resolution);
      }
      else{
        fill(0);
        rect(x, y, resolution, resolution);
      }
    }
  }

  for(int i=0; i<cols; i++){
    for(int j=0; j<rows; j++){
        grid[i][j] = next[i][j];
      }
    }
  }

int countNeighbours(int array[][], int x, int y){
  int sum = 0;
  for(int i=-1; i<2; i++){
    for(int j=-1; j<2; j++){
      int xx = (x + i + cols) % cols;
      int yy = (y + j + rows) % rows;
      sum+=array[xx][yy];
    }
  }
  return (sum - array[x][y]);
}
