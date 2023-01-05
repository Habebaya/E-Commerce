import 'package:ecommerce/business_logic/cart_provider.dart';
import 'package:ecommerce/presentation/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckoutScreen extends StatefulWidget {
  CheckoutScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String paymentMethodValue = 'Cash';

  var paymentMethod = ['Cash', 'Credit card'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text(
                      "Enter shipping address",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2), //<-- SEE HERE
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2),
                        ),
                        hintText: "address ....",
                        fillColor: Colors.white),
                    style: TextStyle(fontSize: 18),
                    maxLines: 3,
                    minLines: 2,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Payment method",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                      DropdownButton(
                        // Initial Value
                        value: paymentMethodValue,

                        // Down Arrow Icon
                        icon: const Icon(Icons.keyboard_arrow_down),

                        // Array list of items
                        items: paymentMethod.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),

                        onChanged: (String? newValue) {
                          setState(() {
                            paymentMethodValue = newValue!;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                    ),
                    child: const Text(
                      "Checkout",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()),
                          (Route<dynamic> route) => false);
                      Provider.of<CartProvider>(context, listen: false)
                          .cartProducts
                          .clear();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
