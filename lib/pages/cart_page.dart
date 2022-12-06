import 'package:flutter/material.dart';

class CartPae extends StatelessWidget {
  const CartPae({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Carrinho"),
      ),
    );
  }
}
