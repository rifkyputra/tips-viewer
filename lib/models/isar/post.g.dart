// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetPostIsarCollection on Isar {
  IsarCollection<PostIsar> get postIsars => getCollection();
}

const PostIsarSchema = CollectionSchema(
  name: 'PostIsar',
  schema:
      '{"name":"PostIsar","idName":"id","properties":[{"name":"link","type":"String"},{"name":"sha","type":"String"},{"name":"title","type":"String"},{"name":"type","type":"String"}],"indexes":[{"name":"sha","unique":true,"properties":[{"name":"sha","type":"Hash","caseSensitive":true}]}],"links":[]}',
  idName: 'id',
  propertyIds: {'link': 0, 'sha': 1, 'title': 2, 'type': 3},
  listProperties: {},
  indexIds: {'sha': 0},
  indexValueTypes: {
    'sha': [
      IndexValueType.stringHash,
    ]
  },
  linkIds: {},
  backlinkLinkNames: {},
  getId: _postIsarGetId,
  setId: _postIsarSetId,
  getLinks: _postIsarGetLinks,
  attachLinks: _postIsarAttachLinks,
  serializeNative: _postIsarSerializeNative,
  deserializeNative: _postIsarDeserializeNative,
  deserializePropNative: _postIsarDeserializePropNative,
  serializeWeb: _postIsarSerializeWeb,
  deserializeWeb: _postIsarDeserializeWeb,
  deserializePropWeb: _postIsarDeserializePropWeb,
  version: 3,
);

int? _postIsarGetId(PostIsar object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _postIsarSetId(PostIsar object, int id) {
  object.id = id;
}

List<IsarLinkBase> _postIsarGetLinks(PostIsar object) {
  return [];
}

void _postIsarSerializeNative(
    IsarCollection<PostIsar> collection,
    IsarRawObject rawObj,
    PostIsar object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.link;
  final _link = IsarBinaryWriter.utf8Encoder.convert(value0);
  dynamicSize += (_link.length) as int;
  final value1 = object.sha;
  final _sha = IsarBinaryWriter.utf8Encoder.convert(value1);
  dynamicSize += (_sha.length) as int;
  final value2 = object.title;
  final _title = IsarBinaryWriter.utf8Encoder.convert(value2);
  dynamicSize += (_title.length) as int;
  final value3 = object.type;
  IsarUint8List? _type;
  if (value3 != null) {
    _type = IsarBinaryWriter.utf8Encoder.convert(value3);
  }
  dynamicSize += (_type?.length ?? 0) as int;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBytes(offsets[0], _link);
  writer.writeBytes(offsets[1], _sha);
  writer.writeBytes(offsets[2], _title);
  writer.writeBytes(offsets[3], _type);
}

PostIsar _postIsarDeserializeNative(IsarCollection<PostIsar> collection, int id,
    IsarBinaryReader reader, List<int> offsets) {
  final object = PostIsar();
  object.id = id;
  object.link = reader.readString(offsets[0]);
  object.sha = reader.readString(offsets[1]);
  object.title = reader.readString(offsets[2]);
  object.type = reader.readStringOrNull(offsets[3]);
  return object;
}

P _postIsarDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _postIsarSerializeWeb(
    IsarCollection<PostIsar> collection, PostIsar object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'link', object.link);
  IsarNative.jsObjectSet(jsObj, 'sha', object.sha);
  IsarNative.jsObjectSet(jsObj, 'title', object.title);
  IsarNative.jsObjectSet(jsObj, 'type', object.type);
  return jsObj;
}

PostIsar _postIsarDeserializeWeb(
    IsarCollection<PostIsar> collection, dynamic jsObj) {
  final object = PostIsar();
  object.id = IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity;
  object.link = IsarNative.jsObjectGet(jsObj, 'link') ?? '';
  object.sha = IsarNative.jsObjectGet(jsObj, 'sha') ?? '';
  object.title = IsarNative.jsObjectGet(jsObj, 'title') ?? '';
  object.type = IsarNative.jsObjectGet(jsObj, 'type');
  return object;
}

P _postIsarDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
          as P;
    case 'link':
      return (IsarNative.jsObjectGet(jsObj, 'link') ?? '') as P;
    case 'sha':
      return (IsarNative.jsObjectGet(jsObj, 'sha') ?? '') as P;
    case 'title':
      return (IsarNative.jsObjectGet(jsObj, 'title') ?? '') as P;
    case 'type':
      return (IsarNative.jsObjectGet(jsObj, 'type')) as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _postIsarAttachLinks(IsarCollection col, int id, PostIsar object) {}

extension PostIsarByIndex on IsarCollection<PostIsar> {
  Future<PostIsar?> getBySha(String sha) {
    return getByIndex('sha', [sha]);
  }

  PostIsar? getByShaSync(String sha) {
    return getByIndexSync('sha', [sha]);
  }

  Future<bool> deleteBySha(String sha) {
    return deleteByIndex('sha', [sha]);
  }

  bool deleteByShaSync(String sha) {
    return deleteByIndexSync('sha', [sha]);
  }

  Future<List<PostIsar?>> getAllBySha(List<String> shaValues) {
    final values = shaValues.map((e) => [e]).toList();
    return getAllByIndex('sha', values);
  }

  List<PostIsar?> getAllByShaSync(List<String> shaValues) {
    final values = shaValues.map((e) => [e]).toList();
    return getAllByIndexSync('sha', values);
  }

  Future<int> deleteAllBySha(List<String> shaValues) {
    final values = shaValues.map((e) => [e]).toList();
    return deleteAllByIndex('sha', values);
  }

  int deleteAllByShaSync(List<String> shaValues) {
    final values = shaValues.map((e) => [e]).toList();
    return deleteAllByIndexSync('sha', values);
  }
}

extension PostIsarQueryWhereSort on QueryBuilder<PostIsar, PostIsar, QWhere> {
  QueryBuilder<PostIsar, PostIsar, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }

  QueryBuilder<PostIsar, PostIsar, QAfterWhere> anySha() {
    return addWhereClauseInternal(const IndexWhereClause.any(indexName: 'sha'));
  }
}

extension PostIsarQueryWhere on QueryBuilder<PostIsar, PostIsar, QWhereClause> {
  QueryBuilder<PostIsar, PostIsar, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<PostIsar, PostIsar, QAfterWhereClause> idNotEqualTo(int id) {
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

  QueryBuilder<PostIsar, PostIsar, QAfterWhereClause> idGreaterThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<PostIsar, PostIsar, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<PostIsar, PostIsar, QAfterWhereClause> idBetween(
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

  QueryBuilder<PostIsar, PostIsar, QAfterWhereClause> shaEqualTo(String sha) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'sha',
      value: [sha],
    ));
  }

  QueryBuilder<PostIsar, PostIsar, QAfterWhereClause> shaNotEqualTo(
      String sha) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'sha',
        upper: [sha],
        includeUpper: false,
      )).addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'sha',
        lower: [sha],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'sha',
        lower: [sha],
        includeLower: false,
      )).addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'sha',
        upper: [sha],
        includeUpper: false,
      ));
    }
  }
}

extension PostIsarQueryFilter
    on QueryBuilder<PostIsar, PostIsar, QFilterCondition> {
  QueryBuilder<PostIsar, PostIsar, QAfterFilterCondition> idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<PostIsar, PostIsar, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<PostIsar, PostIsar, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<PostIsar, PostIsar, QAfterFilterCondition> idBetween(
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

  QueryBuilder<PostIsar, PostIsar, QAfterFilterCondition> linkEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'link',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PostIsar, PostIsar, QAfterFilterCondition> linkGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'link',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PostIsar, PostIsar, QAfterFilterCondition> linkLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'link',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PostIsar, PostIsar, QAfterFilterCondition> linkBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'link',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PostIsar, PostIsar, QAfterFilterCondition> linkStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'link',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PostIsar, PostIsar, QAfterFilterCondition> linkEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'link',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PostIsar, PostIsar, QAfterFilterCondition> linkContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'link',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PostIsar, PostIsar, QAfterFilterCondition> linkMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'link',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PostIsar, PostIsar, QAfterFilterCondition> shaEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'sha',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PostIsar, PostIsar, QAfterFilterCondition> shaGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'sha',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PostIsar, PostIsar, QAfterFilterCondition> shaLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'sha',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PostIsar, PostIsar, QAfterFilterCondition> shaBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'sha',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PostIsar, PostIsar, QAfterFilterCondition> shaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'sha',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PostIsar, PostIsar, QAfterFilterCondition> shaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'sha',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PostIsar, PostIsar, QAfterFilterCondition> shaContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'sha',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PostIsar, PostIsar, QAfterFilterCondition> shaMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'sha',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PostIsar, PostIsar, QAfterFilterCondition> titleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PostIsar, PostIsar, QAfterFilterCondition> titleGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PostIsar, PostIsar, QAfterFilterCondition> titleLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PostIsar, PostIsar, QAfterFilterCondition> titleBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'title',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PostIsar, PostIsar, QAfterFilterCondition> titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PostIsar, PostIsar, QAfterFilterCondition> titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PostIsar, PostIsar, QAfterFilterCondition> titleContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PostIsar, PostIsar, QAfterFilterCondition> titleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'title',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PostIsar, PostIsar, QAfterFilterCondition> typeIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'type',
      value: null,
    ));
  }

  QueryBuilder<PostIsar, PostIsar, QAfterFilterCondition> typeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'type',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PostIsar, PostIsar, QAfterFilterCondition> typeGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'type',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PostIsar, PostIsar, QAfterFilterCondition> typeLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'type',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PostIsar, PostIsar, QAfterFilterCondition> typeBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'type',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PostIsar, PostIsar, QAfterFilterCondition> typeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'type',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PostIsar, PostIsar, QAfterFilterCondition> typeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'type',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PostIsar, PostIsar, QAfterFilterCondition> typeContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'type',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PostIsar, PostIsar, QAfterFilterCondition> typeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'type',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension PostIsarQueryLinks
    on QueryBuilder<PostIsar, PostIsar, QFilterCondition> {}

extension PostIsarQueryWhereSortBy
    on QueryBuilder<PostIsar, PostIsar, QSortBy> {
  QueryBuilder<PostIsar, PostIsar, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<PostIsar, PostIsar, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<PostIsar, PostIsar, QAfterSortBy> sortByLink() {
    return addSortByInternal('link', Sort.asc);
  }

  QueryBuilder<PostIsar, PostIsar, QAfterSortBy> sortByLinkDesc() {
    return addSortByInternal('link', Sort.desc);
  }

  QueryBuilder<PostIsar, PostIsar, QAfterSortBy> sortBySha() {
    return addSortByInternal('sha', Sort.asc);
  }

  QueryBuilder<PostIsar, PostIsar, QAfterSortBy> sortByShaDesc() {
    return addSortByInternal('sha', Sort.desc);
  }

  QueryBuilder<PostIsar, PostIsar, QAfterSortBy> sortByTitle() {
    return addSortByInternal('title', Sort.asc);
  }

  QueryBuilder<PostIsar, PostIsar, QAfterSortBy> sortByTitleDesc() {
    return addSortByInternal('title', Sort.desc);
  }

  QueryBuilder<PostIsar, PostIsar, QAfterSortBy> sortByType() {
    return addSortByInternal('type', Sort.asc);
  }

  QueryBuilder<PostIsar, PostIsar, QAfterSortBy> sortByTypeDesc() {
    return addSortByInternal('type', Sort.desc);
  }
}

extension PostIsarQueryWhereSortThenBy
    on QueryBuilder<PostIsar, PostIsar, QSortThenBy> {
  QueryBuilder<PostIsar, PostIsar, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<PostIsar, PostIsar, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<PostIsar, PostIsar, QAfterSortBy> thenByLink() {
    return addSortByInternal('link', Sort.asc);
  }

  QueryBuilder<PostIsar, PostIsar, QAfterSortBy> thenByLinkDesc() {
    return addSortByInternal('link', Sort.desc);
  }

  QueryBuilder<PostIsar, PostIsar, QAfterSortBy> thenBySha() {
    return addSortByInternal('sha', Sort.asc);
  }

  QueryBuilder<PostIsar, PostIsar, QAfterSortBy> thenByShaDesc() {
    return addSortByInternal('sha', Sort.desc);
  }

  QueryBuilder<PostIsar, PostIsar, QAfterSortBy> thenByTitle() {
    return addSortByInternal('title', Sort.asc);
  }

  QueryBuilder<PostIsar, PostIsar, QAfterSortBy> thenByTitleDesc() {
    return addSortByInternal('title', Sort.desc);
  }

  QueryBuilder<PostIsar, PostIsar, QAfterSortBy> thenByType() {
    return addSortByInternal('type', Sort.asc);
  }

  QueryBuilder<PostIsar, PostIsar, QAfterSortBy> thenByTypeDesc() {
    return addSortByInternal('type', Sort.desc);
  }
}

extension PostIsarQueryWhereDistinct
    on QueryBuilder<PostIsar, PostIsar, QDistinct> {
  QueryBuilder<PostIsar, PostIsar, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<PostIsar, PostIsar, QDistinct> distinctByLink(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('link', caseSensitive: caseSensitive);
  }

  QueryBuilder<PostIsar, PostIsar, QDistinct> distinctBySha(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('sha', caseSensitive: caseSensitive);
  }

  QueryBuilder<PostIsar, PostIsar, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('title', caseSensitive: caseSensitive);
  }

  QueryBuilder<PostIsar, PostIsar, QDistinct> distinctByType(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('type', caseSensitive: caseSensitive);
  }
}

extension PostIsarQueryProperty
    on QueryBuilder<PostIsar, PostIsar, QQueryProperty> {
  QueryBuilder<PostIsar, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<PostIsar, String, QQueryOperations> linkProperty() {
    return addPropertyNameInternal('link');
  }

  QueryBuilder<PostIsar, String, QQueryOperations> shaProperty() {
    return addPropertyNameInternal('sha');
  }

  QueryBuilder<PostIsar, String, QQueryOperations> titleProperty() {
    return addPropertyNameInternal('title');
  }

  QueryBuilder<PostIsar, String?, QQueryOperations> typeProperty() {
    return addPropertyNameInternal('type');
  }
}
