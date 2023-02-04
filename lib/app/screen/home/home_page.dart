import 'package:dreamtouch/utils/app_colors.dart';
import 'package:dreamtouch/widgets/page_app_bar.dart';
import 'package:flutter/material.dart';

import '../../../widgets/custom_dashboard_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:const PageAppBar(
        title: "Home Page",
        isBackButtonExist: false,
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            color: AppColors.primaryColorLight,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              spacing: 30,
              runSpacing: 20,
              children: [
                CustomDashboardButton(
                    color: AppColors.primaryColorLight,
                    icon: const Icon(
                      Icons.notification_add,
                      color: Colors.white,
                      size: 35,
                    ),
                    caption: "Notice"),
                CustomDashboardButton(
                    color: AppColors.primaryColorLight,
                    icon: const Icon(
                      Icons.meeting_room,
                      color: Colors.white,
                      size: 35,
                    ),
                    caption: "Meeting"),
                CustomDashboardButton(
                    color: AppColors.primaryColorLight,
                    icon: const Icon(
                      Icons.task_alt_sharp,
                      color: Colors.white,
                      size: 35,
                    ),
                    caption: "Self Task"),
                CustomDashboardButton(
                    color: AppColors.primaryColorLight,
                    icon: const Icon(
                      Icons.task_alt_sharp,
                      color: Colors.white,
                      size: 35,
                    ),
                    caption: "Assign Task"),
                CustomDashboardButton(
                    color: AppColors.primaryColorLight,
                    icon: const Icon(
                      Icons.task_alt_sharp,
                      color: Colors.white,
                      size: 35,
                    ),
                    caption: "Receive Task"),
                CustomDashboardButton(
                    color: AppColors.primaryColorLight,
                    icon: const Icon(
                      Icons.contact_phone,
                      color: Colors.white,
                      size: 35,
                    ),
                    caption: "Contact"),
                CustomDashboardButton(
                    color: AppColors.primaryColorLight,
                    icon: const Icon(
                      Icons.report_gmailerrorred,
                      color: Colors.white,
                      size: 35,
                    ),
                    caption: "Report"),
                CustomDashboardButton(
                    color: AppColors.primaryColorLight,
                    icon: const Icon(
                      Icons.help,
                      color: Colors.white,
                      size: 35,
                    ),
                    caption: "Helpline"),
                CustomDashboardButton(
                    color: AppColors.primaryColorLight,
                    icon: const Icon(
                      Icons.web,
                      color: Colors.white,
                      size: 35,
                    ),
                    caption: "Website"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
