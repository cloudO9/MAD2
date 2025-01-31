import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return AppBar(
      elevation: 4,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isDarkMode
                ? [Colors.deepPurple.shade900, Colors.black87]
                : [Colors.purple.shade300, Colors.deepPurple.shade500],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          fontFamily: 'Anton',
          color: Colors.white,
        ),
      ),
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.menu, color: Colors.white),
        onPressed: () {
          // Add navigation drawer or other functionality here
          print("Menu button pressed");
        },
        splashRadius: 24,
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications, color: Colors.white),
          onPressed: () {
            // Add notifications functionality here
            print("Notifications button pressed");
          },
          splashRadius: 24,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
