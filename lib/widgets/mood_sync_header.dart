import 'package:flutter/material.dart';

class MoodSyncHeader extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String greeting;
  final String date;
  final VoidCallback? onNotification;
  final VoidCallback? onSettings;

  const MoodSyncHeader({
    Key? key,
    required this.title,
    required this.greeting,
    required this.date,
    this.onNotification,
    this.onSettings,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      color: theme.colorScheme.surface,
      child: SafeArea(
        bottom: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 12, top: 16, bottom: 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: const LinearGradient(
                        colors: [Color(0xFFBB86FC), Color(0xFFFF85B3)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: const Center(
                      child: Icon(Icons.nightlight_round,
                          color: Color(0xFF121212), size: 26),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    title,
                    style: theme.textTheme.titleLarge?.copyWith(
                      foreground: Paint()
                        ..shader = const LinearGradient(
                          colors: [Color(0xFFBB86FC), Color(0xFFFF85B3)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ).createShader(
                            const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.notifications_none_rounded),
                    color: theme.colorScheme.onSurface,
                    onPressed: onNotification,
                    tooltip: 'Notifications',
                  ),
                  IconButton(
                    icon: const Icon(Icons.settings),
                    color: theme.colorScheme.onSurface,
                    onPressed: onSettings,
                    tooltip: 'Settings',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    greeting,
                    style: theme.textTheme.headlineMedium?.copyWith(
                      color: theme.colorScheme.onSurface,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    date,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurface.withOpacity(0.7),
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(128);
}
