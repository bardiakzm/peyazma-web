// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $GeotechnicalProjectsTable extends GeotechnicalProjects
    with TableInfo<$GeotechnicalProjectsTable, GeotechnicalProject> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GeotechnicalProjectsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _projectMeta =
      const VerificationMeta('project');
  @override
  late final GeneratedColumn<String> project = GeneratedColumn<String>(
      'project', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _employerMeta =
      const VerificationMeta('employer');
  @override
  late final GeneratedColumn<String> employer = GeneratedColumn<String>(
      'employer', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, project, employer];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'geotechnical_projects';
  @override
  VerificationContext validateIntegrity(
      Insertable<GeotechnicalProject> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('project')) {
      context.handle(_projectMeta,
          project.isAcceptableOrUnknown(data['project']!, _projectMeta));
    } else if (isInserting) {
      context.missing(_projectMeta);
    }
    if (data.containsKey('employer')) {
      context.handle(_employerMeta,
          employer.isAcceptableOrUnknown(data['employer']!, _employerMeta));
    } else if (isInserting) {
      context.missing(_employerMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GeotechnicalProject map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GeotechnicalProject(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      project: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}project'])!,
      employer: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}employer'])!,
    );
  }

  @override
  $GeotechnicalProjectsTable createAlias(String alias) {
    return $GeotechnicalProjectsTable(attachedDatabase, alias);
  }
}

class GeotechnicalProject extends DataClass
    implements Insertable<GeotechnicalProject> {
  final int id;
  final String project;
  final String employer;
  const GeotechnicalProject(
      {required this.id, required this.project, required this.employer});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['project'] = Variable<String>(project);
    map['employer'] = Variable<String>(employer);
    return map;
  }

  GeotechnicalProjectsCompanion toCompanion(bool nullToAbsent) {
    return GeotechnicalProjectsCompanion(
      id: Value(id),
      project: Value(project),
      employer: Value(employer),
    );
  }

  factory GeotechnicalProject.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GeotechnicalProject(
      id: serializer.fromJson<int>(json['id']),
      project: serializer.fromJson<String>(json['project']),
      employer: serializer.fromJson<String>(json['employer']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'project': serializer.toJson<String>(project),
      'employer': serializer.toJson<String>(employer),
    };
  }

  GeotechnicalProject copyWith({int? id, String? project, String? employer}) =>
      GeotechnicalProject(
        id: id ?? this.id,
        project: project ?? this.project,
        employer: employer ?? this.employer,
      );
  GeotechnicalProject copyWithCompanion(GeotechnicalProjectsCompanion data) {
    return GeotechnicalProject(
      id: data.id.present ? data.id.value : this.id,
      project: data.project.present ? data.project.value : this.project,
      employer: data.employer.present ? data.employer.value : this.employer,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GeotechnicalProject(')
          ..write('id: $id, ')
          ..write('project: $project, ')
          ..write('employer: $employer')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, project, employer);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GeotechnicalProject &&
          other.id == this.id &&
          other.project == this.project &&
          other.employer == this.employer);
}

class GeotechnicalProjectsCompanion
    extends UpdateCompanion<GeotechnicalProject> {
  final Value<int> id;
  final Value<String> project;
  final Value<String> employer;
  const GeotechnicalProjectsCompanion({
    this.id = const Value.absent(),
    this.project = const Value.absent(),
    this.employer = const Value.absent(),
  });
  GeotechnicalProjectsCompanion.insert({
    this.id = const Value.absent(),
    required String project,
    required String employer,
  })  : project = Value(project),
        employer = Value(employer);
  static Insertable<GeotechnicalProject> custom({
    Expression<int>? id,
    Expression<String>? project,
    Expression<String>? employer,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (project != null) 'project': project,
      if (employer != null) 'employer': employer,
    });
  }

  GeotechnicalProjectsCompanion copyWith(
      {Value<int>? id, Value<String>? project, Value<String>? employer}) {
    return GeotechnicalProjectsCompanion(
      id: id ?? this.id,
      project: project ?? this.project,
      employer: employer ?? this.employer,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (project.present) {
      map['project'] = Variable<String>(project.value);
    }
    if (employer.present) {
      map['employer'] = Variable<String>(employer.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GeotechnicalProjectsCompanion(')
          ..write('id: $id, ')
          ..write('project: $project, ')
          ..write('employer: $employer')
          ..write(')'))
        .toString();
  }
}

class $QualityControlProjectsTable extends QualityControlProjects
    with TableInfo<$QualityControlProjectsTable, QualityControlProject> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $QualityControlProjectsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _projectMeta =
      const VerificationMeta('project');
  @override
  late final GeneratedColumn<String> project = GeneratedColumn<String>(
      'project', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _employerMeta =
      const VerificationMeta('employer');
  @override
  late final GeneratedColumn<String> employer = GeneratedColumn<String>(
      'employer', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, project, employer];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'quality_control_projects';
  @override
  VerificationContext validateIntegrity(
      Insertable<QualityControlProject> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('project')) {
      context.handle(_projectMeta,
          project.isAcceptableOrUnknown(data['project']!, _projectMeta));
    } else if (isInserting) {
      context.missing(_projectMeta);
    }
    if (data.containsKey('employer')) {
      context.handle(_employerMeta,
          employer.isAcceptableOrUnknown(data['employer']!, _employerMeta));
    } else if (isInserting) {
      context.missing(_employerMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  QualityControlProject map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return QualityControlProject(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      project: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}project'])!,
      employer: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}employer'])!,
    );
  }

  @override
  $QualityControlProjectsTable createAlias(String alias) {
    return $QualityControlProjectsTable(attachedDatabase, alias);
  }
}

class QualityControlProject extends DataClass
    implements Insertable<QualityControlProject> {
  final int id;
  final String project;
  final String employer;
  const QualityControlProject(
      {required this.id, required this.project, required this.employer});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['project'] = Variable<String>(project);
    map['employer'] = Variable<String>(employer);
    return map;
  }

  QualityControlProjectsCompanion toCompanion(bool nullToAbsent) {
    return QualityControlProjectsCompanion(
      id: Value(id),
      project: Value(project),
      employer: Value(employer),
    );
  }

  factory QualityControlProject.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return QualityControlProject(
      id: serializer.fromJson<int>(json['id']),
      project: serializer.fromJson<String>(json['project']),
      employer: serializer.fromJson<String>(json['employer']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'project': serializer.toJson<String>(project),
      'employer': serializer.toJson<String>(employer),
    };
  }

  QualityControlProject copyWith(
          {int? id, String? project, String? employer}) =>
      QualityControlProject(
        id: id ?? this.id,
        project: project ?? this.project,
        employer: employer ?? this.employer,
      );
  QualityControlProject copyWithCompanion(
      QualityControlProjectsCompanion data) {
    return QualityControlProject(
      id: data.id.present ? data.id.value : this.id,
      project: data.project.present ? data.project.value : this.project,
      employer: data.employer.present ? data.employer.value : this.employer,
    );
  }

  @override
  String toString() {
    return (StringBuffer('QualityControlProject(')
          ..write('id: $id, ')
          ..write('project: $project, ')
          ..write('employer: $employer')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, project, employer);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is QualityControlProject &&
          other.id == this.id &&
          other.project == this.project &&
          other.employer == this.employer);
}

class QualityControlProjectsCompanion
    extends UpdateCompanion<QualityControlProject> {
  final Value<int> id;
  final Value<String> project;
  final Value<String> employer;
  const QualityControlProjectsCompanion({
    this.id = const Value.absent(),
    this.project = const Value.absent(),
    this.employer = const Value.absent(),
  });
  QualityControlProjectsCompanion.insert({
    this.id = const Value.absent(),
    required String project,
    required String employer,
  })  : project = Value(project),
        employer = Value(employer);
  static Insertable<QualityControlProject> custom({
    Expression<int>? id,
    Expression<String>? project,
    Expression<String>? employer,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (project != null) 'project': project,
      if (employer != null) 'employer': employer,
    });
  }

  QualityControlProjectsCompanion copyWith(
      {Value<int>? id, Value<String>? project, Value<String>? employer}) {
    return QualityControlProjectsCompanion(
      id: id ?? this.id,
      project: project ?? this.project,
      employer: employer ?? this.employer,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (project.present) {
      map['project'] = Variable<String>(project.value);
    }
    if (employer.present) {
      map['employer'] = Variable<String>(employer.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('QualityControlProjectsCompanion(')
          ..write('id: $id, ')
          ..write('project: $project, ')
          ..write('employer: $employer')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $GeotechnicalProjectsTable geotechnicalProjects =
      $GeotechnicalProjectsTable(this);
  late final $QualityControlProjectsTable qualityControlProjects =
      $QualityControlProjectsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [geotechnicalProjects, qualityControlProjects];
}

typedef $$GeotechnicalProjectsTableCreateCompanionBuilder
    = GeotechnicalProjectsCompanion Function({
  Value<int> id,
  required String project,
  required String employer,
});
typedef $$GeotechnicalProjectsTableUpdateCompanionBuilder
    = GeotechnicalProjectsCompanion Function({
  Value<int> id,
  Value<String> project,
  Value<String> employer,
});

class $$GeotechnicalProjectsTableFilterComposer
    extends Composer<_$AppDatabase, $GeotechnicalProjectsTable> {
  $$GeotechnicalProjectsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get project => $composableBuilder(
      column: $table.project, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get employer => $composableBuilder(
      column: $table.employer, builder: (column) => ColumnFilters(column));
}

class $$GeotechnicalProjectsTableOrderingComposer
    extends Composer<_$AppDatabase, $GeotechnicalProjectsTable> {
  $$GeotechnicalProjectsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get project => $composableBuilder(
      column: $table.project, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get employer => $composableBuilder(
      column: $table.employer, builder: (column) => ColumnOrderings(column));
}

class $$GeotechnicalProjectsTableAnnotationComposer
    extends Composer<_$AppDatabase, $GeotechnicalProjectsTable> {
  $$GeotechnicalProjectsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get project =>
      $composableBuilder(column: $table.project, builder: (column) => column);

  GeneratedColumn<String> get employer =>
      $composableBuilder(column: $table.employer, builder: (column) => column);
}

class $$GeotechnicalProjectsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $GeotechnicalProjectsTable,
    GeotechnicalProject,
    $$GeotechnicalProjectsTableFilterComposer,
    $$GeotechnicalProjectsTableOrderingComposer,
    $$GeotechnicalProjectsTableAnnotationComposer,
    $$GeotechnicalProjectsTableCreateCompanionBuilder,
    $$GeotechnicalProjectsTableUpdateCompanionBuilder,
    (
      GeotechnicalProject,
      BaseReferences<_$AppDatabase, $GeotechnicalProjectsTable,
          GeotechnicalProject>
    ),
    GeotechnicalProject,
    PrefetchHooks Function()> {
  $$GeotechnicalProjectsTableTableManager(
      _$AppDatabase db, $GeotechnicalProjectsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GeotechnicalProjectsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GeotechnicalProjectsTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GeotechnicalProjectsTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> project = const Value.absent(),
            Value<String> employer = const Value.absent(),
          }) =>
              GeotechnicalProjectsCompanion(
            id: id,
            project: project,
            employer: employer,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String project,
            required String employer,
          }) =>
              GeotechnicalProjectsCompanion.insert(
            id: id,
            project: project,
            employer: employer,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$GeotechnicalProjectsTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $GeotechnicalProjectsTable,
        GeotechnicalProject,
        $$GeotechnicalProjectsTableFilterComposer,
        $$GeotechnicalProjectsTableOrderingComposer,
        $$GeotechnicalProjectsTableAnnotationComposer,
        $$GeotechnicalProjectsTableCreateCompanionBuilder,
        $$GeotechnicalProjectsTableUpdateCompanionBuilder,
        (
          GeotechnicalProject,
          BaseReferences<_$AppDatabase, $GeotechnicalProjectsTable,
              GeotechnicalProject>
        ),
        GeotechnicalProject,
        PrefetchHooks Function()>;
typedef $$QualityControlProjectsTableCreateCompanionBuilder
    = QualityControlProjectsCompanion Function({
  Value<int> id,
  required String project,
  required String employer,
});
typedef $$QualityControlProjectsTableUpdateCompanionBuilder
    = QualityControlProjectsCompanion Function({
  Value<int> id,
  Value<String> project,
  Value<String> employer,
});

class $$QualityControlProjectsTableFilterComposer
    extends Composer<_$AppDatabase, $QualityControlProjectsTable> {
  $$QualityControlProjectsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get project => $composableBuilder(
      column: $table.project, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get employer => $composableBuilder(
      column: $table.employer, builder: (column) => ColumnFilters(column));
}

class $$QualityControlProjectsTableOrderingComposer
    extends Composer<_$AppDatabase, $QualityControlProjectsTable> {
  $$QualityControlProjectsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get project => $composableBuilder(
      column: $table.project, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get employer => $composableBuilder(
      column: $table.employer, builder: (column) => ColumnOrderings(column));
}

class $$QualityControlProjectsTableAnnotationComposer
    extends Composer<_$AppDatabase, $QualityControlProjectsTable> {
  $$QualityControlProjectsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get project =>
      $composableBuilder(column: $table.project, builder: (column) => column);

  GeneratedColumn<String> get employer =>
      $composableBuilder(column: $table.employer, builder: (column) => column);
}

class $$QualityControlProjectsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $QualityControlProjectsTable,
    QualityControlProject,
    $$QualityControlProjectsTableFilterComposer,
    $$QualityControlProjectsTableOrderingComposer,
    $$QualityControlProjectsTableAnnotationComposer,
    $$QualityControlProjectsTableCreateCompanionBuilder,
    $$QualityControlProjectsTableUpdateCompanionBuilder,
    (
      QualityControlProject,
      BaseReferences<_$AppDatabase, $QualityControlProjectsTable,
          QualityControlProject>
    ),
    QualityControlProject,
    PrefetchHooks Function()> {
  $$QualityControlProjectsTableTableManager(
      _$AppDatabase db, $QualityControlProjectsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$QualityControlProjectsTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$QualityControlProjectsTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$QualityControlProjectsTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> project = const Value.absent(),
            Value<String> employer = const Value.absent(),
          }) =>
              QualityControlProjectsCompanion(
            id: id,
            project: project,
            employer: employer,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String project,
            required String employer,
          }) =>
              QualityControlProjectsCompanion.insert(
            id: id,
            project: project,
            employer: employer,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$QualityControlProjectsTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $QualityControlProjectsTable,
        QualityControlProject,
        $$QualityControlProjectsTableFilterComposer,
        $$QualityControlProjectsTableOrderingComposer,
        $$QualityControlProjectsTableAnnotationComposer,
        $$QualityControlProjectsTableCreateCompanionBuilder,
        $$QualityControlProjectsTableUpdateCompanionBuilder,
        (
          QualityControlProject,
          BaseReferences<_$AppDatabase, $QualityControlProjectsTable,
              QualityControlProject>
        ),
        QualityControlProject,
        PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$GeotechnicalProjectsTableTableManager get geotechnicalProjects =>
      $$GeotechnicalProjectsTableTableManager(_db, _db.geotechnicalProjects);
  $$QualityControlProjectsTableTableManager get qualityControlProjects =>
      $$QualityControlProjectsTableTableManager(
          _db, _db.qualityControlProjects);
}
