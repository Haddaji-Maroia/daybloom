// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schema.dart';

// **************************************************************************
// FirestoreGenerator
// **************************************************************************

/// Identifiers for all Firestore collections in the schema
/// Used to map collection paths to their respective collection classes
/// By combining collection classes (e.g., as tuple types),
/// we can use extension methods with record types to reduce boilerplate
/// Example: (_$UsersCollection, _$PostsCollection)
final class _$UsersCollection {}

final class _$EntriesCollection {}

/// Generated schema class - dummy class that only serves as type marker
class AppSchema extends FirestoreSchema {
  const AppSchema();
}

/// Generated schema instance
const AppSchema _$AppSchema = AppSchema();

/// Generated FilterSelector for `AppUser`
extension AppSchemaAppUserFilterSelectorExtension on FilterSelector<AppUser> {
  /// Filter by document ID (id field)
  @pragma('vm:prefer-inline')
  DocumentIdFieldFilter get id => DocumentIdFieldFilter(
        name: 'id',
        parent: this,
      );

  /// Filter by firstName
  StringFieldFilter get firstName => StringFieldFilter(
        name: 'firstName',
        parent: this,
      );

  /// Filter by lastName
  StringFieldFilter get lastName => StringFieldFilter(
        name: 'lastName',
        parent: this,
      );

  /// Filter by email
  StringFieldFilter get email => StringFieldFilter(
        name: 'email',
        parent: this,
      );

  /// Filter by currentStreak
  NumericFieldFilter get currentStreak => NumericFieldFilter(
        name: 'currentStreak',
        parent: this,
      );

  /// Filter by longestStreak
  NumericFieldFilter get longestStreak => NumericFieldFilter(
        name: 'longestStreak',
        parent: this,
      );

  /// Filter by lastEntryDate
  DateTimeFieldFilter get lastEntryDate => DateTimeFieldFilter(
        name: 'lastEntryDate',
        parent: this,
      );

  /// Filter by unlockedBadges
  ArrayFieldFilter get unlockedBadges => ArrayFieldFilter(
        name: 'unlockedBadges',
        parent: this,
      );
}

/// Generated OrderByFieldSelector for `AppUser`
extension AppSchemaAppUserOrderByFieldSelectorExtension
    on OrderByFieldSelector<AppUser> {
  /// Order by document ID (id field)
  OrderByField<String> get id => OrderByField(
        name: 'id',
        parent: this,
        type: FieldPathType.documentId,
      );

  /// Order by firstName
  OrderByField<String> get firstName => OrderByField(
        name: 'firstName',
        parent: this,
      );

  /// Order by lastName
  OrderByField<String> get lastName => OrderByField(
        name: 'lastName',
        parent: this,
      );

  /// Order by email
  OrderByField<String> get email => OrderByField(
        name: 'email',
        parent: this,
      );

  /// Order by currentStreak
  OrderByField<int> get currentStreak => OrderByField(
        name: 'currentStreak',
        parent: this,
      );

  /// Order by longestStreak
  OrderByField<int> get longestStreak => OrderByField(
        name: 'longestStreak',
        parent: this,
      );

  /// Order by lastEntryDate
  OrderByField<DateTime?> get lastEntryDate => OrderByField(
        name: 'lastEntryDate',
        parent: this,
      );

  /// Order by unlockedBadges
  OrderByField<List<String>> get unlockedBadges => OrderByField(
        name: 'unlockedBadges',
        parent: this,
      );
}

/// Generated AggregateFieldSelector for AppUser
extension AppSchemaAppUserAggregateFieldSelectorExtension
    on AggregateFieldSelector<AppUser> {
  /// currentStreak field for aggregation
  AggregateField<int> get currentStreak => AggregateField(
        name: 'currentStreak',
        parent: this,
      );

  /// longestStreak field for aggregation
  AggregateField<int> get longestStreak => AggregateField(
        name: 'longestStreak',
        parent: this,
      );
}

extension AppSchemaAppUserPatchBuilder on PatchBuilder<AppUser> {
  /// Update id field `String`
  @pragma('vm:prefer-inline')
  PatchBuilder<String> get id => PatchBuilder(
        name: 'id',
        parent: this,
        converter: const PrimitiveConverter(),
      );

  /// Update firstName field `String`
  @pragma('vm:prefer-inline')
  PatchBuilder<String> get firstName => PatchBuilder(
        name: 'firstName',
        parent: this,
        converter: const PrimitiveConverter(),
      );

  /// Update lastName field `String`
  @pragma('vm:prefer-inline')
  PatchBuilder<String> get lastName => PatchBuilder(
        name: 'lastName',
        parent: this,
        converter: const PrimitiveConverter(),
      );

  /// Update email field `String`
  @pragma('vm:prefer-inline')
  PatchBuilder<String> get email => PatchBuilder(
        name: 'email',
        parent: this,
        converter: const PrimitiveConverter(),
      );

  /// Update currentStreak field `int`
  @pragma('vm:prefer-inline')
  NumericFieldUpdate<int> get currentStreak => NumericFieldUpdate(
        name: 'currentStreak',
        parent: this,
        converter: const PrimitiveConverter(),
      );

  /// Update longestStreak field `int`
  @pragma('vm:prefer-inline')
  NumericFieldUpdate<int> get longestStreak => NumericFieldUpdate(
        name: 'longestStreak',
        parent: this,
        converter: const PrimitiveConverter(),
      );

  /// Update lastEntryDate field `DateTime?`
  @pragma('vm:prefer-inline')
  DateTimeFieldUpdate<DateTime?> get lastEntryDate => DateTimeFieldUpdate(
        name: 'lastEntryDate',
        parent: this,
      );

  /// Update unlockedBadges field `List<String>`
  @pragma('vm:prefer-inline')
  ListFieldUpdate<List<String>, String> get unlockedBadges => ListFieldUpdate(
        name: 'unlockedBadges',
        parent: this,
        converter: /* {} */ ListConverter<String>(const PrimitiveConverter()),
        elementConverter: const PrimitiveConverter(),
      );
}

/// Generated FilterSelector for `List<E>`
extension AppSchemaListFilterSelectorExtension<E> on FilterSelector<List<E>> {}

/// Generated OrderByFieldSelector for `List<E>`
extension AppSchemaListOrderByFieldSelectorExtension<E>
    on OrderByFieldSelector<List<E>> {}

/// Generated FilterSelector for `JournalEntry`
extension AppSchemaJournalEntryFilterSelectorExtension
    on FilterSelector<JournalEntry> {
  /// Filter by document ID (id field)
  @pragma('vm:prefer-inline')
  DocumentIdFieldFilter get id => DocumentIdFieldFilter(
        name: 'id',
        parent: this,
      );

  /// Filter by title
  StringFieldFilter get title => StringFieldFilter(
        name: 'title',
        parent: this,
      );

  /// Filter by content
  StringFieldFilter get content => StringFieldFilter(
        name: 'content',
        parent: this,
      );

  /// Filter by userId
  StringFieldFilter get userId => StringFieldFilter(
        name: 'userId',
        parent: this,
      );

  /// Filter by photoUrl
  StringFieldFilter get photoUrl => StringFieldFilter(
        name: 'photoUrl',
        parent: this,
      );

  /// Filter by tags
  ArrayFieldFilter get tags => ArrayFieldFilter(
        name: 'tags',
        parent: this,
      );

  /// Filter by createdAt
  DateTimeFieldFilter get createdAt => DateTimeFieldFilter(
        name: 'createdAt',
        parent: this,
      );
}

/// Generated OrderByFieldSelector for `JournalEntry`
extension AppSchemaJournalEntryOrderByFieldSelectorExtension
    on OrderByFieldSelector<JournalEntry> {
  /// Order by document ID (id field)
  OrderByField<String> get id => OrderByField(
        name: 'id',
        parent: this,
        type: FieldPathType.documentId,
      );

  /// Order by title
  OrderByField<String> get title => OrderByField(
        name: 'title',
        parent: this,
      );

  /// Order by content
  OrderByField<String> get content => OrderByField(
        name: 'content',
        parent: this,
      );

  /// Order by userId
  OrderByField<String> get userId => OrderByField(
        name: 'userId',
        parent: this,
      );

  /// Order by photoUrl
  OrderByField<String?> get photoUrl => OrderByField(
        name: 'photoUrl',
        parent: this,
      );

  /// Order by tags
  OrderByField<List<String>?> get tags => OrderByField(
        name: 'tags',
        parent: this,
      );

  /// Order by createdAt
  OrderByField<DateTime> get createdAt => OrderByField(
        name: 'createdAt',
        parent: this,
      );
}

/// Generated AggregateFieldSelector for JournalEntry
extension AppSchemaJournalEntryAggregateFieldSelectorExtension
    on AggregateFieldSelector<JournalEntry> {}

extension AppSchemaJournalEntryPatchBuilder on PatchBuilder<JournalEntry> {
  /// Update id field `String`
  @pragma('vm:prefer-inline')
  PatchBuilder<String> get id => PatchBuilder(
        name: 'id',
        parent: this,
        converter: const PrimitiveConverter(),
      );

  /// Update title field `String`
  @pragma('vm:prefer-inline')
  PatchBuilder<String> get title => PatchBuilder(
        name: 'title',
        parent: this,
        converter: const PrimitiveConverter(),
      );

  /// Update content field `String`
  @pragma('vm:prefer-inline')
  PatchBuilder<String> get content => PatchBuilder(
        name: 'content',
        parent: this,
        converter: const PrimitiveConverter(),
      );

  /// Update userId field `String`
  @pragma('vm:prefer-inline')
  PatchBuilder<String> get userId => PatchBuilder(
        name: 'userId',
        parent: this,
        converter: const PrimitiveConverter(),
      );

  /// Update photoUrl field `String?`
  @pragma('vm:prefer-inline')
  PatchBuilder<String?> get photoUrl => PatchBuilder(
        name: 'photoUrl',
        parent: this,
        converter: NullableConverter(const PrimitiveConverter()),
      );

  /// Update tags field `List<String>?`
  @pragma('vm:prefer-inline')
  ListFieldUpdate<List<String>?, String> get tags => ListFieldUpdate(
        name: 'tags',
        parent: this,
        converter: NullableConverter(
            /* {} */ ListConverter<String>(const PrimitiveConverter())),
        elementConverter: const PrimitiveConverter(),
      );

  /// Update createdAt field `DateTime`
  @pragma('vm:prefer-inline')
  DateTimeFieldUpdate<DateTime> get createdAt => DateTimeFieldUpdate(
        name: 'createdAt',
        parent: this,
      );
}

/// Class to add collections to `FirestoreODM<AppSchema>`
extension AppSchemaODM on FirestoreODM<AppSchema> {
  /// Access users collection
  @pragma('vm:prefer-inline')
  FirestoreCollection<AppSchema, AppUser, (_$UsersCollection,)> get users =>
      FirestoreCollection<AppSchema, AppUser, (_$UsersCollection,)>(
        query: firestore.collection('users'),
        converter: const _$AppUserJsonConverter(),
        documentIdField: 'id',
      );
}

/// Extension to add collections to `TransactionContext<AppSchema>`
extension $AppSchemaTransactionContext on TransactionContext<AppSchema> {
  /// Access users collection
  @pragma('vm:prefer-inline')
  TransactionCollection<AppSchema, AppUser, (_$UsersCollection,)> get users =>
      TransactionCollection<AppSchema, AppUser, (_$UsersCollection,)>(
        query: ref.collection('users'),
        context: this,
        converter: const _$AppUserJsonConverter(),
        documentIdField: 'id',
      );
}

/// Transaction document class for users collection
extension $AppSchemaUsersTransactionDocument
    on TransactionDocument<AppSchema, AppUser, (_$UsersCollection,)> {
  /// Access entries subcollection
  @pragma('vm:prefer-inline')
  TransactionCollection<AppSchema, JournalEntry,
          (_$UsersCollection, _$EntriesCollection)>
      get entries => TransactionCollection<AppSchema, JournalEntry,
              (_$UsersCollection, _$EntriesCollection)>(
            query: ref.collection('entries'),
            context: context,
            converter: const _$JournalEntryJsonConverter(),
            documentIdField: 'id',
          );
}

/// Document class for users collection
extension $AppSchemaUsersDocument
    on FirestoreDocument<AppSchema, AppUser, (_$UsersCollection,)> {
  /// Access entries subcollection
  FirestoreCollection<AppSchema, JournalEntry,
          (_$UsersCollection, _$EntriesCollection)>
      get entries => FirestoreCollection<AppSchema, JournalEntry,
              (_$UsersCollection, _$EntriesCollection)>(
            query: ref.collection('entries'),
            converter: const _$JournalEntryJsonConverter(),
            documentIdField: 'id',
          );
}

/// Extension to add collections to BatchContext<AppSchema>
extension AppSchemaBatchContextExtensions on BatchContext<AppSchema> {
  /// Access users collection
  BatchCollection<AppSchema, AppUser, (_$UsersCollection,)> get users =>
      BatchCollection(
        collection: firestoreInstance.collection('users'),
        converter: const _$AppUserJsonConverter(),
        documentIdField: 'id',
        context: this,
      );
}

/// Batch document class for users collection
extension $AppSchemaUsersBatchDocument
    on BatchDocument<AppSchema, AppUser, (_$UsersCollection,)> {
  /// Access entries subcollection
  @pragma('vm:prefer-inline')
  BatchCollection<AppSchema, JournalEntry,
          (_$UsersCollection, _$EntriesCollection)>
      get entries => getBatchCollection(
            parent: this,
            name: 'entries',
            converter: const _$JournalEntryJsonConverter(),
            documentIdField: 'id',
          );
}

//Generated converter for `FirestoreTimestampConverter`
class _$FirestoreTimestampConverterAnnotationConverter
    implements FirestoreConverter<DateTime, Object?> {
  const _$FirestoreTimestampConverterAnnotationConverter();

  @override
  DateTime fromJson(Object? data) =>
      FirestoreTimestampConverter().fromJson(data);

  @override
  Object? toJson(DateTime value) => FirestoreTimestampConverter().toJson(value);
}

//Generated converter for `AppUser`
class _$AppUserJsonConverter
    implements FirestoreConverter<AppUser, Map<String, dynamic>> {
  const _$AppUserJsonConverter();

  @override
  AppUser fromJson(Map<String, dynamic> data) => AppUser.fromJson(data);

  @override
  Map<String, dynamic> toJson(AppUser value) => value.toJson();
}

//Generated converter for `JournalEntry`
class _$JournalEntryJsonConverter
    implements FirestoreConverter<JournalEntry, Map<String, dynamic>> {
  const _$JournalEntryJsonConverter();

  @override
  JournalEntry fromJson(Map<String, dynamic> data) =>
      JournalEntry.fromJson(data);

  @override
  Map<String, dynamic> toJson(JournalEntry value) => value.toJson();
}
