import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/app/data/index.dart';
import '../controllers/excel_controller.dart';

class ExcelView extends GetView<ExcelController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ExcelView'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        color: Get.theme.primaryColor.withAlpha(100),
        child: ListView(
          shrinkWrap: true,
          children: [
            ///
            ///
            ///
            ListTile(
              title: Text('Excel 表格数据筛选:').asNiku()
                ..color(Colors.redAccent)
                ..fontWeight(FontWeight.bold),
              trailing: Icon(
                Icons.handyman,
                color: Get.theme.primaryColor,
              ),
            ),

            ListTile(
              title: Text('Step1: 选择源文件..').asNiku()..color(Colors.blueAccent),
              onTap: () async {
                // Get.defaultDialog(title: "选择文件...");

                final typeGroup = XTypeGroup(label: 'images', extensions: ['jpg', 'png']);
                final file = await openFile(acceptedTypeGroups: [typeGroup]);

                print('open file path: ${file!.path}');
              },
            ),

            SizedBox(
              height: Get.height * 0.3,
            ),

            GridView(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              children: [
                Text('1'),
                Text('1'),
                Text('1'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
