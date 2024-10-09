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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Wrap(
              spacing: 16.0, // Space between items
              alignment: WrapAlignment.end,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                _buildNavButton(
                  context,
                  'تماس با ما',
                  () => Navigator.pushNamed(context, '/contactUs'),
                ),
                _buildNavButton(
                  context,
                  'درباره ما',
                  () => Navigator.pushNamed(context, '/aboutUs'),
                ),
                // _buildNavButton(
                //   context,
                //   'اخبار و اطلاعات',
                //   () {/* Add your 'News and Info' button action here */},
                // ),
                _buildNavButton(
                  context,
                  'پروژه‌ها',
                  () => Navigator.pushNamed(context, '/projects'),
                ),
                _buildNavButton(
                  context,
                  'خدمات ما',
                  () => Navigator.pushNamed(context, '/services'),
                ),
                _buildNavButton(
                  context,
                  'خانه',
                  () => Navigator.pushNamedAndRemoveUntil(
                      context, '/', (route) => false),
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
}
