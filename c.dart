import 'dart:collection';
import "dart:io";

void main() {
  List input = readFile('C:/flutter_projects/yandex_context/bin/input.txt');
  List prices = input[1].split(' ');
  List price = prices.map((e) => int.parse(e)).toList();
  int max = 0;
  int maxIndex = -1;
  int min = price[0];
  for (int i = 0; i < int.parse(input[0]); i++) {
    if (price[i] > max) {
      max = price[i];
      maxIndex = i;
    }
    if (price[i] < min && i < maxIndex) {
      min = price[i];
    }
  }
  writeToFile('C:/flutter_projects/yandex_context/bin/output.txt',
      (max - min).toString());
}

void writeToFile(String path, contents) async {
  await File(path).writeAsString(contents);
}

List readFile(String path) {
  File myFile = File(path);
  String myFileContent = myFile.readAsStringSync();
  List lines = myFileContent.split('\n');
  return lines;
}
