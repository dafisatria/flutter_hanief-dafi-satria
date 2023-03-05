import 'dart:io';

class Book {
  String id;
  String judul;
  String penerbit;
  int harga;
  String kategori;

  Book(
      {required this.id,
      required this.judul,
      required this.penerbit,
      required this.harga,
      required this.kategori});
}

class listBook {
  List<Book> daftarBuku = [];
  void addBook(Book book) {
    daftarBuku.add(book);
  }

  void removeBook(Book book) {
    daftarBuku.remove(book);
  }

  void printBook() {
    if (daftarBuku.isEmpty) {
      print('daftar buku masih kosong!');
      print('------------------------');
    } else {
      for (var b in daftarBuku) {
        print('id buku : ${b.id}');
        print('judul buku : ${b.judul}');
        print('penerbit buku : ${b.penerbit}');
        print('harga buku : ${b.harga}');
        print('kategori buku : ${b.kategori}');
        print('');
      }
      print('------------------------');
    }
  }
}

void main() {
  Book b1 = Book(
      id: 'bk001',
      judul: 'manusia salmon',
      penerbit: 'radit',
      harga: 100000,
      kategori: 'komedi');
  Book b2 = Book(
      id: 'bk002',
      judul: 'manusia macan',
      penerbit: 'radit lagi',
      harga: 200000,
      kategori: 'komedi');
  listBook db = listBook();
  db.printBook();
  db.addBook(b1);
  db.addBook(b2);
  db.printBook();
  db.removeBook(b1);
  db.printBook();
}
