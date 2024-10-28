import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';

class FavoritesScreen extends StatefulWidget {
  final List<Product> favoriteList;
  final Function(Product) onFavoriteToggle;

  FavoritesScreen({
    required this.favoriteList,
    required this.onFavoriteToggle,
  });

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Избранное'),
      ),
      body: widget.favoriteList.isEmpty
          ? Center(child: Text('Нет избранных товаров'))
          : GridView.builder(
        padding: EdgeInsets.all(8.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
        ),
        itemCount: widget.favoriteList.length,
        itemBuilder: (context, index) {
          final product = widget.favoriteList[index];
          return ProductCard(
            product: product,
            isFavorite: true,
            onFavoriteToggle: () {
              setState(() {
                widget.onFavoriteToggle(product);
              });
            },
          );
        },
      ),
    );
  }
}
