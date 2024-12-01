import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 236, 236), // Set the background color
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align texts to the left
          children: <Widget>[
            // Heading
            Center(
              child: Text(
                'Unigrab',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Set the text color to black
                ),
              ),
            ),
            SizedBox(height: 16.0),
            // Search Bar
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search for your favourites!',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none, // Remove the border outline
                ),
                fillColor: const Color.fromARGB(255, 226, 225, 225), // Set the fill color to grey
                filled: true, // Enable filling the background color
              ),
            ),
            SizedBox(height: 16.0), // Add space between the search bar and the headings
            // Delicious Food Heading
            Text(
              'Delicious Food',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Set the text color to black
              ),
            ),
            SizedBox(height: 4.0),
            // What are you Cravin? Subheading
            Text(
              'What are you Cravin?',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey[600], // Set the text color to dark grey
              ),
            ),
            SizedBox(height: 16.0),
              // Cravin Items
              Container(
                height: 100.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    _buildCravinItem('Burger', 'burger.jpeg'),
                    _buildCravinItem('Pizza', 'pizza.jpeg'),
                    _buildCravinItem('Cold Coffee', 'cold_coffee.jpeg'),
                    _buildCravinItem('Wrap', 'wrap.jpeg'),
                    _buildCravinItem('Pasta', 'pasta.jpeg'),
                    _buildCravinItem('Ice Cream', 'ice_cream.jpeg'),
                    _buildCravinItem('Milkshakes', 'milkshakes.jpeg'),
                    _buildCravinItem('Juice', 'juice.jpeg'),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              // Canteen Section
              Text(
                'Canteens',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Set the text color to black
                ),
              ),
              SizedBox(height: 8.0),
              ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: <Widget>[
                  _buildCanteenItem('Canteen 1'),
                  _buildCanteenItem('Canteen 2'),
                  _buildCanteenItem('Canteen 3'),
                  _buildCanteenItem('Canteen 4'),
                ],
              ),
          ],
        ),
      ),
    );
  }
  Widget _buildCravinItem(String name, String asset) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: CircleAvatar(
              radius: 30.0,
              backgroundImage: AssetImage(asset),
            ),
          ),
          SizedBox(height: 8.0),
          Text(name),
        ],
      ),
    );
  }

  Widget _buildCanteenItem(String name) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(name),
        trailing: Icon(Icons.arrow_forward),
        onTap: () {
          // Handle canteen item tap
        },
      ),
    );
  }
}