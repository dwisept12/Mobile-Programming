class Hewan {
  String nama;
  double berat;

  Hewan(this.nama, this.berat);

  String makan(double porsi) {
    berat += porsi / 1000;
    return '$nama telah makan $porsi gram.';
  }
}
