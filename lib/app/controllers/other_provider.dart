import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;


class OtherProvider with ChangeNotifier {
  File? selectedFile;
  File? pageProfileFile;
  File? pageCoverFile;

  clearImage() {
    selectedFile = null;
    notifyListeners();
  }

  setCover() {
    pageCoverFile = selectedFile;
    notifyListeners();
  }

  setProfile() {
    pageProfileFile = selectedFile;
    notifyListeners();
  }

  clearCoverProfile() {
    pageProfileFile = null;
    pageCoverFile = null;
  }

  getImage(ImageSource source, double ratioX, double ratioY, int widget, int height) async {
    // inProcess = true;
    XFile? image = await ImagePicker().pickImage(source: source);
    if (image != null) {
      selectedFile = File(image.path);
    }
    notifyListeners();
  }

  getImageWithOutCroup(ImageSource source) async {
    selectedFile = null;
    XFile? image = await ImagePicker().pickImage(source: source);
    if (image != null) {
      selectedFile = File(image.path);
    }
    notifyListeners();
  }

  void uploadImage() async{
    firebase_storage.FirebaseStorage storage =
        firebase_storage.FirebaseStorage.instance;
    final destination = 'files/$pageCoverFile';
    firebase_storage.UploadTask? uploadTask;
    try {
      final ref = firebase_storage.FirebaseStorage.instance
          .ref(destination)
          .child('file/');
      await ref.putFile(pageCoverFile!);
      final snapshot = uploadTask!.whenComplete(() {
      });
    } catch (e) {
      print('error occured');
    }
  }
}
