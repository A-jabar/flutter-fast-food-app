import 'package:flutter/material.dart';
import 'foodDetailPag.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String , dynamic>> foodItems = [
    {'name': 'cheeseburger', 'image': 'purger1.jpg', 'price': 3},
    {'name': 'burger', 'image': 'purger2.jpg', 'price': 4}
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('FoodGo'),
      ),
      body: GridView.builder(
        itemCount: foodItems.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (Context ,index) {
          final item = foodItems[index];
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => FoodDetailPage(
                    foodName: item['name'],
                    foodPrice: item['price'],
                    foodImage: item['image']

                  )
              ),
            ),
            child: Card(
              child: Column(
                children: [
                  Image.asset(item['image']),
                  Text(item['name']),
                  Text('\$${item['price']}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

}