import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPngImageWidget extends StatelessWidget {
  final String? imageName;
  final double? height;
  final double? width;
  final Color? color;
  final BoxFit? fit;
  const CustomPngImageWidget(
      {Key? key, this.imageName, this.height, this.width, this.color, this.fit})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/$imageName.png',
      height: height ?? 30.h,
      width: width ?? 30.w,
      fit: fit ?? BoxFit.fill,
      color: color,
    );
  }
}

// class CustomSvgImage extends StatelessWidget {
//   final String imageName;
//   final double height;
//   final double width;
//   final Color color;
//   final BoxFit fit;

//   CustomSvgImage(
//       {this.imageName, this.height, this.width, this.color, this.fit});
//   @override
//   Widget build(BuildContext context) {
//     return SvgPicture.asset(
//       'assets/svg/$imageName.svg',
//       color: color,
//       height: height ?? 30.h,
//       width: width ?? 30.w,
//       fit: fit ?? BoxFit.contain,
//     );
//   }
// }

// class CustomSvgImageNetwork extends StatelessWidget {
//   final String imageName;
//   final double height;
//   final double width;
//   final Color color;
//   final BoxFit fit;

//   CustomSvgImageNetwork(
//       {this.imageName, this.height, this.width, this.color, this.fit});
//   @override
//   Widget build(BuildContext context) {
//     return SvgPicture.network(
//       imageName,
//       color: color,
//       height: height ?? 30.h,
//       width: width ?? 30.w,
//       fit: fit ?? BoxFit.contain,
//     );
//   }
// }
