import 'package:flutter/material.dart';
import 'cart_page.dart'; // Import the CartPage

class CanteenMenuPage extends StatefulWidget {
  final String canteenName;
  final List<Map<String, dynamic>> menuItems;

  CanteenMenuPage({required this.canteenName, required this.menuItems});

  @override
  _CanteenMenuPageState createState() => _CanteenMenuPageState();
}

class _CanteenMenuPageState extends State<CanteenMenuPage> {
  Map<String, int> itemQuantities = {};
  Map<String, double> itemPrices = {};

  @override
  void initState() {
    super.initState();
    widget.menuItems.forEach((item) {
      itemPrices[item['name']] = item['price'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 246, 246), // Set the background color
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(0, 33, 149, 243), // Set the AppBar color to match the theme
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.canteenName),
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartPage(
                      canteenName: widget.canteenName,
                      cartItems: itemQuantities,
                      itemPrices: itemPrices,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Align texts to the left
            children: <Widget>[
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: widget.menuItems.length,
                itemBuilder: (context, index) {
                  final item = widget.menuItems[index];
                  final itemName = item['name'];
                  final itemPrice = item['price'];
                  final itemQuantity = itemQuantities[itemName] ?? 0;

                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  itemName,
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black, // Set the text color to black
                                  ),
                                ),
                                SizedBox(height: 4.0),
                                Text(
                                  '\$${itemPrice.toStringAsFixed(2)}',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          itemQuantity == 0
                              ? ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      itemQuantities[itemName] = 1;
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black, // Set the button color to black
                                  ),
                                  child: Text('Add to Cart', style: TextStyle(color: Colors.white)),
                                )
                              : Row(
                                  children: <Widget>[
                                    IconButton(
                                      icon: Icon(Icons.remove),
                                      onPressed: () {
                                        setState(() {
                                          if (itemQuantities[itemName]! > 0) {
                                            itemQuantities[itemName] = itemQuantities[itemName]! - 1;
                                          }
                                          if (itemQuantities[itemName] == 0) {
                                            itemQuantities.remove(itemName);
                                          }
                                        });
                                      },
                                    ),
                                    Text(
                                      itemQuantity.toString(),
                                      style: TextStyle(fontSize: 18.0),
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.add),
                                      onPressed: () {
                                        setState(() {
                                          itemQuantities[itemName] = itemQuantities[itemName]! + 1;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}