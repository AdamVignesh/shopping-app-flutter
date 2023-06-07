import 'package:flutter/material.dart';
import 'package:shopping/Models/Item.dart';

import '../Screens/Item_Detail.dart';


class Item_Widget extends StatelessWidget {
  final Item Product;

  const Item_Widget(
      {super.key,
        required this.Product});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: 250,
        // height: 150,
        margin: EdgeInsets.all(30),
        color: Colors.amberAccent,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
        child: GridTile(
        child: GestureDetector(
        onTap: () {
        Navigator.pushNamed(context, "/Item_Detail", arguments: Product);
        },
          child: Image.network(Product.img),
        ),
        ),
        ),
      ),
    );
  }
}