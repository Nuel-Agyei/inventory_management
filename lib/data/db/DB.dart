import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';
import 'entity/asset.dart';
part 'DB.g.dart';

// Function to lazily open the connection to the SQLite database
LazyDatabase openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'asset.db'));
    return NativeDatabase(file);
  });
}

// DriftDatabase is now extended
@DriftDatabase(tables: [Asset])
class DB extends _$DB {
  // Singleton implementation to avoid multiple instances of the database
  static final DB _instance = DB._internal();
  
  DB._internal() : super(openConnection());
  
  factory DB() {
    return _instance;
  }

  @override
  int get schemaVersion => 1;

  // CRUD methods
  Future<List<AssetData>> getAllAssets() async {
    return await select(asset).get();
  } 
  
  Future<AssetData> getAsset(int id) async {
    return await (select(asset)..where((tbl) => tbl.id.equals(id))).getSingle();
  }

  Future<int> addAsset(AssetCompanion entity) async {
    return await into(asset).insert(entity);
  }

  Future<bool> updateAsset(AssetCompanion entity) async {
    return await update(asset).replace(entity);
  }

  Future<int> deleteAsset(int id) async {
    return await (delete(asset)..where((tbl) => tbl.id.equals(id))).go();
  }
}
