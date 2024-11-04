import 'package:flutter/material.dart';
import 'package:peyazma_web/widgets/option_bar.dart';
import 'package:graphview/GraphView.dart';

class OrganizationChart extends StatefulWidget {
  const OrganizationChart({super.key});

  @override
  State<OrganizationChart> createState() => _OrganizationChartState();
}

class _OrganizationChartState extends State<OrganizationChart> {
  final Graph graph = Graph()..isTree = true;
  late Node ceo;
  late BuchheimWalkerConfiguration builder;

  @override
  void initState() {
    super.initState();
    initializeGraph();
    builder = BuchheimWalkerConfiguration()
      ..siblingSeparation = 20 // Further reduced
      ..levelSeparation = 40
      ..subtreeSeparation = 20 // Further reduced
      ..orientation = BuchheimWalkerConfiguration.ORIENTATION_TOP_BOTTOM;
  }

  void initializeGraph() {
    // Level 1 - CEO
    ceo = Node.Id('مدیر عامل');

    // Level 2 - Main Managers
    var techManager = Node.Id('مدیر فنی و اجرائی');
    var adminManager = Node.Id('مدیر اداری، مالی و پشتیبانی');

    // Level 3 - Supervisors
    var techLabSupervisor = Node.Id('سرپرست بخش فنی و آزمایشگاهی');
    var execSupervisor = Node.Id('سرپرست بخش اجرایی');
    var financeAdmin = Node.Id('مسئول مالی');
    var hrAdmin = Node.Id('مسئول اداری');
    var servicesAdmin = Node.Id('مسئول خدمات');

    // Level 4 - Technical Staff
    var soilLabTech = Node.Id('تکنسین های آزمایشگاه خاک');
    var concreteLabTech = Node.Id('تکنسین های آزمایشگاه بتن و مقاومت مصالح');
    var concreteSamplingTech = Node.Id('تکنسین نمونه گیری بتن و مقاومت مصالح');

    // Level 4 - Executive Staff
    var geoExpert = Node.Id('کارشناس عملیات صحرایی ژئوتکنیکی');
    var strengthExpert = Node.Id('کارشناس مقاومت مصالح');
    var drillingStaff = Node.Id('عوامل حفاری');

    // Add all edges
    graph.addEdge(ceo, techManager);
    graph.addEdge(ceo, adminManager);

    graph.addEdge(techManager, techLabSupervisor);
    graph.addEdge(techManager, execSupervisor);
    graph.addEdge(adminManager, financeAdmin);
    graph.addEdge(adminManager, hrAdmin);
    graph.addEdge(adminManager, servicesAdmin);

    graph.addEdge(techLabSupervisor, soilLabTech);
    graph.addEdge(techLabSupervisor, concreteLabTech);

    graph.addEdge(execSupervisor, concreteSamplingTech);
    graph.addEdge(execSupervisor, geoExpert);
    graph.addEdge(execSupervisor, strengthExpert);
    graph.addEdge(execSupervisor, drillingStaff);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFF3FB),
      appBar: const OptionBar(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Center(
            child: Transform.scale(
              scale: 1.6, // Initial scale to ensure visibility
              child: InteractiveViewer(
                constrained: true,
                boundaryMargin: const EdgeInsets.all(20),
                minScale: 0.4,
                maxScale: 2.0,
                child: Container(
                  width: constraints.maxWidth,
                  height: constraints.maxHeight,
                  alignment: Alignment.center,
                  child: GraphView(
                    graph: graph,
                    algorithm: BuchheimWalkerAlgorithm(
                      builder,
                      TreeEdgeRenderer(builder),
                    ),
                    paint: Paint()
                      ..color = Colors.grey.shade700
                      ..strokeWidth = 1
                      ..style = PaintingStyle.stroke,
                    builder: (Node node) {
                      return _buildBox(
                        node.key?.value as String,
                        _getNodeColor(node.key?.value as String),
                        _getNodeWidth(node.key?.value as String),
                      );
                    },
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Color _getNodeColor(String text) {
    if (text == 'مدیر عامل') return Colors.yellow;
    if (text.contains('مدیر')) return Colors.orange;
    if (text.contains('سرپرست') || text.contains('مسئول')) return Colors.green;
    return const Color(0xFF87CEEB);
  }

  double _getNodeWidth(String text) {
    if (text == 'مدیر عامل') return 120.0; // Further reduced
    if (text.contains('مدیر')) return 110.0;
    if (text.contains('سرپرست')) return 100.0;
    return 90.0;
  }

  Widget _buildBox(String text, Color color, double width) {
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      margin: const EdgeInsets.all(2.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          // color: color == Colors.yellow ? Colors.black : Colors.black,
          color: Colors.black,
          fontSize: 10, // Further reduced
          fontFamily: 'Vazir',
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
