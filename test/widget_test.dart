import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:food_emoji_ui/screens/home_screen.dart';
import 'package:food_emoji_ui/screens/categories_screen.dart';
import 'package:food_emoji_ui/main.dart';

void main() {
  testWidgets('HomeScreen has navigation buttons and navigates to CategoriesScreen', (WidgetTester tester) async {
    // Arrange: Start the app at the HomeScreen
    await tester.pumpWidget(FoodEmojiApp());

    // Act: Verify that the HomeScreen contains the necessary buttons
    expect(find.text('Categories'), findsOneWidget);
    expect(find.text('About'), findsOneWidget);
    expect(find.text('Contact'), findsOneWidget);

    // Tap the "Categories" button and pump the widget tree
    await tester.tap(find.text('Categories'));
    await tester.pumpAndSettle();

    // Assert: Verify that tapping "Categories" navigates to CategoriesScreen
    expect(find.byType(CategoriesScreen), findsOneWidget);

    // Verify that some food items are displayed in CategoriesScreen
    expect(find.text('Pizza'), findsOneWidget);
    expect(find.text('🍕'), findsOneWidget);
    expect(find.text('Burger'), findsOneWidget);
    expect(find.text('🍔'), findsOneWidget);
    expect(find.text('Sushi'), findsOneWidget);
    expect(find.text('🍣'), findsOneWidget);
  });
}
