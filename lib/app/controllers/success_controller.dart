import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/payment_model.dart';
import '../model/product_model.dart';

class SuccessController extends GetxController{
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  late CollectionReference collectionReference;
  var paymentHistory = <PaymentModel>[].obs;
  var isLoading = true.obs;
  var currentDocs = "".obs;


  @override
  void onInit() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    currentDocs.value = prefs.getString('email')!;
    collectionReference = firebaseFirestore.collection('Users');
    paymentHistory.bindStream(getAllProducts());
    super.onInit();
  }

  Stream<List<PaymentModel>> getAllProducts() {
    isLoading(true);
    return collectionReference.doc(currentDocs.value).collection("Payment").snapshots().map((QuerySnapshot query) {
      List<PaymentModel> hotels = [];
      for (var hotel in query.docs) {
        final hotemote = PaymentModel.fromMap(documentSnapshot: hotel);
        hotels.add(hotemote);
        isLoading(false);
      }
      return hotels;
    });
  }
}