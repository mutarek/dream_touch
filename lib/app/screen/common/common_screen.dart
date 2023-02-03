import 'package:dreamtouch/app/screen/auth/visit.dart';
import 'package:dreamtouch/utils/text.styles.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';
import '../auth/login_screen.dart';
import '../auth/register_screen.dart';

class CommonScreen extends StatelessWidget {
  const CommonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (builder)=> LoginPage()));
                },
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  child: Container(
                      height: 100,
                      width: double.infinity,
                      child: Row(
                        children: [
                          SizedBox(width: 10),
                          Icon(Icons.login, size: 35, color: colorPrimaryLight),
                          SizedBox(width: 10),
                          Text(
                            "Login",
                            style: robotoStyle700Bold.copyWith(fontSize: 30, color: colorPrimaryLight),
                          ),
                          Spacer(),
                          Icon(Icons.arrow_circle_right,size: 35,color: colorPrimaryLight),
                          SizedBox(width: 10),
                        ],
                      )),
                ),
              ),
              const SizedBox(height: 10),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (builder)=> RegisterPage()));
                },
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  child:Container(
                      height: 100,
                      width: double.infinity,
                      child: Row(
                        children: [
                          SizedBox(width: 10),
                          Icon(Icons.create, size: 35, color: colorPrimaryLight),
                          SizedBox(width: 10),
                          Text(
                            "Register",
                            style: robotoStyle700Bold.copyWith(fontSize: 30, color: colorPrimaryLight),
                          ),
                          Spacer(),
                          Icon(Icons.arrow_circle_right,size: 35,color: colorPrimaryLight),
                          SizedBox(width: 10),
                        ],
                      )),
                ),
              ),
              SizedBox(height: 10),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (builder)=> VisitPage()));
                },
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  child: SizedBox(
                      height: 100,
                      width: double.infinity,
                      child: Row(
                        children: [
                          SizedBox(width: 10),
                          const Icon(Icons.visibility, size: 35, color: colorPrimaryLight),
                          SizedBox(width: 10),
                          Text(
                            "Visit",
                            style: robotoStyle700Bold.copyWith(fontSize: 30, color: colorPrimaryLight),
                          ),
                          const Spacer(),
                          const Icon(Icons.arrow_circle_right,size: 35,color: colorPrimaryLight),
                          const SizedBox(width: 10),
                        ],
                      )),
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
