import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:meta/meta.dart';
import 'package:salla_shop/core/constant/endpoints_consts.dart';
import 'package:salla_shop/core/helpers_classes/dio_helper.dart';
import 'package:salla_shop/features/main_feature/models/home_data_model.dart';
import 'package:salla_shop/features/main_feature/models/product_model.dart';

import '../../../../core/enums/enum_toast_states.dart';
import '../../../../core/helper_widgets/toast_messages.dart';

part 'home_data_state.dart';

class HomeDataCubit extends Cubit<HomeDataState> {
  HomeDataCubit() : super(HomeDataInitial());

  static HomeDataCubit get(context) => BlocProvider.of(context);
  final pagingController = PagingController<int, ProductModel>(firstPageKey: 1);

  HomeDataModel? homeDataModel;
  List<ProductModel> products = [];

  void getHomeData(String token) {
    emit(HomeDataLoadingState());
    DioHelper.getData(url: homeEndPoint, token: token, lang: 'en')
        .then((value) {
      homeDataModel = HomeDataModel.fromJson(value.data);
      emit(HomeDataLoadedState(homeDataModel: homeDataModel!));
    }).catchError((error) {
      print(error);
      emit(HomeDataErrorState(error));
      ToastMessages.showToastMessage(msg: error, state: ToastStates.ERROR);

      throw error;
    });
  }

  getAllProducts() async {
    emit(HomeDataLoadingState());
    await DioHelper.getData(
        url: dummyProductsEndPoint,
        baseUrl: dummyBaseUrl,
        query: {
          "limit": 50,
          "skip": 18,
        }).then((value) {
      products = List<ProductModel>.from(
        value.data['products'].map<ProductModel>(
          (product) => ProductModel.fromJson(product),
        ),
      );
      emit(AllProductsLoadedState(products: products));
    }).catchError((error) {
      emit(HomeDataErrorState(error));
      print(error);
      throw error;
    });
  }

  @override
  void onChange(Change<HomeDataState> change) {
    print(change);
    super.onChange(change);
  }
}
