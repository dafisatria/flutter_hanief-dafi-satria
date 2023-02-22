import 'dart:io';

void soalPrioritasKedua() {
  // nomor 1 (soal prioritas 2)
  stdout.write('masukkan kata pertama : ');
  String? kataPertama = stdin.readLineSync();
  stdout.write('masukkan kata kedua : ');
  String? kataKedua = stdin.readLineSync();
  stdout.write('masukkan kata ketiga : ');
  String? kataKetiga = stdin.readLineSync();
  print('$kataPertama $kataKedua $kataKetiga');
  print('');

  // nomor 2 (soal prioritas 2)
  stdout.write('masukkan jari-jari alas tabung = ');
  int? r = int.parse(stdin.readLineSync()!);
  stdout.write('masukkan tinggi tabung = ');
  int? t = int.parse(stdin.readLineSync()!);
  double vTabung = 3.14 * (r * r) * t;
  print('volume tabung = ' + vTabung.toStringAsFixed(2));
}
