import 'package:dreamtouch/app/controllers/auth_provider.dart';
import 'package:dreamtouch/app/screen/common/common_screen.dart';
import 'package:dreamtouch/app/screen/home/success_report_page.dart';
import 'package:dreamtouch/app/screen/home/view_notice.dart';
import 'package:dreamtouch/app/screen/home/visit_products.dart';
import 'package:dreamtouch/utils/app_colors.dart';
import 'package:dreamtouch/utils/text.styles.dart';
import 'package:dreamtouch/widgets/page_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../../widgets/custom_image.dart';

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
                  padding: const EdgeInsets.all(20),
                  child: Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 35,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(authProvider.userProfile == ""
                                ? "https://cimages1.touristlink.com/repository/member/218021/tarek_edit_5701.jpg"
                                : authProvider.userProfile),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text("Hey ${authProvider.userName}", style: robotoStyle700Bold.copyWith(fontSize: 18)),
                        Text("Code:  ${authProvider.workPermitCode}", style: robotoStyle700Bold.copyWith(fontSize: 15)),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  spacing: 5,
                  runSpacing: 5,
                  children: [
                    SizedBox(
                      height: 80,
                      width: double.infinity,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (builder) => VisitProducts()));
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          elevation: 2,
                          child: Row(
                            children: [
                              const SizedBox(width: 10),
                              circularImage("https://cdn-icons-png.flaticon.com/512/166/166258.png", 45, 45),
                              const SizedBox(width: 10),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Visit", style: robotoStyle500Medium.copyWith(fontSize: 20)),
                                ],
                              ),
                              const Spacer(),
                              const Icon(Icons.arrow_circle_right_sharp, size: 35),
                              const SizedBox(width: 20),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 80,
                      width: double.infinity,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (builder) => ViewNotice()));
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          elevation: 2,
                          child: Row(
                            children: [
                              const SizedBox(width: 10),
                              circularImage("https://img.icons8.com/doodle/256/alarm.png", 45, 45),
                              const SizedBox(width: 10),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Notice", style: robotoStyle500Medium.copyWith(fontSize: 20)),
                                ],
                              ),
                              const Spacer(),
                              const Icon(Icons.arrow_circle_right_sharp, size: 35),
                              const SizedBox(width: 20),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 80,
                      width: double.infinity,
                      child: InkWell(
                        onTap: () {},
                        child: Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          elevation: 2,
                          child: Row(
                            children: [
                              const SizedBox(width: 10),
                              circularImage("https://cdn-icons-png.flaticon.com/512/174/174685.png", 45, 45),
                              const SizedBox(width: 10),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Success Report", style: robotoStyle500Medium.copyWith(fontSize: 20)),
                                  Text(authProvider.success, style: robotoStyle700Bold.copyWith(fontSize: 20)),
                                ],
                              ),
                              const Spacer(),
                              const Icon(Icons.arrow_circle_right_sharp, size: 35),
                              const SizedBox(width: 20),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 80,
                      width: double.infinity,
                      child: InkWell(
                        onTap: () {},
                        child: Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          elevation: 2,
                          child: Row(
                            children: [
                              const SizedBox(width: 10),
                              circularImage("https://cdn.iconscout.com/icon/premium/png-512-thumb/alert-user-2100747-1765077.png", 45, 45),
                              const SizedBox(width: 10),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Failure Report", style: robotoStyle500Medium.copyWith(fontSize: 20)),
                                  Text(authProvider.failure, style: robotoStyle700Bold.copyWith(fontSize: 20)),
                                ],
                              ),
                              const Spacer(),
                              const Icon(Icons.arrow_circle_right_sharp, size: 35),
                              const SizedBox(width: 20),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 80,
                      width: double.infinity,
                      child: Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        elevation: 2,
                        child: Row(
                          children: [
                            const SizedBox(width: 10),
                            circularImage("https://cdn-icons-png.flaticon.com/512/4118/4118461.png", 45, 45),
                            const SizedBox(width: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Lead Generation", style: robotoStyle500Medium.copyWith(fontSize: 20)),
                                Text(authProvider.lead, style: robotoStyle700Bold.copyWith(fontSize: 20)),
                              ],
                            ),
                            const Spacer(),
                            const Icon(Icons.arrow_circle_right_sharp, size: 35),
                            const SizedBox(width: 20),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 80,
                      width: double.infinity,
                      child: Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        elevation: 2,
                        child: Row(
                          children: [
                            const SizedBox(width: 10),
                            circularImage("https://cdn-icons-png.flaticon.com/512/5303/5303805.png", 45, 45),
                            const SizedBox(width: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Earning Money", style: robotoStyle500Medium.copyWith(fontSize: 20)),
                                Text("৳ ${authProvider.wallet}", style: robotoStyle700Bold.copyWith(fontSize: 20)),
                              ],
                            ),
                            const Spacer(),
                            const Icon(Icons.arrow_circle_right_sharp, size: 35),
                            const SizedBox(width: 20),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 80,
                      width: double.infinity,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (builder) => EarningMethod()));
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          elevation: 2,
                          child: Row(
                            children: [
                              const SizedBox(width: 10),
                              circularImage("https://cdn-icons-png.flaticon.com/512/3029/3029287.png", 45, 45),
                              const SizedBox(width: 10),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Earning Method", style: robotoStyle500Medium.copyWith(fontSize: 20)),
                                  Text("17", style: robotoStyle700Bold.copyWith(fontSize: 20)),
                                ],
                              ),
                              const Spacer(),
                              const Icon(Icons.arrow_circle_right_sharp, size: 35),
                              const SizedBox(width: 20),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 80,
                      width: double.infinity,
                      child: InkWell(
                        onTap: () {
                          authProvider.logout((status) {
                            if (status) {
                              Fluttertoast.showToast(msg: "Logout successful");
                              Get.offAll(() => CommonScreen());
                            } else {
                              Fluttertoast.showToast(msg: "Something went wrong");
                            }
                          });
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          elevation: 2,
                          child: Row(
                            children: [
                              const SizedBox(width: 10),
                              circularImage("https://cdn-icons-png.flaticon.com/512/4436/4436954.png", 45, 45),
                              const SizedBox(width: 10),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Logout", style: robotoStyle500Medium.copyWith(fontSize: 20)),
                                  Text("Access a new account", style: robotoStyle700Bold.copyWith(fontSize: 15)),
                                ],
                              ),
                              const Spacer(),
                              const Icon(Icons.arrow_circle_right_sharp, size: 35),
                              const SizedBox(width: 20),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
