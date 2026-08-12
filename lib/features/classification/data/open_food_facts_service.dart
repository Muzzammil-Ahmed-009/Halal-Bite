import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:isar/isar.dart';

import '../../../../core/database/isar_database_service.dart';
import '../../../../core/database/models/cached_product.dart';
import '../domain/engines/normalization_engine.dart';

class OpenFoodFactsService {
  static const String _baseUrl = 'https://world.openfoodfacts.org/api/v0/product/';

  /// Fetches product data by barcode. Checks the local Isar cache first.
  /// If not found, queries the Open Food Facts API and caches the result.
  static Future<CachedProduct?> getProductByBarcode(String barcode) async {
    final isar = IsarDatabaseService.isar;

    // 1. Check Isar Cache
    final cached = await isar.cachedProducts.where().barcodeEqualTo(barcode).findFirst();
    if (cached != null) {
      // If cached less than 30 days ago, use it
      if (DateTime.now().difference(cached.lastFetched).inDays < 30) {
        return cached;
      }
      // Otherwise, we will re-fetch and update
    }

    // 2. Fetch from Open Food Facts API
    try {
      final url = Uri.parse('$_baseUrl$barcode.json');
      final response = await http.get(url, headers: {
        'User-Agent': 'HalalBite - Android - Version 1.0 - https://halalbite.com',
      });

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        
        if (data['status'] == 1 && data['product'] != null) {
          final productData = data['product'];
          
          final productName = productData['product_name'] ?? 'Unknown Product';
          final brands = productData['brands'];
          final imageUrl = productData['image_front_url'];
          
          // Extract ingredients
          String ingredientsText = productData['ingredients_text'] ?? '';
          if (ingredientsText.isEmpty && productData['ingredients_text_en'] != null) {
             ingredientsText = productData['ingredients_text_en'];
          }
          
          List<String> parsedIngredients = [];
          if (ingredientsText.isNotEmpty) {
            final cleaned = NormalizationEngine.cleanOcrText(ingredientsText);
            parsedIngredients = NormalizationEngine.splitIngredients(cleaned);
          }

          // Create new CachedProduct
          final newProduct = CachedProduct()
            ..barcode = barcode
            ..name = productName
            ..brand = brands
            ..imageUrl = imageUrl
            ..ingredients = parsedIngredients
            ..lastFetched = DateTime.now();

          // 3. Save/Update in Isar
          await isar.writeTxn(() async {
            if (cached != null) {
              newProduct.id = cached.id; // Keep the same Isar ID for update
            }
            await isar.cachedProducts.put(newProduct);
          });

          return newProduct;
        }
      }
      return null; // Product not found or error
    } catch (e) {
      // In case of a network error, return the stale cache if available
      if (cached != null) {
         return cached;
      }
      return null;
    }
  }
}
