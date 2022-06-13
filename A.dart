import "dart:io";

void main() {
  Map input = readFile('C:/flutter_projects/yandex_context/bin/input.txt');
  List times = input['t'].map(int.parse).toList();
  int index = 0;
  int max = times[0];
  for (int i = 0; i < input['n'] - 1; i++) {
    if (times[i + 1] - times[i] >= max) {
      max = times[i + 1] - times[i];
      index = i + 1;
    }
  }
  writeToFile(
      'C:/flutter_projects/yandex_context/bin/output.txt', input['s'][index]);
}

void writeToFile(String path, contents) async {
  await File(path).writeAsString(contents);
}

Map readFile(String path) {
  File myFile = File(path);
  String myFileContent = myFile.readAsStringSync();
  List lines = myFileContent.split('\n');
  print(lines[2]);
  Map input = {
    'n': int.parse(lines[0]),
    's': lines[1].split(''),
    't': lines[2].split(' '),
  };
  print(input['s']);
  return input;
}