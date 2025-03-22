import 'package:sembast/sembast.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast_io.dart';

class DatabaseService {
  /// Database name
  static const String dbName = 'konfio';

  /// Singleton instance of database service
  static DatabaseService? _instance;

  /// Main db store for easy access
  var store = StoreRef.main();

  Database? _database;

  DatabaseService._();

  static DatabaseService get instance {
    _instance ??= DatabaseService._();
    return _instance!;
  }

  Future<Database> get database async {
    _database ??= await _openDatabase();
    return _database!;
  }

  Future<Database> _openDatabase() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    final dbPath = join(appDocumentDir.path, dbName);
    final database = await databaseFactoryIo.openDatabase(dbPath);
    return database;
  }

  // Helper method to get store
  StoreRef<String, Map<String, dynamic>> getStore(String storeName) {
    return stringMapStoreFactory.store(storeName);
  }
}
