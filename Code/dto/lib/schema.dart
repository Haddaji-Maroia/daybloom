import 'package:firestore_odm/firestore_odm.dart';
import 'models/user.dart';
import 'models/journal_entry.dart';

part 'schema.odm.dart';

@Schema()
@Collection<User>('users')
@Collection<JournalEntry>('users/*/entries')
final appSchema = _$AppSchema;