



import 'package:flutter/material.dart';
import 'package:food_delivery_app_ui_bt/data/data.dart';
import 'package:food_delivery_app_ui_bt/models/restaurant.dart';
import 'package:food_delivery_app_ui_bt/widgets/rating_star.dart';

import '../screens/rest_Screen.dart';

class NearByRestaurants extends StatelessWidget {
  const NearByRestaurants({Key? key}) : super(key: key);
  _buildRestaurents(context) {
    List<Widget> restaurantList = [];
    restaurants.forEach((Restaurant restaurant) {
      restaurantList.add(
        GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                MaterialPageRoute(builder: (context) =>  RestaurantScreen(restaurant: restaurant)),
              );
            },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(width: 1.0, color: Colors.grey.shade200)),
            child: Row(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Hero(
                      tag: restaurant.imageUrl!,
                      child: Image(
                        height: 150.0,
                        width: 150.0,
                        image: AssetImage(restaurant.imageUrl!),
                        fit: BoxFit.cover,
                      ),
                    )),
                Container(
                  margin: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        restaurant.name!,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.0),
                        overflow: TextOverflow.ellipsis,
                      ),
                      RatingStars(restaurant.rating!),
                      const SizedBox(
                        height: 4.0,
                      ),
                      Text(
                        restaurant.address!,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16.0,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 4.0,
                      ),
                      const Text(
                        '0.2 miles Away',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 16.0),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
    return Column(
      children: restaurantList,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'Near Restaurants',
              style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2),
            )),
        _buildRestaurents(context),
      ],
    );
  }
}
