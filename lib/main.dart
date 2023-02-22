import 'package:dreamtouch/app/controllers/auth_provider.dart';
import 'package:dreamtouch/app/screen/common/common_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/controllers/other_provider.dart';
import 'app/screen/home/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool? isLogin = prefs.getBool("is_logged")??false;
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => OtherProvider()),
      ChangeNotifierProvider(create: (context) => AuthProvider()),
    ],
    child: MyApp(isLogin),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp(this.result, {super.key});

  final bool result;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: result == true ? const HomePage() : const CommonScreen(),
    );
  }
}
