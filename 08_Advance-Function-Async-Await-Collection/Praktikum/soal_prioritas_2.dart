import 'dart:io';

void main() async {
  Map<int, List> element = {
    1: ['Hanief', 'Dafi', 'Satria'],
    2: ['Bukayo', 'Saka'],
    3: ['Martin', 'Odegaard'],
  };
  print('hasil jawaban nomor 1 = ${nomorSatu(element)}');
  print('');

  List<int> data = [3, 4, 5, 6, 4, 2, 4, 6, 8];
  print('hasil jawaban nomor 2 = ${nomorDua(data)}');
  print('');

  stdout.write('hasil jawaban nomor 3 = ');
  print('${await nomorTiga(5)}');
}

Map<int, List> nomorSatu(Map<int, List> n) {
  int i = 1;
  while (i <= n.length) {
    n[i];
    i++;
  }
  return n;
}

int nomorDua(List<int> n) {
  int i = 0;
  double rata = 0.0;
  while (i < n.length) {
    rata += n[i];
    i++;
  }
  rata /= n.length;
  return rata.ceil().toInt();
}

Future<double> nomorTiga(int nilai) async {
  double hasilAkhir = 1;
  while (nilai >= 1) {
    hasilAkhir *= nilai;
    await Future.delayed(
      Duration(seconds: 1),
      () {
        if (nilai == 1) {
          stdout.write('$nilai = ');
        } else {
          stdout.write('$nilai * ');
        }
      },
    );
    nilai--;
  }
  return hasilAkhir;
}
