import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb_auth;

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final fb_auth.FirebaseAuth _auth = fb_auth.FirebaseAuth.instance;

  int _generateId() {
    return DateTime.now().microsecondsSinceEpoch;
  }

  Future<void> ensureDefaultAdmin() async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: 'admin@rafiq.com',
        password: 'Admin@123',
      );

      final uid = credential.user!.uid;

      await _firestore.collection('users').doc(uid).set({
        'id': uid,
        'name': 'System Admin',
        'email': 'admin@rafiq.com',
        'role': 'admin',
        'created_at': FieldValue.serverTimestamp(),
      });
    } on fb_auth.FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return;
      }
      rethrow;
    }
  }

  Future<Map<String, dynamic>?> loginUser({
    required String email,
    required String password,
  }) async {
    await ensureDefaultAdmin();

    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      final uid = credential.user!.uid;

      final userDoc = await _firestore.collection('users').doc(uid).get();

      if (!userDoc.exists) {
        if (email.trim() == 'admin@rafiq.com') {
          await _firestore.collection('users').doc(uid).set({
            'id': uid,
            'name': 'System Admin',
            'email': 'admin@rafiq.com',
            'role': 'admin',
            'created_at': FieldValue.serverTimestamp(),
          });

          return {
            'id': uid,
            'name': 'System Admin',
            'email': 'admin@rafiq.com',
            'role': 'admin',
          };
        }

        return null;
      }

      final userData = userDoc.data()!;

      if (userData['role'] == 'student') {
        final studentDoc = await _firestore
            .collection('students')
            .doc(uid)
            .get();

        if (studentDoc.exists) {
          final studentData = studentDoc.data()!;
          userData['student_id'] = uid;
          userData['current_level_id'] = studentData['current_level_id'];
        }
      }

      return userData;
    } on fb_auth.FirebaseAuthException {
      return null;
    }
  }

  Future<Map<String, dynamic>> registerStudent({
    required String name,
    required String email,
    required String password,
    required int levelId,
  }) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      final uid = credential.user!.uid;

      await _firestore.collection('users').doc(uid).set({
        'id': uid,
        'name': name.trim(),
        'email': email.trim(),
        'role': 'student',
        'current_level_id': levelId,
        'created_at': FieldValue.serverTimestamp(),
      });

      await _firestore.collection('students').doc(uid).set({
        'id': uid,
        'user_id': uid,
        'current_level_id': levelId,
        'created_at': FieldValue.serverTimestamp(),
      });

      return {
        'success': true,
        'message': 'تم إنشاء الحساب بنجاح',
        'user_id': uid,
      };
    } on fb_auth.FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return {'success': false, 'message': 'البريد الإلكتروني مستخدم بالفعل'};
      }

      return {
        'success': false,
        'message': e.message ?? 'حدث خطأ أثناء إنشاء الحساب',
      };
    } catch (e) {
      return {'success': false, 'message': e.toString()};
    }
  }

  Future<Map<String, dynamic>> getDashboardStats() async {
    final users = await _firestore.collection('users').count().get();
    final levels = await _firestore.collection('levels').count().get();
    final lessons = await _firestore.collection('lessons').count().get();
    final quizzes = await _firestore.collection('quizzes').count().get();

    return {
      'users': users.count ?? 0,
      'levels': levels.count ?? 0,
      'lessons': lessons.count ?? 0,
      'quizzes': quizzes.count ?? 0,
    };
  }

  Future<List<Map<String, dynamic>>> getLevels() async {
    final snapshot = await _firestore
        .collection('levels')
        .orderBy('created_at', descending: true)
        .get();

    return snapshot.docs.map((doc) {
      return {...doc.data(), 'doc_id': doc.id};
    }).toList();
  }

  Future<int> addLevel({required String name, String? description}) async {
    final id = _generateId();

    await _firestore.collection('levels').doc(id.toString()).set({
      'id': id,
      'name': name.trim(),
      'description': description?.trim() ?? '',
      'created_at': FieldValue.serverTimestamp(),
    });

    return id;
  }

  Future<List<Map<String, dynamic>>> getUnitsByLevel(int levelId) async {
    final snapshot = await _firestore
        .collection('units')
        .where('level_id', isEqualTo: levelId)
        .get();

    final units = snapshot.docs.map((doc) {
      return {...doc.data(), 'doc_id': doc.id};
    }).toList();

    units.sort((a, b) {
      final aNumber = a['number'] ?? 0;
      final bNumber = b['number'] ?? 0;
      return aNumber.compareTo(bNumber);
    });

    return units;
  }

  Future<int> addUnit({
    required int levelId,
    required String title,
    required int number,
  }) async {
    final id = _generateId();

    await _firestore.collection('units').doc(id.toString()).set({
      'id': id,
      'level_id': levelId,
      'title': title.trim(),
      'number': number,
      'created_at': FieldValue.serverTimestamp(),
    });

    return id;
  }

  Future<List<Map<String, dynamic>>> getLessonsByUnit(int unitId) async {
    final snapshot = await _firestore
        .collection('lessons')
        .where('unit_id', isEqualTo: unitId)
        .get();

    final lessons = snapshot.docs.map((doc) {
      return {...doc.data(), 'doc_id': doc.id};
    }).toList();

    lessons.sort((a, b) {
      final aNumber = a['number'] ?? 0;
      final bNumber = b['number'] ?? 0;
      return aNumber.compareTo(bNumber);
    });

    return lessons;
  }

  Future<List<Map<String, dynamic>>> getLessonsByLevel(int levelId) async {
    final snapshot = await _firestore
        .collection('lessons')
        .where('level_id', isEqualTo: levelId)
        .get();

    final lessons = snapshot.docs.map((doc) {
      return {...doc.data(), 'doc_id': doc.id};
    }).toList();

    lessons.sort((a, b) {
      final aNumber = a['number'] ?? 0;
      final bNumber = b['number'] ?? 0;
      return aNumber.compareTo(bNumber);
    });

    return lessons;
  }

  Future<int> addLesson({
    required int unitId,
    required String title,
    required int number,
    String? videoUrl,
  }) async {
    final id = _generateId();

    final unitDoc = await _firestore
        .collection('units')
        .doc(unitId.toString())
        .get();

    int? levelId;

    if (unitDoc.exists) {
      levelId = unitDoc.data()?['level_id'];
    }

    await _firestore.collection('lessons').doc(id.toString()).set({
      'id': id,
      'unit_id': unitId,
      'level_id': levelId,
      'title': title.trim(),
      'number': number,
      'video_url': videoUrl?.trim() ?? '',
      'created_at': FieldValue.serverTimestamp(),
    });

    return id;
  }

  Future<List<Map<String, dynamic>>> getVocabularyByLesson(int lessonId) async {
    final snapshot = await _firestore
        .collection('vocabulary')
        .where('lesson_id', isEqualTo: lessonId)
        .get();

    final vocabulary = snapshot.docs.map((doc) {
      return {...doc.data(), 'doc_id': doc.id};
    }).toList();

    vocabulary.sort((a, b) {
      final aId = a['id'] ?? 0;
      final bId = b['id'] ?? 0;
      return aId.compareTo(bId);
    });

    return vocabulary;
  }

  Future<int> addVocabulary({
    required int lessonId,
    required String word,
    required String translation,
    String? voiceUrl,
  }) async {
    final id = _generateId();

    await _firestore.collection('vocabulary').doc(id.toString()).set({
      'id': id,
      'lesson_id': lessonId,
      'word': word.trim(),
      'translation': translation.trim(),
      'voice_url': voiceUrl?.trim() ?? '',
      'created_at': FieldValue.serverTimestamp(),
    });

    return id;
  }

  Future<List<Map<String, dynamic>>> getRecentLessons() async {
    final snapshot = await _firestore
        .collection('lessons')
        .orderBy('created_at', descending: true)
        .limit(7)
        .get();

    return snapshot.docs.map((doc) {
      return {...doc.data(), 'doc_id': doc.id};
    }).toList();
  }
}
