import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'app_database.g.dart';

class Users extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();

  TextColumn get email => text().unique()();

  TextColumn get password => text()();

  TextColumn get role => text()();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

class Students extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get userId =>
      integer().references(Users, #id, onDelete: KeyAction.cascade)();

  IntColumn get currentLevelId =>
      integer().references(Levels, #id, onDelete: KeyAction.cascade)();
}

class Admins extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get userId =>
      integer().references(Users, #id, onDelete: KeyAction.cascade)();
}

class Levels extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();

  TextColumn get description => text().withDefault(const Constant(''))();
}

class Units extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get levelId =>
      integer().references(Levels, #id, onDelete: KeyAction.cascade)();

  TextColumn get title => text()();

  IntColumn get number => integer()();
}

class Lessons extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get unitId =>
      integer().references(Units, #id, onDelete: KeyAction.cascade)();

  TextColumn get title => text()();

  IntColumn get number => integer()();

  TextColumn get videoUrl => text().withDefault(const Constant(''))();
}

class Vocabularies extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get lessonId =>
      integer().references(Lessons, #id, onDelete: KeyAction.cascade)();

  TextColumn get word => text()();

  TextColumn get translation => text()();

  TextColumn get voiceUrl => text().withDefault(const Constant(''))();
}

class Quizzes extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get lessonId =>
      integer().references(Lessons, #id, onDelete: KeyAction.cascade)();

  TextColumn get title => text()();

  TextColumn get type => text().withDefault(const Constant('Lesson_Quiz'))();

  IntColumn get durationMinutes => integer().withDefault(const Constant(10))();
}

class Questions extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get quizId =>
      integer().references(Quizzes, #id, onDelete: KeyAction.cascade)();

  TextColumn get questionText => text().named('text')();

  TextColumn get imageUrl => text().withDefault(const Constant(''))();
}

class Choices extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get questionId =>
      integer().references(Questions, #id, onDelete: KeyAction.cascade)();

  TextColumn get choiceText => text().named('text')();

  BoolColumn get isCorrect => boolean().withDefault(const Constant(false))();
}

class StudentGrades extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get studentId =>
      integer().references(Students, #id, onDelete: KeyAction.cascade)();

  IntColumn get quizId =>
      integer().references(Quizzes, #id, onDelete: KeyAction.cascade)();

  IntColumn get score => integer()();

  DateTimeColumn get takenAt => dateTime().withDefault(currentDateAndTime)();
}

@DriftDatabase(
  tables: [
    Users,
    Students,
    Admins,
    Levels,
    Units,
    Lessons,
    Vocabularies,
    Quizzes,
    Questions,
    Choices,
    StudentGrades,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      beforeOpen: (details) async {
        await customStatement('PRAGMA foreign_keys = ON');
      },
    );
  }

  Future<void> ensureDefaultAdmin() async {
    final existingAdmin = await (select(
      users,
    )..where((tbl) => tbl.email.equals('admin@rafiq.com'))).getSingleOrNull();

    if (existingAdmin != null) {
      return;
    }

    final adminUserId = await into(users).insert(
      UsersCompanion.insert(
        name: 'System Admin',
        email: 'admin@rafiq.com',
        password: 'Admin@123',
        role: 'admin',
      ),
    );

    await into(admins).insert(AdminsCompanion.insert(userId: adminUserId));
  }

  Future<User?> loginUser({
    required String email,
    required String password,
  }) async {
    await ensureDefaultAdmin();

    return await (select(users)..where(
          (tbl) =>
              tbl.email.equals(email.trim()) &
              tbl.password.equals(password.trim()),
        ))
        .getSingleOrNull();
  }

  Future<int> registerStudent({
    required String name,
    required String email,
    required String password,
    required int levelId,
  }) async {
    final existingUser = await (select(
      users,
    )..where((tbl) => tbl.email.equals(email.trim()))).getSingleOrNull();

    if (existingUser != null) {
      throw Exception('البريد الإلكتروني مستخدم بالفعل');
    }

    final userId = await into(users).insert(
      UsersCompanion.insert(
        name: name.trim(),
        email: email.trim(),
        password: password.trim(),
        role: 'student',
      ),
    );

    await into(
      students,
    ).insert(StudentsCompanion.insert(userId: userId, currentLevelId: levelId));

    return userId;
  }

  Future<List<Level>> getAllLevels() async {
    return await (select(
      levels,
    )..orderBy([(tbl) => OrderingTerm.desc(tbl.id)])).get();
  }

  Future<int> addLevel({required String name, String description = ''}) async {
    return await into(levels).insert(
      LevelsCompanion.insert(
        name: name.trim(),
        description: Value(description.trim()),
      ),
    );
  }

  Future<List<Unit>> getUnitsByLevel(int levelId) async {
    return await (select(units)
          ..where((tbl) => tbl.levelId.equals(levelId))
          ..orderBy([(tbl) => OrderingTerm.asc(tbl.number)]))
        .get();
  }

  Future<int> addUnit({
    required int levelId,
    required String title,
    required int number,
  }) async {
    return await into(units).insert(
      UnitsCompanion.insert(
        levelId: levelId,
        title: title.trim(),
        number: number,
      ),
    );
  }

  Future<List<Lesson>> getLessonsByUnit(int unitId) async {
    return await (select(lessons)
          ..where((tbl) => tbl.unitId.equals(unitId))
          ..orderBy([(tbl) => OrderingTerm.asc(tbl.number)]))
        .get();
  }

  Future<int> addLesson({
    required int unitId,
    required String title,
    required int number,
    String videoUrl = '',
  }) async {
    return await into(lessons).insert(
      LessonsCompanion.insert(
        unitId: unitId,
        title: title.trim(),
        number: number,
        videoUrl: Value(videoUrl.trim()),
      ),
    );
  }

  Future<List<Lesson>> getLessonsByLevel(int levelId) async {
    final query =
        select(
            lessons,
          ).join([innerJoin(units, units.id.equalsExp(lessons.unitId))])
          ..where(units.levelId.equals(levelId))
          ..orderBy([OrderingTerm.asc(lessons.number)]);

    final rows = await query.get();

    return rows.map((row) => row.readTable(lessons)).toList();
  }

  Future<int> addVocabulary({
    required int lessonId,
    required String word,
    required String translation,
    String voiceUrl = '',
  }) async {
    return await into(vocabularies).insert(
      VocabulariesCompanion.insert(
        lessonId: lessonId,
        word: word.trim(),
        translation: translation.trim(),
        voiceUrl: Value(voiceUrl.trim()),
      ),
    );
  }

  Future<List<Vocabulary>> getVocabularyByLesson(int lessonId) async {
    return await (select(vocabularies)
          ..where((tbl) => tbl.lessonId.equals(lessonId))
          ..orderBy([(tbl) => OrderingTerm.asc(tbl.id)]))
        .get();
  }

  Future<List<Lesson>> getRecentLessons() async {
    return await (select(lessons)
          ..orderBy([(tbl) => OrderingTerm.desc(tbl.id)])
          ..limit(7))
        .get();
  }

  Future<Map<String, int>> getDashboardStats() async {
    return {
      'users': await _countTable('users'),
      'levels': await _countTable('levels'),
      'lessons': await _countTable('lessons'),
      'quizzes': await _countTable('quizzes'),
    };
  }

  Future<int> _countTable(String tableName) async {
    final row = await customSelect(
      'SELECT COUNT(*) AS total FROM $tableName',
      readsFrom: {users, levels, lessons, quizzes},
    ).getSingle();

    return row.read<int>('total');
  }
}

QueryExecutor _openConnection() {
  return driftDatabase(
    name: 'student_app_database',
    web: DriftWebOptions(
      sqlite3Wasm: Uri.parse('sqlite3.wasm'),
      driftWorker: Uri.parse('drift_worker.dart.js'),
    ),
  );
}
