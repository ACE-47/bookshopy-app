import 'package:bookshopy_app/screens/product_details/product_detail_screen.dart';
import 'package:flutter/material.dart';

import '../../provider/product.dart';

class FavoriteItem extends StatelessWidget {
  const FavoriteItem({super.key, required this.favoriteProduct});
  final Product favoriteProduct;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(
          ProductDetailScreen.routeName,
          arguments: favoriteProduct.id),
      child: SizedBox(
          child: Image.network(
              fit: BoxFit.fitHeight,
              'http://192.168.31.34:8000${favoriteProduct.imageUrl[0]['image']}')),
    );
  }
}
