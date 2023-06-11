import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:shopping/Models/Item.dart';
import '../Providers/Cart_Provider.dart';

class Cart_Page extends StatefulWidget {
  const Cart_Page({super.key});

  @override
  State<Cart_Page> createState() => _Cart_PageState();
}

class _Cart_PageState extends State<Cart_Page> {
  @override
  Widget build(BuildContext context) {
    final CartData = Provider.of<Cart>(context).items;
    return Scaffold(
      appBar: AppBar(
        title:Text('Cart'),
            centerTitle: true,
        backgroundColor: Colors.black,
          actions: [
          ElevatedButton.icon(
          onPressed: (){ GoogleSignIn().signOut();
            Navigator.pushNamed(context, "/");
            },
        icon: Icon(Icons.logout_outlined),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
        ),
        label: Text('')
      ),
    ],
      ),
      body: Center(
        child:SingleChildScrollView(
          child: Column(
           children: [
             for (int i = 0; i < CartData.length; i++)
               ...[
                 Image.network(CartData.elementAt(i).img),
                 Text('Name: ${CartData.elementAt(i).name.toString()}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                 Text('Price: ${CartData.elementAt(i).price.toString()}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20) ),
                 ElevatedButton(
                   onPressed: ()=>context.read<Cart>().remove(CartData.elementAt(i).id.toString()),
                   child: Text('Remove'),
                   style: ElevatedButton.styleFrom(
                     backgroundColor: Colors.red,
                   ),
                 ),
              ]
           ],
          ),
        )
      ),
    );
  }
}
