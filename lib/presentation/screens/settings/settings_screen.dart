import 'package:ecommerce/business_logic/settings_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../cart/cart_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Dark Mode",
                  style: TextStyle(fontSize: 18),
                ),
                IconButton(
                    onPressed: () {
                      Provider.of<SettingsProvider>(context, listen: false)
                          .changeTheme();
                    },
                    icon: Provider.of<SettingsProvider>(context, listen: false)
                            .themeBool
                        ? const Icon(Icons.wb_sunny)
                        : const Icon(Icons.nights_stay))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CartScreen()),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Cart",
                    style: TextStyle(fontSize: 18),
                  ),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.shopping_cart))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
