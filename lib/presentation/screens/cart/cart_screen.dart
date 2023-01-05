import 'package:ecommerce/business_logic/cart_provider.dart';
import 'package:ecommerce/presentation/screens/checkout/checkout_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart_item.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  CartProvider cartProvider = CartProvider();
  late Future future;

  @override
  void initState() {
    super.initState();
    cartProvider = Provider.of<CartProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Cart"),
          centerTitle: true,
        ),
        body: cartProvider.cartProducts.isEmpty
            ? Center(child: Text("Cart is Empty"))
            : SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          itemCount: Provider.of<CartProvider>(context)
                              .cartProducts
                              .length,
                          itemBuilder: (ctx, index) {
                            return CartItem(
                              product: Provider.of<CartProvider>(context,
                                      listen: false)
                                  .cartProducts[index],
                            );
                          }),
                    ),
                    const Divider(
                      color: Colors.black54,
                      thickness: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Total price",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 18),
                          ),
                          Text(
                            "${Provider.of<CartProvider>(context).totalPrice.toInt()} EGP",
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 10),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black),
                        ),
                        child: const Text(
                          "CheckOut",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CheckoutScreen()),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ));
  }
}
