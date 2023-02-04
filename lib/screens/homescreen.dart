import 'package:flutter/material.dart';
import 'package:food_delivery_app_ui_bt/data/data.dart';
import 'package:food_delivery_app_ui_bt/widgets/nearby_restaurent.dart';
import 'package:food_delivery_app_ui_bt/widgets/recent_orders.dart';

import 'cart_Screen.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        actions: [
          TextButton(
            child: Text('Cart (${currentUser.cart?.length})',
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                fontSize: 10,
                color: Colors.white
              ),),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=> CartScreen(),),);
            },
          ),
        ],
        title: const Text('Food Delivery App'),
        leading: IconButton(
          icon: const Icon(Icons.account_circle),
          iconSize: 30.0,
          onPressed: (){},

        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                 borderSide: const BorderSide(width: 0.8),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: const BorderSide(width: 0.8,
                  color: Colors.orange,
                  ),
                ),
                hintText: 'Search Food or Restaurent',
                prefixIcon: const Icon(
                  Icons.search,
                  size: 30.0,
                ),
                suffixIcon: IconButton(
                  icon: const Icon(
                    Icons.clear,

                  ),
                  onPressed: (){},
                ),
              ),
            ),
          ),
          const RecentOrders(),
          NearByRestaurants(),
        ],
      ),
    );
  }
}
