import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';
import '../../common/models/products_model.dart';

class ProductService {
  static Future<Products> fetchProducts({String? url}) async {
    log('Url: $url');
    final jsonString = await rootBundle.loadString(url!);
    final data = jsonDecode(jsonString);
    return Products.fromJson(data);
  }
}
