class Hewan {
  int berat = 100;
}

class Mobil {
  int kapasitas = 5;
  List<String> muatan = [];
  void tambahMuatan(String n) {
    if (muatan.length < kapasitas) {
      muatan.add(n);
    } else {
      print('kapasitas penuh!');
    }
  }
}

void main() {
  var s1 = Hewan();
  print(s1.berat);
  print('---------------');

  var s2 = Mobil();
  print(s2.muatan);
  s2.tambahMuatan('Kucing');
  s2.tambahMuatan('Anjing');
  s2.tambahMuatan('Singa');
  s2.tambahMuatan('Paus');
  s2.tambahMuatan('Macan');
  print(s2.muatan);
  s2.tambahMuatan('Buaya');
}
