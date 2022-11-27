import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import 'package:salla_shop/features/main_feature/models/product_model.dart';

import '../../../../../../core/constant/color.dart';
import '../../../../../../core/helper_widgets/text_widget.dart';

class AllProductsGrid extends StatelessWidget {
  final List<ProductModel> products;
  const AllProductsGrid({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 15, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const TextWidget(
                text: 'Hot',
                fontSize: 25,
                fontWeight: FontWeight.w900,
              ),
              Row(
                children: const [
                  TextWidget(
                    text: 'View all',
                    color: AppColor.black,
                    fontSize: 12,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 13,
                    color: AppColor.black,
                  ),
                ],
              ),
            ],
          ),
          const TextWidget(
            text: 'You\'ve never seen it before!',
            fontSize: 12,
            fontWeight: FontWeight.w100,
            color: AppColor.grey,
          ),
          GridView.custom(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding:
                const EdgeInsets.only(left: 5, top: 5, bottom: 10, right: 5),
            gridDelegate: SliverStairedGridDelegate(
              crossAxisSpacing: 5,
              mainAxisSpacing: 20,
              startCrossAxisDirectionReversed: true,
              pattern: [
                const StairedGridTile(1.0, 5 / 3.3),
                const StairedGridTile(0.52, 1 / 1.3),
                const StairedGridTile(0.48, 3 / 4.5),
              ],
            ),
            childrenDelegate: SliverChildBuilderDelegate(
              (context, index) => SizedBox(
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 5,
                  margin: EdgeInsets.zero,
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: ExtendedImage.network(
                                  products[index].image!,
                                  fit: BoxFit.contain,
                                  cache: true,
                                  height: Get.height * .19,
                                  width: Get.width,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4, left: 6),
                              child: TextWidget(
                                text: products[index].name!,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 6),
                              child: TextWidget(
                                text: "\$${products[index].price}",
                                overflow: TextOverflow.ellipsis,
                                color: AppColor.primaryColor,
                                fontSize: 15,
                              ),
                            ),
                            if (products[index].price <
                                products[index].oldPrice)
                              Padding(
                                padding: const EdgeInsets.only(left: 6),
                                child: TextWidget(
                                  text: "\$${products[index].oldPrice}",
                                  overflow: TextOverflow.ellipsis,
                                  color: AppColor.grey,
                                  fontSize: 13,
                                  textDecoration: TextDecoration.lineThrough,
                                ),
                              ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        right: 6,
                        child: SizedBox(
                          child: Material(
                            borderRadius: BorderRadius.circular(10),
                            elevation: 10,
                            type: MaterialType.card,
                            shadowColor: products[index].inCart == null
                                ? AppColor.primaryColor.withOpacity(.2)
                                : AppColor.backgroundColor,
                            color: products[index].inCart == null
                                ? AppColor.primaryColor.withOpacity(.5)
                                : AppColor.backgroundColor,
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.add_shopping_cart_rounded,
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        left: 0,
                        child: SizedBox(
                          child: Material(
                            borderRadius: BorderRadius.circular(10),
                            elevation: 10,
                            type: MaterialType.card,
                            shadowColor: AppColor.backgroundColor,
                            color: AppColor.backgroundColor.withOpacity(.5),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Icon(
                                Icons.favorite_rounded,
                                size: 30,
                                color: products[index].inFavorites == null
                                    ? Colors.red
                                    : AppColor.grey,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              childCount: products.length,
            ),
          ),
        ],
      ),
    );
  }
}
