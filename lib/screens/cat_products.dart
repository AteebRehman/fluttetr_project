import 'package:flutter/material.dart';
import 'package:egroce/screens/product_det.dart';

class CatProducts extends StatefulWidget {
  final String categoryName;

  const CatProducts({Key? key, required this.categoryName}) : super(key: key);

  @override
  State<CatProducts> createState() => _CatProductsState();
}

class _CatProductsState extends State<CatProducts> {
  late List<Product> products = _getProductsForCategory(widget.categoryName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return _buildProductCard(products[index]);
        },
      ),
    );
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

  static List<Product> _getProductsForCategory(String categoryName) {
    switch (categoryName) {
      case 'Frozen Products':
        return [
          Product('Sabroso Nuggets', 'assets/nuggets.jpg', 'Crispy and flavorful, Sabroso Nuggets offer a delectable snacking experience with juicy chicken bites coated in golden, crunchy batter.', 750, 1, 'pack'),
          Product('Dawn Pratha', 'assets/pratha.jpg', 'Dawn Paratha, with its soft layers and buttery taste, is a perfect accompaniment to any meal, adding warmth and richness to every bite.', 300, 1, 'pack'),
          Product('Dawn Tandoori Naan ', 'assets/naan.jpg', 'Dawn Tandoori Naan, baked to perfection with a soft interior and charred exterior, brings the authentic taste of tandoori cuisine to your table.', 400, 1, 'pack'),
          Product('Eggo Waffles', 'assets/waffles.jpg', 'Eggo Waffles offer a quick and convenient breakfast option, with their fluffy texture and golden crispness, perfect for a delicious start to the day.', 650, 1, 'pack'),
          Product('Sabroso Pakora', 'assets/pakora.jpg', 'Crispy and flavorful, Sabroso Pakora offers a delightful snacking experience with its tantalizing blend of spices and crunchy texture.', 700, 1, 'pack'),
          Product('Sabroso Kachori', 'assets/kachori.jpg', 'Aromatic and savory, Sabroso Kachori delights the senses with its golden crust and fragrant filling, perfect for a delicious tea-time treat.', 900, 1, 'pack'),
        ];
      case 'Dairy Products':
        return [
          Product('Olpers Milk', 'assets/olpers.jpg', 'Olpers Milk, rich in nutrients and freshness, provides wholesome goodness for your familys daily nutrition needs.', 250, 1, 'ltr'),
          Product('MilkPak Cream', 'assets/cream.jpg', ' MilkPak Cream, with its smooth texture and rich flavor, adds indulgence to desserts, beverages, and savory dishes alike.', 250, 200, 'ml'),
          Product('Nestle Yogurt', 'assets/yogurt.jpg', ' Nestle Yogurt, creamy and tangy, is a refreshing and nutritious treat, perfect for a cooling snack or as a complement to spicy dishes.', 180, 500, 'gm'),
          Product('Deens Mozzarella Cheese', 'assets/cheese.jpg', 'Deens Mozzarella Cheese, with its stretchy texture and mild flavor, enhances the taste of pizzas, pastas, and salads with its gooey goodness.', 290, 500, 'gm'),
          Product('MilkPak', 'assets/milk.jpg', 'MilkPAk: rich in nutrients and freshness, provides wholesome goodness for your familys daily nutrition needs.', 220, 1, 'ltr'),
          Product('Dairy Milk', 'assets/dairy_milk.jpg', ' Creamy and indulgent, Dairy Milk chocolate melts in your mouth, delivering a rich and satisfying cocoa experience that is loved by all ages.', 180, 1, 'piece'),
        ];
      case 'Snacks':
        return [
          Product('Lays', 'assets/lays.jpg', 'Lays, with their thin, crispy texture and bold flavors, offer a satisfying snacking experience that tantalizes the taste buds with every bite.', 100, 1, 'piece'),
          Product('Kurkure', 'assets/kurkure.jpg', 'Kurkure, crunchy and full of zest, delivers a burst of spicy flavor in every bite, making it a popular choice for snack lovers.', 60, 1, 'piece'),
          Product('Pringles', 'assets/pringles.jpg', 'Pringles, with their unique shape and addictive crunch, offer a variety of bold flavors in a convenient packaging, perfect for on-the-go snacking.', 250, 1, 'piece'),
          Product('Kolson Potato Sticks', 'assets/sticks.jpg', 'Kolson Potato Sticks, crispy and seasoned to perfection, are an irresistible snack option, ideal for munching during leisure time or as a side dish.', 50, 1, 'piece'),
          Product('Doritos', 'assets/doritos.jpg', 'Bold and crunchy, Doritos chips are bursting with intense flavor and irresistible crunch, making them the ultimate snack for any occasion.', 100, 1, 'piece'),
          Product('Twister', 'assets/twister.png', 'These tantalizing chips from Super Crisp boast a whirlwind of flavors and an irresistibly crispy texture, delivering a satisfying snacking experience with every bite.', 30, 1, 'piece'),
        ];
      case 'Fruits and Vegetables':
        return [
          Product('Tomato', 'assets/tomato.jpg', 'Fresh and firm tomatoes, are a must-have for every kitchen. Packed with vitamins and antioxidants, they add vibrant color and delicious flavor to salads, sandwiches, and sauces.', 300, 1, 'kg'),
          Product('Apple', 'assets/apple.jpg', 'Juicy and crisp, our apples are handpicked for quality and freshness. Enjoy a burst of natural sweetness and a crunch in every bite.', 350, 1, 'kg'),
          Product('Mango', 'assets/mango.jpg', 'Experience tropical bliss with our succulent mangoes, bursting with vibrant flavor and refreshing juiciness. Treat yourself to a tropical getaway with every bite of our premium mangoes.', 500, 1, 'kg'),
          Product('Peas', 'assets/peas.jpg', 'Peas, tender legumes rich in protein and fiber, add sweet flavor and essential nutrients to diverse dishes, from soups to stir-fries.', 180, 1, 'kg'),
          Product('Grapes', 'assets/grapes.jpg', 'Juicy and sweet, grapes offer a burst of natural flavor and refreshing hydration, making them a healthy and delicious snack choice.', 450, 1, 'kg'),
          Product('Potato', 'assets/potato.jpg', 'Versatile and comforting, potatoes are a kitchen staple that can be transformed into a variety of delicious dishes, from crispy fries to creamy mashed potatoes.', 120, 1, 'kg'),
        ];
      default:
        return [];
    }
  }
}

class Product {
  final String name;
  final String imagePath;
  final String description;
  final double price;
  final double quantity;
  final String quantityUnit;

  Product(
      this.name,
      this.imagePath,
      this.description,
      this.price,
      this.quantity,
      this.quantityUnit
      );
}
