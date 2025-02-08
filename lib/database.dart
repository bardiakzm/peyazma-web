import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';

part 'database.g.dart';

@DataClassName('GeotechnicalProject')
class GeotechnicalProjects extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get project => text().withLength(min: 1, max: 255)();
  TextColumn get employer => text().withLength(min: 1, max: 255)();
}

@DataClassName('QualityControlProject')
class QualityControlProjects extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get project => text().withLength(min: 1, max: 255)();
  TextColumn get employer => text().withLength(min: 1, max: 255)();
}

@DriftDatabase(tables: [GeotechnicalProjects, QualityControlProjects])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // Insert a new geotechnical project
  Future<int> insertGeotechnicalProject(GeotechnicalProjectsCompanion entry) =>
      into(geotechnicalProjects).insert(entry);

  // Insert a new quality control project
  Future<int> insertQualityControlProject(
          QualityControlProjectsCompanion entry) =>
      into(qualityControlProjects).insert(entry);

  // Get all geotechnical projects
  Future<List<GeotechnicalProject>> getAllGeotechnicalProjects() =>
      select(geotechnicalProjects).get();

  // Get all quality control projects
  Future<List<QualityControlProject>> getAllQualityControlProjects() =>
      select(qualityControlProjects).get();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFile = File('/var/lib/peyazma/data/peyazma.db');
    return NativeDatabase(dbFile);
  });
}
