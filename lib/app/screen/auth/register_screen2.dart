import 'package:dreamtouch/app/controllers/auth_provider.dart';
import 'package:dreamtouch/app/controllers/other_provider.dart';
import 'package:dreamtouch/app/screen/message/message_page.dart';
import 'package:dreamtouch/utils/text.styles.dart';
import 'package:dreamtouch/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import '../../../widgets/page_app_bar.dart';
import '../chose_image_crop_view.dart';

class RegisterScreen2 extends StatefulWidget {
  const RegisterScreen2(this.teamNo, this.permitCode, this.connectingDate, this.name, this.phoneNumber, this.gmail, this.password,
      {Key? key})
      : super(key: key);
  final String teamNo;
  final String permitCode;
  final String connectingDate;
  final String name;
  final String phoneNumber;
  final String gmail;
  final String password;

  @override
  State<RegisterScreen2> createState() => _RegisterScreen2State();
}

class _RegisterScreen2State extends State<RegisterScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PageAppBar(
        title: "Create Account",
      ),
      body: Consumer2<OtherProvider, AuthProvider>(builder: (context, otherProvider, authProvider, child) {
        return SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 17),
                      child: Text("NID Or Birth Certificate", style: latoStyle900Black.copyWith(fontSize: 19)),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey,
                        ),
                        height: 200,
                        width: 300,
                        child: otherProvider.pageCoverFile == null
                            ? const Icon(Icons.add_a_photo)
                            : SizedBox(
                                width: 300,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.file(
                                    otherProvider.pageCoverFile!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 13),
                      child: InkWell(
                        onTap: () {
                          otherProvider.clearImage();
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => const ChooseImageAndCropImageView(
                                    16,
                                    9,
                                    640,
                                    260,
                                    isFromNid: true,
                                  )));
                        },
                        child: Container(
                          height: 40,
                          width: 170,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.black),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.image, size: 35, color: Colors.white),
                              const SizedBox(width: 5),
                              Text("Upload Image", style: latoStyle700Bold.copyWith(fontSize: 15, color: Colors.white)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 17),
                      child: Text("Upload Your Picture", style: latoStyle900Black.copyWith(fontSize: 19)),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey,
                        ),
                        height: 200,
                        width: 300,
                        child: otherProvider.pageProfileFile == null
                            ? const Icon(Icons.add_a_photo)
                            : Container(
                                width: 300,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.file(
                                    otherProvider.pageProfileFile!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 13),
                      child: InkWell(
                        onTap: () {
                          otherProvider.clearImage();
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => const ChooseImageAndCropImageView(16, 9, 640, 260, isFromProfile: true)));
                        },
                        child: Container(
                          height: 40,
                          width: 170,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.black),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.image, size: 35, color: Colors.white),
                              const SizedBox(width: 5),
                              Text("Upload Image", style: latoStyle700Bold.copyWith(fontSize: 15, color: Colors.white)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  otherProvider.isLoading?
                      Center(
                        child: CircularProgressIndicator(),
                      ):authProvider.isLoading?
                      Center(
                        child: CircularProgressIndicator(),
                      ):CustomButton(
                    btnTxt: "Create Account",
                    radius: 25,
                    onTap: () {
                      if (otherProvider.pageProfileFile == null) {
                        Fluttertoast.showToast(msg: "Please Select Image First");
                      } else if (otherProvider.pageCoverFile == null) {
                        Fluttertoast.showToast(msg: "Please Select Image");
                      } else {
                        otherProvider.uploadNidorBirth((status) {
                          if (status) {
                            otherProvider.uploadPhoto((status) {
                              if (status) {
                                authProvider.createAccount(widget.gmail, widget.password, (status) {
                                  if (status) {
                                    authProvider.createProfile(widget.password,widget.teamNo, widget.permitCode, widget.connectingDate, widget.name,
                                        widget.phoneNumber, widget.gmail, otherProvider.nidUrl, otherProvider.photoUrl, (status) {
                                          if (status) {
                                            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                                                const MessagePage()), (Route<dynamic> route) => false);
                                          }
                                        });
                                  }
                                });
                              }
                            });
                          }
                        });
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
