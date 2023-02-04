import 'package:dreamtouch/app/controllers/auth_provider.dart';
import 'package:dreamtouch/utils/app_colors.dart';
import 'package:dreamtouch/utils/text.styles.dart';
import 'package:dreamtouch/widgets/page_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../widgets/custom_dashboard_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Provider.of<AuthProvider>(context, listen: false).getCurrentUserProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, authProvider, child) {
      return Scaffold(
        appBar: const PageAppBar(
          title: "Home Page",
          isBackButtonExist: false,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                color: AppColors.primaryColorLight,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 35,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(35),
                            child: Image.network(authProvider.userProfile == ""
                                ? "https://cimages1.touristlink.com/repository/member/218021/tarek_edit_5701.jpg"
                                : authProvider.userProfile),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text("Hey ${authProvider.userName}",style: robotoStyle700Bold.copyWith(fontSize: 18)),
                        Text("Code:  ${authProvider.workPermitCode}",style: robotoStyle700Bold.copyWith(fontSize: 15)),
                      ],
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
                          Icons.visibility_outlined,
                          color: Colors.white,
                          size: 35,
                        ),
                        caption: "Visit"),
                    CustomDashboardButton(
                        color: AppColors.primaryColorLight,
                        icon: const Icon(
                          Icons.fork_right,
                          color: Colors.white,
                          size: 35,
                        ),
                        caption: "Success Report"),
                    CustomDashboardButton(
                        color: AppColors.primaryColorLight,
                        icon: const Icon(
                          Icons.leaderboard,
                          color: Colors.white,
                          size: 35,
                        ),
                        caption: "Lead Generation"),
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
                          Icons.monetization_on,
                          color: Colors.white,
                          size: 35,
                        ),
                        caption: "Earning Money"),
                    CustomDashboardButton(
                        color: AppColors.primaryColorLight,
                        icon: const Icon(
                          Icons.payments_outlined,
                          color: Colors.white,
                          size: 35,
                        ),
                        caption: "Earning Method"),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
