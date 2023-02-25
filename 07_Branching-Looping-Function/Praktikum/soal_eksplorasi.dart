import 'dart:io';
import 'dart:math';

void main() {
  // nomor 1
  int bilangan = 11, i = 2;
  bool isPrima = true;
  while (i <= sqrt(bilangan)) {
    if (bilangan % i == 0) {
      isPrima = false;
      break;
    }
    i++;
  }

  if (isPrima == true) {
    print('bilangan prima');
  } else {
    print('bukan bilangan prima');
  }
  print('');
  print('--------------------------------');
  print('');
  // nomor 2
  int n = 9;
  for (int i = 1; i <= n; i++) {
    for (int j = 1; j <= n; j++) {
      if (i == 1) {
        stdout.write('${i * j}   ');
      } else {
        stdout.write('${i * j}  ');
      }
    }
    print('');
  }
}
