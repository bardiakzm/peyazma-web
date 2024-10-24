import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

// Map section widget
Widget buildMapSection(BuildContext context) {
  return Card(
    elevation: 4,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    child: Column(
      children: [
        const SizedBox(
          height: 250,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: HtmlElementView(viewType: 'iframeElement'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SelectableText(
                "موقعیت ما روی نقشه",
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                icon: const Icon(Icons.open_in_new),
                label: const Text(
                  'مشاهده نقشه کامل',
                  style: TextStyle(color: Colors.white70),
                ),
                onPressed: _launchMap,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade700,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

// Contact details section
Widget buildContactDetailsSection(BuildContext context, Color backgroundColor) {
  return Card(
    color: backgroundColor,
    elevation: 4,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    child: Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SelectableText(
            'اطلاعات تماس',
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(color: Colors.blue.shade800),
          ),
          const SizedBox(height: 24),
          _buildContactItem(Icons.email, 'ایمیل', 'peyazma.k.s@gmail.com'),
          _buildContactItem(Icons.phone, 'تلفن', '021-44593139'),
          _buildContactItem(Icons.location_city, 'کد پستی', '1388853961'),
          _buildContactItem(Icons.fax, 'فکس', '021-44593139'),
          _buildContactItem(Icons.location_on, 'آدرس',
              'تهرانسر، بلوار یاس، خیابان نفت جنوبی، کوچه 46، پلاک 15'),
          _buildContactItem(Icons.access_time, 'ساعات کاری', '8:00-16:30'),
        ],
      ),
    ),
  );
}

// Contact item
Widget _buildContactItem(IconData icon, String label, String value) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: SelectableText(
            value,
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.right,
          ),
        ),
        const SizedBox(width: 8),
        SelectableText(
          '$label:',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.blue.shade700,
          ),
        ),
        const SizedBox(width: 8),
        Icon(icon, color: Colors.blue.shade700),
      ],
    ),
  );
}

// Launch the full map link
void _launchMap() async {
  final Uri url =
      Uri.parse('https://www.google.com/maps?ll=35.687987,51.256856&z=17');
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}
