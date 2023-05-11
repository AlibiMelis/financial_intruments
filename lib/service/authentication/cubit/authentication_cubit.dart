import 'dart:developer';

import 'package:financial_instruments/service/authentication/model/main_user.dart';
import 'package:financial_instruments/service/authentication/repository/authentication_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthenticationCubit extends Cubit<MainUser?> {
  final AuthenticationRepository repository;

  AuthenticationCubit({required this.repository}) : super(null);

  Future<void> sendOTP(String phoneNo) async {
    repository.sendOTP(phoneNo);
  }

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
}
