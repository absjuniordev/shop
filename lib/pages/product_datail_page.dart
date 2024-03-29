import 'package:flutter/material.dart';
import 'package:shop/model/provider/product.dart';

class ProductDatailPage extends StatelessWidget {
  const ProductDatailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Product product =
        ModalRoute.of(context)!.settings.arguments as Product;
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'R\$ ${product.price.toStringAsFixed(2)}',
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text(
                textAlign: TextAlign.center,
                product.description,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
