import 'package:flutter/material.dart';

class FoodDetailPage extends StatefulWidget {
  final String foodName;
  final double foodPrice;
  final String foodImage;

  FoodDetailPage({
    required this.foodName,
    required this.foodPrice,
    required this.foodImage,

});
  @override
  _FoodDetailPageState createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  late double totalPrice;
  Map<String , bool> toppings ={
    'Yaanyo': false,
    'Basal': false,
    'Qajaar': false,
    'Ukun': false,
  };

  @override
  void initState() {
    super.initState();
    totalPrice = widget.foodPrice;
  }

  void updatePrice(String topping, bool isAdded) {
    setState(() {
      toppings[topping] = isAdded;
      if (isAdded) {
        totalPrice +=1.0;
      }
      else{
        totalPrice -=1.0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.foodName),
      ),
      body: Column(
        children: [
          Image.asset(widget.foodImage),
          Text("Customize your burger"),

          ...toppings.keys.map((topping) => CheckboxListTile(
            title: Text(topping),
            value: toppings[topping],
            onChanged:  (bool? value) {
              if (value != null) {
                updatePrice(topping, value);
              }
            },
          )),
          Spacer(),
          Text("Total:\$${totalPrice.toStringAsFixed(2)}"),
          ElevatedButton(
            onPressed: () {
              print("Your order is on the way ");
            },
            child: Text('Order Now'),
          ),

        ],
      ),
    );
  }
}