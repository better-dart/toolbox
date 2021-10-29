import 'package:get/get.dart';

import 'package:toolbox/app/modules/about/bindings/about_binding.dart';
import 'package:toolbox/app/modules/about/views/about_view.dart';
import 'package:toolbox/app/modules/excel/bindings/excel_binding.dart';
import 'package:toolbox/app/modules/excel/views/excel_view.dart';
import 'package:toolbox/app/modules/home/bindings/home_binding.dart';
import 'package:toolbox/app/modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.EXCEL,
      page: () => ExcelView(),
      binding: ExcelBinding(),
    ),
    GetPage(
      name: _Paths.ABOUT,
      page: () => AboutView(),
      binding: AboutBinding(),
    ),
  ];
}
