// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_ingredient.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetLocalIngredientCollection on Isar {
  IsarCollection<LocalIngredient> get localIngredients => this.collection();
}

const LocalIngredientSchema = CollectionSchema(
  name: r'LocalIngredient',
  id: 2574034385203276338,
  properties: {
    r'aliases': PropertySchema(
      id: 0,
      name: r'aliases',
      type: IsarType.stringList,
    ),
    r'animalDerived': PropertySchema(
      id: 1,
      name: r'animalDerived',
      type: IsarType.bool,
    ),
    r'category': PropertySchema(
      id: 2,
      name: r'category',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 3,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'eNumber': PropertySchema(
      id: 4,
      name: r'eNumber',
      type: IsarType.string,
    ),
    r'explanation': PropertySchema(
      id: 5,
      name: r'explanation',
      type: IsarType.string,
    ),
    r'firestoreId': PropertySchema(
      id: 6,
      name: r'firestoreId',
      type: IsarType.string,
    ),
    r'languageVariants': PropertySchema(
      id: 7,
      name: r'languageVariants',
      type: IsarType.stringList,
    ),
    r'name': PropertySchema(
      id: 8,
      name: r'name',
      type: IsarType.string,
    ),
    r'origin': PropertySchema(
      id: 9,
      name: r'origin',
      type: IsarType.string,
    ),
    r'plantDerived': PropertySchema(
      id: 10,
      name: r'plantDerived',
      type: IsarType.bool,
    ),
    r'possibleSources': PropertySchema(
      id: 11,
      name: r'possibleSources',
      type: IsarType.stringList,
    ),
    r'references': PropertySchema(
      id: 12,
      name: r'references',
      type: IsarType.stringList,
    ),
    r'riskLevel': PropertySchema(
      id: 13,
      name: r'riskLevel',
      type: IsarType.string,
    ),
    r'scholarlyNotes': PropertySchema(
      id: 14,
      name: r'scholarlyNotes',
      type: IsarType.string,
    ),
    r'scientificName': PropertySchema(
      id: 15,
      name: r'scientificName',
      type: IsarType.string,
    ),
    r'searchTokens': PropertySchema(
      id: 16,
      name: r'searchTokens',
      type: IsarType.stringList,
    ),
    r'status': PropertySchema(
      id: 17,
      name: r'status',
      type: IsarType.string,
    ),
    r'synthetic': PropertySchema(
      id: 18,
      name: r'synthetic',
      type: IsarType.bool,
    ),
    r'updatedAt': PropertySchema(
      id: 19,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'verifiedBy': PropertySchema(
      id: 20,
      name: r'verifiedBy',
      type: IsarType.string,
    )
  },
  estimateSize: _localIngredientEstimateSize,
  serialize: _localIngredientSerialize,
  deserialize: _localIngredientDeserialize,
  deserializeProp: _localIngredientDeserializeProp,
  idName: r'id',
  indexes: {
    r'firestoreId': IndexSchema(
      id: 1863077355534729001,
      name: r'firestoreId',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'firestoreId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'name': IndexSchema(
      id: 879695947855722453,
      name: r'name',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'name',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'aliases': IndexSchema(
      id: 7903086418021463659,
      name: r'aliases',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'aliases',
          type: IndexType.hashElements,
          caseSensitive: true,
        )
      ],
    ),
    r'searchTokens': IndexSchema(
      id: 2062148741461982474,
      name: r'searchTokens',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'searchTokens',
          type: IndexType.hashElements,
          caseSensitive: true,
        )
      ],
    ),
    r'status': IndexSchema(
      id: -107785170620420283,
      name: r'status',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'status',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _localIngredientGetId,
  getLinks: _localIngredientGetLinks,
  attach: _localIngredientAttach,
  version: '3.1.0+1',
);

int _localIngredientEstimateSize(
  LocalIngredient object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.aliases.length * 3;
  {
    for (var i = 0; i < object.aliases.length; i++) {
      final value = object.aliases[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.category.length * 3;
  {
    final value = object.eNumber;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.explanation.length * 3;
  bytesCount += 3 + object.firestoreId.length * 3;
  {
    final list = object.languageVariants;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.origin.length * 3;
  {
    final list = object.possibleSources;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  {
    final list = object.references;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  bytesCount += 3 + object.riskLevel.length * 3;
  {
    final value = object.scholarlyNotes;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.scientificName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.searchTokens.length * 3;
  {
    for (var i = 0; i < object.searchTokens.length; i++) {
      final value = object.searchTokens[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.status.length * 3;
  bytesCount += 3 + object.verifiedBy.length * 3;
  return bytesCount;
}

void _localIngredientSerialize(
  LocalIngredient object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeStringList(offsets[0], object.aliases);
  writer.writeBool(offsets[1], object.animalDerived);
  writer.writeString(offsets[2], object.category);
  writer.writeDateTime(offsets[3], object.createdAt);
  writer.writeString(offsets[4], object.eNumber);
  writer.writeString(offsets[5], object.explanation);
  writer.writeString(offsets[6], object.firestoreId);
  writer.writeStringList(offsets[7], object.languageVariants);
  writer.writeString(offsets[8], object.name);
  writer.writeString(offsets[9], object.origin);
  writer.writeBool(offsets[10], object.plantDerived);
  writer.writeStringList(offsets[11], object.possibleSources);
  writer.writeStringList(offsets[12], object.references);
  writer.writeString(offsets[13], object.riskLevel);
  writer.writeString(offsets[14], object.scholarlyNotes);
  writer.writeString(offsets[15], object.scientificName);
  writer.writeStringList(offsets[16], object.searchTokens);
  writer.writeString(offsets[17], object.status);
  writer.writeBool(offsets[18], object.synthetic);
  writer.writeDateTime(offsets[19], object.updatedAt);
  writer.writeString(offsets[20], object.verifiedBy);
}

LocalIngredient _localIngredientDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = LocalIngredient();
  object.aliases = reader.readStringList(offsets[0]) ?? [];
  object.animalDerived = reader.readBool(offsets[1]);
  object.category = reader.readString(offsets[2]);
  object.createdAt = reader.readDateTime(offsets[3]);
  object.eNumber = reader.readStringOrNull(offsets[4]);
  object.explanation = reader.readString(offsets[5]);
  object.firestoreId = reader.readString(offsets[6]);
  object.id = id;
  object.languageVariants = reader.readStringList(offsets[7]);
  object.name = reader.readString(offsets[8]);
  object.origin = reader.readString(offsets[9]);
  object.plantDerived = reader.readBool(offsets[10]);
  object.possibleSources = reader.readStringList(offsets[11]);
  object.references = reader.readStringList(offsets[12]);
  object.riskLevel = reader.readString(offsets[13]);
  object.scholarlyNotes = reader.readStringOrNull(offsets[14]);
  object.scientificName = reader.readStringOrNull(offsets[15]);
  object.searchTokens = reader.readStringList(offsets[16]) ?? [];
  object.status = reader.readString(offsets[17]);
  object.synthetic = reader.readBool(offsets[18]);
  object.updatedAt = reader.readDateTime(offsets[19]);
  object.verifiedBy = reader.readString(offsets[20]);
  return object;
}

P _localIngredientDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringList(offset) ?? []) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readStringList(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readBool(offset)) as P;
    case 11:
      return (reader.readStringList(offset)) as P;
    case 12:
      return (reader.readStringList(offset)) as P;
    case 13:
      return (reader.readString(offset)) as P;
    case 14:
      return (reader.readStringOrNull(offset)) as P;
    case 15:
      return (reader.readStringOrNull(offset)) as P;
    case 16:
      return (reader.readStringList(offset) ?? []) as P;
    case 17:
      return (reader.readString(offset)) as P;
    case 18:
      return (reader.readBool(offset)) as P;
    case 19:
      return (reader.readDateTime(offset)) as P;
    case 20:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _localIngredientGetId(LocalIngredient object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _localIngredientGetLinks(LocalIngredient object) {
  return [];
}

void _localIngredientAttach(
    IsarCollection<dynamic> col, Id id, LocalIngredient object) {
  object.id = id;
}

extension LocalIngredientByIndex on IsarCollection<LocalIngredient> {
  Future<LocalIngredient?> getByFirestoreId(String firestoreId) {
    return getByIndex(r'firestoreId', [firestoreId]);
  }

  LocalIngredient? getByFirestoreIdSync(String firestoreId) {
    return getByIndexSync(r'firestoreId', [firestoreId]);
  }

  Future<bool> deleteByFirestoreId(String firestoreId) {
    return deleteByIndex(r'firestoreId', [firestoreId]);
  }

  bool deleteByFirestoreIdSync(String firestoreId) {
    return deleteByIndexSync(r'firestoreId', [firestoreId]);
  }

  Future<List<LocalIngredient?>> getAllByFirestoreId(
      List<String> firestoreIdValues) {
    final values = firestoreIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'firestoreId', values);
  }

  List<LocalIngredient?> getAllByFirestoreIdSync(
      List<String> firestoreIdValues) {
    final values = firestoreIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'firestoreId', values);
  }

  Future<int> deleteAllByFirestoreId(List<String> firestoreIdValues) {
    final values = firestoreIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'firestoreId', values);
  }

  int deleteAllByFirestoreIdSync(List<String> firestoreIdValues) {
    final values = firestoreIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'firestoreId', values);
  }

  Future<Id> putByFirestoreId(LocalIngredient object) {
    return putByIndex(r'firestoreId', object);
  }

  Id putByFirestoreIdSync(LocalIngredient object, {bool saveLinks = true}) {
    return putByIndexSync(r'firestoreId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByFirestoreId(List<LocalIngredient> objects) {
    return putAllByIndex(r'firestoreId', objects);
  }

  List<Id> putAllByFirestoreIdSync(List<LocalIngredient> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'firestoreId', objects, saveLinks: saveLinks);
  }
}

extension LocalIngredientQueryWhereSort
    on QueryBuilder<LocalIngredient, LocalIngredient, QWhere> {
  QueryBuilder<LocalIngredient, LocalIngredient, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterWhere> anyName() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'name'),
      );
    });
  }
}

extension LocalIngredientQueryWhere
    on QueryBuilder<LocalIngredient, LocalIngredient, QWhereClause> {
  QueryBuilder<LocalIngredient, LocalIngredient, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterWhereClause> idBetween(
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

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterWhereClause>
      firestoreIdEqualTo(String firestoreId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'firestoreId',
        value: [firestoreId],
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterWhereClause>
      firestoreIdNotEqualTo(String firestoreId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'firestoreId',
              lower: [],
              upper: [firestoreId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'firestoreId',
              lower: [firestoreId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'firestoreId',
              lower: [firestoreId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'firestoreId',
              lower: [],
              upper: [firestoreId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterWhereClause> nameEqualTo(
      String name) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'name',
        value: [name],
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterWhereClause>
      nameNotEqualTo(String name) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [],
              upper: [name],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [name],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [name],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [],
              upper: [name],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterWhereClause>
      nameGreaterThan(
    String name, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'name',
        lower: [name],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterWhereClause>
      nameLessThan(
    String name, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'name',
        lower: [],
        upper: [name],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterWhereClause> nameBetween(
    String lowerName,
    String upperName, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'name',
        lower: [lowerName],
        includeLower: includeLower,
        upper: [upperName],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterWhereClause>
      nameStartsWith(String NamePrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'name',
        lower: [NamePrefix],
        upper: ['$NamePrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterWhereClause>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'name',
        value: [''],
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterWhereClause>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'name',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'name',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'name',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'name',
              upper: [''],
            ));
      }
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterWhereClause>
      aliasesElementEqualTo(String aliasesElement) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'aliases',
        value: [aliasesElement],
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterWhereClause>
      aliasesElementNotEqualTo(String aliasesElement) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'aliases',
              lower: [],
              upper: [aliasesElement],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'aliases',
              lower: [aliasesElement],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'aliases',
              lower: [aliasesElement],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'aliases',
              lower: [],
              upper: [aliasesElement],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterWhereClause>
      searchTokensElementEqualTo(String searchTokensElement) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'searchTokens',
        value: [searchTokensElement],
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterWhereClause>
      searchTokensElementNotEqualTo(String searchTokensElement) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'searchTokens',
              lower: [],
              upper: [searchTokensElement],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'searchTokens',
              lower: [searchTokensElement],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'searchTokens',
              lower: [searchTokensElement],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'searchTokens',
              lower: [],
              upper: [searchTokensElement],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterWhereClause>
      statusEqualTo(String status) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'status',
        value: [status],
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterWhereClause>
      statusNotEqualTo(String status) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'status',
              lower: [],
              upper: [status],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'status',
              lower: [status],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'status',
              lower: [status],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'status',
              lower: [],
              upper: [status],
              includeUpper: false,
            ));
      }
    });
  }
}

extension LocalIngredientQueryFilter
    on QueryBuilder<LocalIngredient, LocalIngredient, QFilterCondition> {
  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      aliasesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'aliases',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      aliasesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'aliases',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      aliasesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'aliases',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      aliasesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'aliases',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      aliasesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'aliases',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      aliasesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'aliases',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      aliasesElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'aliases',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      aliasesElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'aliases',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      aliasesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'aliases',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      aliasesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'aliases',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      aliasesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'aliases',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      aliasesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'aliases',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      aliasesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'aliases',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      aliasesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'aliases',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      aliasesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'aliases',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      aliasesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'aliases',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      animalDerivedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'animalDerived',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      categoryEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      categoryGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      categoryLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      categoryBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'category',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      categoryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      categoryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      categoryContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      categoryMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'category',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      categoryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      categoryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'category',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      createdAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      createdAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      eNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'eNumber',
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      eNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'eNumber',
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      eNumberEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'eNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      eNumberGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'eNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      eNumberLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'eNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      eNumberBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'eNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      eNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'eNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      eNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'eNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      eNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'eNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      eNumberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'eNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      eNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'eNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      eNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'eNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      explanationEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'explanation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      explanationGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'explanation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      explanationLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'explanation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      explanationBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'explanation',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      explanationStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'explanation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      explanationEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'explanation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      explanationContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'explanation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      explanationMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'explanation',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      explanationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'explanation',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      explanationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'explanation',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      firestoreIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'firestoreId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      firestoreIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'firestoreId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      firestoreIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'firestoreId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      firestoreIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'firestoreId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      firestoreIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'firestoreId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      firestoreIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'firestoreId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      firestoreIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'firestoreId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      firestoreIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'firestoreId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      firestoreIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'firestoreId',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      firestoreIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'firestoreId',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      languageVariantsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'languageVariants',
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      languageVariantsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'languageVariants',
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      languageVariantsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'languageVariants',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      languageVariantsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'languageVariants',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      languageVariantsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'languageVariants',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      languageVariantsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'languageVariants',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      languageVariantsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'languageVariants',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      languageVariantsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'languageVariants',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      languageVariantsElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'languageVariants',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      languageVariantsElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'languageVariants',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      languageVariantsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'languageVariants',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      languageVariantsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'languageVariants',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      languageVariantsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'languageVariants',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      languageVariantsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'languageVariants',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      languageVariantsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'languageVariants',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      languageVariantsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'languageVariants',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      languageVariantsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'languageVariants',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      languageVariantsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'languageVariants',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      originEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'origin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      originGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'origin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      originLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'origin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      originBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'origin',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      originStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'origin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      originEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'origin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      originContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'origin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      originMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'origin',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      originIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'origin',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      originIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'origin',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      plantDerivedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'plantDerived',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      possibleSourcesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'possibleSources',
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      possibleSourcesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'possibleSources',
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      possibleSourcesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'possibleSources',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      possibleSourcesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'possibleSources',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      possibleSourcesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'possibleSources',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      possibleSourcesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'possibleSources',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      possibleSourcesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'possibleSources',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      possibleSourcesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'possibleSources',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      possibleSourcesElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'possibleSources',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      possibleSourcesElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'possibleSources',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      possibleSourcesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'possibleSources',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      possibleSourcesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'possibleSources',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      possibleSourcesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'possibleSources',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      possibleSourcesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'possibleSources',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      possibleSourcesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'possibleSources',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      possibleSourcesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'possibleSources',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      possibleSourcesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'possibleSources',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      possibleSourcesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'possibleSources',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      referencesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'references',
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      referencesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'references',
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      referencesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'references',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      referencesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'references',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      referencesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'references',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      referencesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'references',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      referencesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'references',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      referencesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'references',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      referencesElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'references',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      referencesElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'references',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      referencesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'references',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      referencesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'references',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      referencesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'references',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      referencesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'references',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      referencesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'references',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      referencesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'references',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      referencesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'references',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      referencesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'references',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      riskLevelEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'riskLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      riskLevelGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'riskLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      riskLevelLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'riskLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      riskLevelBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'riskLevel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      riskLevelStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'riskLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      riskLevelEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'riskLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      riskLevelContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'riskLevel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      riskLevelMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'riskLevel',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      riskLevelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'riskLevel',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      riskLevelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'riskLevel',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      scholarlyNotesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'scholarlyNotes',
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      scholarlyNotesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'scholarlyNotes',
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      scholarlyNotesEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'scholarlyNotes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      scholarlyNotesGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'scholarlyNotes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      scholarlyNotesLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'scholarlyNotes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      scholarlyNotesBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'scholarlyNotes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      scholarlyNotesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'scholarlyNotes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      scholarlyNotesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'scholarlyNotes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      scholarlyNotesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'scholarlyNotes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      scholarlyNotesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'scholarlyNotes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      scholarlyNotesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'scholarlyNotes',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      scholarlyNotesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'scholarlyNotes',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      scientificNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'scientificName',
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      scientificNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'scientificName',
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      scientificNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'scientificName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      scientificNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'scientificName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      scientificNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'scientificName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      scientificNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'scientificName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      scientificNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'scientificName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      scientificNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'scientificName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      scientificNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'scientificName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      scientificNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'scientificName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      scientificNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'scientificName',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      scientificNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'scientificName',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      searchTokensElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'searchTokens',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      searchTokensElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'searchTokens',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      searchTokensElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'searchTokens',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      searchTokensElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'searchTokens',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      searchTokensElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'searchTokens',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      searchTokensElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'searchTokens',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      searchTokensElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'searchTokens',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      searchTokensElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'searchTokens',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      searchTokensElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'searchTokens',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      searchTokensElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'searchTokens',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      searchTokensLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'searchTokens',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      searchTokensIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'searchTokens',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      searchTokensIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'searchTokens',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      searchTokensLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'searchTokens',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      searchTokensLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'searchTokens',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      searchTokensLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'searchTokens',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      statusEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      statusGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      statusLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      statusBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'status',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      statusStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      statusEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      statusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'status',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      statusMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'status',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      statusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      statusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'status',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      syntheticEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'synthetic',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      updatedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      updatedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      updatedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updatedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      verifiedByEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'verifiedBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      verifiedByGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'verifiedBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      verifiedByLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'verifiedBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      verifiedByBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'verifiedBy',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      verifiedByStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'verifiedBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      verifiedByEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'verifiedBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      verifiedByContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'verifiedBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      verifiedByMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'verifiedBy',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      verifiedByIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'verifiedBy',
        value: '',
      ));
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterFilterCondition>
      verifiedByIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'verifiedBy',
        value: '',
      ));
    });
  }
}

extension LocalIngredientQueryObject
    on QueryBuilder<LocalIngredient, LocalIngredient, QFilterCondition> {}

extension LocalIngredientQueryLinks
    on QueryBuilder<LocalIngredient, LocalIngredient, QFilterCondition> {}

extension LocalIngredientQuerySortBy
    on QueryBuilder<LocalIngredient, LocalIngredient, QSortBy> {
  QueryBuilder<LocalIngredient, LocalIngredient, QAfterSortBy>
      sortByAnimalDerived() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'animalDerived', Sort.asc);
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterSortBy>
      sortByAnimalDerivedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'animalDerived', Sort.desc);
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterSortBy>
      sortByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterSortBy>
      sortByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterSortBy> sortByENumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'eNumber', Sort.asc);
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterSortBy>
      sortByENumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'eNumber', Sort.desc);
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterSortBy>
      sortByExplanation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'explanation', Sort.asc);
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterSortBy>
      sortByExplanationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'explanation', Sort.desc);
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterSortBy>
      sortByFirestoreId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firestoreId', Sort.asc);
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterSortBy>
      sortByFirestoreIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firestoreId', Sort.desc);
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterSortBy> sortByOrigin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'origin', Sort.asc);
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterSortBy>
      sortByOriginDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'origin', Sort.desc);
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterSortBy>
      sortByPlantDerived() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plantDerived', Sort.asc);
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterSortBy>
      sortByPlantDerivedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plantDerived', Sort.desc);
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterSortBy>
      sortByRiskLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'riskLevel', Sort.asc);
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterSortBy>
      sortByRiskLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'riskLevel', Sort.desc);
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterSortBy>
      sortByScholarlyNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scholarlyNotes', Sort.asc);
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterSortBy>
      sortByScholarlyNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scholarlyNotes', Sort.desc);
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterSortBy>
      sortByScientificName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scientificName', Sort.asc);
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterSortBy>
      sortByScientificNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scientificName', Sort.desc);
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterSortBy>
      sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterSortBy>
      sortBySynthetic() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'synthetic', Sort.asc);
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterSortBy>
      sortBySyntheticDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'synthetic', Sort.desc);
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterSortBy>
      sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterSortBy>
      sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterSortBy>
      sortByVerifiedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'verifiedBy', Sort.asc);
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterSortBy>
      sortByVerifiedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'verifiedBy', Sort.desc);
    });
  }
}

extension LocalIngredientQuerySortThenBy
    on QueryBuilder<LocalIngredient, LocalIngredient, QSortThenBy> {
  QueryBuilder<LocalIngredient, LocalIngredient, QAfterSortBy>
      thenByAnimalDerived() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'animalDerived', Sort.asc);
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterSortBy>
      thenByAnimalDerivedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'animalDerived', Sort.desc);
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterSortBy>
      thenByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterSortBy>
      thenByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterSortBy> thenByENumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'eNumber', Sort.asc);
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterSortBy>
      thenByENumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'eNumber', Sort.desc);
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterSortBy>
      thenByExplanation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'explanation', Sort.asc);
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterSortBy>
      thenByExplanationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'explanation', Sort.desc);
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterSortBy>
      thenByFirestoreId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firestoreId', Sort.asc);
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterSortBy>
      thenByFirestoreIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firestoreId', Sort.desc);
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterSortBy> thenByOrigin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'origin', Sort.asc);
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterSortBy>
      thenByOriginDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'origin', Sort.desc);
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterSortBy>
      thenByPlantDerived() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plantDerived', Sort.asc);
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterSortBy>
      thenByPlantDerivedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plantDerived', Sort.desc);
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterSortBy>
      thenByRiskLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'riskLevel', Sort.asc);
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterSortBy>
      thenByRiskLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'riskLevel', Sort.desc);
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterSortBy>
      thenByScholarlyNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scholarlyNotes', Sort.asc);
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterSortBy>
      thenByScholarlyNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scholarlyNotes', Sort.desc);
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterSortBy>
      thenByScientificName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scientificName', Sort.asc);
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterSortBy>
      thenByScientificNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scientificName', Sort.desc);
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterSortBy>
      thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterSortBy>
      thenBySynthetic() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'synthetic', Sort.asc);
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterSortBy>
      thenBySyntheticDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'synthetic', Sort.desc);
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterSortBy>
      thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterSortBy>
      thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterSortBy>
      thenByVerifiedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'verifiedBy', Sort.asc);
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QAfterSortBy>
      thenByVerifiedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'verifiedBy', Sort.desc);
    });
  }
}

extension LocalIngredientQueryWhereDistinct
    on QueryBuilder<LocalIngredient, LocalIngredient, QDistinct> {
  QueryBuilder<LocalIngredient, LocalIngredient, QDistinct>
      distinctByAliases() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'aliases');
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QDistinct>
      distinctByAnimalDerived() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'animalDerived');
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QDistinct> distinctByCategory(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'category', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QDistinct> distinctByENumber(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'eNumber', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QDistinct>
      distinctByExplanation({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'explanation', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QDistinct>
      distinctByFirestoreId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'firestoreId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QDistinct>
      distinctByLanguageVariants() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'languageVariants');
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QDistinct> distinctByOrigin(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'origin', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QDistinct>
      distinctByPlantDerived() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'plantDerived');
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QDistinct>
      distinctByPossibleSources() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'possibleSources');
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QDistinct>
      distinctByReferences() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'references');
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QDistinct> distinctByRiskLevel(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'riskLevel', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QDistinct>
      distinctByScholarlyNotes({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'scholarlyNotes',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QDistinct>
      distinctByScientificName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'scientificName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QDistinct>
      distinctBySearchTokens() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'searchTokens');
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QDistinct> distinctByStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QDistinct>
      distinctBySynthetic() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'synthetic');
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QDistinct>
      distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<LocalIngredient, LocalIngredient, QDistinct>
      distinctByVerifiedBy({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'verifiedBy', caseSensitive: caseSensitive);
    });
  }
}

extension LocalIngredientQueryProperty
    on QueryBuilder<LocalIngredient, LocalIngredient, QQueryProperty> {
  QueryBuilder<LocalIngredient, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<LocalIngredient, List<String>, QQueryOperations>
      aliasesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'aliases');
    });
  }

  QueryBuilder<LocalIngredient, bool, QQueryOperations>
      animalDerivedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'animalDerived');
    });
  }

  QueryBuilder<LocalIngredient, String, QQueryOperations> categoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'category');
    });
  }

  QueryBuilder<LocalIngredient, DateTime, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<LocalIngredient, String?, QQueryOperations> eNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'eNumber');
    });
  }

  QueryBuilder<LocalIngredient, String, QQueryOperations>
      explanationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'explanation');
    });
  }

  QueryBuilder<LocalIngredient, String, QQueryOperations>
      firestoreIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'firestoreId');
    });
  }

  QueryBuilder<LocalIngredient, List<String>?, QQueryOperations>
      languageVariantsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'languageVariants');
    });
  }

  QueryBuilder<LocalIngredient, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<LocalIngredient, String, QQueryOperations> originProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'origin');
    });
  }

  QueryBuilder<LocalIngredient, bool, QQueryOperations> plantDerivedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'plantDerived');
    });
  }

  QueryBuilder<LocalIngredient, List<String>?, QQueryOperations>
      possibleSourcesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'possibleSources');
    });
  }

  QueryBuilder<LocalIngredient, List<String>?, QQueryOperations>
      referencesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'references');
    });
  }

  QueryBuilder<LocalIngredient, String, QQueryOperations> riskLevelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'riskLevel');
    });
  }

  QueryBuilder<LocalIngredient, String?, QQueryOperations>
      scholarlyNotesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'scholarlyNotes');
    });
  }

  QueryBuilder<LocalIngredient, String?, QQueryOperations>
      scientificNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'scientificName');
    });
  }

  QueryBuilder<LocalIngredient, List<String>, QQueryOperations>
      searchTokensProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'searchTokens');
    });
  }

  QueryBuilder<LocalIngredient, String, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<LocalIngredient, bool, QQueryOperations> syntheticProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'synthetic');
    });
  }

  QueryBuilder<LocalIngredient, DateTime, QQueryOperations>
      updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<LocalIngredient, String, QQueryOperations> verifiedByProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'verifiedBy');
    });
  }
}
