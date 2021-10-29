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
            ListTile(
              title: Text('Excel 表格数据筛选:').asNiku()
                ..color(Colors.redAccent)
                ..fontWeight(FontWeight.bold),
              trailing: Icon(
                Icons.handyman,
                color: Get.theme.primaryColor,
              ),
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
