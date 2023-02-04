import 'package:flutter/material.dart';
import 'package:food_delivery_app_ui_bt/data/data.dart';
import 'package:food_delivery_app_ui_bt/models/order.dart';
class RecentOrders extends StatelessWidget {
  const RecentOrders({Key? key}) : super(key: key);
  // Function for showing recent orders in the UI
  _buildRecentOrder( BuildContext context, Order order){
    return Container(
      margin: const EdgeInsets.all(10.0),
      width: 320,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
          width: 1.0,
          color: Colors.grey.shade200,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child:  Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image(
                        fit: BoxFit.cover,
                        height: 100,
                        width: 100,
                        image: AssetImage(order!.food!.imageUrl!)),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(12.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(order.food!.name!, style: const TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),overflow: TextOverflow.ellipsis),
                          const SizedBox(height: 4.0,),
                          Text(order.restaurant!.name!,style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),overflow: TextOverflow.ellipsis),
                          const SizedBox(height: 4.0,),
                          Text(order.date!, style: const TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),overflow: TextOverflow.ellipsis),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
          ),


          Container(
            margin: const EdgeInsets.only(right: 20.0),
            width: 48,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: IconButton(
              icon: const Icon(Icons.add),
              iconSize: 30.0,
              color: Colors.white,
              onPressed: (){},
            ),
          ),
        ],
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    // to show the Text in the UI Recent Orders
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Text('Recent Orders', style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 24.0,
            letterSpacing: 1.2,

          ),),
        ),
        /* first we create a container then we make another container in the container
        and the scroll direcetion is horizontal
        * */
        Container(
          height: 120.0,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: currentUser.orders!.length,
              itemBuilder:(BuildContext context, int index){
                Order order = currentUser.orders![index];
                return _buildRecentOrder(context, order);
              }  ,
            ),
          ),
        ),
      ],
    );
  }
}
