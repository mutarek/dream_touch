import 'package:dreamtouch/utils/text.styles.dart';
import 'package:flutter/material.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Thanks For Registration Dream Touch ",style: robotoStyle800ExtraBold.copyWith(fontSize: 20),),
      ),
    );
  }
}
