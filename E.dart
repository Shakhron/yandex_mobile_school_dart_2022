import "dart:io";
import 'dart:math';

void main() {
  List input = readFile('C:/flutter_projects/yandex_context/bin/input.txt');
  List num = input[1].split(' ');
  List number = [];
  for (var i in num) {
    number.add(int.parse(i));
  }
  List neg = [];
  List pos = [];
  var res;
  for (var e in number) {
    if (e < 0) {
      neg.add(e);
    } else {
      pos.add(e);
    }
  }
  if (neg.length % 2 != 0) {
    res = neg.reduce((curr, next) => curr > next ? curr : next);
  } else if (neg.length == number.length) {
    res = number.reduce((curr, next) => curr < next ? curr : next);
  } else {
    res = pos.reduce((curr, next) => curr < next ? curr : next);
  }

  writeToFile(
      'C:/flutter_projects/yandex_context/bin/output.txt', res.toString());
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
