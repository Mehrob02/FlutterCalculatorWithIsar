// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_calculation.dart';

// **************************************************************************
// _IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, invalid_use_of_protected_member, lines_longer_than_80_chars, constant_identifier_names, avoid_js_rounded_ints, no_leading_underscores_for_local_identifiers, require_trailing_commas, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_in_if_null_operators, library_private_types_in_public_api, prefer_const_constructors
// ignore_for_file: type=lint

extension GetCalculationIsarCollection on Isar {
  IsarCollection<int, CalculationIsar> get calculationIsars =>
      this.collection();
}

const CalculationIsarSchema = IsarGeneratedSchema(
  schema: IsarSchema(
    name: 'CalculationIsar',
    idName: 'id',
    embedded: false,
    properties: [
      IsarPropertySchema(
        name: 'propmt',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'result',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'operationDateTime',
        type: IsarType.dateTime,
      ),
    ],
    indexes: [],
  ),
  converter: IsarObjectConverter<int, CalculationIsar>(
    serialize: serializeCalculationIsar,
    deserialize: deserializeCalculationIsar,
    deserializeProperty: deserializeCalculationIsarProp,
  ),
  embeddedSchemas: [],
);

@isarProtected
int serializeCalculationIsar(IsarWriter writer, CalculationIsar object) {
  IsarCore.writeString(writer, 1, object.propmt);
  IsarCore.writeString(writer, 2, object.result);
  IsarCore.writeLong(
      writer, 3, object.operationDateTime.toUtc().microsecondsSinceEpoch);
  return object.id;
}

@isarProtected
CalculationIsar deserializeCalculationIsar(IsarReader reader) {
  final object = CalculationIsar();
  object.id = IsarCore.readId(reader);
  object.propmt = IsarCore.readString(reader, 1) ?? '';
  object.result = IsarCore.readString(reader, 2) ?? '';
  {
    final value = IsarCore.readLong(reader, 3);
    if (value == -9223372036854775808) {
      object.operationDateTime =
          DateTime.fromMillisecondsSinceEpoch(0, isUtc: true).toLocal();
    } else {
      object.operationDateTime =
          DateTime.fromMicrosecondsSinceEpoch(value, isUtc: true).toLocal();
    }
  }
  return object;
}

@isarProtected
dynamic deserializeCalculationIsarProp(IsarReader reader, int property) {
  switch (property) {
    case 0:
      return IsarCore.readId(reader);
    case 1:
      return IsarCore.readString(reader, 1) ?? '';
    case 2:
      return IsarCore.readString(reader, 2) ?? '';
    case 3:
      {
        final value = IsarCore.readLong(reader, 3);
        if (value == -9223372036854775808) {
          return DateTime.fromMillisecondsSinceEpoch(0, isUtc: true).toLocal();
        } else {
          return DateTime.fromMicrosecondsSinceEpoch(value, isUtc: true)
              .toLocal();
        }
      }
    default:
      throw ArgumentError('Unknown property: $property');
  }
}

sealed class _CalculationIsarUpdate {
  bool call({
    required int id,
    String? propmt,
    String? result,
    DateTime? operationDateTime,
  });
}

class _CalculationIsarUpdateImpl implements _CalculationIsarUpdate {
  const _CalculationIsarUpdateImpl(this.collection);

  final IsarCollection<int, CalculationIsar> collection;

  @override
  bool call({
    required int id,
    Object? propmt = ignore,
    Object? result = ignore,
    Object? operationDateTime = ignore,
  }) {
    return collection.updateProperties([
          id
        ], {
          if (propmt != ignore) 1: propmt as String?,
          if (result != ignore) 2: result as String?,
          if (operationDateTime != ignore) 3: operationDateTime as DateTime?,
        }) >
        0;
  }
}

sealed class _CalculationIsarUpdateAll {
  int call({
    required List<int> id,
    String? propmt,
    String? result,
    DateTime? operationDateTime,
  });
}

class _CalculationIsarUpdateAllImpl implements _CalculationIsarUpdateAll {
  const _CalculationIsarUpdateAllImpl(this.collection);

  final IsarCollection<int, CalculationIsar> collection;

  @override
  int call({
    required List<int> id,
    Object? propmt = ignore,
    Object? result = ignore,
    Object? operationDateTime = ignore,
  }) {
    return collection.updateProperties(id, {
      if (propmt != ignore) 1: propmt as String?,
      if (result != ignore) 2: result as String?,
      if (operationDateTime != ignore) 3: operationDateTime as DateTime?,
    });
  }
}

extension CalculationIsarUpdate on IsarCollection<int, CalculationIsar> {
  _CalculationIsarUpdate get update => _CalculationIsarUpdateImpl(this);

  _CalculationIsarUpdateAll get updateAll =>
      _CalculationIsarUpdateAllImpl(this);
}

sealed class _CalculationIsarQueryUpdate {
  int call({
    String? propmt,
    String? result,
    DateTime? operationDateTime,
  });
}

class _CalculationIsarQueryUpdateImpl implements _CalculationIsarQueryUpdate {
  const _CalculationIsarQueryUpdateImpl(this.query, {this.limit});

  final IsarQuery<CalculationIsar> query;
  final int? limit;

  @override
  int call({
    Object? propmt = ignore,
    Object? result = ignore,
    Object? operationDateTime = ignore,
  }) {
    return query.updateProperties(limit: limit, {
      if (propmt != ignore) 1: propmt as String?,
      if (result != ignore) 2: result as String?,
      if (operationDateTime != ignore) 3: operationDateTime as DateTime?,
    });
  }
}

extension CalculationIsarQueryUpdate on IsarQuery<CalculationIsar> {
  _CalculationIsarQueryUpdate get updateFirst =>
      _CalculationIsarQueryUpdateImpl(this, limit: 1);

  _CalculationIsarQueryUpdate get updateAll =>
      _CalculationIsarQueryUpdateImpl(this);
}

class _CalculationIsarQueryBuilderUpdateImpl
    implements _CalculationIsarQueryUpdate {
  const _CalculationIsarQueryBuilderUpdateImpl(this.query, {this.limit});

  final QueryBuilder<CalculationIsar, CalculationIsar, QOperations> query;
  final int? limit;

  @override
  int call({
    Object? propmt = ignore,
    Object? result = ignore,
    Object? operationDateTime = ignore,
  }) {
    final q = query.build();
    try {
      return q.updateProperties(limit: limit, {
        if (propmt != ignore) 1: propmt as String?,
        if (result != ignore) 2: result as String?,
        if (operationDateTime != ignore) 3: operationDateTime as DateTime?,
      });
    } finally {
      q.close();
    }
  }
}

extension CalculationIsarQueryBuilderUpdate
    on QueryBuilder<CalculationIsar, CalculationIsar, QOperations> {
  _CalculationIsarQueryUpdate get updateFirst =>
      _CalculationIsarQueryBuilderUpdateImpl(this, limit: 1);

  _CalculationIsarQueryUpdate get updateAll =>
      _CalculationIsarQueryBuilderUpdateImpl(this);
}

extension CalculationIsarQueryFilter
    on QueryBuilder<CalculationIsar, CalculationIsar, QFilterCondition> {
  QueryBuilder<CalculationIsar, CalculationIsar, QAfterFilterCondition>
      idEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<CalculationIsar, CalculationIsar, QAfterFilterCondition>
      idGreaterThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<CalculationIsar, CalculationIsar, QAfterFilterCondition>
      idGreaterThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<CalculationIsar, CalculationIsar, QAfterFilterCondition>
      idLessThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<CalculationIsar, CalculationIsar, QAfterFilterCondition>
      idLessThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<CalculationIsar, CalculationIsar, QAfterFilterCondition>
      idBetween(
    int lower,
    int upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 0,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }

  QueryBuilder<CalculationIsar, CalculationIsar, QAfterFilterCondition>
      propmtEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CalculationIsar, CalculationIsar, QAfterFilterCondition>
      propmtGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CalculationIsar, CalculationIsar, QAfterFilterCondition>
      propmtGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CalculationIsar, CalculationIsar, QAfterFilterCondition>
      propmtLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CalculationIsar, CalculationIsar, QAfterFilterCondition>
      propmtLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CalculationIsar, CalculationIsar, QAfterFilterCondition>
      propmtBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 1,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CalculationIsar, CalculationIsar, QAfterFilterCondition>
      propmtStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CalculationIsar, CalculationIsar, QAfterFilterCondition>
      propmtEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CalculationIsar, CalculationIsar, QAfterFilterCondition>
      propmtContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CalculationIsar, CalculationIsar, QAfterFilterCondition>
      propmtMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 1,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CalculationIsar, CalculationIsar, QAfterFilterCondition>
      propmtIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<CalculationIsar, CalculationIsar, QAfterFilterCondition>
      propmtIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<CalculationIsar, CalculationIsar, QAfterFilterCondition>
      resultEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CalculationIsar, CalculationIsar, QAfterFilterCondition>
      resultGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CalculationIsar, CalculationIsar, QAfterFilterCondition>
      resultGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CalculationIsar, CalculationIsar, QAfterFilterCondition>
      resultLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CalculationIsar, CalculationIsar, QAfterFilterCondition>
      resultLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CalculationIsar, CalculationIsar, QAfterFilterCondition>
      resultBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 2,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CalculationIsar, CalculationIsar, QAfterFilterCondition>
      resultStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CalculationIsar, CalculationIsar, QAfterFilterCondition>
      resultEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CalculationIsar, CalculationIsar, QAfterFilterCondition>
      resultContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CalculationIsar, CalculationIsar, QAfterFilterCondition>
      resultMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 2,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CalculationIsar, CalculationIsar, QAfterFilterCondition>
      resultIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 2,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<CalculationIsar, CalculationIsar, QAfterFilterCondition>
      resultIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 2,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<CalculationIsar, CalculationIsar, QAfterFilterCondition>
      operationDateTimeEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 3,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<CalculationIsar, CalculationIsar, QAfterFilterCondition>
      operationDateTimeGreaterThan(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 3,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<CalculationIsar, CalculationIsar, QAfterFilterCondition>
      operationDateTimeGreaterThanOrEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 3,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<CalculationIsar, CalculationIsar, QAfterFilterCondition>
      operationDateTimeLessThan(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 3,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<CalculationIsar, CalculationIsar, QAfterFilterCondition>
      operationDateTimeLessThanOrEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 3,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<CalculationIsar, CalculationIsar, QAfterFilterCondition>
      operationDateTimeBetween(
    DateTime lower,
    DateTime upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 3,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }
}

extension CalculationIsarQueryObject
    on QueryBuilder<CalculationIsar, CalculationIsar, QFilterCondition> {}

extension CalculationIsarQuerySortBy
    on QueryBuilder<CalculationIsar, CalculationIsar, QSortBy> {
  QueryBuilder<CalculationIsar, CalculationIsar, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<CalculationIsar, CalculationIsar, QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<CalculationIsar, CalculationIsar, QAfterSortBy> sortByPropmt(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        1,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<CalculationIsar, CalculationIsar, QAfterSortBy> sortByPropmtDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        1,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<CalculationIsar, CalculationIsar, QAfterSortBy> sortByResult(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        2,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<CalculationIsar, CalculationIsar, QAfterSortBy> sortByResultDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        2,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<CalculationIsar, CalculationIsar, QAfterSortBy>
      sortByOperationDateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3);
    });
  }

  QueryBuilder<CalculationIsar, CalculationIsar, QAfterSortBy>
      sortByOperationDateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, sort: Sort.desc);
    });
  }
}

extension CalculationIsarQuerySortThenBy
    on QueryBuilder<CalculationIsar, CalculationIsar, QSortThenBy> {
  QueryBuilder<CalculationIsar, CalculationIsar, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<CalculationIsar, CalculationIsar, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<CalculationIsar, CalculationIsar, QAfterSortBy> thenByPropmt(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CalculationIsar, CalculationIsar, QAfterSortBy> thenByPropmtDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CalculationIsar, CalculationIsar, QAfterSortBy> thenByResult(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CalculationIsar, CalculationIsar, QAfterSortBy> thenByResultDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CalculationIsar, CalculationIsar, QAfterSortBy>
      thenByOperationDateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3);
    });
  }

  QueryBuilder<CalculationIsar, CalculationIsar, QAfterSortBy>
      thenByOperationDateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, sort: Sort.desc);
    });
  }
}

extension CalculationIsarQueryWhereDistinct
    on QueryBuilder<CalculationIsar, CalculationIsar, QDistinct> {
  QueryBuilder<CalculationIsar, CalculationIsar, QAfterDistinct>
      distinctByPropmt({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(1, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CalculationIsar, CalculationIsar, QAfterDistinct>
      distinctByResult({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(2, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CalculationIsar, CalculationIsar, QAfterDistinct>
      distinctByOperationDateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(3);
    });
  }
}

extension CalculationIsarQueryProperty1
    on QueryBuilder<CalculationIsar, CalculationIsar, QProperty> {
  QueryBuilder<CalculationIsar, int, QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<CalculationIsar, String, QAfterProperty> propmtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<CalculationIsar, String, QAfterProperty> resultProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<CalculationIsar, DateTime, QAfterProperty>
      operationDateTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }
}

extension CalculationIsarQueryProperty2<R>
    on QueryBuilder<CalculationIsar, R, QAfterProperty> {
  QueryBuilder<CalculationIsar, (R, int), QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<CalculationIsar, (R, String), QAfterProperty> propmtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<CalculationIsar, (R, String), QAfterProperty> resultProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<CalculationIsar, (R, DateTime), QAfterProperty>
      operationDateTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }
}

extension CalculationIsarQueryProperty3<R1, R2>
    on QueryBuilder<CalculationIsar, (R1, R2), QAfterProperty> {
  QueryBuilder<CalculationIsar, (R1, R2, int), QOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<CalculationIsar, (R1, R2, String), QOperations>
      propmtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<CalculationIsar, (R1, R2, String), QOperations>
      resultProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<CalculationIsar, (R1, R2, DateTime), QOperations>
      operationDateTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }
}
