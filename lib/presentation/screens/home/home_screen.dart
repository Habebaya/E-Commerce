import 'package:ecommerce/business_logic/product_provider.dart';
import 'package:ecommerce/data/models/product_model.dart';
import 'package:ecommerce/presentation/screens/home/product_item.dart';
import 'package:ecommerce/presentation/screens/settings/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ProductProvider productProvider = ProductProvider();
  late Future future;

  // List<Product> _foundedProduct = [];

  @override
  void initState() {
    super.initState();
    productProvider.foundedProduct = productProvider.products;

    productProvider = Provider.of<ProductProvider>(context, listen: false);
    future = productProvider.getAllProduct();
  }

  Widget appBarTitle = const Text("Product");
  Icon actionIcon = const Icon(Icons.search);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: appBarTitle, actions: [
        IconButton(
          icon: actionIcon,
          onPressed: () {
            setState(() {
              if (actionIcon.icon == Icons.search) {
                actionIcon = const Icon(Icons.close);
                appBarTitle = TextField(
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search, color: Colors.white),
                    hintText: "Search...",
                  ),
                  onChanged: (value) => productProvider.runFilter(value),
                );
              } else {
                actionIcon = const Icon(Icons.search);
                appBarTitle = const Text("Product");
              }
            });
          },
        ),
        IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen()),
              );
            },
            icon: const Icon(Icons.settings)),
      ]),
      body: productProvider.foundedProduct.isEmpty
          ? FutureBuilder(
              future: future,
              builder: (c, s) {
                if (s.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 350,
                              crossAxisSpacing: 1,
                              mainAxisSpacing: 4,
                              childAspectRatio: 0.8),
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemCount:
                          Provider.of<ProductProvider>(context).products.length,
                      itemBuilder: (ctx, index) {
                        return ProductItem(
                          product: productProvider.products[index],
                        );
                      });
                }
              })
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 350,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 4,
                  childAspectRatio: 0.8),
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: productProvider.foundedProduct.length,
              itemBuilder: (ctx, index) {
                return ProductItem(
                  product: productProvider.foundedProduct[index],
                );
              }),
    );
  }
}
