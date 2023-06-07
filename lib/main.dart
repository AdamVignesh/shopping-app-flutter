import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/Models/Item.dart';
import 'package:shopping/Screens/Cart_Page.dart';

import './Screens/Item_Detail.dart';
import './Screens/Cart_Page.dart';
import './Widgets/Item_Widget.dart';
import './Providers/Cart_Provider.dart';

void main()
{
  runApp(
      ChangeNotifierProvider(
          create: (context)=>Cart(),
          child: MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "CarTex",
      routes: {
        "/":(context)=> HomePage(),
        "/Item_Detail":(context) => Item_Detail(),
        "/Cart_Page":(context)=>Cart_Page(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Column(
          children:[
            AppBar(
              title: Text('CarTex'),
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
              ],
              centerTitle: true,
            ),

                Item_Widget(Product:Item(id: 'A1', name:'soap', price: 34, img: "https://5.imimg.com/data5/LW/GN/MY-4990337/bath-soap-500x500.jpg")),
                ElevatedButton(
                  onPressed: ()=>context.read<Cart>().add(Item(id: 'A1', name:'soap', price: 34, img: "https://5.imimg.com/data5/LW/GN/MY-4990337/bath-soap-500x500.jpg")),
                  child: Text('Add to cart'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                ),
                Item_Widget(Product:Item(id: 'A2', name:'soap', price: 34, img: "https://media.istockphoto.com/id/505574760/vector/pink-bar-of-soap-3d-isometric-icon.jpg?s=612x612&w=0&k=20&c=1S2_3_WlTs5plf4y5-zY7Ss3Vcvq8ghxzgPLf7sUh7w=")),
                ElevatedButton(
                  onPressed: ()=>context.read<Cart>().add(Item(id: 'A2', name:'soap', price: 34, img: "https://media.istockphoto.com/id/505574760/vector/pink-bar-of-soap-3d-isometric-icon.jpg?s=612x612&w=0&k=20&c=1S2_3_WlTs5plf4y5-zY7Ss3Vcvq8ghxzgPLf7sUh7w=")),
                  child: Text('Add to cart'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                ),

                Item_Widget(Product:Item(id: 'A3', name:'soap', price: 34, img: "https://m.economictimes.com/thumb/height-450,width-600,imgsize-35868,msid-96714687/best-soaps-for-men-in-india-.jpg")),
                ElevatedButton(
                  onPressed: ()=>context.read<Cart>().add(Item(id: 'A3', name:'soap', price: 34, img: "https://m.economictimes.com/thumb/height-450,width-600,imgsize-35868,msid-96714687/best-soaps-for-men-in-india-.jpg")),
                  child: Text('Add to cart'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                ),
                Item_Widget(Product:Item(id: 'A4', name:'soap', price: 34, img: "https://media.istockphoto.com/id/956733810/vector/soap-flat-design-beauty-icon-with-side-shadow.jpg?s=612x612&w=0&k=20&c=Zrls6FRUtMyXNQxIsoX5FWRghm-p9l20u_YyUF8AmuY=")),
                ElevatedButton(
                  onPressed: ()=>context.read<Cart>().add(Item(id: 'A4', name:'soap', price: 34, img: "https://media.istockphoto.com/id/505574760/vector/pink-bar-of-soap-3d-isometric-icon.jpg?s=612x612&w=0&k=20&c=1S2_3_WlTs5plf4y5-zY7Ss3Vcvq8ghxzgPLf7sUh7w=")),
                  child: Text('Add to cart'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                ),
                Item_Widget(Product:Item(id: 'A5', name:'soap', price: 34, img: "https://www.naturesdestiny.in/wp-content/uploads/2020/04/coconut-milk.jpg")),
                ElevatedButton(
                  onPressed: ()=>context.read<Cart>().add(Item(id: 'A5', name:'soap', price: 34, img: "https://www.naturesdestiny.in/wp-content/uploads/2020/04/coconut-milk.jpg")),
                  child: Text('Add to cart'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                ),
          ],
        ),
      )
    );
  }
}

