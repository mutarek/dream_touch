import 'package:dreamtouch/utils/text.styles.dart';
import 'package:dreamtouch/widgets/page_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/notice_controller.dart';
import '../../controllers/success_controller.dart';

class ViewNotice extends StatelessWidget {
  ViewNotice({Key? key}) : super(key: key);
  final successReport = Get.put(NoticeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PageAppBar(
        title: "Notice",
      ),
      body: Obx(() => successReport.isLoading.value
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : successReport.noticeModel.isEmpty
          ? const Center(
        child: Text("No Notice"),
      )
          : ListView.builder(
        itemCount: successReport.noticeModel.length,
        itemBuilder: (_, index) {
          var success = successReport.noticeModel[index];
          return Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              contentPadding: const EdgeInsets.only(left: 10, right: 10),
              title: Text(
                success.title!,
                style: robotoStyle700Bold.copyWith(fontSize: 13),
              ),
              subtitle: Text(
                success.description!,
                style: robotoStyle700Bold.copyWith(fontSize: 13),
              ),
            ),
          );
        },
      )),
    );
  }
}
