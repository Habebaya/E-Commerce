import 'package:ecommerce/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../business_logic/product_provider.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Product product;

  const ProductDetailsScreen({Key? key, required this.product})
      : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  ProductProvider productProvider = ProductProvider();
  late Future future;

  @override
  void initState() {
    super.initState();
    productProvider = Provider.of<ProductProvider>(context, listen: false);
    future = productProvider.getSingleProduct(widget.product.id!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,

        title: const Text("Product Details"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: widget.product.id.toString(),
                child: Container(
                  padding: EdgeInsets.only(top: 10),
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Image.network(
                    '${widget.product.image}',
                    fit: BoxFit.contain,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;

                      return Center(
                          child: Image.asset('assets/images/loading.gif'));
                    },
                    errorBuilder: (context, error, stackTrace) =>
                        Image.asset('assets/images/placeholder.jpeg'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  '${widget.product.title}',
                  style: const TextStyle(
                    height: 1.3,
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  textAlign: TextAlign.start,
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    'EGP ${widget.product.price}',
                    style: const TextStyle(
                      height: 1.3,
                      fontSize: 16,
                      color: Colors.red,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    textAlign: TextAlign.center,

                  ),
                ),
              ),
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.97,
                  child: ElevatedButton(

                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                    ),
                    child: const Text(
                      "Add To Cart",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {},
                  ),
                ),
              ),
             SizedBox(height: 10,),
             const Padding(
               padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 1),
                  child: Text(
                    "Description",
                    style: TextStyle(
                      height: 1.3,
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,

                    ),
                    textAlign: TextAlign.start,

                  ),
                ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 1),
                child: Text(
                  '${widget.product.description}',
                  style: const TextStyle(
                    height: 1.3,
                    fontSize: 16,
                    color: Colors.black54,
                    fontWeight: FontWeight.w600,

                  ),
                  textAlign: TextAlign.start,

                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03,)


            ],
          ),
        ),
      ),
    );
  }
}
