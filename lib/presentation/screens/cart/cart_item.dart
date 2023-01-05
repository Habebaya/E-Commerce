import 'package:ecommerce/business_logic/cart_provider.dart';
import 'package:ecommerce/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  final Product product;

  const CartItem({Key? key, required this.product}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsetsDirectional.all(2),
      margin: EdgeInsets.only(top: 5, left: 5, right: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black54),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(

        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.13,
            padding: EdgeInsets.all(5),
            color: Colors.white,
            child: Image.network(
              '${product.image}',
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
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.5,
              padding: const EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${product.title}',
                    style: const TextStyle(
                      height: 1.2,
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'EGP ${product.price}',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    textAlign: TextAlign.start,
                  ),
                  Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),

                          child:  ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.black),
                            ),
                            child:const  Text(
                              "Remove",
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () async {
                              Provider.of<CartProvider>(context,listen: false).removeFromCart(product);




                            },
                          ),)),
                ],
              ),

            ),
          ),

        ],
      ),
    );
  }
}
