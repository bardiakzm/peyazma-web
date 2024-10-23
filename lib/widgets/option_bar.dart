import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OptionBar extends StatelessWidget implements PreferredSizeWidget {
  const OptionBar({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return AppBar(
      backgroundColor: const Color(0xFF151C23),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (screenWidth > 600) // For larger screens (tablet and desktop)
            Expanded(
              child: Wrap(
                spacing: 16.0, // Space between items
                alignment: WrapAlignment.end,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  _buildNavButton(
                    context,
                    'تماس با ما',
                    () => context.go('/contactUs'),
                  ),
                  _buildNavButton(
                    context,
                    'معرفی شرکت',
                    () => context.go('/aboutUs'),
                  ),
                  _buildNavButton(
                    context,
                    'پروژه‌ها',
                    () => context.go('/projects'),
                  ),
                  _buildNavButton(
                    context,
                    'خدمات ما',
                    () => context.go('/services'),
                  ),
                  _buildNavButton(
                    context,
                    'خانه',
                    () => context.go('/'),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Icon(
                      Icons.engineering,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                ],
              ),
            )
          else // For smaller screens (mobile)
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.menu, color: Colors.white),
                    onPressed: () {
                      // Open navigation drawer or popup menu for mobile
                      _showPopupMenu(context);
                    },
                  ),
                  const Icon(
                    Icons.engineering,
                    color: Colors.white,
                    size: 40,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildNavButton(
      BuildContext context, String label, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        ),
        child: Text(
          label,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  void _showPopupMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ListView(
          children: [
            ListTile(
              title: const Text('خانه'),
              onTap: () {
                Navigator.pop(context);
                context.go('/');
              },
            ),
            ListTile(
              title: const Text('خدمات ما'),
              onTap: () {
                Navigator.pop(context);
                context.go('/services');
              },
            ),
            ListTile(
              title: const Text('پروژه‌ها'),
              onTap: () {
                Navigator.pop(context);
                context.go('/projects');
              },
            ),
            ListTile(
              title: const Text('معرفی شرکت'),
              onTap: () {
                Navigator.pop(context);
                context.go('/aboutUs');
              },
            ),
            ListTile(
              title: const Text('تماس با ما'),
              onTap: () {
                Navigator.pop(context);
                context.go('/contactUs');
              },
            ),
          ],
        );
      },
    );
  }
}
