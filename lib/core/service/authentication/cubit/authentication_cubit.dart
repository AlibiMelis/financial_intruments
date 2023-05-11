import 'dart:developer';

import 'package:financial_instruments/core/service/authentication/model/main_user.dart';
import 'package:financial_instruments/core/service/authentication/repository/authentication_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseAuthentication extends Cubit<MainUser?> {
  BaseAuthentication(super.initialState);

  Future<void> init();
  Future<void> sendOTP(String phoneNo);
  Future<bool> verfiyOTP(String otp);
  // Future<void> fetchUserData();
}

class AuthenticationCubit extends BaseAuthentication {
  final AuthenticationRepository repository;

  AuthenticationCubit({required this.repository}) : super(null);

  @override
  Future<void> init() async {
    final data = await repository.getUser();
    if (data.object != null) {
      final mainUser = data.object! as MainUser;
      emit(mainUser);
    }
  }

  @override
  Future<void> sendOTP(String phoneNo) async {
    repository.sendOTP(phoneNo);
  }

  @override
  Future<bool> verfiyOTP(String otp) async {
    final data = await repository.verifyOTP(otp);
    if (data.errorMessage == null && data.object != null) {
      final mainUser = data.object as MainUser?;
      emit(mainUser);
      log("LOG: successfully logged in");
      return mainUser != null;
    }
    return false;
  }
  
  // @override
  // Future<void> fetchUserData() async {
  //   final data = 
  // }
}
