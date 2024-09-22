import 'dart:html';
import 'dart:ui_web';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  @override
  _ProjectsPageState createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  @override
  void initState() {
    super.initState();
    // Registering the iframeElement once in initState for the map
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
      appBar: AppBar(
        title: const Text('پروژه ها'),
        backgroundColor: const Color(0xFF151C23),
        actions: [
          _buildNavButton('خانه', '/'),
          _buildNavButton('درباره ما', '/about'),
          _buildNavButton('خدمات ما', '/services'),
          _buildNavButton('پروژه ها', '/projects'),
          _buildNavButton('اخبار و اطلاعیه ها', '/news'),
          _buildNavButton('تماس با ما', '/contact'),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildProjectSection(),
              const SizedBox(height: 32),
              _buildMapSection(context),
              const SizedBox(height: 32),
              _buildContactDetailsSection(context),
            ],
          ),
        ),
      ),
    );
  }

  // Navigation button
  Widget _buildNavButton(String title, String route) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextButton(
        onPressed: () {
          // Navigator.pushNamed(context, route);
        },
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
        ),
        child: Text(title),
      ),
    );
  }

  // Project section widget (You can replace this with the project data)
  Widget _buildProjectSection() {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'پروژه های ما',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade800,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Here you can display the list of projects or other content from the page.',
              style:
                  TextStyle(fontSize: 16, height: 1.5, color: Colors.grey[800]),
            ),
          ],
        ),
      ),
    );
  }

  // Map section widget
  Widget _buildMapSection(BuildContext context) {
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
                Text(
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

  // Contact details section
  Widget _buildContactDetailsSection(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
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
            child: Text(
              value,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.right,
            ),
          ),
          const SizedBox(width: 8),
          Text(
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
}
