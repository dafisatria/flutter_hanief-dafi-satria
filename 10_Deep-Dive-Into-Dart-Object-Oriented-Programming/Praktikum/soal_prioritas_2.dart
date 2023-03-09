class matematika {
  int hasil() {
    return 0;
  }
}

class kelipatanPersekutuanTerkecil implements matematika {
  late int x, y;
  kelipatanPersekutuanTerkecil({required this.x, required this.y});
  @override
  int hasil() {
    int max = (x > y) ? x : y;
    while (true) {
      if (max % x == 0 && max % y == 0) {
        return max;
      }
      max++;
    }
  }
}

class faktorPersekutuanTerbesar implements matematika {
  late int x, y;
  faktorPersekutuanTerbesar({required this.x, required this.y});
  @override
  int hasil() {
    while (y != 0) {
      int r = x % y;
      x = y;
      y = r;
    }
    return x;
  }
}

void main() {
  matematika kpk = kelipatanPersekutuanTerkecil(x: 20, y: 12);
  print('kpk : ${kpk.hasil()}');
  matematika fpb = faktorPersekutuanTerbesar(x: 20, y: 12);
  print('fpb : ${fpb.hasil()}');
}
