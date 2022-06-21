import 'package:get/get.dart';

import '../controllers/excel_controller.dart';

class ExcelBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExcelController>(
      () => ExcelController(),
    );
  }
}
