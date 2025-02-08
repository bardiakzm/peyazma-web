// import 'dart:io';
// import 'package:peyazma_web/resources/lists/geotechnical_projects_list.dart';
// import 'package:peyazma_web/resources/lists/qaulity_control_and_local_unit_list.dart';
//
// void main() {
//   final buffer = StringBuffer();
//
//   // Generate SQL for geotechnical projects
//   buffer.writeln("BEGIN TRANSACTION;");
//   for (var project in geotechnicalProjects) {
//     buffer.writeln(
//         "INSERT INTO geotechnical_projects (project, employer) VALUES ('${project['project']}', '${project['employer']}');");
//   }
//
//   // Generate SQL for quality control projects
//   for (var project in qualityControlAndLocalUnitData) {
//     buffer.writeln(
//         "INSERT INTO quality_control_projects (project, employer) VALUES ('${project['project']}', '${project['employer']}');");
//   }
//   buffer.writeln("COMMIT;");
//
//   // Save to a file
//   File('projects_data.sql').writeAsStringSync(buffer.toString());
//   print("SQL file generated: projects_data.sql");
// }
