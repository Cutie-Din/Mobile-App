import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/shop_item.dart'; // Import the Product model

class ProductRepository {
  final String _baseUrl = 'https://fakestoreapi.com/products?limit=5';

  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      final List<dynamic> productJson = json.decode(response.body);
      return productJson.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
