import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dreamtouch/app/model/profile_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  late DocumentReference collectionReference;
  var userModel = <ProfileModel>[].obs;

  @override
  void onInit() {
    collectionReference = firebaseFirestore.collection('Users').doc();
    //userModel.bindStream(getCurrentUser());
    super.onInit();
  }

  // Stream<List<ProfileModel>> getCurrentUser() {
  //   return collectionReference
  //       .snapshots()
  //       .map((QuerySnapshot query) {
  //     List<ProfileModel> hotels = [];
  //     for (var hotel in query.docs) {
  //       final hotemote = ProfileModel.fromDocumentSnap(documentSnapshot: hotel);
  //       hotels.add(hotemote);
  //     }
  //     return hotels;
  //   });
  // }
}