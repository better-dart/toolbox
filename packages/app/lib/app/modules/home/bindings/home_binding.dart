import 'package:get/get.dart';
import 'package:toolbox/app/modules/excel/controllers/excel_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExcelController>(() => ExcelController());

    Get.lazyPut<HomeController>(() => HomeController());
  }
}
