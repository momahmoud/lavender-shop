part of 'home_data_cubit.dart';

@immutable
abstract class HomeDataState {}

class HomeDataInitial extends HomeDataState {}

class HomeDataLoadingState extends HomeDataState {}

class HomeDataLoadedState extends HomeDataState {
  final HomeDataModel homeDataModel;

  HomeDataLoadedState({required this.homeDataModel});
}

class AllProductsLoadedState extends HomeDataState {
  final List<ProductModel> products;

  AllProductsLoadedState({required this.products});
}

class HomeDataErrorState extends HomeDataState {
  final String error;

  HomeDataErrorState(this.error);
}
