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

  final List<Color> _cardColors = const [
    Color(0xFFFF7043),
    Color(0xFF42A5F5),
    Color(0xFF66BB6A),
    Color(0xFFFFA726),
    Color(0xFF26A69A),
    Color(0xFFEC407A),
    Color(0xFF7E57C2),
    Color(0xFF26C6DA),
  ];

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

  Future<void> _openLesson(Map<String, dynamic> lesson, Color color) async {
    final vocabulary = await _dbHelper.getVocabularyByLesson(
      lesson['id'] as int,
    );

    if (!mounted) return;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => LessonDetailsScreen(
          lesson: lesson,
          vocabulary: vocabulary,
          themeColor: color,
        ),
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
    final studentName = widget.user['name']?.toString() ?? 'الطالب';

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF0F2F5),
        body: Stack(
          children: [
            _buildCircle(
              280,
              const Color(0xFF64B5F6).withOpacity(0.22),
              top: -90,
              right: -70,
            ),
            _buildCircle(
              220,
              const Color(0xFF81C784).withOpacity(0.16),
              bottom: 80,
              left: -80,
            ),
            _buildCircle(
              160,
              const Color(0xFFFFB74D).withOpacity(0.12),
              top: 260,
              left: -55,
            ),
            SafeArea(
              child: Column(
                children: [
                  _buildHeader(studentName),
                  Expanded(
                    child: _isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : _lessons.isEmpty
                        ? _emptyLessons()
                        : RefreshIndicator(
                            onRefresh: _loadLessons,
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(
                                parent: AlwaysScrollableScrollPhysics(),
                              ),
                              padding: const EdgeInsets.fromLTRB(
                                20,
                                10,
                                20,
                                30,
                              ),
                              itemCount: _lessons.length,
                              itemBuilder: (context, index) {
                                final lesson = _lessons[index];
                                final color =
                                    _cardColors[index % _cardColors.length];

                                return _lessonCard(
                                  lesson: lesson,
                                  color: color,
                                  index: index,
                                );
                              },
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(String studentName) {
    return Container(
      padding: const EdgeInsets.fromLTRB(18, 22, 18, 18),
      child: Row(
        children: [
          IconButton(
            tooltip: 'تسجيل الخروج',
            onPressed: _logout,
            icon: const Icon(Icons.logout_rounded, color: Color(0xFF2C3E50)),
          ),
          const SizedBox(width: 8),
          Container(
            height: 62,
            width: 62,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(22),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 12,
                  offset: Offset(0, 6),
                ),
              ],
            ),
            child: const Icon(
              Icons.auto_stories_rounded,
              color: Color(0xFF42A5F5),
              size: 34,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'مرحبًا $studentName',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color(0xFF7F8C8D),
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'رحلتك التعليمية',
                  style: TextStyle(
                    color: Color(0xFF2C3E50),
                    fontSize: 27,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'اختر درسًا للبدء',
                  style: TextStyle(color: Color(0xFF95A5A6), fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _lessonCard({
    required Map<String, dynamic> lesson,
    required Color color,
    required int index,
  }) {
    final title = lesson['title']?.toString() ?? 'درس بدون عنوان';
    final number = lesson['number']?.toString() ?? '${index + 1}';

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: LinearGradient(
          colors: [color.withOpacity(0.86), color],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.28),
            blurRadius: 14,
            offset: const Offset(0, 7),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => _openLesson(lesson, color),
            child: Stack(
              children: [
                Positioned(
                  left: -18,
                  top: -16,
                  child: Icon(
                    Icons.menu_book_rounded,
                    size: 118,
                    color: Colors.white.withOpacity(0.12),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Row(
                    children: [
                      Container(
                        height: 68,
                        width: 68,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.25),
                          borderRadius: BorderRadius.circular(22),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.45),
                          ),
                        ),
                        child: const Icon(
                          Icons.play_lesson_rounded,
                          color: Colors.white,
                          size: 36,
                        ),
                      ),
                      const SizedBox(width: 18),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Lesson $number',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.88),
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Wrap(
                              spacing: 7,
                              runSpacing: 7,
                              children: const [
                                _SmallChip(text: '📘 مفردات'),
                                _SmallChip(text: '🎧 استماع'),
                                _SmallChip(text: '📝 تدريب'),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.white,
                        size: 18,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _emptyLessons() {
    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.all(24),
      children: [
        const SizedBox(height: 120),
        Container(
          padding: const EdgeInsets.all(28),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(28),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 18,
                offset: Offset(0, 8),
              ),
            ],
          ),
          child: const Column(
            children: [
              Icon(
                Icons.menu_book_outlined,
                color: Color(0xFF42A5F5),
                size: 58,
              ),
              SizedBox(height: 18),
              Text(
                'لا توجد دروس مضافة لهذه المرحلة حتى الآن',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF2C3E50),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'سيتم عرض الدروس هنا عندما يقوم الأدمن بإضافتها.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xFF7F8C8D), fontSize: 14),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCircle(
    double size,
    Color color, {
    double? top,
    double? bottom,
    double? left,
    double? right,
  }) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
    );
  }
}

class LessonDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> lesson;
  final List<Map<String, dynamic>> vocabulary;
  final Color themeColor;

  const LessonDetailsScreen({
    super.key,
    required this.lesson,
    required this.vocabulary,
    required this.themeColor,
  });

  @override
  Widget build(BuildContext context) {
    final title = lesson['title']?.toString() ?? 'تفاصيل الدرس';
    final number = lesson['number']?.toString() ?? '';
    final videoUrl = lesson['video_url']?.toString() ?? '';

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF0F2F5),
        body: Stack(
          children: [
            Positioned(
              top: -110,
              right: -70,
              child: Container(
                width: 280,
                height: 280,
                decoration: BoxDecoration(
                  color: themeColor.withOpacity(0.20),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            SafeArea(
              child: Column(
                children: [
                  _detailsHeader(context, title, number),
                  Expanded(
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
                      children: [
                        if (videoUrl.isNotEmpty) _videoCard(videoUrl),
                        _sectionTitle('مفردات الدرس'),
                        const SizedBox(height: 12),
                        if (vocabulary.isEmpty)
                          _emptyVocabulary()
                        else
                          ...vocabulary.map(_vocabularyCard),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _detailsHeader(BuildContext context, String title, String number) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 18),
      child: Row(
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Color(0xFF2C3E50),
            ),
          ),
          Container(
            height: 62,
            width: 62,
            decoration: BoxDecoration(
              color: themeColor,
              borderRadius: BorderRadius.circular(22),
              boxShadow: [
                BoxShadow(
                  color: themeColor.withOpacity(0.30),
                  blurRadius: 14,
                  offset: const Offset(0, 7),
                ),
              ],
            ),
            child: const Icon(
              Icons.menu_book_rounded,
              color: Colors.white,
              size: 34,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  number.isEmpty ? 'Lesson' : 'Lesson $number',
                  style: const TextStyle(
                    color: Color(0xFF7F8C8D),
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color(0xFF2C3E50),
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _videoCard(String videoUrl) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: themeColor,
        borderRadius: BorderRadius.circular(26),
        boxShadow: [
          BoxShadow(
            color: themeColor.withOpacity(0.25),
            blurRadius: 14,
            offset: const Offset(0, 7),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            height: 54,
            width: 54,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.24),
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Icon(
              Icons.video_library_rounded,
              color: Colors.white,
              size: 30,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              videoUrl,
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: Color(0xFF2C3E50),
        fontSize: 23,
        fontWeight: FontWeight.w900,
      ),
    );
  }

  Widget _emptyVocabulary() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(26),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 16,
            offset: Offset(0, 7),
          ),
        ],
      ),
      child: const Text(
        'لا توجد مفردات مضافة لهذا الدرس',
        textAlign: TextAlign.center,
        style: TextStyle(color: Color(0xFF7F8C8D), fontSize: 16),
      ),
    );
  }

  Widget _vocabularyCard(Map<String, dynamic> item) {
    final word = item['word']?.toString() ?? '';
    final translation = item['translation']?.toString() ?? '';
    final voiceUrl = item['voice_url']?.toString() ?? '';

    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(26),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 14,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            height: 54,
            width: 54,
            decoration: BoxDecoration(
              color: themeColor.withOpacity(0.16),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Icon(Icons.translate_rounded, color: themeColor, size: 28),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  word,
                  style: const TextStyle(
                    color: Color(0xFF2C3E50),
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  translation,
                  style: const TextStyle(
                    color: Color(0xFF7F8C8D),
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          if (voiceUrl.isNotEmpty)
            Icon(Icons.volume_up_rounded, color: themeColor),
        ],
      ),
    );
  }
}

class _SmallChip extends StatelessWidget {
  final String text;

  const _SmallChip({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.16),
        borderRadius: BorderRadius.circular(9),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
