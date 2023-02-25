import 'package:cloud_firestore/cloud_firestore.dart';

class PaymentModel{
  String? amount;
  String? number;
  String? method;

  PaymentModel({this.amount, this.number, this.method});

  PaymentModel.fromMap({required DocumentSnapshot documentSnapshot}){
    amount = documentSnapshot['amount'];
    number = documentSnapshot['number'];
    method = documentSnapshot['method'];
  }
}