import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';
import 'add_product_screen.dart';

class HomeScreen extends StatefulWidget {
  final List<Product> productList;
  final List<Product> favoriteList;
  final Function(Product) onFavoriteToggle;

  HomeScreen({
    required this.productList,
    required this.favoriteList,
    required this.onFavoriteToggle,
  });

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Магазин'),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(8.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
        ),
        itemCount: widget.productList.length,
        itemBuilder: (context, index) {
          final product = widget.productList[index];
          return ProductCard(
            product: product,
            isFavorite: widget.favoriteList.contains(product),
            onFavoriteToggle: () {
              setState(() {
                widget.onFavoriteToggle(product);
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newProduct = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddProductScreen(),
            ),
          );
          if (newProduct != null) {
            setState(() {
              widget.productList.add(newProduct);
            });
          }
        },
        child: Icon(Icons.add),
        tooltip: 'Добавить товар',
      ),
    );
  }
}
