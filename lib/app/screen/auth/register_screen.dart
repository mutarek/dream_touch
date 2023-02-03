import 'package:dreamtouch/utils/text.styles.dart';
import 'package:dreamtouch/widgets/custom_button.dart';
import 'package:dreamtouch/widgets/page_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../../widgets/custom_text_field.dart';
import '../../controllers/other_provider.dart';
import 'register_screen2.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final teamCon = TextEditingController();
  final permitCon = TextEditingController();
  final connectingDateCon = TextEditingController();
  final nameCon = TextEditingController();
  final numberCon = TextEditingController();
  final emailCon = TextEditingController();
  final passCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PageAppBar(
        title: "Create Account",
      ),
      body: Consumer<OtherProvider>(builder: (context, otherProvider, child) {
        return SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text("Type Your Team No", style: robotoStyle600SemiBold.copyWith(fontSize: 15))),
                  const SizedBox(height: 7),
                  CustomTextField(
                    hintText: 'Team No',
                    isShowBorder: true,
                    borderRadius: 11,
                    verticalSize: 14,
                    controller: teamCon,
                  ),
                  const SizedBox(height: 7),
                  Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text("Type Your Work Permit Code", style: robotoStyle600SemiBold.copyWith(fontSize: 15))),
                  const SizedBox(height: 7),
                  CustomTextField(
                    hintText: 'Permit Code',
                    isShowBorder: true,
                    borderRadius: 11,
                    verticalSize: 14,
                    controller: permitCon,
                  ),
                  const SizedBox(height: 7),
                  Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text("Type Your Connecting Date", style: robotoStyle600SemiBold.copyWith(fontSize: 15))),
                  const SizedBox(height: 7),
                  CustomTextField(
                    hintText: 'Connecting Date',
                    isShowBorder: true,
                    borderRadius: 11,
                    verticalSize: 14,
                    controller: connectingDateCon,
                  ),
                  const SizedBox(height: 7),
                  Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text("Type Your Name ", style: robotoStyle600SemiBold.copyWith(fontSize: 15))),
                  const SizedBox(height: 7),
                  CustomTextField(
                    hintText: 'Name',
                    isShowBorder: true,
                    borderRadius: 11,
                    verticalSize: 14,
                    controller: nameCon,
                  ),
                  const SizedBox(height: 7),
                  Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text("Active Phone Number", style: robotoStyle600SemiBold.copyWith(fontSize: 15))),
                  const SizedBox(height: 7),
                  CustomTextField(
                    hintText: 'Phone Number',
                    isShowBorder: true,
                    borderRadius: 11,
                    verticalSize: 14,
                    controller: numberCon,
                  ),
                  const SizedBox(height: 7),
                  Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text("Email Account", style: robotoStyle600SemiBold.copyWith(fontSize: 15))),
                  const SizedBox(height: 7),
                  CustomTextField(
                    hintText: "Email Account",
                    isShowBorder: true,
                    borderRadius: 11,
                    verticalSize: 14,
                    controller: emailCon,
                  ),
                  const SizedBox(height: 7),
                  Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text("Password", style: robotoStyle600SemiBold.copyWith(fontSize: 15))),
                  const SizedBox(height: 7),
                  CustomTextField(
                    hintText: "Password",
                    isShowBorder: true,
                    borderRadius: 11,
                    verticalSize: 14,
                    controller: passCon,
                  ),
                  const SizedBox(height: 20),
                  CustomButton(
                    btnTxt: "Next",
                    radius: 15,
                    onTap: () {
                      if (teamCon.text.isEmpty) {
                        Fluttertoast.showToast(msg: "Team No is Required");
                      } else if (permitCon.text.isEmpty) {
                        Fluttertoast.showToast(msg: "Permit Code is Required");
                      } else if (connectingDateCon.text.isEmpty) {
                        Fluttertoast.showToast(msg: "Connecting Date is Required");
                      } else if (nameCon.text.isEmpty) {
                        Fluttertoast.showToast(msg: "Name is Required");
                      } else if (numberCon.text.isEmpty) {
                        Fluttertoast.showToast(msg: "Mobile Number is Required");
                      } else if (emailCon.text.isEmpty) {
                        Fluttertoast.showToast(msg: "Email is Required");
                      } else if (passCon.text.isEmpty) {
                        Fluttertoast.showToast(msg: "Password is Required");
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => RegisterScreen2(teamCon.text, permitCon.text, connectingDateCon.text, nameCon.text,
                                    numberCon.text, emailCon.text, passCon.text)));
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
