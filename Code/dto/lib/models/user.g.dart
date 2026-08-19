// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppUser _$AppUserFromJson(Map<String, dynamic> json) => _AppUser(
      id: json['id'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      currentStreak: (json['currentStreak'] as num?)?.toInt() ?? 0,
      longestStreak: (json['longestStreak'] as num?)?.toInt() ?? 0,
      lastEntryDate: json['lastEntryDate'] == null
          ? null
          : DateTime.parse(json['lastEntryDate'] as String),
      unlockedBadges: (json['unlockedBadges'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

const _$AppUserFieldMap = <String, String>{
  'id': 'id',
  'firstName': 'firstName',
  'lastName': 'lastName',
  'email': 'email',
  'currentStreak': 'currentStreak',
  'longestStreak': 'longestStreak',
  'lastEntryDate': 'lastEntryDate',
  'unlockedBadges': 'unlockedBadges',
};

// ignore: unused_element
abstract class _$AppUserPerFieldToJson {
  // ignore: unused_element
  static Object? id(String instance) => instance;
  // ignore: unused_element
  static Object? firstName(String instance) => instance;
  // ignore: unused_element
  static Object? lastName(String instance) => instance;
  // ignore: unused_element
  static Object? email(String instance) => instance;
  // ignore: unused_element
  static Object? currentStreak(int instance) => instance;
  // ignore: unused_element
  static Object? longestStreak(int instance) => instance;
  // ignore: unused_element
  static Object? lastEntryDate(DateTime? instance) =>
      instance?.toIso8601String();
  // ignore: unused_element
  static Object? unlockedBadges(List<String> instance) => instance;
}

Map<String, dynamic> _$AppUserToJson(_AppUser instance) => <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'currentStreak': instance.currentStreak,
      'longestStreak': instance.longestStreak,
      'lastEntryDate': instance.lastEntryDate?.toIso8601String(),
      'unlockedBadges': instance.unlockedBadges,
    };
