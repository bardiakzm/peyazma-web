import 'package:flutter/material.dart';
import 'package:peyazma_web/widgets/option_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});
  final String navLabel = '/contactUs';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const OptionBar(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue.shade50, Colors.blue.shade100],
          ),
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 1200),
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SelectableText(
                      'تماس با ما',
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            color: Colors.blue.shade800,
                            fontWeight: FontWeight.bold,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: _buildMapSection(context),
                          ),
                          const SizedBox(width: 32),
                          Expanded(
                            child: _buildContactDetailsSection(context),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMapSection(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.map, size: 64, color: Colors.blue.shade700),
          const SizedBox(height: 16),
          SelectableText(
            "موقعیت ما روی نقشه",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            icon: const Icon(Icons.location_on),
            label: const SelectableText('مشاهده نقشه'),
            onPressed: () => _launchMap(),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue.shade700,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactDetailsSection(BuildContext context) {
    return Card(
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
                'هرانسر، بلوار یاس، خیابان نفت جنوبی، کوچه 46، پلاک 15'),
            _buildContactItem(Icons.access_time, 'ساعات کاری', '8:00-16:30'),
          ],
        ),
      ),
    );
  }

  Widget _buildContactItem(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SelectableText(value, style: const TextStyle(fontSize: 16)),
          const SizedBox(width: 8),
          SelectableText('$label:',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade700)),
          const SizedBox(width: 8),
          Icon(icon, color: Colors.blue.shade700),
        ],
      ),
    );
  }

  void _launchMap() async {
    final Uri url = Uri.parse(
        'https://www.google.com/maps?ll=35.688007,51.256864&z=17&t=m&hl=en-US&gl=US&mapclient=embed&q=35%C2%B041%2716.8%22N+51%C2%B015%2724.7%22E+35.687985,+51.256856@35.687985,51.256856');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
