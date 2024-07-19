import 'package:flutter/material.dart';
import 'package:egroce/screens/product_det.dart';
import 'package:egroce/widgets/appbar.dart';
import 'package:egroce/widgets/navbar.dart';
import 'about_us.dart';
import 'categories.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _searchText = '';
  late List<Product> filteredProducts = List.from(featuredProducts);
  late List<Product> featuredProducts = [
    Product(
      'Sabroso Nuggets',
      'assets/nuggets.jpg',
      'Crispy and flavorful, Sabroso Nuggets offer a delectable snacking experience with juicy chicken bites coated in golden, crunchy batter.',
      750,
      1,
      'pack',
    ),
    Product(
      'Dawn Pratha',
      'assets/pratha.jpg',
      'Dawn Paratha, with its soft layers and buttery taste, is a perfect accompaniment to any meal, adding warmth and richness to every bite.',
      300,
      1,
      'pack',
    ),
    Product(
      'Nestle Yogurt',
      'assets/yogurt.jpg',
      'Nestle Yogurt, creamy and tangy, is a refreshing and nutritious treat, perfect for a cooling snack or as a complement to spicy dishes.',
      180,
      500,
      'gm',
    ),
    Product(
      'Eggo Waffles',
      'assets/waffles.jpg',
      'Eggo Waffles offer a quick and convenient breakfast option, with their fluffy texture and golden crispness, perfect for a delicious start to the day.',
      650,
      1,
      'pack',
    ),
    Product(
      'Olpers Milk',
      'assets/olpers.jpg',
      'Olpers Milk, rich in nutrients and freshness, provides wholesome goodness for your familys daily nutrition needs.',
      250,
      1,
      'ltr',
    ),
    Product(
      'Pringles',
      'assets/pringles.jpg',
      'Pringles, with their unique shape and addictive crunch, offer a variety of bold flavors in a convenient packaging, perfect for on-the-go snacking.',
      250,
      1,
      'piece',
    ),
    Product(
      'Potato',
      'assets/potato.jpg',
      'Versatile and comforting, potatoes are a kitchen staple that can be transformed into a variety of delicious dishes, from crispy fries to creamy mashed potatoes.',
      120,
      1,
      'kg',
    ),
    Product(
      'Grapes',
      'assets/grapes.jpg',
      'Juicy and sweet, grapes offer a burst of natural flavor and refreshing hydration, making them a healthy and delicious snack choice.',
      450,
      1,
      'kg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  _searchText = value;
                  _filterProducts(_searchText);
                });
              },
              decoration: InputDecoration(
                hintText: 'Search...',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            color: Colors.greenAccent,
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Center(
              child: Text(
                'Featured Products',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              childAspectRatio: 0.8,
              children: filteredProducts.map((product) {
                return _buildProductCard(product);
              }).toList(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Categories()),
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

  void _filterProducts(String query) {
    setState(() {
      filteredProducts = featuredProducts
          .where((product) =>
          product.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  Widget _buildProductCard(Product product) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetail(
              productName: product.name,
              productDescription: product.description,
              productImage: product.imagePath,
              productPrice: product.price,
              quantity: product.quantity,
              quantityUnit: product.quantityUnit,
            ),
          ),
        );
      },
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              product.imagePath,
              fit: BoxFit.cover,
              height: 150,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                product.name,
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
}

class Product {
  final String name;
  final String imagePath;
  final String description;
  final double price;
  final double quantity;
  final String quantityUnit;

  Product(this.name,
      this.imagePath,
      this.description,
      this.price,
      this.quantity,
      this.quantityUnit);
}
