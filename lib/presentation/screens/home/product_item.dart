import 'package:ecommerce/data/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: double.infinity,
        padding: const EdgeInsetsDirectional.all(2),
        margin: EdgeInsets.only(top: 5, left: 5, right: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black54),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              child: Hero(
                tag: product.id.toString(),
                child: Container(
                  color: Colors.white,
                  child: Image.network(
                    '${product.image}',
                    fit: BoxFit.cover,
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
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(5),
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  Text(
                    '${product.title}',
                    style: const TextStyle(
                      height: 1.3,
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    '${product.price}',
                    style: const TextStyle(
                      height: 1.3,
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    textAlign: TextAlign.start,
                  ),                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

