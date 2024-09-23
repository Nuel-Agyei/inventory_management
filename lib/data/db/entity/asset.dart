import 'package:drift/drift.dart';


class Asset extends Table{
  IntColumn get id => integer().autoIncrement()();
  TextColumn get image => text().nullable()();
  TextColumn get name => text().withLength(min: 1, max: 50)();
  TextColumn get condition => text()();
  DateTimeColumn get dateOfPurchase => dateTime()() ;
  IntColumn get total => integer()();
  IntColumn get lifespan => integer()();
  IntColumn get scrapvalue => integer()();
}