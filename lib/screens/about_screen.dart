import 'package:flutter/material.dart';

class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  bool _showDetails = false; // Controls whether the detailed info is shown

  void _toggleDetails() {
    setState(() {
      _showDetails = !_showDetails; // Toggle the visibility of detailed info
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About', style: TextStyle(color: Colors.white)), // White text for better contrast
        backgroundColor: Colors.deepOrangeAccent, // Bold, modern app bar color
        elevation: 10, // Adding elevation for a sleek look
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(seconds: 1), // Animation duration
          curve: Curves.easeInOut, // Smooth curve for animation
          padding: EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: Colors.orangeAccent, // Lively background color
            borderRadius: BorderRadius.circular(20), // Rounded corners for soft feel
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 15,
                spreadRadius: 4,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.food_bank,
                color: Colors.white,
                size: 60, // Food icon for visual appeal
              ),
              SizedBox(height: 20),
              Text(
                'Welcome to the Food Emoji UI App!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              // Tap to interact prompt
              ElevatedButton(
                onPressed: _toggleDetails,
                child: Text(_showDetails ? 'Hide Features' : 'Tap to Interact'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // Button color
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // Rounded corners
                  ),
                  textStyle: TextStyle(fontSize: 18), // Larger text style
                ),
              ),
              SizedBox(height: 20),
              // Show detailed information with smooth opacity transition
              AnimatedSize(
                duration: Duration(seconds: 1),
                curve: Curves.easeInOut,
                child: AnimatedOpacity(
                  duration: Duration(seconds: 1),
                  opacity: _showDetails ? 1.0 : 0.0, // Transition opacity based on state
                  child: _showDetails
                      ? Column(
                    children: [
                      SizedBox(height: 20),
                      Text(
                        'Categories Available:',
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '• Fruits & Vegetables\n'
                            '• Snacks & Fast Food\n'
                            '• Drinks\n'
                            '• Desserts\n'
                            '• And More!',
                        style: TextStyle(fontSize: 18, color: Colors.black),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  )
                      : Container(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
