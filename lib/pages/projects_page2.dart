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
  static const int _rowsPerPage = 10;

  int _qualityControlCurrentPage = 0;
  int _geotechnicalCurrentPage = 0;

  late final Future<List<Map<String, String>>> _qualityControlFuture;
  late final Future<List<Map<String, String>>> _geotechnicalProjectsFuture;

  @override
  void initState() {
    super.initState();
    _qualityControlFuture =
        Future.microtask(() => qualityControlAndLocalUnitData);
    _geotechnicalProjectsFuture = Future.microtask(() => geotechnicalProjects);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const OptionBar(),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildProjectSection(),
                const SizedBox(height: 32),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: buildContactDetailsSection(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPaginatedTable({
    required List<Map<String, String>> data,
    required int currentPage,
    required Function(int) onPageChanged,
    required String emptyTableText,
  }) {
    final int totalPages = (data.length / _rowsPerPage).ceil();
    final int startIndex = currentPage * _rowsPerPage;
    final int endIndex = (startIndex + _rowsPerPage < data.length)
        ? startIndex + _rowsPerPage
        : data.length;

    final List<Map<String, String>> paginatedData =
        data.sublist(startIndex, endIndex);

    return Column(
      children: [
        if (data.isEmpty)
          Center(child: Text(emptyTableText))
        else
          DataTable(
            columns: const [
              DataColumn(
                label: Center(
                  child: SelectableText(
                    'پروژه',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              DataColumn(
                label: Center(
                  child: SelectableText(
                    'کارفرما',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
            rows: paginatedData.map<DataRow>((project) {
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
                  SelectableText(
                    project['employer'] ?? '',
                    textDirection: TextDirection.rtl,
                  ),
                ),
              ]);
            }).toList(),
          ),
        if (totalPages > 1)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.chevron_left),
                  onPressed: currentPage > 0
                      ? () => onPageChanged(currentPage - 1)
                      : null,
                ),
                Text(
                  '${currentPage + 1} / $totalPages',
                  style: const TextStyle(fontSize: 16),
                ),
                IconButton(
                  icon: const Icon(Icons.chevron_right),
                  onPressed: currentPage < totalPages - 1
                      ? () => onPageChanged(currentPage + 1)
                      : null,
                ),
              ],
            ),
          ),
      ],
    );
  }

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
            SelectableText(
              'پروژه های ما',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade800,
              ),
            ),
            const SizedBox(height: 16),
            SelectableText(
              'پروژه های کنترل کیفیت',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade700,
              ),
            ),
            FutureBuilder<List<Map<String, String>>>(
              future: _qualityControlFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(
                      child: Text('هیچ پروژه کنترل کیفیتی موجود نیست'));
                }
                return _buildPaginatedTable(
                  data: snapshot.data!,
                  currentPage: _qualityControlCurrentPage,
                  onPageChanged: (int newPage) {
                    setState(() {
                      _qualityControlCurrentPage = newPage;
                    });
                  },
                  emptyTableText: 'هیچ پروژه کنترل کیفیتی موجود نیست',
                );
              },
            ),
            const SizedBox(height: 16),
            SelectableText(
              'پروژه های ژئوتکنیک',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade700,
              ),
            ),
            FutureBuilder<List<Map<String, String>>>(
              future: _geotechnicalProjectsFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(
                      child: Text('هیچ پروژه ژئوتکنیکی موجود نیست'));
                }
                return _buildPaginatedTable(
                  data: snapshot.data!,
                  currentPage: _geotechnicalCurrentPage,
                  onPageChanged: (int newPage) {
                    setState(() {
                      _geotechnicalCurrentPage = newPage;
                    });
                  },
                  emptyTableText: 'هیچ پروژه ژئوتکنیکی موجود نیست',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}