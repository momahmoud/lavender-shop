import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salla_shop/core/constant/color.dart';
import 'package:salla_shop/core/helper_widgets/text_widget.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        children: [
          const SizedBox(height: 20),
          // Material(
          //   color: AppColor.white,
          //   elevation: 0,
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         Container(
          //           alignment: Alignment.center,
          //           width: Get.width * .2,
          //           decoration: const BoxDecoration(
          //             border: Border(
          //               bottom: BorderSide(
          //                 color: AppColor.primaryColor,
          //                 width: 3,
          //               ),
          //             ),
          //           ),
          //           child: const TextWidget(
          //             text: 'Women',
          //           ),
          //         ),
          //         Container(
          //           width: Get.width * .2,
          //           alignment: Alignment.center,
          //           decoration: const BoxDecoration(
          //               // border: Border(
          //               //   bottom: BorderSide(
          //               //       color: AppColor.primaryColor, width: 3),
          //               // ),
          //               ),
          //           child: const TextWidget(
          //             text: 'Men',
          //           ),
          //         ),
          //         Container(
          //           alignment: Alignment.center,
          //           width: Get.width * .2,
          //           decoration: const BoxDecoration(
          //               // border: Border(
          //               //   bottom: BorderSide(
          //               //       color: AppColor.primaryColor, width: 3),
          //               // ),
          //               ),
          //           child: const TextWidget(
          //             text: 'Kids',
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          // const SizedBox(height: 20),
          Container(
            width: double.infinity,
            height: 110,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: AppColor.primaryColor.withOpacity(.87),
                borderRadius: BorderRadius.circular(15)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                TextWidget(
                  text: 'SUMMER SALES',
                  color: AppColor.white,
                  fontSize: 24,
                ),
                TextWidget(
                  text: 'Up to 50% off',
                  color: AppColor.white,
                  fontSize: 15,
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 7,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(bottom: 20),
                width: double.infinity,
                height: 110,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurStyle: BlurStyle.outer,
                        color: AppColor.grey.withOpacity(.2),
                        spreadRadius: 3,
                        blurRadius: 9,
                      )
                    ],
                    color: AppColor.white,
                    border: Border.all(style: BorderStyle.none),
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    TextWidget(
                      text: 'SUMMER SALES',
                      color: AppColor.white,
                      fontSize: 24,
                    ),
                    TextWidget(
                      text: 'Up to 50% off',
                      color: AppColor.white,
                      fontSize: 15,
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
