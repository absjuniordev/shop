import 'package:flutter/material.dart';
import 'package:shop/utils/app_routes.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: const Text('Olá malhado(a)!'),
            automaticallyImplyLeading: false,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.shop),
            title: const Text('Loja'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                AppRoutes.HOME,
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.shop),
            title: const Text('Pedidos'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                AppRoutes.ORDERS,
              );
            },
          ),
          const Divider(),
          const ListTile(
            title: Text("Sua loja de suplementos"),
            subtitle: Text("Fique gigante!!!"),
          ),
          const Divider(),
          const ListTile(
            leading: Icon(Icons.whatsapp),
            title: Text('Tel: (71) 99334-6500'),
          ),
          const Divider(),
          const ListTile(
            leading: Icon(Icons.web),
            title: Text('https://github.com/absjuniordev/'),
          ),
        ],
      ),
    );
  }
}
