import 'dart:io';

void soalEksplorasi() {
  // nomor 1 (soal eksplorasi)
  stdout.write('masukkan kata pertama : ');
  String? kataPertama = stdin.readLineSync();
  stdout.write('masukkan kata kedua : ');
  String? kataKedua = stdin.readLineSync();
  String palindrom = kataPertama!.split('').reversed.join();
  if (kataKedua == palindrom) {
    print('palindrom');
  } else {
    print('bukan palindrom');
  }
  print('');

  // nomor 2 (soal eksplorasi)
  stdout.write('masukkan bilangan : ');
  int? bil = int.parse(stdin.readLineSync()!);
  for (int i = 1; i < bil; i++) {
    if (bil % i == 0) {
      print(i);
    }
  }
}
