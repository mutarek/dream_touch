import 'package:dreamtouch/utils/app_colors.dart';
import 'package:dreamtouch/utils/text.styles.dart';
import 'package:flutter/material.dart';

import '../../../widgets/page_app_bar.dart';

class VisitPage extends StatelessWidget {
  const VisitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PageAppBar(title: 'Visit'),
      body: Center(
        child: SizedBox(
          height: 250,
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.all(5),
            child: Column(
              children: [
                SizedBox(
                    height: 180,
                    width: double.infinity,
                    child: Card(
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          Text.rich(
                              TextSpan(children: [TextSpan(text: "App Organized By", style: robotoStyle500Medium.copyWith(fontSize: 15)),
                              TextSpan(text: "\nDream Touch",style: robotoStyle800ExtraBold.copyWith(fontSize: 20))])),
                          SizedBox(height: 10),
                          Text("Helpline",style: robotoStyle500Medium.copyWith(fontSize: 15)),
                          Divider(thickness: 2,color: AppColors.primaryColorLight),
                          Text("+8801602246104",style: robotoStyle800ExtraBold.copyWith(fontSize: 20)),
                          Text("+8801602246105",style: robotoStyle800ExtraBold.copyWith(fontSize: 20)),
                        ],
                      ),
                    )),
                const SizedBox(height: 10),
                const Icon(Icons.facebook,size: 35)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
