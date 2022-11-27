import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:salla_shop/core/constant/color.dart';
import 'package:salla_shop/core/helper_widgets/custom_button.dart';
import 'package:salla_shop/core/helper_widgets/text_widget.dart';

import 'package:salla_shop/features/main_feature/cubit/home_data/home_data_cubit.dart';
import 'package:salla_shop/features/main_feature/presentation/view/home_view/widgets/all_poducts_grid.dart';
import 'package:salla_shop/features/main_feature/presentation/view/home_view/widgets/best_selling_product_widget.dart';
import 'package:salla_shop/features/main_feature/presentation/view/home_view/widgets/slider_banner_widget.dart';

import '../../../../../main.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = HomeDataCubit.get(context);
    cubit.getAllProducts();
    cubit.getHomeData(token);
    return BlocBuilder<HomeDataCubit, HomeDataState>(
      builder: (context, state) {
        if (cubit.homeDataModel == null) {
          return Center(
            child: Column(
              children: [
                Image.asset("assets/images/eyes.gif"),
                SpinKitFadingFour(
                  // color: AppColor.success,

                  itemBuilder: (BuildContext context, int index) {
                    return DecoratedBox(
                      decoration: BoxDecoration(
                        color: index.isEven ? Colors.red : Colors.green,
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        } else if (cubit.homeDataModel != null) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                SliderBannerWidget(
                  banners: cubit.homeDataModel!.homeSectionDataModel.banners,
                ),
                BestSellingProductWidget(
                  title: 'Sale',
                  subtitle: 'Super summer sale',
                  products: cubit.products.reversed.toList(),
                ),
                BestSellingProductWidget(
                  title: "New",
                  subtitle: "You've never seen it before",
                  products: cubit.products,
                ),
                AllProductsGrid(
                  products: cubit.homeDataModel!.homeSectionDataModel.products,
                ),
              ],
            ),
          );
        } else if (state is HomeDataErrorState && cubit.homeDataModel == null) {
          return Center(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image.asset("assets/images/loudly_crying_face.gif"),
              const TextWidget(
                text: "😒",
                fontSize: 30,
              ),
              TextWidget(text: state.error),
              CustomButton(
                  title: 'Try Again',
                  onPressed: () {
                    cubit.getHomeData(token);
                  },
                  btnColor: AppColor.primaryColor,
                  txtColor: AppColor.backgroundColor,
                  fontSize: 20),
            ],
          ));
        }
        return Center(
          child: Column(
            children: [
              Image.asset("assets/images/eyes.gif"),
              SpinKitFadingFour(
                // color: AppColor.success,

                itemBuilder: (BuildContext context, int index) {
                  return DecoratedBox(
                    decoration: BoxDecoration(
                      color: index.isEven ? Colors.red : Colors.green,
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
