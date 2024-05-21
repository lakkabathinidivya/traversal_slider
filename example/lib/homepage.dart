import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:traversal_slider/traversal_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  int currentIndex = 0;
  List<String> foodImages = [
    'assets/images/salad2.png',
    'assets/images/pasta.png',
    'assets/images/food6.png',
    'assets/images/food1.png',
    'assets/images/food7.png',
    'assets/images/food2.png',
    'assets/images/food3.png',
    'assets/images/food4.png',
  ];

  List<FoodModel> foodNames = [
    FoodModel(
        description:
            'They have the most nutrients. Case in point: Kale and spinach have over 10 times more immune-boosting vitamins A and C than iceberg lettuce. Not a fan of those? Turn over a new leaf: Boston, bibb, and romaine lettuces have a mild flavor, while arugula and watercress have a peppery bite',
        title: 'SALAAD'),
    FoodModel(
        description:
            'Pasta is made from grain, one of the basic food groups in a healthy diet that also can include vegetables, fruits, fish, and poultry. It\'s a good source of energy and can give you fiber, too, if it\'s made from whole grain. That can help with stomach problems and may help lower cholesterol',
        title: 'PASTA'),
    FoodModel(
        description:
            'Tomato soup may offer numerous health benefits, including cancer-fighting properties and improved fertility in men. It may also benefit heart, skin, and bone health, among others. These benefits are mainly due to the many plant compounds in tomatoes',
        title: 'TOMATO SOUP'),
    FoodModel(
        description:
            'This salad is a delightful combination of fresh, ripe avocados, crisp and cool cucumbers, complemented by a light lime dressing. If you\'re a fan of guacamole, then you\'ll surely love this easy avocado salad',
        title: 'AVACCADO FRENCH SPINACH'),
    FoodModel(
        description:
            'They are a good source of vitamins, minerals and fibre. Noodles can be a healthy meal when they are cooked with vegetables and lean protein. However, noodles can be high in sodium and calories if they are cooked with unhealthy ingredients such as processed meats, full-fat cheese and creamy sauces',
        title: 'NOOODLES'),
    FoodModel(
        description:
            'Mangoes (like avos) release ethylene, an odorless gas that speeds up the ripening process. The paper bag makes this gas work overtime and means your mango should be ripe in a couple of days (or less, so keep checking every day)',
        title: 'MANGO SPICE HONEYWRAP'),
    FoodModel(
        description:
            'Packed with Protein: The tender flaky fish and black beans provide plenty of protein for this salad bowl. You will feel full for hours after eating this recipe. Nutritious: Fish is a healthy source of protein that is lean and packed with healthy fats like omega-3s',
        title: 'FRESH MEAL SALAD'),
    FoodModel(
        description:
            'A burger is a patty of ground beef grilled and placed between two halves of a bun. Slices of raw onion, lettuce, bacon, mayonnaise, and other ingredients add flavor. Burgers are considered an American food but are popular around the world',
        title: 'BURGER'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: double.maxFinite,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/foodappbg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ClipRRect(
          // make sure we apply clip it properly
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 120,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Text(
                    foodNames[currentIndex].title,
                    style: const TextStyle(
                        color: Colors.white, fontSize: 30, letterSpacing: 1),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Text(
                    foodNames[currentIndex].description,
                    style: const TextStyle(
                        color: Colors.white, fontSize: 16, letterSpacing: 1),
                  ),
                ),
                const Spacer(),
                TraversalSlider(
                  widgets: List.generate(
                    foodImages.length,
                    (index) => Image.asset(
                      foodImages[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                  onIndexChanged: (value) {
                    currentIndex = value;
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FoodModel {
  final String title;
  final String description;

  FoodModel({required this.description, required this.title});
}
