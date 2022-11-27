import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_shop/core/helper_widgets/custom_image_widget.dart';
import 'package:salla_shop/core/helper_widgets/text_widget.dart';

import '../../../../core/constant/color.dart';
import '../../../../generated/assets.dart';
import '../../cubit/bottom_nav_bar/bottom_nav_bar_cubit.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
      builder: (context, state) {
        final cubit = BlocProvider.of<BottomNavBarCubit>(context);
        return Scaffold(
          appBar: AppBar(
            title: TextWidget(
              text: cubit.currentIndex == 0 ? 'Lavender' : "Categories ",
              color: AppColor.primaryColor,
              fontSize: cubit.currentIndex == 0 ? 30 : 20,
              fontWeight: FontWeight.w900,
            ),
            leading: cubit.currentIndex == 0
                ? null
                : IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: AppColor.black,
                    ),
                  ),
            centerTitle: cubit.currentIndex == 0 ? false : true,
            actions: [
              if (cubit.currentIndex == 0)
                IconButton(
                  padding: EdgeInsets.zero,
                  alignment: Alignment.center,
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notifications_outlined,
                    color: AppColor.black,
                    size: 25,
                  ),
                ),
              IconButton(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.zero,
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: AppColor.black,
                  size: 25,
                ),
              ),
              const SizedBox(width: 15),
            ],
          ),
          backgroundColor: AppColor.backgroundColor,
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: SizedBox(
            height: 55,
            child: Padding(
              padding: const EdgeInsets.only(top: 12),
              child: BottomNavigationBar(
                selectedFontSize: 0.0,
                unselectedFontSize: 0.0,
                selectedItemColor: AppColor.primaryColor,
                unselectedItemColor: AppColor.grey,
                backgroundColor: AppColor.backgroundColor,
                elevation: 0,
                onTap: (int index) {
                  cubit.changeNavIndex(index);
                },
                currentIndex: cubit.currentIndex,
                type: BottomNavigationBarType.fixed,
                items: [
                  _buildNavigationBarItem(
                    imageFill: Assets.imagesHomeFill,
                    image: Assets.imagesHome,
                    text: 'Home',
                  ),
                  _buildNavigationBarItem(
                    imageFill: Assets.imagesMenuFill,
                    image: Assets.imagesMenu,
                    text: 'Home',
                  ),
                  _buildNavigationBarItem(
                    imageFill: Assets.imagesShoppingCartFill,
                    image: Assets.imagesShoppingCart,
                    text: 'Bag',
                  ),
                  // _buildNavigationBarItem(
                  //   imageFill: 'bag_fill',
                  //   image: 'bag',
                  //   text: 'Bag',
                  // ),
                  _buildNavigationBarItem(
                    imageFill: Assets.imagesFavFill,
                    image: Assets.imagesFav,
                    text: 'Favorites',
                  ),
                  _buildNavigationBarItem(
                    imageFill: Assets.imagesAccountCircleFill,
                    image: Assets.imagesAccountCircle,
                    text: 'Profile',
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  BottomNavigationBarItem _buildNavigationBarItem({
    required String imageFill,
    required String image,
    required String text,
  }) {
    return BottomNavigationBarItem(
      backgroundColor: Colors.white,
      activeIcon: Column(
        children: [
          CustomPngImageWidget(
              imageName: imageFill,
              height: 18.h,
              width: 18.h,
              fit: BoxFit.contain,
              color: AppColor.primaryColor),
          SizedBox(
            height: 1.h,
          ),
          TextWidget(
            text: text,
            fontSize: 11.sp,
            color: AppColor.primaryColor,
          )
        ],
      ),
      icon: Column(
        children: [
          CustomPngImageWidget(
            imageName: image,
            height: 18.h,
            width: 18.h,
            fit: BoxFit.contain,
            color: AppColor.grey,
          ),
          SizedBox(
            height: 1.h,
          ),
          TextWidget(
            text: text,
            fontSize: 11.sp,
            fontWeight: FontWeight.normal,
            color: AppColor.grey,
          )
        ],
      ),
      label: "",
    );
  }
}
