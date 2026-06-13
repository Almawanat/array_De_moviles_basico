class Movil { 
  PVector pos;
  PVector vel; 
  int tamanio = 50; 

 
  Movil (float x, float y) {
    pos = new PVector(x, y);
    
    vel = new PVector(random(-2, 5), random(-3, 4));
  }

  void Mover() {
    pos.add(vel);
  }

  void Mostrar() {
    circle(pos.x, pos.y, tamanio);
  }

  void Noc() {
    if (pos.y < tamanio/2 || pos.y > height - tamanio/2){
      vel.y = vel.y * -1;
    }
  }
   
  void Hom() {
    if (pos.x < tamanio/2 || pos.x > width - tamanio/2){
      vel.x = vel.x * -1;
    }
  }
}

int cant = 10;
Movil[] moviles;

void setup () {
  size(800, 600);
  moviles = new Movil[cant];
  
 float espacio = width / (cant + 1);
   for (int i = 0; i < cant; i++){
    float x = espacio * (i + 1); 
    float y = height / 2;      
    
    moviles[i] = new Movil(x, y);
  }
}

void draw() {
  background(220); 
  for (int i = 0; i < cant; i ++){
    moviles[i].Mover();
    moviles[i].Mostrar();
    moviles[i].Noc();
    moviles[i].Hom();
  }
}
