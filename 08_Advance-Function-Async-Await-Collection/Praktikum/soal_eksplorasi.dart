void main() {
  List<String> uniqueWord = [
    'amuse',
    'tommy kaira',
    'spoon',
    'HKS',
    'litchfield',
    'amuse',
    'HKS'
  ];
  List<String> uniqueWord2 = [
    'JS Racing',
    'amuse',
    'spoon',
    'spoon',
    'JS Racing',
    'amuse',
  ];
  print(
      'hasil jawaban nomor 1 sampel output pertama = ${uniqueWord.toSet().toList()}');
  print(
      'hasil jawaban nomor 1 sampel output kedua = ${uniqueWord2.toSet().toList()}');
  print('');

  List<String> anyWord = [
    'js',
    'js',
    'js',
    'golang',
    'python',
    'js',
    'js',
    'golang',
    'rust'
  ];

  print('hasil jawaban nomor 2 = ${nomorDua(anyWord)}');
}

Map<String, int> nomorDua(List<String> n) {
  Map<String, int> frequencyWord = {};
  int i = 0;
  while (i < n.length) {
    String word = n[i];
    if (frequencyWord.containsKey(word)) {
      frequencyWord[word] = (frequencyWord[word]! + 1);
    } else {
      frequencyWord[word] = 1;
    }
    i++;
  }
  return frequencyWord;
}
