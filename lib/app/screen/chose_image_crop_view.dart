import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../controllers/other_provider.dart';

class ChooseImageAndCropImageView extends StatefulWidget {
  final double ratioX;
  final double ratioY;
  final int width;
  final int height;
  final bool isFromNid;
  final bool isFromProfile;

  const ChooseImageAndCropImageView(this.ratioX, this.ratioY, this.width, this.height,
      {this.isFromNid = false,this.isFromProfile = false,Key? key})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ChooseImageAndCropImageViewState createState() => _ChooseImageAndCropImageViewState();
}

class _ChooseImageAndCropImageViewState extends State<ChooseImageAndCropImageView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<OtherProvider>(
        builder: (context, otherProvider, child) => Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              actions: [
                IconButton(
                    onPressed: () {
                      if(widget.isFromNid){
                        otherProvider.setCover();
                      }
                      else if(widget.isFromProfile){
                        otherProvider.setProfile();
                      }else{}
                          Navigator.pop(context);

                    },
                    icon: const Icon(Icons.download_done_rounded, color: Colors.black))
              ],
            ),
            body: Stack(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    otherProvider.selectedFile != null
                        ? Image.file(otherProvider.selectedFile!,
                        width: widget.width.toDouble(), height: widget.height.toDouble(), fit: BoxFit.fill)
                        : Image.network("https://raw.githubusercontent.com/GeekAbdelouahed/flutter-reaction-button/doc/images/Preview.png",
                        width: widget.width.toDouble(), height: widget.height.toDouble(), fit: BoxFit.fill),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        MaterialButton(
                            color: Colors.green,
                            child: const Text(
                              "Camera",
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              otherProvider.getImage(ImageSource.camera, widget.ratioX, widget.ratioY, widget.width, widget.height);
                            }),
                        MaterialButton(
                            color: Colors.deepOrange,
                            child: const Text(
                              "Device",
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              otherProvider.getImage(ImageSource.gallery, widget.ratioX, widget.ratioY, widget.width, widget.height);
                            })
                      ],
                    )
                  ],
                ),
              ],
            )));
  }
}
