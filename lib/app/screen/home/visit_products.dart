import 'package:cached_network_image/cached_network_image.dart';
import 'package:dreamtouch/app/controllers/visit_product_controller.dart';
import 'package:dreamtouch/utils/text.styles.dart';
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
      body: Obx(()=> visitCon.isLoading.value?
      const Center(
        child: CircularProgressIndicator(),
      ):GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: visitCon.productList.length,
          itemBuilder: (_, index) {
            var data = visitCon.productList[index];
            return Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CachedNetworkImage(imageUrl: data.image!),
                  const SizedBox(height: 5),
                  Text(data.title!,style: robotoStyle700Bold.copyWith(fontSize: 15),)
                ],
              ),
            );
          }))
    );
  }
}
