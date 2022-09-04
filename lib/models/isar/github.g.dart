// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetGithubConfigIsarCollection on Isar {
  IsarCollection<GithubConfigIsar> get githubConfigIsars => getCollection();
}

const GithubConfigIsarSchema = CollectionSchema(
  name: 'GithubConfigIsar',
  schema:
      '{"name":"GithubConfigIsar","idName":"id","properties":[{"name":"token","type":"String"}],"indexes":[],"links":[]}',
  idName: 'id',
  propertyIds: {'token': 0},
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {},
  backlinkLinkNames: {},
  getId: _githubConfigIsarGetId,
  setId: _githubConfigIsarSetId,
  getLinks: _githubConfigIsarGetLinks,
  attachLinks: _githubConfigIsarAttachLinks,
  serializeNative: _githubConfigIsarSerializeNative,
  deserializeNative: _githubConfigIsarDeserializeNative,
  deserializePropNative: _githubConfigIsarDeserializePropNative,
  serializeWeb: _githubConfigIsarSerializeWeb,
  deserializeWeb: _githubConfigIsarDeserializeWeb,
  deserializePropWeb: _githubConfigIsarDeserializePropWeb,
  version: 3,
);

int? _githubConfigIsarGetId(GithubConfigIsar object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _githubConfigIsarSetId(GithubConfigIsar object, int id) {
  object.id = id;
}

List<IsarLinkBase> _githubConfigIsarGetLinks(GithubConfigIsar object) {
  return [];
}

void _githubConfigIsarSerializeNative(
    IsarCollection<GithubConfigIsar> collection,
    IsarRawObject rawObj,
    GithubConfigIsar object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.token;
  final _token = IsarBinaryWriter.utf8Encoder.convert(value0);
  dynamicSize += (_token.length) as int;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBytes(offsets[0], _token);
}

GithubConfigIsar _githubConfigIsarDeserializeNative(
    IsarCollection<GithubConfigIsar> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
  final object = GithubConfigIsar();
  object.id = id;
  object.token = reader.readString(offsets[0]);
  return object;
}

P _githubConfigIsarDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readString(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _githubConfigIsarSerializeWeb(
    IsarCollection<GithubConfigIsar> collection, GithubConfigIsar object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'token', object.token);
  return jsObj;
}

GithubConfigIsar _githubConfigIsarDeserializeWeb(
    IsarCollection<GithubConfigIsar> collection, dynamic jsObj) {
  final object = GithubConfigIsar();
  object.id = IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity;
  object.token = IsarNative.jsObjectGet(jsObj, 'token') ?? '';
  return object;
}

P _githubConfigIsarDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
          as P;
    case 'token':
      return (IsarNative.jsObjectGet(jsObj, 'token') ?? '') as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _githubConfigIsarAttachLinks(
    IsarCollection col, int id, GithubConfigIsar object) {}

extension GithubConfigIsarQueryWhereSort
    on QueryBuilder<GithubConfigIsar, GithubConfigIsar, QWhere> {
  QueryBuilder<GithubConfigIsar, GithubConfigIsar, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension GithubConfigIsarQueryWhere
    on QueryBuilder<GithubConfigIsar, GithubConfigIsar, QWhereClause> {
  QueryBuilder<GithubConfigIsar, GithubConfigIsar, QAfterWhereClause> idEqualTo(
      int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<GithubConfigIsar, GithubConfigIsar, QAfterWhereClause>
      idNotEqualTo(int id) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      ).addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      );
    } else {
      return addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      ).addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      );
    }
  }

  QueryBuilder<GithubConfigIsar, GithubConfigIsar, QAfterWhereClause>
      idGreaterThan(int id, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<GithubConfigIsar, GithubConfigIsar, QAfterWhereClause>
      idLessThan(int id, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<GithubConfigIsar, GithubConfigIsar, QAfterWhereClause> idBetween(
    int lowerId,
    int upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: lowerId,
      includeLower: includeLower,
      upper: upperId,
      includeUpper: includeUpper,
    ));
  }
}

extension GithubConfigIsarQueryFilter
    on QueryBuilder<GithubConfigIsar, GithubConfigIsar, QFilterCondition> {
  QueryBuilder<GithubConfigIsar, GithubConfigIsar, QAfterFilterCondition>
      idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<GithubConfigIsar, GithubConfigIsar, QAfterFilterCondition>
      idGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<GithubConfigIsar, GithubConfigIsar, QAfterFilterCondition>
      idLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<GithubConfigIsar, GithubConfigIsar, QAfterFilterCondition>
      idBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'id',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<GithubConfigIsar, GithubConfigIsar, QAfterFilterCondition>
      tokenEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'token',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<GithubConfigIsar, GithubConfigIsar, QAfterFilterCondition>
      tokenGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'token',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<GithubConfigIsar, GithubConfigIsar, QAfterFilterCondition>
      tokenLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'token',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<GithubConfigIsar, GithubConfigIsar, QAfterFilterCondition>
      tokenBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'token',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<GithubConfigIsar, GithubConfigIsar, QAfterFilterCondition>
      tokenStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'token',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<GithubConfigIsar, GithubConfigIsar, QAfterFilterCondition>
      tokenEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'token',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<GithubConfigIsar, GithubConfigIsar, QAfterFilterCondition>
      tokenContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'token',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<GithubConfigIsar, GithubConfigIsar, QAfterFilterCondition>
      tokenMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'token',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension GithubConfigIsarQueryLinks
    on QueryBuilder<GithubConfigIsar, GithubConfigIsar, QFilterCondition> {}

extension GithubConfigIsarQueryWhereSortBy
    on QueryBuilder<GithubConfigIsar, GithubConfigIsar, QSortBy> {
  QueryBuilder<GithubConfigIsar, GithubConfigIsar, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<GithubConfigIsar, GithubConfigIsar, QAfterSortBy>
      sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<GithubConfigIsar, GithubConfigIsar, QAfterSortBy> sortByToken() {
    return addSortByInternal('token', Sort.asc);
  }

  QueryBuilder<GithubConfigIsar, GithubConfigIsar, QAfterSortBy>
      sortByTokenDesc() {
    return addSortByInternal('token', Sort.desc);
  }
}

extension GithubConfigIsarQueryWhereSortThenBy
    on QueryBuilder<GithubConfigIsar, GithubConfigIsar, QSortThenBy> {
  QueryBuilder<GithubConfigIsar, GithubConfigIsar, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<GithubConfigIsar, GithubConfigIsar, QAfterSortBy>
      thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<GithubConfigIsar, GithubConfigIsar, QAfterSortBy> thenByToken() {
    return addSortByInternal('token', Sort.asc);
  }

  QueryBuilder<GithubConfigIsar, GithubConfigIsar, QAfterSortBy>
      thenByTokenDesc() {
    return addSortByInternal('token', Sort.desc);
  }
}

extension GithubConfigIsarQueryWhereDistinct
    on QueryBuilder<GithubConfigIsar, GithubConfigIsar, QDistinct> {
  QueryBuilder<GithubConfigIsar, GithubConfigIsar, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<GithubConfigIsar, GithubConfigIsar, QDistinct> distinctByToken(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('token', caseSensitive: caseSensitive);
  }
}

extension GithubConfigIsarQueryProperty
    on QueryBuilder<GithubConfigIsar, GithubConfigIsar, QQueryProperty> {
  QueryBuilder<GithubConfigIsar, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<GithubConfigIsar, String, QQueryOperations> tokenProperty() {
    return addPropertyNameInternal('token');
  }
}
