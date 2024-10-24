import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OptionBar extends StatefulWidget implements PreferredSizeWidget {
  const OptionBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<OptionBar> createState() => _OptionBarState();
}

class _OptionBarState extends State<OptionBar> {
  final GlobalKey _dropdownKey = GlobalKey();
  bool _isDropdownOpen = false;
  OverlayEntry? _overlayEntry;

  void _showDropdown() {
    if (_isDropdownOpen) return; // Prevent showing if already open

    final RenderBox renderBox =
        _dropdownKey.currentContext!.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero);
    final size = renderBox.size;

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: position.dy + size.height,
        left: position.dx - 42,
        child: Material(
          color: Colors.transparent,
          child: MouseRegion(
            onEnter: (_) => _keepDropdownOpen(),
            onExit: (_) => _hideDropdown(),
            child: Container(
              width: 200,
              decoration: BoxDecoration(
                color: const Color(0xFF1E2730),
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDropdownHeader(),
                  const Divider(
                    height: 1,
                    color: Colors.white24,
                  ),
                  _buildDropdownItem(
                    'درباره ما',
                    Icons.info_outline,
                    () {
                      context.go('/aboutUs');
                      _hideDropdown();
                    },
                  ),
                  _buildDropdownItem(
                    'معرفی کارکنان',
                    Icons.people_outline,
                    () {
                      context.go('/staff');
                      _hideDropdown();
                    },
                  ),
                  _buildDropdownItem(
                    'چارت سازمانی',
                    Icons.account_tree_outlined,
                    () {
                      context.go('/organizationChart');
                      _hideDropdown();
                    },
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
    setState(() => _isDropdownOpen = true);
  }

  void _keepDropdownOpen() {
    if (!_isDropdownOpen) {
      _showDropdown(); // Open dropdown if it's not open
    }
  }

  void _hideDropdown() {
    if (!_isDropdownOpen) return; // Prevent hiding if already closed

    _overlayEntry?.remove();
    _overlayEntry = null;
    setState(() => _isDropdownOpen = false);
  }

  Widget _buildDropdownHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: const Text(
        'معرفی شرکت',
        style: TextStyle(
          color: Colors.white70,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        textAlign: TextAlign.right,
      ),
    );
  }

  Widget _buildDropdownItem(String title, IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          textDirection: TextDirection.rtl,
          children: [
            Icon(
              icon,
              size: 20,
              color: Colors.white70,
            ),
            const SizedBox(width: 12),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return AppBar(
      elevation: 0,
      backgroundColor: const Color(0xFF151C23),
      title: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.white.withOpacity(0.1),
              width: 1,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (screenWidth > 600)
              Expanded(
                child: Wrap(
                  spacing: 24.0,
                  alignment: WrapAlignment.end,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    _buildNavButton(
                      context,
                      'تماس با ما',
                      () => context.go('/contactUs'),
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      onEnter: (_) => _showDropdown(),
                      onExit: (_) => _hideDropdown(),
                      child: Container(
                        key: _dropdownKey,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: const Text(
                          'معرفی شرکت',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
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
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.engineering,
                          color: Colors.white,
                          size: 45,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            else
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.menu, color: Colors.white),
                        onPressed: () => _showPopupMenu(context),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.engineering,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavButton(
    BuildContext context,
    String label,
    VoidCallback onPressed,
  ) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  void _showPopupMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1E2730),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: ListView(
            children: [
              _buildMobileMenuItem(context, 'خانه', '/'),
              _buildMobileMenuItem(context, 'خدمات ما', '/services'),
              _buildMobileMenuItem(context, 'پروژه‌ها', '/projects'),
              Theme(
                data: Theme.of(context).copyWith(
                  dividerColor: Colors.transparent,
                  listTileTheme: ListTileThemeData(
                    textColor: Colors.white.withOpacity(0.9),
                  ),
                ),
                child: ExpansionTile(
                  title: const Text(
                    'معرفی شرکت',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  children: [
                    _buildMobileSubmenuItem(
                      context,
                      'درباره ما',
                      Icons.info_outline,
                      '/aboutUs',
                    ),
                    _buildMobileSubmenuItem(
                      context,
                      'معرفی کارکنان',
                      Icons.people_outline,
                      '/staff',
                    ),
                    _buildMobileSubmenuItem(
                      context,
                      'چارت سازمانی',
                      Icons.account_tree_outlined,
                      '/organizationChart',
                    ),
                  ],
                ),
              ),
              _buildMobileMenuItem(context, 'تماس با ما', '/contactUs'),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMobileMenuItem(
      BuildContext context, String title, String route) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(fontSize: 16),
      ),
      onTap: () {
        context.go(route);
        Navigator.pop(context); // Close the bottom sheet
      },
    );
  }

  Widget _buildMobileSubmenuItem(
      BuildContext context, String title, IconData icon, String route) {
    return ListTile(
      leading: Icon(icon, color: Colors.white.withOpacity(0.9)),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16),
      ),
      onTap: () {
        context.go(route);
        Navigator.pop(context); // Close the bottom sheet
      },
    );
  }
}
