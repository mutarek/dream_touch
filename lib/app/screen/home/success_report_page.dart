import 'package:dreamtouch/utils/text.styles.dart';
import 'package:dreamtouch/widgets/page_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/success_controller.dart';

class EarningMethod extends StatelessWidget {
  EarningMethod({Key? key}) : super(key: key);
  final successReport = Get.put(SuccessController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PageAppBar(
        title: "Success Report",
      ),
      body: Obx(() => successReport.isLoading.value
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : successReport.paymentHistory.isEmpty
              ? const Center(
                  child: Text("No Success Report"),
                )
              : ListView.builder(
                  itemCount: successReport.paymentHistory.length,
                  itemBuilder: (_, index) {
                    var success = successReport.paymentHistory[index];
                    return Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      child: ListTile(
                        contentPadding: const EdgeInsets.only(left: 10, right: 10),
                        title: Text(
                          success.amount!,
                          style: robotoStyle700Bold.copyWith(fontSize: 13),
                        ),
                        subtitle: Text(
                          success.number!,
                          style: robotoStyle700Bold.copyWith(fontSize: 13),
                        ),
                        trailing: Text(success.method!),
                      ),
                    );
                  },
                )),
    );
  }
}
