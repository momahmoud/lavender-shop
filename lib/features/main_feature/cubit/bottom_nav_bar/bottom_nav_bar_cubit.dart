import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:salla_shop/features/cart/presentation/view/cart_screen.dart';
import 'package:salla_shop/features/main_feature/presentation/view/categories_screen.dart';
import 'package:salla_shop/features/main_feature/presentation/view/favorites_screen.dart';
import 'package:salla_shop/features/main_feature/presentation/view/home_view/home_screen.dart';
import 'package:salla_shop/features/main_feature/presentation/view/settings_screen.dart';

part 'bottom_nav_bar_state.dart';

class BottomNavBarCubit extends Cubit<BottomNavBarState> {
  BottomNavBarCubit() : super(BottomNavBarInitial());

  static BottomNavBarCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> screens = [
    const HomeScreen(),
    const CategoriesScreen(),
    const CartScreen(),
    const FavoritesScreen(),
    const SettingsScreen(),
  ];

  void changeNavIndex(int index) {
    currentIndex = index;
    emit(ChangeBottomNavBarState());
  }
}
