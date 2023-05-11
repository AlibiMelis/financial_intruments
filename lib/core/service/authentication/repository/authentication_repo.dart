import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:financial_instruments/core/service/authentication/authentication.dart';
import 'package:financial_instruments/core/service/authentication/providers/db_provider.dart';
import 'package:financial_instruments/core/service/model/app_response.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationRepository {
  Future<AppResponse> sendOTP(String phoneNo);
  Future<AppResponse> verifyOTP(String otp);
  Future<AppResponse> getUser();
  // Future<AppResponse> fetchUserData(String uid);
}

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance.collection('users');
  final AuthenticationDBProvider dbProvider;

  AuthenticationRepositoryImpl({required this.dbProvider});

  String _verificationId = '';

  @override
  Future<AppResponse> getUser() async {
    try {
      final data = await dbProvider.fetchData();
      return AppResponse.success(data);
    } on Exception catch (e) {
      return AppResponse.success(e.toString());
    }
  }

  @override
  Future<AppResponse> sendOTP(String phoneNo) async {
    // final bool success = false;
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNo,
      verificationCompleted: (credential) async {
        await _auth.signInWithCredential(credential);
      },
      codeSent: (verificationId, forceResendingToken) {
        _verificationId = verificationId;
      },
      codeAutoRetrievalTimeout: (verificationId) {
        _verificationId = verificationId;
      },
      verificationFailed: (error) {
        // TODO: snackbar with error if error
        if (error.code == 'invalid-phone-number') {
          log("ERROR: invalid phone number");
        } else {
          log("ERROR: $error");
        }
      },
    );
    return AppResponse.success(null);
  }

  @override
  Future<AppResponse> verifyOTP(String otp) async {
    try {
      final credentials = await _auth.signInWithCredential(PhoneAuthProvider.credential(verificationId: _verificationId, smsCode: otp));
      if (credentials.user == null) return AppResponse.withError(null);
      final user = credentials.user;
      final mainUser = MainUser(phoneNumber: user?.phoneNumber ?? '', uid: user?.uid ?? '');
      dbProvider.cacheData(mainUser);
      return AppResponse.success(mainUser);
    } on Exception catch (e) {
      log("ERROR: verification error: $e");
      return AppResponse.withError(e.toString());
    }
  }
  
  // @override
  // Future<AppResponse> fetchUserData(String uid) async {
  //   final userData = await _firestore.doc(uid).get();
  // }
}
