import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dreamtouch/app/screen/home/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  late final DocumentReference documentReference;

  get user => _auth.currentUser;
  bool isLoading = false;
  String userName = "";
  String userProfile = "";
  String workPermitCode = "";
  String wallet = "";
  String success = "";
  String lead = "";

  createAccount(String email, String pass, Function callback) async {
    isLoading = true;
    notifyListeners();
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );
      callback(true);
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

  createProfile(String pass,String teamNo, String permitCode, String connecting, String name, String number, String email, String nidUrl,
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
      'wallet': "0",
      'success': "0",
      'lead': "0",
      'password': pass,
    };
    usersRef.doc(email).set(data).then((value) {
      callback(true);
      isLoading = false;
      notifyListeners();
    }).catchError((error) {
      callback(false);
      isLoading = false;
      notifyListeners();
      Fluttertoast.showToast(msg: error);
    });
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

  getSpecie(String email, Function callback) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    CollectionReference collectionReference = firebaseFirestore.collection("Users");
    DocumentSnapshot snap = await collectionReference.doc(email).get();
    bool approved = ((snap.data() as Map)['is_approved']);
    if (approved) {
      isLoading = false;
      callback(true);
      saveToLocalStorage(email);
      notifyListeners();
    } else {
      callback(false);
      isLoading = false;
      notifyListeners();
      Fluttertoast.showToast(msg: "Admin Didn't Approved");
    }
  }

  saveToLocalStorage(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email', email);
    prefs.setBool("is_logged", true);
  }

  getFromLocalStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? stringValue = prefs.getString('email');
    return stringValue;
  }

  getCurrentUserProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? stringValue = prefs.getString('email');
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    CollectionReference collectionReference = firebaseFirestore.collection("Users");
    DocumentSnapshot snap = await collectionReference.doc(stringValue).get();
    userName = ((snap.data() as Map)['user_name']);
    userProfile = ((snap.data() as Map)['user_profileUrl']);
    workPermitCode = ((snap.data() as Map)['permitCode']);
    wallet = ((snap.data() as Map)['wallet']);
    success = ((snap.data() as Map)['success']);
    lead = ((snap.data() as Map)['lead']);
    notifyListeners();
  }
}
