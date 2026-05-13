import 'package:flutter/material.dart';

import '../../core/database/database_helper.dart';

class AdminContentScreen extends StatefulWidget {
  const AdminContentScreen({super.key});

  @override
  State<AdminContentScreen> createState() => _AdminContentScreenState();
}

class _AdminContentScreenState extends State<AdminContentScreen> {
  final DatabaseHelper _dbHelper = DatabaseHelper();

  final TextEditingController _levelNameController = TextEditingController();
  final TextEditingController _levelDescriptionController =
      TextEditingController();

  final TextEditingController _unitTitleController = TextEditingController();
  final TextEditingController _unitNumberController = TextEditingController();

  final TextEditingController _lessonTitleController = TextEditingController();
  final TextEditingController _lessonNumberController = TextEditingController();
  final TextEditingController _lessonVideoController = TextEditingController();

  final TextEditingController _wordController = TextEditingController();
  final TextEditingController _translationController = TextEditingController();
  final TextEditingController _voiceUrlController = TextEditingController();

  List<Map<String, dynamic>> _levels = [];
  List<Map<String, dynamic>> _units = [];
  List<Map<String, dynamic>> _lessons = [];
  List<Map<String, dynamic>> _vocabulary = [];

  int? _selectedLevelId;
  int? _selectedUnitId;
  int? _selectedLessonId;

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadLevels();
  }

  Future<void> _loadLevels() async {
    setState(() {
      _isLoading = true;
    });

    final levels = await _dbHelper.getLevels();

    setState(() {
      _levels = levels;
      _selectedLevelId = levels.isNotEmpty ? levels.first['id'] as int : null;
      _isLoading = false;
    });

    if (_selectedLevelId != null) {
      await _loadUnits(_selectedLevelId!);
    }
  }

  Future<void> _loadUnits(int levelId) async {
    final units = await _dbHelper.getUnitsByLevel(levelId);

    setState(() {
      _units = units;
      _selectedUnitId = units.isNotEmpty ? units.first['id'] as int : null;
      _lessons = [];
      _selectedLessonId = null;
      _vocabulary = [];
    });

    if (_selectedUnitId != null) {
      await _loadLessons(_selectedUnitId!);
    }
  }

  Future<void> _loadLessons(int unitId) async {
    final lessons = await _dbHelper.getLessonsByUnit(unitId);

    setState(() {
      _lessons = lessons;
      _selectedLessonId = lessons.isNotEmpty
          ? lessons.first['id'] as int
          : null;
      _vocabulary = [];
    });

    if (_selectedLessonId != null) {
      await _loadVocabulary(_selectedLessonId!);
    }
  }

  Future<void> _loadVocabulary(int lessonId) async {
    final vocabulary = await _dbHelper.getVocabularyByLesson(lessonId);

    setState(() {
      _vocabulary = vocabulary;
    });
  }

  Future<void> _addLevel() async {
    final name = _levelNameController.text.trim();
    final description = _levelDescriptionController.text.trim();

    if (name.isEmpty) {
      _showMessage('أدخل اسم المرحلة الدراسية', isError: true);
      return;
    }

    final newLevelId = await _dbHelper.addLevel(
      name: name,
      description: description,
    );

    _levelNameController.clear();
    _levelDescriptionController.clear();

    final levels = await _dbHelper.getLevels();

    setState(() {
      _levels = levels;
      _selectedLevelId = newLevelId;

      _units = [];
      _selectedUnitId = null;

      _lessons = [];
      _selectedLessonId = null;

      _vocabulary = [];
    });

    await _loadUnits(newLevelId);

    _showMessage('تم إضافة المرحلة الدراسية واختيارها بنجاح');
  }

  Future<void> _addUnit() async {
    if (_selectedLevelId == null) {
      _showMessage('اختر الفصل أولًا', isError: true);
      return;
    }

    final title = _unitTitleController.text.trim();
    final number = int.tryParse(_unitNumberController.text.trim());

    if (title.isEmpty || number == null) {
      _showMessage('أدخل عنوان الوحدة ورقمها بشكل صحيح', isError: true);
      return;
    }

    await _dbHelper.addUnit(
      levelId: _selectedLevelId!,
      title: title,
      number: number,
    );

    _unitTitleController.clear();
    _unitNumberController.clear();

    await _loadUnits(_selectedLevelId!);

    _showMessage('تم إضافة الوحدة بنجاح');
  }

  Future<void> _addLesson() async {
    if (_selectedUnitId == null) {
      _showMessage('اختر الوحدة أولًا', isError: true);
      return;
    }

    final title = _lessonTitleController.text.trim();
    final number = int.tryParse(_lessonNumberController.text.trim());
    final videoUrl = _lessonVideoController.text.trim();

    if (title.isEmpty || number == null) {
      _showMessage('أدخل عنوان الدرس ورقمه بشكل صحيح', isError: true);
      return;
    }

    await _dbHelper.addLesson(
      unitId: _selectedUnitId!,
      title: title,
      number: number,
      videoUrl: videoUrl,
    );

    _lessonTitleController.clear();
    _lessonNumberController.clear();
    _lessonVideoController.clear();

    await _loadLessons(_selectedUnitId!);

    _showMessage('تم إضافة الدرس بنجاح');
  }

  Future<void> _addVocabulary() async {
    if (_selectedLessonId == null) {
      _showMessage('اختر الدرس أولًا', isError: true);
      return;
    }

    final word = _wordController.text.trim();
    final translation = _translationController.text.trim();
    final voiceUrl = _voiceUrlController.text.trim();

    if (word.isEmpty || translation.isEmpty) {
      _showMessage('أدخل الكلمة والترجمة', isError: true);
      return;
    }

    await _dbHelper.addVocabulary(
      lessonId: _selectedLessonId!,
      word: word,
      translation: translation,
      voiceUrl: voiceUrl,
    );

    _wordController.clear();
    _translationController.clear();
    _voiceUrlController.clear();

    await _loadVocabulary(_selectedLessonId!);

    _showMessage('تم إضافة المفردة بنجاح');
  }

  void _showMessage(String message, {bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, textAlign: TextAlign.center),
        backgroundColor: isError ? Colors.redAccent : Colors.green,
      ),
    );
  }

  @override
  void dispose() {
    _levelNameController.dispose();
    _levelDescriptionController.dispose();
    _unitTitleController.dispose();
    _unitNumberController.dispose();
    _lessonTitleController.dispose();
    _lessonNumberController.dispose();
    _lessonVideoController.dispose();
    _wordController.dispose();
    _translationController.dispose();
    _voiceUrlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFF111729),
        appBar: AppBar(
          backgroundColor: const Color(0xFF1E2538),
          title: const Text('إدارة المحتوى التعليمي'),
        ),
        body: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _sectionTitle('1. إدارة المراحل الدراسية'),
                    _card(
                      children: [
                        _input(
                          controller: _levelNameController,
                          label: 'اسم المرحلة الدراسية',
                          icon: Icons.school_outlined,
                        ),
                        const SizedBox(height: 12),
                        _input(
                          controller: _levelDescriptionController,
                          label: 'وصف المرحلة الدراسية',
                          icon: Icons.description_outlined,
                        ),
                        const SizedBox(height: 12),
                        _button(
                          text: 'إضافة مرحلة دراسية',
                          icon: Icons.add,
                          onPressed: _addLevel,
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    _sectionTitle('2. إدارة الوحدات'),
                    _card(
                      children: [
                        _levelsDropdown(),
                        const SizedBox(height: 12),
                        _input(
                          controller: _unitTitleController,
                          label: 'عنوان الوحدة',
                          icon: Icons.layers_outlined,
                        ),
                        const SizedBox(height: 12),
                        _input(
                          controller: _unitNumberController,
                          label: 'رقم الوحدة',
                          icon: Icons.numbers,
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(height: 12),
                        _button(
                          text: 'إضافة وحدة',
                          icon: Icons.add,
                          onPressed: _addUnit,
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    _sectionTitle('3. إدارة الدروس'),
                    _card(
                      children: [
                        _unitsDropdown(),
                        const SizedBox(height: 12),
                        _input(
                          controller: _lessonTitleController,
                          label: 'عنوان الدرس',
                          icon: Icons.menu_book_outlined,
                        ),
                        const SizedBox(height: 12),
                        _input(
                          controller: _lessonNumberController,
                          label: 'رقم الدرس',
                          icon: Icons.numbers,
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(height: 12),
                        _input(
                          controller: _lessonVideoController,
                          label: 'رابط الفيديو اختياري',
                          icon: Icons.video_library_outlined,
                        ),
                        const SizedBox(height: 12),
                        _button(
                          text: 'إضافة درس',
                          icon: Icons.add,
                          onPressed: _addLesson,
                        ),
                        const SizedBox(height: 18),
                        _listTitle('الدروس الموجودة'),
                        _lessonsList(),
                      ],
                    ),
                    const SizedBox(height: 24),

                    _sectionTitle('4. إدارة مفردات الدرس'),
                    _card(
                      children: [
                        _lessonsDropdown(),
                        const SizedBox(height: 12),
                        _input(
                          controller: _wordController,
                          label: 'الكلمة',
                          icon: Icons.translate_outlined,
                        ),
                        const SizedBox(height: 12),
                        _input(
                          controller: _translationController,
                          label: 'الترجمة',
                          icon: Icons.language_outlined,
                        ),
                        const SizedBox(height: 12),
                        _input(
                          controller: _voiceUrlController,
                          label: 'رابط الصوت اختياري',
                          icon: Icons.volume_up_outlined,
                        ),
                        const SizedBox(height: 12),
                        _button(
                          text: 'إضافة مفردة',
                          icon: Icons.add,
                          onPressed: _addVocabulary,
                        ),
                        const SizedBox(height: 18),
                        _listTitle('مفردات الدرس'),
                        _vocabularyList(),
                      ],
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _listTitle(String title) {
    return Align(
      alignment: Alignment.centerRight,
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white70,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _card({required List<Widget> children}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF1E2538),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(children: children),
    );
  }

  Widget _input({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white54),
        prefixIcon: Icon(icon, color: Colors.white54),
        filled: true,
        fillColor: const Color(0xFF171D2D),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white10),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  Widget _button({
    required String text,
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 46,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon),
        label: Text(text),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  Widget _levelsDropdown() {
    return DropdownButtonFormField<int>(
      value: _selectedLevelId,
      dropdownColor: const Color(0xFF1E2538),
      style: const TextStyle(color: Colors.white),
      decoration: _dropdownDecoration(
        label: 'اختر المرحلة الدراسية',
        icon: Icons.school_outlined,
      ),
      items: _levels.map((level) {
        return DropdownMenuItem<int>(
          value: level['id'] as int,
          child: Text(level['name'].toString()),
        );
      }).toList(),
      onChanged: (value) async {
        if (value == null) return;

        setState(() {
          _selectedLevelId = value;
        });

        await _loadUnits(value);
      },
    );
  }

  Widget _unitsDropdown() {
    return DropdownButtonFormField<int>(
      value: _selectedUnitId,
      dropdownColor: const Color(0xFF1E2538),
      style: const TextStyle(color: Colors.white),
      decoration: _dropdownDecoration(
        label: 'اختر الوحدة',
        icon: Icons.layers_outlined,
      ),
      items: _units.map((unit) {
        return DropdownMenuItem<int>(
          value: unit['id'] as int,
          child: Text(unit['title'].toString()),
        );
      }).toList(),
      onChanged: (value) async {
        if (value == null) return;

        setState(() {
          _selectedUnitId = value;
        });

        await _loadLessons(value);
      },
    );
  }

  Widget _lessonsDropdown() {
    return DropdownButtonFormField<int>(
      value: _selectedLessonId,
      dropdownColor: const Color(0xFF1E2538),
      style: const TextStyle(color: Colors.white),
      decoration: _dropdownDecoration(
        label: 'اختر الدرس',
        icon: Icons.menu_book_outlined,
      ),
      items: _lessons.map((lesson) {
        return DropdownMenuItem<int>(
          value: lesson['id'] as int,
          child: Text(lesson['title'].toString()),
        );
      }).toList(),
      onChanged: (value) async {
        if (value == null) return;

        setState(() {
          _selectedLessonId = value;
        });

        await _loadVocabulary(value);
      },
    );
  }

  InputDecoration _dropdownDecoration({
    required String label,
    required IconData icon,
  }) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: Colors.white54),
      prefixIcon: Icon(icon, color: Colors.white54),
      filled: true,
      fillColor: const Color(0xFF171D2D),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white10),
        borderRadius: BorderRadius.circular(12),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.blue),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  Widget _lessonsList() {
    if (_lessons.isEmpty) {
      return const Padding(
        padding: EdgeInsets.only(top: 12),
        child: Text(
          'لا توجد دروس مضافة لهذه الوحدة',
          style: TextStyle(color: Colors.white54),
        ),
      );
    }

    return Column(
      children: _lessons.map((lesson) {
        return Container(
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFF171D2D),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.white10),
          ),
          child: Row(
            children: [
              const Icon(Icons.menu_book, color: Colors.blue),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  '${lesson['number']} - ${lesson['title']}',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _vocabularyList() {
    if (_vocabulary.isEmpty) {
      return const Padding(
        padding: EdgeInsets.only(top: 12),
        child: Text(
          'لا توجد مفردات مضافة لهذا الدرس',
          style: TextStyle(color: Colors.white54),
        ),
      );
    }

    return Column(
      children: _vocabulary.map((item) {
        return Container(
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFF171D2D),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.white10),
          ),
          child: Row(
            children: [
              const Icon(Icons.translate, color: Colors.blue),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  '${item['word']} = ${item['translation']}',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
