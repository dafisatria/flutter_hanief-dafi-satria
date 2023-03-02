void main() async {
  List<int> data = [1, 2, 3, 4, 5];
  int pengali = 4;
  print('data awal = $data');
  print('data hasil akhir = ${await loopingAsync(data, pengali)}');
}

Future<List> loopingAsync(List<int> data, int pengali) async {
  int i = 0;
  while (i < data.length) {
    data[i] *= pengali;
    i++;
    await Future.delayed(Duration(seconds: 1), () => print(i));
  }
  return data;
}
