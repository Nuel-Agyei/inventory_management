// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DB.dart';

// ignore_for_file: type=lint
class $AssetTable extends Asset with TableInfo<$AssetTable, AssetData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AssetTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
      'image', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _conditionMeta =
      const VerificationMeta('condition');
  @override
  late final GeneratedColumn<String> condition = GeneratedColumn<String>(
      'condition', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dateOfPurchaseMeta =
      const VerificationMeta('dateOfPurchase');
  @override
  late final GeneratedColumn<DateTime> dateOfPurchase =
      GeneratedColumn<DateTime>('date_of_purchase', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _totalMeta = const VerificationMeta('total');
  @override
  late final GeneratedColumn<int> total = GeneratedColumn<int>(
      'total', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _lifespanMeta =
      const VerificationMeta('lifespan');
  @override
  late final GeneratedColumn<int> lifespan = GeneratedColumn<int>(
      'lifespan', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _scrapvalueMeta =
      const VerificationMeta('scrapvalue');
  @override
  late final GeneratedColumn<int> scrapvalue = GeneratedColumn<int>(
      'scrapvalue', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, image, name, condition, dateOfPurchase, total, lifespan, scrapvalue];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'asset';
  @override
  VerificationContext validateIntegrity(Insertable<AssetData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('condition')) {
      context.handle(_conditionMeta,
          condition.isAcceptableOrUnknown(data['condition']!, _conditionMeta));
    } else if (isInserting) {
      context.missing(_conditionMeta);
    }
    if (data.containsKey('date_of_purchase')) {
      context.handle(
          _dateOfPurchaseMeta,
          dateOfPurchase.isAcceptableOrUnknown(
              data['date_of_purchase']!, _dateOfPurchaseMeta));
    } else if (isInserting) {
      context.missing(_dateOfPurchaseMeta);
    }
    if (data.containsKey('total')) {
      context.handle(
          _totalMeta, total.isAcceptableOrUnknown(data['total']!, _totalMeta));
    } else if (isInserting) {
      context.missing(_totalMeta);
    }
    if (data.containsKey('lifespan')) {
      context.handle(_lifespanMeta,
          lifespan.isAcceptableOrUnknown(data['lifespan']!, _lifespanMeta));
    } else if (isInserting) {
      context.missing(_lifespanMeta);
    }
    if (data.containsKey('scrapvalue')) {
      context.handle(
          _scrapvalueMeta,
          scrapvalue.isAcceptableOrUnknown(
              data['scrapvalue']!, _scrapvalueMeta));
    } else if (isInserting) {
      context.missing(_scrapvalueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AssetData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AssetData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      image: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image']),
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      condition: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}condition'])!,
      dateOfPurchase: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}date_of_purchase'])!,
      total: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}total'])!,
      lifespan: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}lifespan'])!,
      scrapvalue: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}scrapvalue'])!,
    );
  }

  @override
  $AssetTable createAlias(String alias) {
    return $AssetTable(attachedDatabase, alias);
  }
}

class AssetData extends DataClass implements Insertable<AssetData> {
  final int id;
  final String? image;
  final String name;
  final String condition;
  final DateTime dateOfPurchase;
  final int total;
  final int lifespan;
  final int scrapvalue;
  const AssetData(
      {required this.id,
      this.image,
      required this.name,
      required this.condition,
      required this.dateOfPurchase,
      required this.total,
      required this.lifespan,
      required this.scrapvalue});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || image != null) {
      map['image'] = Variable<String>(image);
    }
    map['name'] = Variable<String>(name);
    map['condition'] = Variable<String>(condition);
    map['date_of_purchase'] = Variable<DateTime>(dateOfPurchase);
    map['total'] = Variable<int>(total);
    map['lifespan'] = Variable<int>(lifespan);
    map['scrapvalue'] = Variable<int>(scrapvalue);
    return map;
  }

  AssetCompanion toCompanion(bool nullToAbsent) {
    return AssetCompanion(
      id: Value(id),
      image:
          image == null && nullToAbsent ? const Value.absent() : Value(image),
      name: Value(name),
      condition: Value(condition),
      dateOfPurchase: Value(dateOfPurchase),
      total: Value(total),
      lifespan: Value(lifespan),
      scrapvalue: Value(scrapvalue),
    );
  }

  factory AssetData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AssetData(
      id: serializer.fromJson<int>(json['id']),
      image: serializer.fromJson<String?>(json['image']),
      name: serializer.fromJson<String>(json['name']),
      condition: serializer.fromJson<String>(json['condition']),
      dateOfPurchase: serializer.fromJson<DateTime>(json['dateOfPurchase']),
      total: serializer.fromJson<int>(json['total']),
      lifespan: serializer.fromJson<int>(json['lifespan']),
      scrapvalue: serializer.fromJson<int>(json['scrapvalue']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'image': serializer.toJson<String?>(image),
      'name': serializer.toJson<String>(name),
      'condition': serializer.toJson<String>(condition),
      'dateOfPurchase': serializer.toJson<DateTime>(dateOfPurchase),
      'total': serializer.toJson<int>(total),
      'lifespan': serializer.toJson<int>(lifespan),
      'scrapvalue': serializer.toJson<int>(scrapvalue),
    };
  }

  AssetData copyWith(
          {int? id,
          Value<String?> image = const Value.absent(),
          String? name,
          String? condition,
          DateTime? dateOfPurchase,
          int? total,
          int? lifespan,
          int? scrapvalue}) =>
      AssetData(
        id: id ?? this.id,
        image: image.present ? image.value : this.image,
        name: name ?? this.name,
        condition: condition ?? this.condition,
        dateOfPurchase: dateOfPurchase ?? this.dateOfPurchase,
        total: total ?? this.total,
        lifespan: lifespan ?? this.lifespan,
        scrapvalue: scrapvalue ?? this.scrapvalue,
      );
  AssetData copyWithCompanion(AssetCompanion data) {
    return AssetData(
      id: data.id.present ? data.id.value : this.id,
      image: data.image.present ? data.image.value : this.image,
      name: data.name.present ? data.name.value : this.name,
      condition: data.condition.present ? data.condition.value : this.condition,
      dateOfPurchase: data.dateOfPurchase.present
          ? data.dateOfPurchase.value
          : this.dateOfPurchase,
      total: data.total.present ? data.total.value : this.total,
      lifespan: data.lifespan.present ? data.lifespan.value : this.lifespan,
      scrapvalue:
          data.scrapvalue.present ? data.scrapvalue.value : this.scrapvalue,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AssetData(')
          ..write('id: $id, ')
          ..write('image: $image, ')
          ..write('name: $name, ')
          ..write('condition: $condition, ')
          ..write('dateOfPurchase: $dateOfPurchase, ')
          ..write('total: $total, ')
          ..write('lifespan: $lifespan, ')
          ..write('scrapvalue: $scrapvalue')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, image, name, condition, dateOfPurchase, total, lifespan, scrapvalue);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AssetData &&
          other.id == this.id &&
          other.image == this.image &&
          other.name == this.name &&
          other.condition == this.condition &&
          other.dateOfPurchase == this.dateOfPurchase &&
          other.total == this.total &&
          other.lifespan == this.lifespan &&
          other.scrapvalue == this.scrapvalue);
}

class AssetCompanion extends UpdateCompanion<AssetData> {
  final Value<int> id;
  final Value<String?> image;
  final Value<String> name;
  final Value<String> condition;
  final Value<DateTime> dateOfPurchase;
  final Value<int> total;
  final Value<int> lifespan;
  final Value<int> scrapvalue;
  const AssetCompanion({
    this.id = const Value.absent(),
    this.image = const Value.absent(),
    this.name = const Value.absent(),
    this.condition = const Value.absent(),
    this.dateOfPurchase = const Value.absent(),
    this.total = const Value.absent(),
    this.lifespan = const Value.absent(),
    this.scrapvalue = const Value.absent(),
  });
  AssetCompanion.insert({
    this.id = const Value.absent(),
    this.image = const Value.absent(),
    required String name,
    required String condition,
    required DateTime dateOfPurchase,
    required int total,
    required int lifespan,
    required int scrapvalue,
  })  : name = Value(name),
        condition = Value(condition),
        dateOfPurchase = Value(dateOfPurchase),
        total = Value(total),
        lifespan = Value(lifespan),
        scrapvalue = Value(scrapvalue);
  static Insertable<AssetData> custom({
    Expression<int>? id,
    Expression<String>? image,
    Expression<String>? name,
    Expression<String>? condition,
    Expression<DateTime>? dateOfPurchase,
    Expression<int>? total,
    Expression<int>? lifespan,
    Expression<int>? scrapvalue,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (image != null) 'image': image,
      if (name != null) 'name': name,
      if (condition != null) 'condition': condition,
      if (dateOfPurchase != null) 'date_of_purchase': dateOfPurchase,
      if (total != null) 'total': total,
      if (lifespan != null) 'lifespan': lifespan,
      if (scrapvalue != null) 'scrapvalue': scrapvalue,
    });
  }

  AssetCompanion copyWith(
      {Value<int>? id,
      Value<String?>? image,
      Value<String>? name,
      Value<String>? condition,
      Value<DateTime>? dateOfPurchase,
      Value<int>? total,
      Value<int>? lifespan,
      Value<int>? scrapvalue}) {
    return AssetCompanion(
      id: id ?? this.id,
      image: image ?? this.image,
      name: name ?? this.name,
      condition: condition ?? this.condition,
      dateOfPurchase: dateOfPurchase ?? this.dateOfPurchase,
      total: total ?? this.total,
      lifespan: lifespan ?? this.lifespan,
      scrapvalue: scrapvalue ?? this.scrapvalue,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (condition.present) {
      map['condition'] = Variable<String>(condition.value);
    }
    if (dateOfPurchase.present) {
      map['date_of_purchase'] = Variable<DateTime>(dateOfPurchase.value);
    }
    if (total.present) {
      map['total'] = Variable<int>(total.value);
    }
    if (lifespan.present) {
      map['lifespan'] = Variable<int>(lifespan.value);
    }
    if (scrapvalue.present) {
      map['scrapvalue'] = Variable<int>(scrapvalue.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AssetCompanion(')
          ..write('id: $id, ')
          ..write('image: $image, ')
          ..write('name: $name, ')
          ..write('condition: $condition, ')
          ..write('dateOfPurchase: $dateOfPurchase, ')
          ..write('total: $total, ')
          ..write('lifespan: $lifespan, ')
          ..write('scrapvalue: $scrapvalue')
          ..write(')'))
        .toString();
  }
}

abstract class _$DB extends GeneratedDatabase {
  _$DB(QueryExecutor e) : super(e);
  $DBManager get managers => $DBManager(this);
  late final $AssetTable asset = $AssetTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [asset];
}

typedef $$AssetTableCreateCompanionBuilder = AssetCompanion Function({
  Value<int> id,
  Value<String?> image,
  required String name,
  required String condition,
  required DateTime dateOfPurchase,
  required int total,
  required int lifespan,
  required int scrapvalue,
});
typedef $$AssetTableUpdateCompanionBuilder = AssetCompanion Function({
  Value<int> id,
  Value<String?> image,
  Value<String> name,
  Value<String> condition,
  Value<DateTime> dateOfPurchase,
  Value<int> total,
  Value<int> lifespan,
  Value<int> scrapvalue,
});

class $$AssetTableFilterComposer extends FilterComposer<_$DB, $AssetTable> {
  $$AssetTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get image => $state.composableBuilder(
      column: $state.table.image,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get condition => $state.composableBuilder(
      column: $state.table.condition,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get dateOfPurchase => $state.composableBuilder(
      column: $state.table.dateOfPurchase,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get total => $state.composableBuilder(
      column: $state.table.total,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get lifespan => $state.composableBuilder(
      column: $state.table.lifespan,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get scrapvalue => $state.composableBuilder(
      column: $state.table.scrapvalue,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$AssetTableOrderingComposer extends OrderingComposer<_$DB, $AssetTable> {
  $$AssetTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get image => $state.composableBuilder(
      column: $state.table.image,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get condition => $state.composableBuilder(
      column: $state.table.condition,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get dateOfPurchase => $state.composableBuilder(
      column: $state.table.dateOfPurchase,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get total => $state.composableBuilder(
      column: $state.table.total,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get lifespan => $state.composableBuilder(
      column: $state.table.lifespan,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get scrapvalue => $state.composableBuilder(
      column: $state.table.scrapvalue,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$AssetTableTableManager extends RootTableManager<
    _$DB,
    $AssetTable,
    AssetData,
    $$AssetTableFilterComposer,
    $$AssetTableOrderingComposer,
    $$AssetTableCreateCompanionBuilder,
    $$AssetTableUpdateCompanionBuilder,
    (AssetData, BaseReferences<_$DB, $AssetTable, AssetData>),
    AssetData,
    PrefetchHooks Function()> {
  $$AssetTableTableManager(_$DB db, $AssetTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$AssetTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$AssetTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> image = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> condition = const Value.absent(),
            Value<DateTime> dateOfPurchase = const Value.absent(),
            Value<int> total = const Value.absent(),
            Value<int> lifespan = const Value.absent(),
            Value<int> scrapvalue = const Value.absent(),
          }) =>
              AssetCompanion(
            id: id,
            image: image,
            name: name,
            condition: condition,
            dateOfPurchase: dateOfPurchase,
            total: total,
            lifespan: lifespan,
            scrapvalue: scrapvalue,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> image = const Value.absent(),
            required String name,
            required String condition,
            required DateTime dateOfPurchase,
            required int total,
            required int lifespan,
            required int scrapvalue,
          }) =>
              AssetCompanion.insert(
            id: id,
            image: image,
            name: name,
            condition: condition,
            dateOfPurchase: dateOfPurchase,
            total: total,
            lifespan: lifespan,
            scrapvalue: scrapvalue,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AssetTableProcessedTableManager = ProcessedTableManager<
    _$DB,
    $AssetTable,
    AssetData,
    $$AssetTableFilterComposer,
    $$AssetTableOrderingComposer,
    $$AssetTableCreateCompanionBuilder,
    $$AssetTableUpdateCompanionBuilder,
    (AssetData, BaseReferences<_$DB, $AssetTable, AssetData>),
    AssetData,
    PrefetchHooks Function()>;

class $DBManager {
  final _$DB _db;
  $DBManager(this._db);
  $$AssetTableTableManager get asset =>
      $$AssetTableTableManager(_db, _db.asset);
}
