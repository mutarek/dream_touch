import 'package:cached_network_image/cached_network_image.dart';
import 'package:dreamtouch/app/controllers/visit_product_controller.dart';
import 'package:dreamtouch/app/screen/home/single_products.dart';
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
        body: Obx(() => visitCon.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                ),
                itemCount: visitCon.productList.length,
                itemBuilder: (_, index) {
                  var data = visitCon.productList[index];
                  return Container(
                    //width: MediaQuery.of(context).size.width * 0.45,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          color: Color(0x3600000F),
                          offset: Offset(0, 2),
                        )
                      ],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: InkWell(
                      onTap: (){
                        Get.to(()=> DetailesScreen(data));
                      },
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0),
                                      bottomRight: Radius.circular(0),
                                      topLeft: Radius.circular(8),
                                      topRight: Radius.circular(8),
                                    ),
                                    child: CachedNetworkImage(
                                      imageUrl: data.image!,
                                      width: 100,
                                      height: 130,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                              child: Container(
                                child: Row(
                                  children: [
                                    Flexible(
                                      child: Column(children: [
                                        Text(
                                          data.title!,
                                          style: robotoStyle700Bold.copyWith(fontSize: 16,
                                          overflow: TextOverflow.fade),
                                        )
                                      ]),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                })));
  }
}
