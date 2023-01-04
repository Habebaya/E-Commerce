import 'package:ecommerce/business_logic/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ProductProvider productProvider = ProductProvider();
 late  Future future;
  @override
  void initState() {
    super.initState();
    productProvider = Provider.of<ProductProvider>(context, listen: false);
    future = productProvider.getAllProduct();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Products"),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: FutureBuilder(
            future: future,
            builder: (c, s) {
              if (s.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return GridView.builder(
                    gridDelegate:
                    const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 300,
                        crossAxisSpacing: 0.5,
                        mainAxisSpacing: 1,
                        childAspectRatio: 0.8),
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: Provider.of<ProductProvider>(context).products.length,
                    itemBuilder: (ctx, index) {
                      return Text(productProvider.products[index].title!);
                    });
              }
            }));

  }
}
