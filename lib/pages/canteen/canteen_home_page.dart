import 'package:app/pages/canteen/past_orders_page.dart';
import 'package:flutter/material.dart';
import '../../components/canteen_nav.dart';

class CanteenHomePage extends StatefulWidget {
  @override
  _CanteenHomePageState createState() => _CanteenHomePageState();
}

class _CanteenHomePageState extends State<CanteenHomePage> {
  List<Map<String, dynamic>> orders = [
    {
      'orderId': '12345',
      'orderNumber': '001',
      'items': [
        {'name': 'Burger', 'quantity': 2},
        {'name': 'Pizza', 'quantity': 1},
      ],
    },
    {
      'orderId': '12346',
      'orderNumber': '002',
      'items': [
        {'name': 'Cold Coffee', 'quantity': 3},
        {'name': 'Wrap', 'quantity': 2},
      ],
    },
  ];

  void _markOrderComplete(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Mark Order Complete'),
          content: Text('Are you sure you want to mark this order as complete?'),
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
                setState(() {
                  PastOrdersPage.completedOrders.add(orders[index]);
                  orders.removeAt(index);
                });
                Navigator.of(context).pop(); // Close the dialog
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Set the button color to green
              ),
              child: Text('Proceed'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Canteen Home'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Order Number: ${order['orderNumber']}',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    'Order ID: ${order['orderId']}',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Items:',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ...order['items'].map<Widget>((item) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Text(
                        '${item['name']} x${item['quantity']}',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                        ),
                      ),
                    );
                  }).toList(),
                  SizedBox(height: 8.0),
                  ElevatedButton(
                    onPressed: () => _markOrderComplete(index),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red, // Set the button color to red
                    ),
                    child: Text('Mark as Complete'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: CanteenNav(), // Add the CanteenNav component
    );
  }
}