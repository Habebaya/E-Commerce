import 'package:ecommerce/business_logic/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        title: Text("Settings"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Dark Mode",style: TextStyle(
                  fontSize: 18
                ),),
                IconButton(
                    onPressed: () {
                      Provider.of<SettingsProvider>(context, listen: false)
                          .changeTheme();
                      print(Provider.of<SettingsProvider>(context, listen: false)
                          .themeBool);
                    },
                    icon: Provider.of<SettingsProvider>(context, listen: false)
                            .themeBool
                        ? Icon(Icons.wb_sunny)
                        : Icon(Icons.nights_stay))
              ],
            ),
          )
        ],
      ),
    );
  }
}
