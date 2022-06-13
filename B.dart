import 'dart:collection';
import "dart:io";

void main() {
  List input = readFile('C:/flutter_projects/yandex_context/bin/input.txt');
  List<String> emails = [];
  for (int i = 1; i <= int.parse(input[0]); i++) {
    List email = input[i].split('@');
    email[0] = email[0].replaceAll('.', '');
    email[0] = email[0].split('-').first;
    email[1] = email[1].substring(0, email[1].lastIndexOf('.'));
    emails.add(email[0] + email[1]);
  }
  emails.toSet().toList();

  var uniques = new LinkedHashMap<String, bool>();
  for (var s in emails) {
    uniques[s] = true;
  }
  writeToFile('C:/flutter_projects/yandex_context/bin/output.txt',
      uniques.length.toString());
  print(uniques);
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
