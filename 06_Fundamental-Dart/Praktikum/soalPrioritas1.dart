import 'dart:io';

void soalPrioritasPertama() {
  //  nomor 1 (soal prioritas 1)
  stdout.write('masukkan sisi persegi = ');
  int? s = int.parse(stdin.readLineSync()!);
  int kPersegi = 4 * s;
  print('keliling persegi = $kPersegi');
  int lPersegi = s * s;
  print('luas persegi = $lPersegi');
  print('');
  stdout.write('masukkan panjang persegi panjang = ');
  int? p = int.parse(stdin.readLineSync()!);
  stdout.write('masukkan lebar persegi = ');
  int? l = int.parse(stdin.readLineSync()!);
  int kPersegiPanjang = (2 * p) + (2 * l);
  print('luas persegi panjang = $kPersegiPanjang');
  int lPersegiPanjang = p * l;
  print('luas persegi panjang = $lPersegiPanjang');
  print('');

  // nomor 2 (soal prioritas 1)
  stdout.write('masukkan jari-jari lingkaran = ');
  int? r = int.parse(stdin.readLineSync()!);
  double lLingkaran = 3.14 * (r * r);
  print('luas lingkaran = ' + lLingkaran.toStringAsFixed(2));
  double kLingkaran = 2 * 3.14 * r;
  print('keliling lingkaran = ' + kLingkaran.toStringAsFixed(2));
}
