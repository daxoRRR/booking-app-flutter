import 'package:flutter/material.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(itemBuilder: (context, index) {
        return ListTile(
          title: Text('ShopPage')
        );
      }),
    );
  }
}