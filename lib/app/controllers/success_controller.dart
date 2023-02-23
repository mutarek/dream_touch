import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/product_model.dart';

class SuccessController extends GetxController{
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  late CollectionReference collectionReference;
  var productList = <ProductModel>[].obs;
  var isLoading = true.obs;
  var currentDocs = "".obs;


  @override
  void onInit() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    currentDocs.value = prefs.getString('email')!;
    collectionReference = firebaseFirestore.collection('Users');
    productList.bindStream(getAllProducts());
    super.onInit();
  }

  Stream<List<ProductModel>> getAllProducts() {
    isLoading(true);
    return collectionReference.doc(currentDocs.value).collection("Failure").snapshots().map((QuerySnapshot query) {
      List<ProductModel> hotels = [];
      for (var hotel in query.docs) {
        final hotemote = ProductModel.fromMap(documentSnapshot: hotel);
        hotels.add(hotemote);
        isLoading(false);
      }
      return hotels;
    });
  }
}