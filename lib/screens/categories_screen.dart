import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  final List<Map<String, String>> foodItems = [
    {'name': 'Pizza', 'emoji': '🍕', 'price': '₹800', 'description': 'A cheesy delight with a crispy crust.'},
    {'name': 'Burger', 'emoji': '🍔', 'price': '₹250', 'description': 'Juicy patty with lettuce, tomato, and cheese.'},
    {'name': 'Sushi', 'emoji': '🍣', 'price': '₹1200', 'description': 'Fresh sushi rolls with fish and vegetables.'},
    {'name': 'Spaghetti', 'emoji': '🍝', 'price': '₹450', 'description': 'Pasta served with rich tomato sauce and herbs.'},
    {'name': 'Taco', 'emoji': '🌮', 'price': '₹180', 'description': 'Crispy shell with a spicy filling.'},

    {'name': 'Salad', 'emoji': '🥗', 'price': '₹200', 'description': 'Fresh vegetables and greens with a light dressing.'},
    {'name': 'Hot Dog', 'emoji': '🌭', 'price': '₹150', 'description': 'A classic hot dog with mustard and ketchup.'},
    {'name': 'Fries', 'emoji': '🍟', 'price': '₹100', 'description': 'Crispy golden fries with a side of ketchup.'},
    {'name': 'Steak', 'emoji': '🥩', 'price': '₹1200', 'description': 'Tender steak cooked to perfection.'},
    {'name': 'Popcorn', 'emoji': '🍿', 'price': '₹50', 'description': 'Fluffy popcorn, perfect for movie nights.'},
    {'name': 'Sandwich', 'emoji': '🥪', 'price': '₹250', 'description': 'Tasty sandwich with fresh ingredients.'},
    {'name': 'Pancakes', 'emoji': '🥞', 'price': '₹300', 'description': 'Soft pancakes served with syrup and butter.'},
    {'name': 'Ramen', 'emoji': '🍜', 'price': '₹500', 'description': 'Japanese noodle soup with a variety of toppings.'},
    {'name': 'Donut', 'emoji': '🍩', 'price': '₹100', 'description': 'Sweet donuts with various flavors.'},
    {'name': 'Ice Cream', 'emoji': '🍨', 'price': '₹200', 'description': 'Creamy ice cream in your favorite flavor.'},
    {'name': 'Cake', 'emoji': '🍰', 'price': '₹350', 'description': 'A delicious slice of cake for dessert.'},
    {'name': 'Cupcake', 'emoji': '🧁', 'price': '₹150', 'description': 'A mini cake with frosting and sprinkles.'},
    {'name': 'Cookie', 'emoji': '🍪', 'price': '₹80', 'description': 'Warm, soft cookies with chocolate chips.'},
    {'name': 'Chocolate', 'emoji': '🍫', 'price': '₹200', 'description': 'Rich chocolate for those who love sweetness.'},
    {'name': 'Coffee', 'emoji': '☕', 'price': '₹120', 'description': 'A hot cup of coffee to start your day.'},
    {'name': 'Tea', 'emoji': '🍵', 'price': '₹50', 'description': 'A soothing cup of tea with aromatic flavors.'},
    {'name': 'Boba', 'emoji': '🧋', 'price': '₹250', 'description': 'Sweet bubble tea with chewy tapioca pearls.'},
    {'name': 'Croissant', 'emoji': '🥐', 'price': '₹100', 'description': 'Flaky buttery croissant, perfect for breakfast.'},
    {'name': 'Bagel', 'emoji': '🥯', 'price': '₹150', 'description': 'Soft bagel with cream cheese and toppings.'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
        backgroundColor: Colors.greenAccent,
      ),
      body: SingleChildScrollView(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.0, // Adjust aspect ratio for better visuals
          ),
          shrinkWrap: true, // Make sure GridView doesn't take up unnecessary space
          physics: NeverScrollableScrollPhysics(), // Prevent the GridView from scrolling
          itemCount: foodItems.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        DetailScreen(foodItems[index]),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      var tween = Tween(begin: Offset(1.0, 0.0), end: Offset.zero).chain(CurveTween(curve: Curves.easeInOut));
                      var offsetAnimation = animation.drive(tween);
                      return SlideTransition(position: offsetAnimation, child: child);
                    },
                  ),
                );
              },
              child: AnimatedScale(
                duration: Duration(milliseconds: 300),
                scale: 1.0, // Optional scale effect on tap
                child: FoodCard(
                  name: foodItems[index]['name']!,
                  emoji: foodItems[index]['emoji']!,
                  price: foodItems[index]['price']!,
                  description: foodItems[index]['description']!,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class FoodCard extends StatelessWidget {
  final String name;
  final String emoji;
  final String price;
  final String description;

  FoodCard({
    required this.name,
    required this.emoji,
    required this.price,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white.withOpacity(0.8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              emoji,
              style: TextStyle(fontSize: 50),
            ),
            SizedBox(height: 10),
            Text(
              name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              price,
              style: TextStyle(fontSize: 16, color: Colors.blue
              ),
            ),
            SizedBox(height: 5),
            Text(
              description,
              style: TextStyle(fontSize: 14, color: Colors.black),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final Map<String, String> foodItem;

  DetailScreen(this.foodItem);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(foodItem['name']!),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              foodItem['emoji']!,
              style: TextStyle(fontSize: 100),
            ),
            SizedBox(height: 20),
            Text(
              foodItem['name']!,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              foodItem['price']!,
              style: TextStyle(fontSize: 24, color: Colors.blue),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                foodItem['description']!,
                style: TextStyle(fontSize: 16, color: Colors.black54),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
