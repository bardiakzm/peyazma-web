import 'dart:html';
import 'dart:ui_web';
import 'package:peyazma_web/resources/lists/geotechnical_projects_list.dart';
import 'package:peyazma_web/resources/lists/qaulity_control_and_local_unit_list.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:peyazma_web/widgets/option_bar.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  @override
  _ProjectsPageState createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  @override
  void initState() {
    super.initState();
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
      appBar: OptionBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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

  // Project section widget
  Widget _buildProjectSection() {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SelectableText(
              'پروژه های ما',
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade800,
              ),
            ),
            const SizedBox(height: 16),
            // Quality Control Table
            SelectableText(
              'پروژه های کنترل کیفیت',
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade700,
              ),
            ),
            _buildQualityControlTable(),
            const SizedBox(height: 16),
            // Geotechnical Projects Table
            SelectableText(
              'پروژه های ژئوتکنیک',
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade700,
              ),
            ),
            _buildGeotechnicalProjectsTable(),
          ],
        ),
      ),
    );
  }

  // Build Quality Control Table
  Widget _buildQualityControlTable() {
    return DataTable(
      columns: const [
        DataColumn(
          label: Align(
            alignment: Alignment.centerRight,
            child: SelectableText(
              'پروژه',
              textDirection: TextDirection.rtl,
            ),
          ),
        ),
        DataColumn(
          label: Align(
            alignment: Alignment.centerRight,
            child: SelectableText(
              'کارفرما',
              textDirection: TextDirection.rtl,
            ),
          ),
        ),
      ],
      rows: qualityControlAndLocalUnitData.map<DataRow>((project) {
        return DataRow(cells: [
          DataCell(
            Align(
              alignment: Alignment.centerRight,
              child: SelectableText(
                project['project'] ?? '',
                textDirection: TextDirection.rtl,
              ),
            ),
          ),
          DataCell(
            Align(
              alignment: Alignment.centerRight,
              child: SelectableText(
                project['employer'] ?? '',
                textDirection: TextDirection.rtl,
              ),
            ),
          ),
        ]);
      }).toList(),
    );
  }

  // Build Geotechnical Projects Table
  Widget _buildGeotechnicalProjectsTable() {
    return DataTable(
      columns: const [
        DataColumn(
          label: SelectableText(
            'پروژه',
            textDirection: TextDirection.rtl,
          ),
        ),
        DataColumn(
          label: SelectableText(
            'کارفرما',
            textDirection: TextDirection.rtl,
          ),
        ),
      ],
      rows: geotechnicalProjects.map<DataRow>((project) {
        return DataRow(cells: [
          DataCell(
            Align(
              alignment: Alignment.centerRight,
              child: SelectableText(
                project['project'] ?? '',
                textDirection: TextDirection.rtl,
              ),
            ),
          ),
          DataCell(
            Align(
              alignment: Alignment.centerRight,
              child: SelectableText(
                project['employer'] ?? '',
                textDirection: TextDirection.rtl,
              ),
            ),
          ),
        ]);
      }).toList(),
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
