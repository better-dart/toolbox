import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/excel_controller.dart';

class ExcelView extends GetView<ExcelController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ExcelView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ExcelView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
