import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthProvider with ChangeNotifier {
  bool isLoading = false;
  String userId = "";

  createAccount(String email, String pass, Function callback) async {
    isLoading = true;
    notifyListeners();
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );
      callback(true);
      userId = credential.user!.uid;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      isLoading = false;
      callback(false);
      notifyListeners();
      if (e.code == 'weak-password') {
        Fluttertoast.showToast(msg: "The password provided is too weak.");
      } else if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(msg: "The account already exists for that email.");
      }
    } catch (e) {
      print(e);
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  createProfile(String teamNo, String permitCode, String connecting, String name, String number, String email, String nidUrl,
      String photoUrl, Function callback) {
    final usersRef = FirebaseFirestore.instance.collection("Users");
    Map<String, dynamic> data = {
      'teamNo': teamNo,
      'permitCode': permitCode,
      'connecting_date': connecting,
      'user_name': name,
      'mobile_number': number,
      'email': email,
      'nidOrBirthUrl': nidUrl,
      'user_profileUrl': photoUrl,
      'is_approved': false,
    };
    usersRef.add(data).then((value) {}).then((value) {
      callback(true);
      isLoading = false;
      notifyListeners();
    }).catchError((onError) {
      callback(false);
      isLoading = false;
      notifyListeners();
      Fluttertoast.showToast(msg: onError);
    });
  }

  login(String email, String pass, Function callback) async {
    isLoading = true;
    notifyListeners();
    FirebaseAuth firebaseAuth = await FirebaseAuth.instance;
    firebaseAuth.signInWithEmailAndPassword(email: email, password: pass).then((value) {
      callback(true);
      userId = firebaseAuth.currentUser!.uid.toString();
      notifyListeners();
    }).onError((error, stackTrace) {
      isLoading = false;
      callback(false);
      notifyListeners();
    });
  }
  checkProfile(){
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    final snapshot = firebaseFirestore.collection("Users").doc(userId).get();
  }
}
