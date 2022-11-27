import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:salla_shop/core/constant/color.dart';
import 'package:salla_shop/features/main_feature/cubit/home_data/home_data_cubit.dart';

import 'core/helpers_classes/cached_helper.dart';
import 'core/helpers_classes/dio_helper.dart';
import 'features/auth/presentation/view/login_view.dart';
import 'features/main_feature/cubit/bottom_nav_bar/bottom_nav_bar_cubit.dart';
import 'features/main_feature/presentation/view/main_screen.dart';
import 'features/onboarding/presentation/view/onboarding_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await CachedHelper.init();
  await DioHelper.init();
  bool isSeen =
      CachedHelper.getCachedData(key: 'isSeen', returnType: true) ?? false;
  String token = CachedHelper.getCachedData(key: 'token', returnType: '') ?? '';
  runApp(MyApp(
    isSeen: isSeen,
    token: token,
  ));
}

class MyApp extends StatelessWidget {
  final bool isSeen;
  final String token;
  const MyApp({Key? key, this.isSeen = false, required this.token})
      : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, _) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => BottomNavBarCubit()),
          BlocProvider(
            create: (context) => HomeDataCubit(),
            lazy: false,
          ),
        ],
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              toolbarHeight: 50,
              backgroundColor: AppColor.backgroundColor,
              elevation: 0,
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: AppColor.backgroundColor,
                statusBarIconBrightness: Brightness.dark,
                statusBarBrightness: Brightness.dark,
              ),
            ),
            fontFamily: 'Jannah',
            primarySwatch: Colors.blue,
            scaffoldBackgroundColor: Colors.white,
          ),
          home: isSeen
              ? token.isNotEmpty
                  ? const MainScreen()
                  : LoginView()
              : const OnBoardingView(),
        ),
      ),
    );
  }
}

String token = '';
