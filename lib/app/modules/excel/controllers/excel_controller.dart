import 'package:excel/excel.dart';
import 'package:file_selector/file_selector.dart';
import 'package:get/get.dart';
import 'package:toolbox/app/modules/excel/views/excel_view.dart';

class ExcelController extends GetxController {
  final rootDir = ''.obs;

  /// input file:
  final inFile = ''.obs;

  /// input file:
  final inData = <User>[].obs;

  @override
  void onInit() {
    super.onInit();

    if (GetPlatform.isMacOS) {
      rootDir.value = 'Downloads';
    }

    List.generate(100, (index) {
      inData.add(User('张三$index', index % 50, index % 2 == 0 ? '男' : '女'));
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<void> selectFile() async {
    final typeGroup = XTypeGroup(
      label: 'Excel',
      extensions: [
        'csv',
        'xls',
        'xlsx',
      ],
    );

    final file = await openFile(
      acceptedTypeGroups: [typeGroup],
      initialDirectory: rootDir.value,
    );
    if (file == null) {
      return;
    }

    /// set:
    inFile.value = file.name;
    print('open file path: ${inFile}, ${file.mimeType},');

    ///
    /// 读取文件:
    ///
    var raw = await file.readAsBytes();

    ///
    /// 解析 Excel 文件:
    ///
    var excel = Excel.decodeBytes(raw);

    ///
    /// row = Data() 是每个单元格的数据, eg Data( 用户名, 2, 49, null, Sheet1),
    ///
    for (var table in excel.tables.keys) {
      print('\ttable name: $table, maxCols: ${excel.tables[table]!.maxCols}, maxRows:${excel.tables[table]!.maxRows}'); //sheet Name

      for (var row in excel.tables[table]!.rows) {
        print("\trow: $row\n");
      }
    }
  }
}
