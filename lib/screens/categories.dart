import 'package:egroce/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:egroce/widgets/navbar.dart';
import 'about_us.dart';
import 'cat_products.dart';
import 'home.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<Category> categories = [
    Category('Frozen Products', 'assets/frozen_prod.png'),
    Category('Dairy Products', 'assets/dairy_prod.jpg'),
    Category('Snacks', 'assets/snacks.jpg'),
    Category('Fruits and Vegetables', 'assets/fruits_veg.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                'Categories',
                style: TextStyle(
                  backgroundColor: Colors.greenAccent,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return _buildCategoryCard(
                  categories[index].name,
                  categories[index].imagePath,
                      () {
                    _navigateToProductsScreen(categories[index].name);
                  },
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 1,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          } else if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => AboutUs()),
            );
          }
        },
      ),
    );
  }

  Widget _buildCategoryCard(String categoryName, String imagePath, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              fit: BoxFit.cover,
              height: 150, // Adjust the height as needed
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                categoryName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToProductsScreen(String categoryName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CatProducts(categoryName: categoryName),
      ),
    );
  }
}

class Category {
  final String name;
  final String imagePath;

  Category(
      this.name,
      this.imagePath
      );
}
