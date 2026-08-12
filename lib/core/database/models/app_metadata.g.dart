// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_metadata.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAppMetadataCollection on Isar {
  IsarCollection<AppMetadata> get appMetadatas => this.collection();
}

const AppMetadataSchema = CollectionSchema(
  name: r'AppMetadata',
  id: 885844506131692784,
  properties: {
    r'currentDatabaseVersion': PropertySchema(
      id: 0,
      name: r'currentDatabaseVersion',
      type: IsarType.long,
    ),
    r'lastSha256': PropertySchema(
      id: 1,
      name: r'lastSha256',
      type: IsarType.string,
    ),
    r'lastSyncTime': PropertySchema(
      id: 2,
      name: r'lastSyncTime',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _appMetadataEstimateSize,
  serialize: _appMetadataSerialize,
  deserialize: _appMetadataDeserialize,
  deserializeProp: _appMetadataDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _appMetadataGetId,
  getLinks: _appMetadataGetLinks,
  attach: _appMetadataAttach,
  version: '3.1.0+1',
);

int _appMetadataEstimateSize(
  AppMetadata object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.lastSha256.length * 3;
  return bytesCount;
}

void _appMetadataSerialize(
  AppMetadata object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.currentDatabaseVersion);
  writer.writeString(offsets[1], object.lastSha256);
  writer.writeDateTime(offsets[2], object.lastSyncTime);
}

AppMetadata _appMetadataDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AppMetadata();
  object.currentDatabaseVersion = reader.readLong(offsets[0]);
  object.id = id;
  object.lastSha256 = reader.readString(offsets[1]);
  object.lastSyncTime = reader.readDateTime(offsets[2]);
  return object;
}

P _appMetadataDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _appMetadataGetId(AppMetadata object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _appMetadataGetLinks(AppMetadata object) {
  return [];
}

void _appMetadataAttach(
    IsarCollection<dynamic> col, Id id, AppMetadata object) {
  object.id = id;
}

extension AppMetadataQueryWhereSort
    on QueryBuilder<AppMetadata, AppMetadata, QWhere> {
  QueryBuilder<AppMetadata, AppMetadata, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AppMetadataQueryWhere
    on QueryBuilder<AppMetadata, AppMetadata, QWhereClause> {
  QueryBuilder<AppMetadata, AppMetadata, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<AppMetadata, AppMetadata, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<AppMetadata, AppMetadata, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<AppMetadata, AppMetadata, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<AppMetadata, AppMetadata, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension AppMetadataQueryFilter
    on QueryBuilder<AppMetadata, AppMetadata, QFilterCondition> {
  QueryBuilder<AppMetadata, AppMetadata, QAfterFilterCondition>
      currentDatabaseVersionEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentDatabaseVersion',
        value: value,
      ));
    });
  }

  QueryBuilder<AppMetadata, AppMetadata, QAfterFilterCondition>
      currentDatabaseVersionGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'currentDatabaseVersion',
        value: value,
      ));
    });
  }

  QueryBuilder<AppMetadata, AppMetadata, QAfterFilterCondition>
      currentDatabaseVersionLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'currentDatabaseVersion',
        value: value,
      ));
    });
  }

  QueryBuilder<AppMetadata, AppMetadata, QAfterFilterCondition>
      currentDatabaseVersionBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'currentDatabaseVersion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AppMetadata, AppMetadata, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AppMetadata, AppMetadata, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AppMetadata, AppMetadata, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AppMetadata, AppMetadata, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AppMetadata, AppMetadata, QAfterFilterCondition>
      lastSha256EqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastSha256',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppMetadata, AppMetadata, QAfterFilterCondition>
      lastSha256GreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastSha256',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppMetadata, AppMetadata, QAfterFilterCondition>
      lastSha256LessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastSha256',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppMetadata, AppMetadata, QAfterFilterCondition>
      lastSha256Between(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastSha256',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppMetadata, AppMetadata, QAfterFilterCondition>
      lastSha256StartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'lastSha256',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppMetadata, AppMetadata, QAfterFilterCondition>
      lastSha256EndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'lastSha256',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppMetadata, AppMetadata, QAfterFilterCondition>
      lastSha256Contains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'lastSha256',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppMetadata, AppMetadata, QAfterFilterCondition>
      lastSha256Matches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'lastSha256',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppMetadata, AppMetadata, QAfterFilterCondition>
      lastSha256IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastSha256',
        value: '',
      ));
    });
  }

  QueryBuilder<AppMetadata, AppMetadata, QAfterFilterCondition>
      lastSha256IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'lastSha256',
        value: '',
      ));
    });
  }

  QueryBuilder<AppMetadata, AppMetadata, QAfterFilterCondition>
      lastSyncTimeEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastSyncTime',
        value: value,
      ));
    });
  }

  QueryBuilder<AppMetadata, AppMetadata, QAfterFilterCondition>
      lastSyncTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastSyncTime',
        value: value,
      ));
    });
  }

  QueryBuilder<AppMetadata, AppMetadata, QAfterFilterCondition>
      lastSyncTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastSyncTime',
        value: value,
      ));
    });
  }

  QueryBuilder<AppMetadata, AppMetadata, QAfterFilterCondition>
      lastSyncTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastSyncTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension AppMetadataQueryObject
    on QueryBuilder<AppMetadata, AppMetadata, QFilterCondition> {}

extension AppMetadataQueryLinks
    on QueryBuilder<AppMetadata, AppMetadata, QFilterCondition> {}

extension AppMetadataQuerySortBy
    on QueryBuilder<AppMetadata, AppMetadata, QSortBy> {
  QueryBuilder<AppMetadata, AppMetadata, QAfterSortBy>
      sortByCurrentDatabaseVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentDatabaseVersion', Sort.asc);
    });
  }

  QueryBuilder<AppMetadata, AppMetadata, QAfterSortBy>
      sortByCurrentDatabaseVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentDatabaseVersion', Sort.desc);
    });
  }

  QueryBuilder<AppMetadata, AppMetadata, QAfterSortBy> sortByLastSha256() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSha256', Sort.asc);
    });
  }

  QueryBuilder<AppMetadata, AppMetadata, QAfterSortBy> sortByLastSha256Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSha256', Sort.desc);
    });
  }

  QueryBuilder<AppMetadata, AppMetadata, QAfterSortBy> sortByLastSyncTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncTime', Sort.asc);
    });
  }

  QueryBuilder<AppMetadata, AppMetadata, QAfterSortBy>
      sortByLastSyncTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncTime', Sort.desc);
    });
  }
}

extension AppMetadataQuerySortThenBy
    on QueryBuilder<AppMetadata, AppMetadata, QSortThenBy> {
  QueryBuilder<AppMetadata, AppMetadata, QAfterSortBy>
      thenByCurrentDatabaseVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentDatabaseVersion', Sort.asc);
    });
  }

  QueryBuilder<AppMetadata, AppMetadata, QAfterSortBy>
      thenByCurrentDatabaseVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentDatabaseVersion', Sort.desc);
    });
  }

  QueryBuilder<AppMetadata, AppMetadata, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<AppMetadata, AppMetadata, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<AppMetadata, AppMetadata, QAfterSortBy> thenByLastSha256() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSha256', Sort.asc);
    });
  }

  QueryBuilder<AppMetadata, AppMetadata, QAfterSortBy> thenByLastSha256Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSha256', Sort.desc);
    });
  }

  QueryBuilder<AppMetadata, AppMetadata, QAfterSortBy> thenByLastSyncTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncTime', Sort.asc);
    });
  }

  QueryBuilder<AppMetadata, AppMetadata, QAfterSortBy>
      thenByLastSyncTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncTime', Sort.desc);
    });
  }
}

extension AppMetadataQueryWhereDistinct
    on QueryBuilder<AppMetadata, AppMetadata, QDistinct> {
  QueryBuilder<AppMetadata, AppMetadata, QDistinct>
      distinctByCurrentDatabaseVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currentDatabaseVersion');
    });
  }

  QueryBuilder<AppMetadata, AppMetadata, QDistinct> distinctByLastSha256(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastSha256', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AppMetadata, AppMetadata, QDistinct> distinctByLastSyncTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastSyncTime');
    });
  }
}

extension AppMetadataQueryProperty
    on QueryBuilder<AppMetadata, AppMetadata, QQueryProperty> {
  QueryBuilder<AppMetadata, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<AppMetadata, int, QQueryOperations>
      currentDatabaseVersionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currentDatabaseVersion');
    });
  }

  QueryBuilder<AppMetadata, String, QQueryOperations> lastSha256Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastSha256');
    });
  }

  QueryBuilder<AppMetadata, DateTime, QQueryOperations> lastSyncTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastSyncTime');
    });
  }
}
