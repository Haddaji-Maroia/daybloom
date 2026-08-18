import 'package:firestore_odm/firestore_odm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dto/converters/firestore_timestamp_converter.dart';

part 'journal_entry.freezed.dart';
part 'journal_entry.g.dart';

@freezed
abstract class JournalEntry with _$JournalEntry {
  const factory JournalEntry({
    @DocumentIdField() required String id,
    required String title,
    required String content,
    required String userId,
    String? photoUrl,
    List<String>? tags,
    @FirestoreTimestampConverter()
    required DateTime createdAt,
  }) = _JournalEntry;

  factory JournalEntry.fromJson(Map<String, dynamic> json) =>
      _$JournalEntryFromJson(json);
}