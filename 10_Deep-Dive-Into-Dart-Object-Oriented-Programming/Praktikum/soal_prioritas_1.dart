class BangunRuang {
  late int panjang;
  late int lebar;
  late int tinggi;
  int volume() {
    return 0;
  }
}

class Kubus extends BangunRuang {
  late int sisi;
  Kubus(this.sisi);

  @override
  int volume() {
    return sisi * sisi * sisi;
  }
}

class Balok extends BangunRuang {
  Balok(int p, int l, int t) {
    super.panjang = p;
    super.lebar = l;
    super.tinggi = t;
  }
  @override
  int volume() {
    return panjang * lebar * tinggi;
  }
}

void main() {
  final BangunRuang kbs = Kubus(9);
  print('volume kubus : ${kbs.volume()}');

  final BangunRuang blk = Balok(2, 3, 4);
  print('volume balok : ${blk.volume()}');
}
