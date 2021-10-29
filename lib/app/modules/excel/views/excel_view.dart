import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/app/data/index.dart';
import '../controllers/excel_controller.dart';

class ExcelView extends GetView<ExcelController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Excel 表格数据筛选工具').asNiku()
          ..fontSize(24)
          ..color(Colors.redAccent)
          ..fontWeight(FontWeight.bold)
          ..center(),
        centerTitle: true,
        backgroundColor: Color(0xff201E3A),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        color: Color(0xff201E3A), // 0xff3C4868 // 0xff201E3A
        child: ListView(
          shrinkWrap: true,
          children: [
            ///
            ///
            ///

            Card(
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.all(10),
                children: [
                  InkWell(
                    onTap: () async {
                      await controller.selectFile();
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.handyman,
                          color: Colors.orange,
                        ),
                        SizedBox(width: 10),
                        Text('Step1: 选择源文件 ...').asNiku()
                          ..color(Colors.orange)
                          ..fontSize(20),
                        SizedBox(width: 10),
                        Container(
                            padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.blueAccent,
                            ),
                            child: Text('点击').asNiku()
                              ..fontSize(20)
                              ..color(Colors.white)),
                      ],
                    ).asNiku()
                      ..itemsCenter(),
                  ),

                  SizedBox(height: 20),

                  ///
                  ///
                  ///
                  ///
                  Row(
                    children: [
                      Icon(
                        Icons.file_download_done,
                        color: Colors.orange,
                      ),
                      SizedBox(width: 10),
                      Text('已打开文件路径:').asNiku()
                        ..fontSize(20)
                        ..color(Colors.orange),
                      Obx(
                        () => Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text('${controller.inFile}').asNiku()
                            ..fontSize(20)
                            ..color(Colors.orange),
                        ),
                      ),
                    ],
                  ).asNiku()
                    ..itemsCenter(),

                  SizedBox(height: 20),

                  ///
                  ///
                  ///
                  Row(
                    children: [
                      Icon(
                        Icons.file_present,
                        color: Colors.orange,
                      ),
                      SizedBox(width: 10),
                      Text('工作表名称:').asNiku()
                        ..fontSize(20)
                        ..color(Colors.orange),
                      SizedBox(width: 10),
                      Obx(() => Container(
                            // padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.deepPurple,
                            ),
                            width: Get.width * 0.2,
                            child: DropdownButtonFormField(
                              alignment: Alignment.center,
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                              icon: Icon(
                                Icons.arrow_drop_down_sharp,
                                color: Colors.orange,
                                size: 30,
                              ),
                              value: controller.sheetName.value,
                              onChanged: (val) {
                                controller.setSheetName(val as String);
                              },
                              selectedItemBuilder: (context) {
                                return [Text('语文'), Text('数学'), Text('英语')];
                              },
                              items: [
                                DropdownMenuItem(
                                  child: Text('语文'),
                                  value: '语文',
                                ),
                                DropdownMenuItem(child: Text('数学'), value: '数学'),
                                DropdownMenuItem(child: Text('英语'), value: '英语'),
                              ],
                            ),
                          ))
                    ],
                  ).asNiku()
                    ..itemsCenter(),
                ],
              ),
            ),

            ///
            ///
            ///
            ///
            Padding(
              padding: EdgeInsets.all(10),
              child: Card(
                child: Form(
                  child: ListView(
                    shrinkWrap: true,
                    children: [],
                  ),
                ),
              ),
            ),

            ///
            ///
            ///
            PaginatedDataTable(
              header: Text('数据预览:').asNiku()
                ..fontSize(20)
                ..color(Colors.orange),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {},
                ),
              ],
              columns: [
                DataColumn(label: Text('姓名')),
                DataColumn(label: Text('性别')),
                DataColumn(label: Text('年龄')),
              ],
              source: MyDataTableSource(controller.inData),
            ),

            SizedBox(height: Get.height * 0.2),

            GridView(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              children: [
                IconButton(
                  onPressed: () => Get.snackbar('hello', 'hi'),
                  icon: Icon(Icons.send, color: Colors.redAccent),
                ),
                IconButton(
                  onPressed: () => Get.snackbar('hello', 'hi'),
                  icon: Icon(Icons.send, color: Colors.redAccent),
                ),
                IconButton(
                  onPressed: () => Get.snackbar('hello', 'hi'),
                  icon: Icon(Icons.send, color: Colors.redAccent),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class MyDataTableSource extends DataTableSource {
  MyDataTableSource(this.data);

  final List<User> data;

  @override
  DataRow? getRow(int index) {
    if (index >= data.length) {
      return null;
    }
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text('${data[index].name}')),
        DataCell(Text('${data[index].sex}')),
        DataCell(Text('${data[index].age}')),
      ],
    );
  }

  @override
  int get selectedRowCount {
    return 0;
  }

  @override
  bool get isRowCountApproximate {
    return false;
  }

  @override
  int get rowCount {
    return data.length;
  }
}

class User {
  User(this.name, this.age, this.sex);

  final String name;
  final int age;
  final String sex;
}
