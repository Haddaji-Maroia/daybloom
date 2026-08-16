import 'package:flutter/material.dart';
import '../../../constants/fonts.dart';
import '../../../constants/size.dart';
import '../../../widgets/add_button.dart';
import '../../entries/add_entry_screen.dart';
import '../../entries/widgets/entries_list.dart';

class RecentEntries extends StatelessWidget {
  const RecentEntries({super.key});

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'RECENT ENTRIES',
              style: TextStyle(
                color: Colors.white,
                fontSize: fontSizeSmall,
                fontWeight: FontWeight.w600,
              ),
            ),
            AddButton(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddEntryScreen(),
                  ),
                );
              },
            ),
          ],
        ),
        const SizedBox(height: spacingSmall),
        const Expanded(
          child: EntriesList(maxItems: 5),
        ),
      ],
    );
  }
}