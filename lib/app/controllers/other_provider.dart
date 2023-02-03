import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class OtherProvider with ChangeNotifier {
  File? selectedFile;
  File? pageProfileFile;
  File? pageCoverFile;


  bool isLoading = false;
  String nidUrl = "";
  String photoUrl = "";

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

  uploadNidorBirth(Function callback) async {
    isLoading = true;
    notifyListeners();
    String uniqueName = DateTime.now().toString();
    Reference referenceroot = FirebaseStorage.instance.ref();
    Reference referenceDirImage = referenceroot.child("images");
    Reference referenceImagetoUpload = referenceDirImage.child(uniqueName);
    try {
      await referenceImagetoUpload.putFile(File(pageCoverFile!.path));
      nidUrl = await referenceImagetoUpload.getDownloadURL();
      callback(true);
      notifyListeners();
    } catch (error) {
      callback(false);
      Fluttertoast.showToast(msg: error.toString());
    }
  }

  uploadPhoto(Function callback) async {
    String uniqueName = DateTime.now().toString();
    Reference referenceroot = FirebaseStorage.instance.ref();
    Reference referenceDirImage = referenceroot.child("images");
    Reference referenceImagetoUpload = referenceDirImage.child(uniqueName);
    try {
      await referenceImagetoUpload.putFile(File(pageProfileFile!.path));
      photoUrl = await referenceImagetoUpload.getDownloadURL();
      isLoading = false;
      callback(true);
      notifyListeners();
    } catch (error) {
      callback(false);
      Fluttertoast.showToast(msg: error.toString());
    }
  }

  // uploadProfilePhoto() async {
  //   try {
  //     firebaseStoreage.UploadTask? uploadTask;
  //     firebaseStoreage.Reference ref = firebaseStoreage.FirebaseStorage.instance.ref('files').child("/${pageProfileFile!.path}");
  //     ref.putFile(File(pageProfileFile!.path));
  //     await uploadTask!.whenComplete(() => null);
  //     photoUrl = ref.getDownloadURL().toString();
  //     notifyListeners();
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

// void uploadImage() async {
//   StorageReference.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;
//   final destination = 'files/$pageCoverFile';
//   firebase_storage.UploadTask? uploadTask;
//   try {
//     final ref = firebase_storage.FirebaseStorage.instance.ref(destination).child('file/');
//     StorageUploadTask uploadTask = await ref.putFile(pageCoverFile!);
//     var dowurl = await (await uploadTask?.onComplete).ref.getDownloadURL();
//     url = dowurl.toString();
//   } catch (e) {
//     print('error occured');
//   }
// }
}
