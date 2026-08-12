import 'package:isar/isar.dart';

part 'app_metadata.g.dart';

@collection
class AppMetadata {
  Id id = 0; // Singleton pattern
  late int currentDatabaseVersion;
  late DateTime lastSyncTime;
  late String lastSha256;
}
