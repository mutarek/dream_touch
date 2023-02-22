import 'package:dreamtouch/app/controllers/visit_product_controller.dart';
import 'package:dreamtouch/widgets/page_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class VisitProducts extends StatelessWidget {
  VisitProducts({Key? key}) : super(key: key);
  final visitCon = Get.put(VisitProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PageAppBar(title: "Products"),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: 10,
          itemBuilder: (_, index) {
            return const Card();
          }),
    );
  }
}
