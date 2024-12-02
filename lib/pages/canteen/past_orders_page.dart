import 'package:flutter/material.dart';

class PastOrdersPage extends StatelessWidget {
  static List<Map<String, dynamic>> completedOrders = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Past Orders'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: completedOrders.length,
        itemBuilder: (context, index) {
          final order = completedOrders[index];
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
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}