import 'package:isar/isar.dart';

part 'local_ingredient.g.dart';

@collection
class LocalIngredient {
  Id id = Isar.autoIncrement;
  
  @Index(unique: true)
  late String firestoreId;
  
  @Index(type: IndexType.value, caseSensitive: false)
  late String name;
  
  @Index(type: IndexType.hashElements)
  late List<String> aliases;
  
  @Index(type: IndexType.hashElements)
  late List<String> searchTokens; 
  
  String? scientificName;
  String? eNumber;
  
  @Index()
  late String status; // halal, haram, mushbooh, unknown
  
  late String category;
  late String origin;
  late bool animalDerived;
  late bool plantDerived;
  late bool synthetic;
  late String riskLevel; // low, medium, high
  
  late String explanation;
  String? scholarlyNotes;
  List<String>? languageVariants;
  List<String>? possibleSources;
  List<String>? references;
  
  late DateTime createdAt;
  late DateTime updatedAt;
  late String verifiedBy;
}
