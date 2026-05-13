import 'package:flutter/material.dart';

import '../../core/database/database_helper.dart';
import '../auth/login_screen.dart';

class StudentHomeScreen extends StatefulWidget {
  final Map<String, dynamic> user;

  const StudentHomeScreen({super.key, required this.user});

  @override
  State<StudentHomeScreen> createState() => _StudentHomeScreenState();
}

class _StudentHomeScreenState extends State<StudentHomeScreen> {
  final DatabaseHelper _dbHelper = DatabaseHelper();

  bool _isLoading = true;
  List<Map<String, dynamic>> _lessons = [];

  @override
  void initState() {
    super.initState();
    _loadLessons();
  }

  Future<void> _loadLessons() async {
    final levelId = widget.user['current_level_id'];

    if (levelId == null) {
      setState(() {
        _lessons = [];
        _isLoading = false;
      });
      return;
    }

    final lessons = await _dbHelper.getLessonsByLevel(levelId as int);

    if (!mounted) return;

    setState(() {
      _lessons = lessons;
      _isLoading = false;
    });
  }

  Future<void> _openLesson(Map<String, dynamic> lesson) async {
    final vocabulary = await _dbHelper.getVocabularyByLesson(
      lesson['id'] as int,
    );

    if (!mounted) return;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) =>
            LessonDetailsScreen(lesson: lesson, vocabulary: vocabulary),
      ),
    );
  }

  void _logout() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const LoginScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final studentName = widget.user['name'] ?? 'الطالب';

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFF111729),
        appBar: AppBar(
          backgroundColor: const Color(0xFF1E2538),
          title: const Text('صفحة الطالب'),
          actions: [
            IconButton(
              tooltip: 'تسجيل الخروج',
              onPressed: _logout,
              icon: const Icon(Icons.logout),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'مرحبًا $studentName',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'هذه الدروس مخصصة للمرحلة الدراسية التي اخترتها.',
                style: TextStyle(color: Colors.white60, fontSize: 16),
              ),
              const SizedBox(height: 28),
              Expanded(
                child: _isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : _lessons.isEmpty
                    ? _emptyLessons()
                    : _lessonsGrid(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _emptyLessons() {
    return const Center(
      child: Text(
        'لا توجد دروس مضافة لهذه المرحلة حتى الآن',
        style: TextStyle(color: Colors.white54, fontSize: 18),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _lessonsGrid() {
    final isWide = MediaQuery.of(context).size.width > 900;

    return GridView.builder(
      itemCount: _lessons.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isWide ? 3 : 1,
        crossAxisSpacing: 18,
        mainAxisSpacing: 18,
        childAspectRatio: isWide ? 1.4 : 2.7,
      ),
      itemBuilder: (context, index) {
        final lesson = _lessons[index];

        return InkWell(
          onTap: () => _openLesson(lesson),
          borderRadius: BorderRadius.circular(18),
          child: Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: const Color(0xFF1E2538),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: Colors.white10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.menu_book, color: Colors.blue, size: 42),
                const Spacer(),
                Text(
                  'الدرس ${lesson['number']}',
                  style: const TextStyle(color: Colors.white54, fontSize: 14),
                ),
                const SizedBox(height: 6),
                Text(
                  lesson['title'].toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'اضغط لعرض مفردات الدرس',
                  style: TextStyle(color: Colors.white60, fontSize: 13),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class LessonDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> lesson;
  final List<Map<String, dynamic>> vocabulary;

  const LessonDetailsScreen({
    super.key,
    required this.lesson,
    required this.vocabulary,
  });

  @override
  Widget build(BuildContext context) {
    final videoUrl = lesson['video_url']?.toString() ?? '';

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFF111729),
        appBar: AppBar(
          backgroundColor: const Color(0xFF1E2538),
          title: Text(lesson['title'].toString()),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                lesson['title'].toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'الدرس رقم ${lesson['number']}',
                style: const TextStyle(color: Colors.white54, fontSize: 16),
              ),
              const SizedBox(height: 20),

              if (videoUrl.isNotEmpty)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.only(bottom: 24),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E2538),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: Colors.white10),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.video_library_outlined,
                        color: Colors.blue,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          videoUrl,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              const Text(
                'مفردات الدرس',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 14),

              if (vocabulary.isEmpty)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E2538),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: Colors.white10),
                  ),
                  child: const Text(
                    'لا توجد مفردات مضافة لهذا الدرس',
                    style: TextStyle(color: Colors.white54, fontSize: 16),
                  ),
                )
              else
                Column(
                  children: vocabulary.map((item) {
                    final word = item['word']?.toString() ?? '';
                    final translation = item['translation']?.toString() ?? '';

                    return Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1E2538),
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: Colors.white10),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.translate, color: Colors.blue),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              word,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            translation,
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
