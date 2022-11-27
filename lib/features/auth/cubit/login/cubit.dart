import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla_shop/features/auth/cubit/login/states.dart';

import '../../../../core/constant/endpoints_consts.dart';
import '../../../../core/helpers_classes/dio_helper.dart';
import '../../models/user_model.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  IconData iconData = Icons.visibility;
  bool isPasswordVisible = true;
  LoginData? loginData;

  static LoginCubit get(context) => BlocProvider.of(context);

  void login(String email, String password) {
    emit(LoginLoadingState());
    DioHelper.postData(
      url: loginEndPoint,
      data: {
        'email': email,
        "password": password,
      },
    ).then((value) {
      loginData = LoginData.fromJson(value.data);
      emit(LoginSuccessState(loginData: loginData!));
    }).catchError((error) {
      emit(LoginErrorState(error.toString()));
      throw error;
    });
  }

  void toggleVisibility() {
    isPasswordVisible = !isPasswordVisible;
    iconData = isPasswordVisible ? Icons.visibility : Icons.visibility_off;
    emit(LoginIsPasswordVisibleState());
  }

  @override
  void onChange(Change<LoginState> change) {
    print(change);
    super.onChange(change);
  }
}
