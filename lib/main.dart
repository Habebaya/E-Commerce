import 'package:device_preview/device_preview.dart';
import 'package:ecommerce/business_logic/product_provider.dart';
import 'package:ecommerce/presentation/screens/home/home_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
          create: (BuildContext context) => ProductProvider()),
    ],
    child: DevicePreview(
      builder: (BuildContext context) => const MyApp(),
      enabled: !kReleaseMode,
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen());
  }
}
