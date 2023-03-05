import 'dart:io';

class Calculator {
  int penjumlahan(int a, int b) {
    return a + b;
  }

  int pengurangan(int a, int b) {
    return a - b;
  }

  int perkalian(int a, int b) {
    return a * b;
  }

  double pembagian(int a, int b) {
    return a / b;
  }
}

class Course {
  String judul;
  String deskripsi;
  Course({required this.judul, required this.deskripsi});
}

class Student {
  String? nama;
  String? kelas;
  List<Course> daftarCourse = [];
  Student(String nama, String kelas) {
    this.nama = nama;
    this.kelas = kelas;
  }
  void addCourse(Course n) {
    daftarCourse.add(n);
  }

  void removeCourse(Course n) {
    daftarCourse.remove(n);
  }

  void printCourse() {
    print('Nama : $nama');
    print('------------');
    for (var c in daftarCourse) {
      print('Judul : ${c.judul}');
      print('Deskripsi : ${c.deskripsi}');
    }
  }
}

void main() {
  var s1 = Calculator();
  print(s1.penjumlahan(12, 12));
  print(s1.pengurangan(12, 12));
  print(s1.perkalian(12, 12));
  print(s1.pembagian(12, 12));
  print('----------');

  Course c1 = Course(judul: 'Flutter', deskripsi: 'mobile development');
  Course c2 = Course(judul: 'UI/UX', deskripsi: 'graphic design');
  Course c3 = Course(judul: 'Laravel', deskripsi: 'web development');

  Student st1 = Student('Dafi', '3B');
  Student st2 = Student('Ryujin', '3A');
  st1.addCourse(c1);
  st1.addCourse(c2);
  st2.addCourse(c2);
  st2.addCourse(c3);
  st2.addCourse(c1);
  st1.printCourse();
  print('');
  st2.printCourse();
  print('');
  st1.removeCourse(c2);
  st1.printCourse();
}
