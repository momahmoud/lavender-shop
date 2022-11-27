import 'package:flutter/material.dart';

import '../../../../core/constant/color.dart';
import '../../../../core/helper_widgets/custom_button.dart';
import '../../../../core/helper_widgets/text_widget.dart';
import '../widgets/text_form_field_widget.dart';
import 'login_view.dart';

class RegisterView extends StatelessWidget {
  RegisterView({Key? key}) : super(key: key);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const TextWidget(
              text: 'Create an Account',
              fontWeight: FontWeight.bold,
              color: AppColor.primaryColor,
              fontSize: 30,
            ),
            const TextWidget(
              text: 'Register now to browse our hot offers',
              fontWeight: FontWeight.normal,
              color: AppColor.grey,
              fontSize: 18,
            ),
            const SizedBox(height: 45),
            TextFormFieldWidget(
              hint: 'Username',
              controller: _nameController,
              validator: () {},
              prefixIcon: const Icon(
                Icons.person,
                color: AppColor.primaryColor,
              ),
            ),
            const SizedBox(height: 15),
            TextFormFieldWidget(
              hint: 'Email Address',
              controller: _emailController,
              validator: () {},
              prefixIcon: const Icon(
                Icons.email,
                color: AppColor.primaryColor,
              ),
            ),
            const SizedBox(height: 15),
            TextFormFieldWidget(
              hint: 'Password',
              controller: _passwordController,
              validator: () {},
              suffixIcon: const Icon(
                Icons.visibility,
                color: AppColor.primaryColor,
              ),
              prefixIcon: const Icon(
                Icons.lock,
                color: AppColor.primaryColor,
              ),
            ),
            const SizedBox(height: 40),
            Center(
              child: SizedBox(
                width: 300,
                height: 45,
                child: CustomButton(
                  title: 'REGISTER',
                  onPressed: () {},
                  btnColor: AppColor.primaryColor,
                  txtColor: Colors.white,
                  fontSize: 22,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const TextWidget(
                  text: "Already have an account?",
                  fontWeight: FontWeight.bold,
                  color: AppColor.grey,
                  fontSize: 18,
                ),
                const SizedBox(width: 8),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginView()));
                  },
                  child: TextWidget(
                    text: 'Login'.toUpperCase(),
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
    ));
  }
}
