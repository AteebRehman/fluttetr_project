import 'package:flutter/material.dart';
import 'cart.dart';

class ProductDetail extends StatelessWidget {
  final String productName;
  final String productDescription;
  final String productImage;
  final double productPrice;
  final double quantity;
  final String quantityUnit;

  const ProductDetail({
    Key? key,
    required this.productName,
    required this.productDescription,
    required this.productImage,
    required this.productPrice,
    required this.quantity,
    required this.quantityUnit
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Detail'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.asset(
              productImage,
              fit: BoxFit.cover,
              height: 200,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Center(
              child: Text(
                productName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Price: \Rs${productPrice.toStringAsFixed(0)}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Quantity: ${quantity.toStringAsFixed(0)}', // Display the fixed quantity
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(width: 3),
                Text(
                  quantityUnit,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              productDescription,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Handle buy now button tap
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Cart(
                      productName: productName,
                      productPrice: productPrice,
                      productImage: productImage,
                    ),
                  ),
                );
              },
              child: Text('Buy Now'),
            ),
          ),
        ],
      ),
    );
  }
}
