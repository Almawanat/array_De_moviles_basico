int columnas = 8;
int filas = 6;
int cant = columnas * filas; 
Movil[] moviles;

void setup () {
  size(800, 600);
  moviles = new Movil[cant];
  
  float intervaloX = width / (columnas + 1);
  float intervaloY = height / (filas + 1);
  
  int index = 0;
  for (int f = 0; f < filas; f++) {
    for (int c = 0; c < columnas; c++) {
      float x = intervaloX * (c + 1);
      float y = intervaloY * (f + 1);
      
      moviles[index] = new Movil(x, y);
      index++;
    }
  }
}

void draw() {
  for (int i = 0; i < cant; i ++){
    moviles[i].Mover();
    moviles[i].Mostrar();
    moviles[i].Noc();
    moviles[i].Hom();
  }
}
class Movil { 
  PVector pos;
  PVector vel;
  int tamanio = 50;

  Movil (float x, float y) {
    pos = new PVector(x, y);
    vel = new PVector(random(-3, 3), random(-3, 3));
  }

  void Mover() { pos.add(vel); }
  void Mostrar() { circle(pos.x, pos.y, tamanio); }
  
  void Noc() {
    if (pos.y < tamanio/2 || pos.y > height - tamanio/2){ vel.y *= -1; }
  }
   
  void Hom() {
    if (pos.x < tamanio/2 || pos.x > width - tamanio/2){ vel.x *= -1; }
  }
}
