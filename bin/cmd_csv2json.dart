import 'package:excel/excel.dart';
import 'package:file_selector/file_selector.dart';

main() {
  var excel = Excel.decodeBytes(FileSelector.getFile());
  print(excel);
}
