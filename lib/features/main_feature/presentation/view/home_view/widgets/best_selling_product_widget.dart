import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:salla_shop/core/constant/color.dart';
import 'package:salla_shop/core/helper_widgets/text_widget.dart';
import 'package:salla_shop/features/main_feature/models/product_model.dart';

class BestSellingProductWidget extends StatelessWidget {
  final List<ProductModel> products;
  final bool? reverse;
  final String title;
  final String subtitle;
  const BestSellingProductWidget(
      {super.key,
      required this.products,
      this.reverse = false,
      required this.title,
      required this.subtitle});

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
              TextWidget(
                text: title,
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
          TextWidget(
            text: subtitle,
            fontSize: 12,
            fontWeight: FontWeight.w100,
            color: AppColor.grey,
          ),
          SizedBox(
            height: 300,
            child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              reverse: reverse!,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                final newPrice = products[index].price -
                    ((products[index].price / 100) *
                        products[index].discountPercentage);

                return SizedBox(
                  width: 170,
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: ExtendedImage.network(
                                  products[index].thumbnail!,
                                  fit: BoxFit.contain,
                                  cache: true,
                                  height: 210,
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            SizedBox(
                              height: 17,
                              child: RatingBar.builder(
                                initialRating:
                                    products[index].rating.toDouble(),
                                direction: Axis.vertical,
                                itemSize: 15,
                                itemCount: 5,
                                allowHalfRating: true,
                                itemBuilder: (context, _) => ImageIcon(
                                  AssetImage(
                                    products[index].rating != null
                                        ? 'assets/images/Star_fill.png'
                                        : 'assets/images/Star.png',
                                  ),
                                  size: 15,
                                  color: products[index].rating != null
                                      ? AppColor.yellow
                                      : AppColor.grey,
                                ),
                                itemPadding: const EdgeInsets.only(right: 4.0),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                            ),
                            // SizedBox(
                            //   height: 17,
                            //   child: ListView.builder(
                            //     shrinkWrap: true,
                            //     padding: EdgeInsets.zero,
                            //     scrollDirection: Axis.horizontal,
                            //     itemCount: 5,
                            //     itemBuilder: (context, index) {
                            //       return Padding(
                            //         padding: const EdgeInsets.only(right: 3),
                            //         child:
                            // ImageIcon(
                            //           AssetImage(products[index].rating != null
                            //               ? 'assets/images/Star_fill.png'
                            //               : 'assets/images/Star.png'),
                            //           size: 16,
                            //           color: products[index].rating != null
                            //               ? AppColor.yellow
                            //               : AppColor.grey,
                            //         ),
                            //       );
                            //     },
                            //   ),
                            // ),
                            const SizedBox(height: 3),
                            TextWidget(
                              text: products[index].brand!,
                              overflow: TextOverflow.ellipsis,
                              fontSize: 12,
                              color: AppColor.grey,
                              fontWeight: FontWeight.normal,
                            ),
                            TextWidget(
                              text: products[index].title!,
                              overflow: TextOverflow.ellipsis,
                              fontSize: 17,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                TextWidget(
                                  text:
                                      "\$${products[index].price.toStringAsFixed(0)}",
                                  overflow: TextOverflow.ellipsis,
                                  color: AppColor.grey,
                                  fontSize: 12,
                                  textDecoration: TextDecoration.lineThrough,
                                ),
                                const SizedBox(width: 4),
                                TextWidget(
                                  text: "\$${newPrice.toStringAsFixed(0)}",
                                  overflow: TextOverflow.ellipsis,
                                  color: AppColor.primaryColor,
                                  fontSize: 14,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 70,
                        right: 6,
                        child: SizedBox(
                          child: Material(
                            elevation: 10,
                            shadowColor: AppColor.white,
                            type: MaterialType.circle,
                            color: AppColor.white,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: ImageIcon(
                                AssetImage(products[index].inFavorites == null
                                    ? 'assets/images/heart_fill.png'
                                    : 'assets/images/heart.png'),
                                size: 35,
                                color: products[index].inFavorites == null
                                    ? AppColor.primaryColor
                                    : AppColor.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 10,
                        left: 10,
                        child: products[index].discountPercentage > 0
                            ? Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 3),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: AppColor.saleOrHot,
                                ),
                                child: TextWidget(
                                  text:
                                      "${products[index].discountPercentage}%",
                                  color: AppColor.white,
                                  fontSize: 11.5,
                                  textAlign: TextAlign.center,
                                ),
                              )
                            : Container(),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
