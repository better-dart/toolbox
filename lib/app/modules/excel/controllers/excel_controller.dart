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
    inFile.value = file.path;

    print('open file path: ${inFile}');
  }
}
