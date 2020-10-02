ArrayList<Star> estrelas = new ArrayList<Star>();

void criarEstrelas() {
  for (int i = 0; i <= 5; i++) {
    estrelas.add(new Star());
  }
}

void initialize() {
  criarEstrelas();
}
