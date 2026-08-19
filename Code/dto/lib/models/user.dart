import 'package:firestore_odm/firestore_odm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class User with _$User {
  const factory User({
    @DocumentIdField() required String id,
    required String firstName,
    required String lastName,
    required String email,
    @Default(0) int currentStreak,
    @Default(0) int longestStreak,
    DateTime? lastEntryDate,
    @Default([]) List<String> unlockedBadges,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}