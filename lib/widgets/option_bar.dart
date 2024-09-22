import 'package:flutter/material.dart';

class OptionBar extends StatelessWidget implements PreferredSizeWidget {
  const OptionBar({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF151C23),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/contactUs');
              },
              child: const Text(
                'تماس با ما',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextButton(
              onPressed: () {
                // Add your 'About Us' button action here
              },
              child: const Text(
                'درباره ما',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextButton(
              onPressed: () {
                // Add your 'News and Info' button action here
              },
              child: const Text(
                'اخبار و اطلاعات',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextButton(
              onPressed: () {
                // Add your 'Projects' button action here
              },
              child: const Text(
                'پروژه‌ها',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextButton(
              onPressed: () {
                // Add your 'Services' button action here
              },
              child: const Text(
                'خدمات ما',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextButton(
              onPressed: () {
                // Add your 'Home' button action here
                Navigator.pushReplacementNamed(context, '/');
              },
              child: const Text(
                'خانه',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 16),
            child: Icon(
              Icons.engineering,
              color: Colors.white,
              size: 50,
            ),
          ), // Placeholder for the logo
        ],
      ),
    );
  }
}
