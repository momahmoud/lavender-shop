import 'package:carousel_slider/carousel_slider.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:salla_shop/features/main_feature/models/banner_model.dart';

class SliderBannerWidget extends StatelessWidget {
  final List<BannerModel> banners;
  const SliderBannerWidget({Key? key, required this.banners}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: banners.length,
      itemBuilder: (context, index, realIndex) {
        return ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          child: ExtendedImage.network(
            banners[index].image,
            width: double.infinity,
            fit: BoxFit.fill,
            cache: true,

            //cancelToken: cancellationToken,
          ),
        );
      },
      options: CarouselOptions(
        height: 170,
        aspectRatio: 1,
        viewportFraction: .97,
        enlargeCenterPage: true,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 6),
      ),
    );
  }
}
