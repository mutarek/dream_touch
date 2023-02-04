import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dreamtouch/app/screen/home/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  late final DocumentReference documentReference;
  get user => _auth.currentUser;
  bool isLoading = false;
  String userId = "";

  createAccount(String email, String pass, Function callback) async {
    isLoading = true;
    notifyListeners();
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
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
    usersRef.doc(email).set(data).then((value) {
      callback(true);
      isLoading = false;
      notifyListeners();
    }).catchError((error){
      callback(false);
      isLoading = false;
      notifyListeners();
      Fluttertoast.showToast(msg: error);
    });
    // usersRef.add(data).then((value) {}).then((value) {
    //   callback(true);
    //   isLoading = false;
    //   notifyListeners();
    // }).catchError((onError) {
    //   callback(false);
    //   isLoading = false;
    //   notifyListeners();
    //   Fluttertoast.showToast(msg: onError);
    // });
  }

  login(String email, String pass, Function callback) async {
    isLoading = true;
    notifyListeners();
    _auth.signInWithEmailAndPassword(email: email, password: pass).then((value) {
      callback(true);
      isLoading = true;
      notifyListeners();
      Fluttertoast.showToast(msg: "Login Success");
    }).onError((error, stackTrace) {
      isLoading = false;
      callback(false);
      Fluttertoast.showToast(msg: error.toString());
      notifyListeners();
    });
  }
  checkProfile(String email,Function callback){
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    DocumentReference documentReference = firebaseFirestore.collection("Users").doc(email);
    documentReference.get().then((snapshot) {
      if(snapshot.exists){
        if(snapshot.data().toString().contains("is_approved:false")){
          callback(true);
        }else
          {
            callback(false);
          }
      }
      else{
        Fluttertoast.showToast(msg: "Ops No Database Found");
        callback(false);
      }
    });
  }
}
