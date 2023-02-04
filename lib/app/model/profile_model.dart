import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileModel{
  String? docId;
  String? connectingDate;
  String? email;
  bool? isApproved;
  String? mobileNumber;
  String? nidOrBirth;
  String? permitCode;
  String? teamNo;
  String? user_name;
  String? profile_pic_url;

  ProfileModel({this.connectingDate, this.email, this.isApproved, this.mobileNumber, this.nidOrBirth, this.permitCode, this.teamNo,
      this.user_name, this.profile_pic_url});

  ProfileModel.fromDocumentSnap({required DocumentSnapshot documentSnapshot}){
    docId = documentSnapshot.id;
    connectingDate = documentSnapshot['connecting_date'];
    email = documentSnapshot['email'];
    isApproved = documentSnapshot['is_approved'];
    mobileNumber = documentSnapshot['mobile_number'];
    nidOrBirth = documentSnapshot['nidOrBirthUrl'];
    permitCode = documentSnapshot['permitCode'];
    teamNo = documentSnapshot['teamNo'];
    user_name = documentSnapshot['user_name'];
    profile_pic_url = documentSnapshot['user_profileUrl'];
  }
}