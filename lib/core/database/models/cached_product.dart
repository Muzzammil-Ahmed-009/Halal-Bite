import 'package:isar/isar.dart';

part 'cached_product.g.dart';

@collection
class CachedProduct {
  Id id = Isar.autoIncrement;
  
  @Index(unique: true)
  late String barcode;
  
  late String name;
  String? brand;
  String? imageUrl;
  late List<String> ingredients;
  
  late DateTime lastFetched;
}
