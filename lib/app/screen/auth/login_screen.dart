import 'package:dreamtouch/app/controllers/auth_provider.dart';
import 'package:dreamtouch/utils/text.styles.dart';
import 'package:dreamtouch/widgets/custom_button.dart';
import 'package:dreamtouch/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../home/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailCon = TextEditingController();
  final paddCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer<AuthProvider>(builder: (context, authProvider, child) {
      return Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  "assets/icons/dream_touch_logo.jpg",
                  height: 150,
                  width: 150,
                )),
            Text("Dream Touch", style: robotoStyle900Black.copyWith(fontSize: 25)),
            const SizedBox(height: 20),
            CustomTextField(
              hintText: 'User Id',
              isShowBorder: true,
              borderRadius: 11,
              verticalSize: 14,
              controller: emailCon,
            ),
            const SizedBox(height: 10),
            CustomTextField(
              hintText: 'Password',
              isShowBorder: true,
              borderRadius: 11,
              verticalSize: 14,
              controller: paddCon,
            ),
            const SizedBox(height: 20),
            authProvider.isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : CustomButton(
                    btnTxt: 'Login',
                    onTap: () {
                      if (emailCon.text.isEmpty) {
                        Fluttertoast.showToast(msg: "ID IS Required");
                      } else if (paddCon.text.isEmpty) {
                        Fluttertoast.showToast(msg: "Password is Required");
                      } else {
                        authProvider.login(emailCon.text, paddCon.text, (status) {
                          if (status) {
                            authProvider.getSpecie(emailCon.text, (status) {
                              if (status) {
                                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context) => HomePage()),
                                    (Route<dynamic> route) => false);
                              } else {}
                            });
                          }
                        });
                      }
                    },
                    radius: 100,
                    height: 48)
          ],
        ),
      );
    }));
  }
}
