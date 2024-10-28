import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  ProductDetailScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.network(
                  product.imageUrl,
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 16),
              Text(
                product.name,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              SizedBox(height: 16),
              Text(
                '${product.price.toStringAsFixed(0)} ₽',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.green),
              ),
              SizedBox(height: 16),
              Text(
                product.description,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
