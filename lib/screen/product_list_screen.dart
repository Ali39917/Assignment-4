import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/product_tile.dart';
import 'product_detail_screen.dart';

class ProductListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Product> products = [
      Product(
        name: 'IPhone 12 JV',
        image: 'assets/images/images1.jpg',
        price: 65000,
        description: '100% Battery Health And Water Pack.',
        colors: ['Red', 'Blue', 'Black'], // Added colors
      ),
      Product(
        name: 'Samsung A33',
        image: 'assets/images/images2.jpeg',
        price: 55000,
        description: 'Samsung A33 Brand New Mobile',
        colors: ['White', 'Blue'], // Added colors
      ),
      Product(
        name: 'Samsung S24 Ultra',
        image: 'assets/images/images3.jpeg',
        price: 300000,
        description: 'Samsung S24 Ultra Pta Approved',
        colors: ['Green', 'Black', 'Gold'], // Added colors
      ),
      Product(
        name: 'Iphone 13 Pro Max',
        image: 'assets/images/image4.png',
        price: 150000,
        description: 'Iphone 13 Pro Max Pta Approved',
        colors: ['Silver', 'Graphite', 'Sierra Blue'], // Added colors
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/B1.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  Product product = products[index];
                  return ProductTile(
                    product: product,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailScreen(product: product),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
