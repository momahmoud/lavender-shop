import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salla_shop/core/constant/color.dart';
import 'package:salla_shop/core/helper_widgets/custom_image_widget.dart';
import 'package:salla_shop/core/helper_widgets/text_widget.dart';

import '../../../../core/dummy/dummy_data.dart';


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
            itemCount: images.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: (){

                  Get.bottomSheet(
                 Container(
                   height: Get.height,
                   padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                   child: ListView.separated(
                     separatorBuilder: (context, index) => const Divider(
                       height: 20),

                     itemCount: clothesCats.length ,
                     itemBuilder: (context, index) {
                     return  TextWidget(
                       text: clothesCats[index],
                       color: AppColor.black.withOpacity(.7),
                       fontSize: 16,
                       fontWeight: FontWeight.normal,

                     );
                   },),
                 ),
                    backgroundColor: AppColor.white,
                    elevation: 0,
                    barrierColor: AppColor.white.withOpacity(.3),
                    ignoreSafeArea: false,
                    


                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(15),
                    child: SizedBox(
                      width: double.infinity,
                      height: 120,
                      child: Padding(
                        padding: const EdgeInsets.only(left:15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:  [
                             TextWidget(
                              text: cats[index],
                              color: AppColor.black,
                              fontSize: 20,

                            ),
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(15),
                                bottomRight: Radius.circular(15)
                              ),
                              child: CustomPngImageWidget(
                                imageName: images[index],
                                width: Get.width/2,
                                height: Get.height * .9,
                              ),
                            )

                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }

}
