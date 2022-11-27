import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salla_shop/core/helper_widgets/text_widget.dart';

import '../../../../core/constant/color.dart';
import '../../../../core/enums/enum_toast_states.dart';
import '../../../../core/helper_widgets/toast_messages.dart';
import '../../../../core/helpers_classes/cached_helper.dart';
import '../../../auth/presentation/view/login_view.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
          onPressed: () {
            Get.defaultDialog(
              title: 'Logout',
              middleText: 'Are you sure?',
              onConfirm: () {
                CachedHelper.clearCachedData(key: 'token').then((value) {
                  if (value) {
                    ToastMessages.showToastMessage(
                        msg: 'Logout done successfully',
                        state: ToastStates.SUCCESS);
                    Get.off(() => LoginView());
                  } else {
                    ToastMessages.showToastMessage(
                        msg: 'Something went wrong, please try again',
                        state: ToastStates.ERROR);
                  }
                });
              },
              textConfirm: 'Okay',
              buttonColor: AppColor.primaryColor,
              onCancel: () => Get.back(),
              confirmTextColor: AppColor.backgroundColor,
              cancelTextColor: AppColor.black,
            );
          },
          child: const TextWidget(
            text: 'Sign out',
          )),
    );
  }
}
