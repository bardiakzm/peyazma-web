import 'dart:html';
import 'dart:ui_web';
import 'package:peyazma_web/resources/lists/geotechnical_projects_list.dart';
import 'package:peyazma_web/resources/lists/qaulity_control_and_local_unit_list.dart';
import 'package:flutter/material.dart';
import 'package:peyazma_web/widgets/option_bar.dart';
import 'package:peyazma_web/resources/bottom_page_information.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});
  final String navLabel = '/projects';
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
      appBar: const OptionBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildProjectSection(),
              const SizedBox(height: 32),
              buildMapSection(context),
              const SizedBox(height: 32),
              buildContactDetailsSection(context),
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
}
