import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:shopping/Models/Item.dart';
import 'package:shopping/Providers/Cart_Provider.dart';


class Item_Detail extends StatefulWidget {

  @override
  State<Item_Detail> createState() => _Item_DetailState();
}
class _Item_DetailState extends State<Item_Detail> {

  @override
  Widget build(BuildContext context) {
    final Item arguments = ModalRoute.of(context)?.settings.arguments as Item;
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(arguments.name.toString()),
            backgroundColor: Colors.black,
            actions: [
              ElevatedButton.icon(
                  onPressed: (){ Navigator.pushNamed(context, "/Cart_Page");},
                  icon: Icon(Icons.shopping_cart),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                  ),
                  label: Text('')
              ),
              ElevatedButton.icon(
                  onPressed: (){GoogleSignIn().signOut();
                  Navigator.pushNamed(context, "/");
                  },
                  icon: Icon(Icons.logout_outlined),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                  ),
                  label: Text('')
              ),
            ],
            centerTitle: true,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  child: Image(image: NetworkImage(arguments.img.toString())),
              ),
              Text('Price: ${arguments.price.toString()}',style: TextStyle(fontWeight:FontWeight.bold ,fontSize: 25),),
              ElevatedButton(
                onPressed: ()=>context.read<Cart>().add(arguments),
                child: Text('Add to cart'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
              ),
            ],


        )
      )
    );
  }
}
//children[: Container(
//                 // height: 300,
//                 decoration: BoxDecoration(
//                     color:Colors.red,
//                     image: DecorationImage(
//                       image: NetworkImage(arguments.img.toString()),
//                     )
//                 ),
//                 child: Text(arguments.name.toString())),
//       ]
//           ),