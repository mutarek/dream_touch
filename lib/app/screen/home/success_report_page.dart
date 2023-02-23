import 'package:dreamtouch/utils/text.styles.dart';
import 'package:dreamtouch/widgets/page_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/success_controller.dart';

class SuccessReportPage extends StatelessWidget {
  SuccessReportPage({Key? key}) : super(key: key);
  final successReport = Get.put(SuccessController());

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const PageAppBar(
        title: "Success Report",
      ),
      body: Obx(() => successReport.isLoading.value?
      const Center(
        child: CircularProgressIndicator(),
      ):
          successReport.productList.isEmpty?
              const Center(
                child: Text("No Success Report"),
              ):
              ListView.builder(
                itemCount: successReport.productList.length,
                itemBuilder: (_,index){
                  var success = successReport.productList[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: NetworkImage(success.image!),fit: BoxFit.fitWidth
                        )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(success.title!,style: robotoStyle700Bold.copyWith(fontSize: 17,color: Colors.white)),
                            const SizedBox(height: 5),
                            Text(success.description!,style: robotoStyle700Bold.copyWith(fontSize: 14,color: Colors.white)),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )
      ),
    );
  }
}
