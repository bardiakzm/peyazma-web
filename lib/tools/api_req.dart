import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:peyazma_web/resources/consts.dart';

late List<Map<String, String>> apiGeotechnicalProjects;
late List<Map<String, String>> apiQualityControlAndLocalUnitData;

class Api {
  static Future<List<Map<String, String>>> fetchFromDB(String path) async {
    final client = http.Client();

    try {
      final response = await client.get(
        Uri.parse('$apiUrl/$path'),
      );

      if (response.statusCode == 200) {
        String rawBody = utf8.decode(response.bodyBytes);

        // Convert the non-standard format to valid JSON by adding quotes
        rawBody = rawBody
            .replaceAll('id:', '"id":')
            .replaceAll('project:', '"project":')
            .replaceAll('employer:', '"employer":');

        // Add quotes around the values
        rawBody = rawBody.replaceAllMapped(
            RegExp(r'": ([^,"}\]]+)([,}\]])', multiLine: true),
            (match) => '": "${match.group(1)}"${match.group(2)}');

        List<dynamic> jsonList = jsonDecode(rawBody);

        return jsonList
            .map((item) => {
                  'project': item['project'] as String,
                  'employer': item['employer'] as String,
                })
            .toList();
      } else {
        throw HttpException(
          'Failed to fetch projects. Status code: ${response.statusCode}',
        );
      }
    } catch (e) {
      throw Exception('Failed to fetch projects: $e');
    } finally {
      client.close();
    }
  }

  static Future<void> getGeotechnicalProjects() async {
    final List<Map<String, String>> projects =
        await Api.fetchFromDB('geotechnical_projects');
    apiGeotechnicalProjects = projects;
    // print('Successfully fetched ${projects.length} projects');
    // for (var project in projects) {
    //   print('\nProject: ${project['project']}');
    //   print('Employer: ${project['employer']}');
    // }
  }

  static Future<void> getQualityControlAndLocalUnitData() async {
    final List<Map<String, String>> projects =
        await Api.fetchFromDB('quality_control_projects');
    apiQualityControlAndLocalUnitData = projects;
  }
}

Future<void> main() async {
  try {
    final List<Map<String, String>> projects =
        await Api.fetchFromDB('quality_control_projects');
    apiGeotechnicalProjects = projects;
    print('Successfully fetched ${projects.length} projects');
    for (var project in projects) {
      print('\nProject: ${project['project']}');
      print('Employer: ${project['employer']}');
    }
  } catch (e) {
    print('Error: $e');
    print('Stack trace:');
    print(StackTrace.current);
  }
}
