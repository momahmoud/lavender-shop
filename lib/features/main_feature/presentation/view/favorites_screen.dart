import 'package:flutter/material.dart';
import 'package:salla_shop/core/helper_widgets/text_widget.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: TextWidget(
        text: 'favorites',
      ),
    );
  }

}