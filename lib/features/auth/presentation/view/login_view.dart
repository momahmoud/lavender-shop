import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:salla_shop/core/enums/enum_toast_states.dart';
import 'package:salla_shop/core/helpers_classes/cached_helper.dart';
import 'package:salla_shop/features/auth/presentation/view/register.dart';
import 'package:salla_shop/features/main_feature/presentation/view/main_screen.dart';

import '../../../../core/constant/color.dart';
import '../../../../core/helper_widgets/custom_button.dart';
import '../../../../core/helper_widgets/text_widget.dart';
import '../../../../core/helper_widgets/toast_messages.dart';
import '../../../../core/helpers_classes/validation_string.dart';

import '../../cubit/login/cubit.dart';
import '../../cubit/login/states.dart';
import '../widgets/text_form_field_widget.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            if (state.loginData.status == true) {
              ToastMessages.showToastMessage(
                  msg: state.loginData.message, state: ToastStates.SUCCESS);
              CachedHelper.saveCachedData(
                  key: 'token', value: state.loginData.userData!.token);
              Get.off(() => const MainScreen());
            } else if (state.loginData.status == false) {
              ToastMessages.showToastMessage(
                  msg: state.loginData.message, state: ToastStates.ERROR);
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
              body: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(18.0),
              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const TextWidget(
                      text: 'LOGIN',
                      fontWeight: FontWeight.bold,
                      color: AppColor.primaryColor,
                      fontSize: 30,
                    ),
                    const TextWidget(
                      text: 'login now to browse our hot offers',
                      fontWeight: FontWeight.normal,
                      color: AppColor.grey,
                      fontSize: 18,
                    ),
                    const SizedBox(height: 45),
                    TextFormFieldWidget(
                      hint: 'Email Address',
                      controller: _emailController,
                      validator: (String value) {
                        if (!RegExp(validationEmail).hasMatch(value)) {
                          return 'Please, Enter valid email';
                        } else {
                          return null;
                        }
                      },
                      prefixIcon: const Icon(
                        Icons.email,
                        color: AppColor.primaryColor,
                      ),
                    ),
                    const SizedBox(height: 15),
                    TextFormFieldWidget(
                      secureText: LoginCubit.get(context).isPasswordVisible,
                      onSubmit: () {
                        if (_formKey.currentState!.validate()) {
                          LoginCubit.get(context).login(
                            _emailController.text.trim(),
                            _passwordController.text.trim(),
                          );
                        }
                      },
                      hint: 'Password',
                      controller: _passwordController,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'password is empty';
                        }
                        if (value.trim().length < 6) {
                          return "password must be 6 characters at least";
                        }
                      },
                      suffixIcon: InkWell(
                        onTap: () {
                          LoginCubit.get(context).toggleVisibility();
                        },
                        child: Icon(
                          LoginCubit.get(context).iconData,
                          color: AppColor.primaryColor,
                        ),
                      ),
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: AppColor.primaryColor,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        InkWell(
                          onTap: () {},
                          child: const TextWidget(
                            text: "Forget Password?",
                            fontWeight: FontWeight.bold,
                            color: Colors.lightBlue,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    Center(
                      child: ConditionalBuilder(
                        condition: state is! LoginLoadingState,
                        builder: (context) => SizedBox(
                          width: 300,
                          height: 45,
                          child: CustomButton(
                            title: 'LOGIN',
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                LoginCubit.get(context).login(
                                  _emailController.text.trim(),
                                  _passwordController.text.trim(),
                                );
                              }
                            },
                            btnColor: AppColor.primaryColor,
                            txtColor: Colors.white,
                            fontSize: 22,
                          ),
                        ),
                        fallback: (context) => const SizedBox(
                            height: 25,
                            width: 25,
                            child: CircularProgressIndicator()),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const TextWidget(
                          text: "Don't have an account?",
                          fontWeight: FontWeight.bold,
                          color: AppColor.grey,
                          fontSize: 18,
                        ),
                        const SizedBox(width: 8),
                        InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterView()));
                          },
                          child: const TextWidget(
                            text: 'Register',
                            fontWeight: FontWeight.bold,
                            color: AppColor.primaryColor,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ));
        },
      ),
    );
  }
}
