import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'models/app_metadata.dart';
import 'models/cached_product.dart';
import 'models/local_ingredient.dart';

class IsarDatabaseService {
  static late Isar isar;

  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [
        LocalIngredientSchema,
        CachedProductSchema,
        AppMetadataSchema,
      ],
      directory: dir.path,
    );
  }
}
