// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'journal_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_JournalEntry _$JournalEntryFromJson(Map<String, dynamic> json) =>
    _JournalEntry(
      id: json['id'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
      userId: json['userId'] as String,
      photoUrl: json['photoUrl'] as String?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

const _$JournalEntryFieldMap = <String, String>{
  'id': 'id',
  'title': 'title',
  'content': 'content',
  'userId': 'userId',
  'photoUrl': 'photoUrl',
  'tags': 'tags',
  'createdAt': 'createdAt',
};

// ignore: unused_element
abstract class _$JournalEntryPerFieldToJson {
  // ignore: unused_element
  static Object? id(String instance) => instance;
  // ignore: unused_element
  static Object? title(String instance) => instance;
  // ignore: unused_element
  static Object? content(String instance) => instance;
  // ignore: unused_element
  static Object? userId(String instance) => instance;
  // ignore: unused_element
  static Object? photoUrl(String? instance) => instance;
  // ignore: unused_element
  static Object? tags(List<String>? instance) => instance;
  // ignore: unused_element
  static Object? createdAt(DateTime instance) => instance.toIso8601String();
}

Map<String, dynamic> _$JournalEntryToJson(_JournalEntry instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'userId': instance.userId,
      'photoUrl': instance.photoUrl,
      'tags': instance.tags,
      'createdAt': instance.createdAt.toIso8601String(),
    };
