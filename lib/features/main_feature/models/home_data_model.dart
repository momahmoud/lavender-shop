import 'package:salla_shop/features/main_feature/models/banner_model.dart';
import 'package:salla_shop/features/main_feature/models/product_model.dart';

class HomeDataModel {
  final bool status;
  final HomeSectionDataModel homeSectionDataModel;

  HomeDataModel({
    required this.status,
    required this.homeSectionDataModel,
  });

  factory HomeDataModel.fromJson(Map<String, dynamic> json) {
    return HomeDataModel(
      status: json['status'],
      homeSectionDataModel: HomeSectionDataModel.fromJson(json['data']),
    );
  }
}

class HomeSectionDataModel {
  final List<BannerModel> banners;
  final List<ProductModel> products;

  HomeSectionDataModel({
    required this.banners,
    required this.products,
  });

  factory HomeSectionDataModel.fromJson(Map<String, dynamic> json) {
    return HomeSectionDataModel(
      banners: List<BannerModel>.from(json['banners']
          .map<BannerModel>((banner) => BannerModel.fromJson(banner))),
      products: List<ProductModel>.from(json['products']
          .map<ProductModel>((product) => ProductModel.fromJson(product))),
    );
  }
}
