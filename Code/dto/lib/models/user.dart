import 'package:firestore_odm/firestore_odm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class AppUser with _$AppUser {
  const factory AppUser({
    @DocumentIdField() required String id,
    required String firstName,
    required String lastName,
    required String email,
    @Default(0) int currentStreak,
    @Default(0) int longestStreak,
    DateTime? lastEntryDate,
    @Default([]) List<String> unlockedBadges,
  }) = _AppUser;

  factory AppUser.fromJson(Map<String, dynamic> json) => _$AppUserFromJson(json);
}