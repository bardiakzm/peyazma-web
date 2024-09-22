import 'dart:html';
import 'dart:ui_web';

import 'package:flutter/material.dart';
import 'package:peyazma_web/widgets/option_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  final String navLabel = '/contactUs';

  @override
  void initState() {
    super.initState();

    // Registering the iframeElement once in initState
    // Use 'platformViewRegistry' without the 'ui' prefix
    platformViewRegistry.registerViewFactory(
      'iframeElement',
      (int viewId) => IFrameElement()
        ..style.border = 'none'
        ..src =
            'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3239.9554804073694!2d51.25466741525996!3d35.68798868019381!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2zMzXCsDQxJzE2LjgiTiA1McKwMTUnMjQuNyJF!5e0!3m2!1sen!2sus!4v1632901234567!5m2!1sen!2sus',
    );
  }

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
            constraints: const BoxConstraints(maxWidth: 1200),
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
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
                            flex: 1,
                            child: _buildMapSection(context),
                          ),
                          const SizedBox(width: 32),
                          Expanded(
                            flex: 1,
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
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
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
                  onPressed: () => _launchMap(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade700,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                  ),
                ),
              ],
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
            Expanded(
              child: ListView(
                children: [
                  _buildContactItem(
                      Icons.email, 'ایمیل', 'peyazma.k.s@gmail.com'),
                  _buildContactItem(Icons.phone, 'تلفن', '021-44593139'),
                  _buildContactItem(
                      Icons.location_city, 'کد پستی', '1388853961'),
                  _buildContactItem(Icons.fax, 'فکس', '021-44593139'),
                  _buildContactItem(Icons.location_on, 'آدرس',
                      'تهرانسر، بلوار یاس، خیابان نفت جنوبی، کوچه 46، پلاک 15'),
                  _buildContactItem(
                      Icons.access_time, 'ساعات کاری', '8:00-16:30'),
                ],
              ),
            ),
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
          Expanded(
            child: SelectableText(
              value,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.right,
            ),
          ),
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
    final Uri url =
        Uri.parse('https://www.google.com/maps?ll=35.687987,51.256856&z=17');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
