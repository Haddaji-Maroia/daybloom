import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../constants/colors.dart';
import '../../../constants/fonts.dart';
import '../../../constants/size.dart';

class NotificationToggle extends StatefulWidget {
  const NotificationToggle({super.key});

  @override
  State<NotificationToggle> createState() => _NotificationToggleState();
}

class _NotificationToggleState extends State<NotificationToggle> {
  bool _notificationsEnabled = false;

  @override
  void initState() {
    super.initState();
    _loadNotifState();
  }

  Future<void> _loadNotifState() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _notificationsEnabled = prefs.getBool('notifications_enabled') ?? false;
    });
  }

  Future<void> _toggleNotif(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('notifications_enabled', value);
    setState(() => _notificationsEnabled = value);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: paddingMedium,
        vertical: paddingSmall,
      ),
      decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Daily writing reminder',
            style: TextStyle(
              color: Colors.white,
              fontSize: fontSizeMedium,
            ),
          ),
          Switch(
            value: _notificationsEnabled,
            onChanged: _toggleNotif,
            activeColor: buttonColor,
          ),
        ],
      ),
    );
  }
}