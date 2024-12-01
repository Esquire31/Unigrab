import 'package:flutter/material.dart';
import '../util/unigrabTheme.dart'; // Import the theme file

class OrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryBackgroundColor, // Set the background color
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align texts to the left
          children: <Widget>[
            // Heading
            Center(
              child: Text(
                'Your Orders',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Set the text color to black
                ),
              ),
            ),
            SizedBox(height: 16.0),
            // Orders List
            Expanded(
              child: ListView(
                children: <Widget>[
                  _buildOrderItem('Order 1', 'assets/burger.jpeg', 15.99, 'Delivered'),
                  _buildOrderItem('Order 2', 'assets/pizza.jpeg', 12.99, 'In Progress'),
                  _buildOrderItem('Order 3', 'assets/cold_coffee.jpeg', 5.99, 'Cancelled'),
                  _buildOrderItem('Order 4', 'assets/wrap.jpeg', 8.99, 'Delivered'),
                  _buildOrderItem('Order 5', 'assets/pasta.jpeg', 10.99, 'In Progress'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderItem(String name, String imageAsset, double price, String status) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: <Widget>[
            Image.asset(
              imageAsset,
              height: 60.0,
              width: 60.0,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black, // Set the text color to black
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    '\$$price',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    status,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: status == 'Delivered'
                          ? Colors.green
                          : status == 'In Progress'
                              ? Colors.orange
                              : Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}