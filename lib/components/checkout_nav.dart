import 'package:flutter/material.dart';

class CheckoutNav extends StatelessWidget {
  final int totalItems;
  final double totalPrice;
  final VoidCallback onOrderPressed;

  CheckoutNav({required this.totalItems, required this.totalPrice, required this.onOrderPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, -3), // changes position of shadow
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            '$totalItems items | \$${totalPrice.toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Confirm Order'),
                    content: Text('Do you want to confirm this order?'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Close the dialog
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.black, side: BorderSide(color: Colors.grey),
                        ),
                        child: Text('Cancel'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Close the dialog
                          onOrderPressed(); // Proceed with the order
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black, // Set the button color to green
                        ),
                        child: Text('Proceed'),
                      ),
                    ],
                  );
                },
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black, // Set the button color to black
            ),
            icon: Icon(Icons.arrow_forward, color: Colors.white),
            label: Text('Order', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}