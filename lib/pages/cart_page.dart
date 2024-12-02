import 'package:flutter/material.dart';
import '../components/checkout_nav.dart';

class CartPage extends StatefulWidget {
  final String canteenName;
  final Map<String, int> cartItems;
  final Map<String, double> itemPrices;

  CartPage({required this.canteenName, required this.cartItems, required this.itemPrices});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    double totalPrice = 0.0;
    int totalItems = 0;
    widget.cartItems.forEach((key, value) {
      totalPrice += value * widget.itemPrices[key]!;
      totalItems += value;
    });

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 246, 246), // Set the background color
      appBar: AppBar(
        backgroundColor: Colors.blue, // Set the AppBar color to match the theme
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Cart - ${widget.canteenName}'),
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
                itemCount: widget.cartItems.length,
                itemBuilder: (context, index) {
                  final itemName = widget.cartItems.keys.elementAt(index);
                  final itemQuantity = widget.cartItems[itemName]!;
                  final itemPrice = widget.itemPrices[itemName]!;

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
                                  '\$${(itemPrice * itemQuantity).toStringAsFixed(2)}',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.remove),
                                onPressed: () {
                                  setState(() {
                                    if (widget.cartItems[itemName]! > 0) {
                                      widget.cartItems[itemName] = widget.cartItems[itemName]! - 1;
                                    }
                                    if (widget.cartItems[itemName] == 0) {
                                      widget.cartItems.remove(itemName);
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
                                    widget.cartItems[itemName] = widget.cartItems[itemName]! + 1;
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
              SizedBox(height: 16.0),
              Text(
                'Total Price: \$${totalPrice.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Set the text color to black
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CheckoutNav(
        totalItems: totalItems,
        totalPrice: totalPrice,
        onOrderPressed: () {
          // Handle order button press
        },
      ),
    );
  }
}