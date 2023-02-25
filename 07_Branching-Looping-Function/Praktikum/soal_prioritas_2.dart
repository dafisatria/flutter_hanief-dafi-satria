import 'dart:io';

void main() {
  // tugas looping 1
  for (int i = 0; i < 8; i++) {
    for (int j = 8 - i; j > 1; j--) {
      stdout.write('   ');
    }
    for (int k = 0; k <= i * 2; k++) {
      stdout.write(' * ');
    }
    print('');
  }
  print('');
  print('--------------------------------');
  print('');
  // tugas looping 2
  for (int i = 5; i > 0; i--) {
    for (int j = 5; j > i; j--) {
      stdout.write(' ');
    }
    for (int k = 0; k <= i * 2; k++) {
      stdout.write('0');
    }
    print('');
  }
  for (int i = 0; i < 6; i++) {
    for (int j = 6 - i; j > 1; j--) {
      stdout.write(' ');
    }
    for (int k = 0; k <= i * 2; k++) {
      stdout.write('0');
    }
    print('');
  }
  print('');
  print('--------------------------------');
  print('');
  // tugas looping 3
  double a = 10, b = 40, c = 50, hasil = 1;
  while (c >= 1) {
    hasil *= c;
    c--;
  }
  print(hasil);
  print('');
  print('--------------------------------');
  print('');
  // hasil tugas function
  print(luasLingkaran(10));
}

// tugas function
double luasLingkaran(int r) {
  return 3.14 * (r * r);
}
