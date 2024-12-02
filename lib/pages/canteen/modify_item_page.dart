import 'package:flutter/material.dart';

class ModifyItemPage extends StatefulWidget {
  @override
  _ModifyItemPageState createState() => _ModifyItemPageState();
}

class _ModifyItemPageState extends State<ModifyItemPage> {
  List<Map<String, dynamic>> items = [
    {'name': 'Burger', 'price': 5.99, 'inStock': true},
    {'name': 'Pizza', 'price': 8.99, 'inStock': true},
    {'name': 'Cold Coffee', 'price': 3.99, 'inStock': true},
    {'name': 'Wrap', 'price': 4.99, 'inStock': true},
    {'name': 'Pasta', 'price': 7.99, 'inStock': true},
    {'name': 'Ice Cream', 'price': 2.99, 'inStock': true},
    {'name': 'Milkshakes', 'price': 4.49, 'inStock': true},
    {'name': 'Juice', 'price': 2.49, 'inStock': true},
  ];

  void _editItem(int index) {
    // Handle edit item logic here
  }

  void _markAsOutOfStock(int index) {
    setState(() {
      items[index]['inStock'] = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Modify Items'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
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
                          item['name'],
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          '\$${item['price'].toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.grey[600],
                          ),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          item['inStock'] ? 'In Stock' : 'Out of Stock',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: item['inStock'] ? Colors.green : Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => _editItem(index),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Set the button color to blue
                    ),
                    child: Text('Edit'),
                  ),
                  SizedBox(width: 8.0),
                  ElevatedButton(
                    onPressed: () => _markAsOutOfStock(index),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red, // Set the button color to red
                    ),
                    child: Text('Out of Stock'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}