import 'package:flutter/material.dart';

class ContactScreen extends StatelessWidget {
  final String email = 'foodemoji@app.com';
  final String phoneNumber = '123 456-7890'; // Replace with your actual phone number

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact'),
        backgroundColor: Colors.green, // App bar color
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.lightBlue, Colors.blueAccent], // Gradient background colors
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: AnimatedContainer(
            duration: Duration(seconds: 1),
            curve: Curves.easeInOut,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, 4),
                  blurRadius: 6,
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Title Section
                AnimatedOpacity(
                  duration: Duration(seconds: 1),
                  opacity: 1.0,
                  child: Text(
                    'Contact Us',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // Email and Phone Number Section
                AnimatedOpacity(
                  duration: Duration(seconds: 1),
                  opacity: 1.0,
                  child: Column(
                    children: [
                      Text(
                        'Email: $email',
                        style: TextStyle(fontSize: 18, color: Colors.black87),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Phone: $phoneNumber',
                        style: TextStyle(fontSize: 18, color: Colors.black87),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),

                // Contact Buttons Section
                AnimatedContainer(
                  duration: Duration(seconds: 1),
                  curve: Curves.easeInOut,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: MaterialButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.email, color: Colors.white),
                        SizedBox(width: 8),
                        Text(
                          'Send an Email',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                AnimatedContainer(
                  duration: Duration(seconds: 1),
                  curve: Curves.easeInOut,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: MaterialButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.phone, color: Colors.white),
                        SizedBox(width: 8),
                        Text(
                          'Call Us',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
