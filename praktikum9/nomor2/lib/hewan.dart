class Hewan {
  String nama;
  double berat;

  Hewan(this.nama, this.berat);

  void makan(double kg) {
    berat += kg;
  }

  void lari(double kg) {
    berat -= kg;
    if (berat < 0) berat = 0; 
  }
}