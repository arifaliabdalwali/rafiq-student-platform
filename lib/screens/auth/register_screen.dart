import 'package:flutter/material.dart';

import '../../core/database/database_helper.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final DatabaseHelper _dbHelper = DatabaseHelper();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  List<Map<String, dynamic>> _levels = [];
  int? _selectedLevelId;

  bool _isLoading = false;
  bool _obscurePassword = true;
  bool _isLoadingLevels = true;

  @override
  void initState() {
    super.initState();
    _loadLevels();
  }

  Future<void> _loadLevels() async {
    final levels = await _dbHelper.getLevels();

    if (!mounted) return;

    setState(() {
      _levels = levels;
      _selectedLevelId = levels.isNotEmpty ? levels.first['id'] as int : null;
      _isLoadingLevels = false;
    });
  }

  Future<void> _register() async {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      _showMessage('يرجى تعبئة جميع الحقول', isError: true);
      return;
    }

    if (_selectedLevelId == null) {
      _showMessage(
        'لا توجد مرحلة دراسية. يجب أن يقوم الأدمن بإضافة مرحلة دراسية أولًا',
        isError: true,
      );
      return;
    }

    if (password.length < 6) {
      _showMessage('كلمة المرور يجب أن تكون 6 أحرف على الأقل', isError: true);
      return;
    }

    setState(() {
      _isLoading = true;
    });

    final result = await _dbHelper.registerStudent(
      name: name,
      email: email,
      password: password,
      levelId: _selectedLevelId!,
    );

    if (!mounted) return;

    setState(() {
      _isLoading = false;
    });

    if (result['success'] == false) {
      _showMessage(result['message'], isError: true);
      return;
    }

    _showMessage(
      'تم إنشاء الحساب بنجاح. يمكنك تسجيل الدخول الآن',
      isError: false,
    );

    Navigator.pop(context);
  }

  void _showMessage(String message, {required bool isError}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, textAlign: TextAlign.center),
        backgroundColor: isError ? Colors.redAccent : Colors.green,
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFF111729),
        appBar: AppBar(
          backgroundColor: const Color(0xFF111729),
          elevation: 0,
          title: const Text('إنشاء حساب طالب'),
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Container(
              width: 420,
              padding: const EdgeInsets.all(28),
              decoration: BoxDecoration(
                color: const Color(0xFF1E2538),
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: Colors.white10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircleAvatar(
                    radius: 34,
                    backgroundColor: Colors.blue,
                    child: Icon(
                      Icons.person_add_alt_1,
                      color: Colors.white,
                      size: 34,
                    ),
                  ),
                  const SizedBox(height: 18),
                  const Text(
                    'إنشاء حساب طالب',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'اختر المرحلة الدراسية ثم أدخل بيانات الطالب',
                    style: TextStyle(color: Colors.white54, fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 28),

                  TextField(
                    controller: _nameController,
                    style: const TextStyle(color: Colors.white),
                    decoration: _inputDecoration(
                      label: 'الاسم الكامل',
                      icon: Icons.person_outline,
                    ),
                  ),

                  const SizedBox(height: 16),

                  TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(color: Colors.white),
                    decoration: _inputDecoration(
                      label: 'البريد الإلكتروني',
                      icon: Icons.email_outlined,
                    ),
                  ),

                  const SizedBox(height: 16),

                  TextField(
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    style: const TextStyle(color: Colors.white),
                    decoration: _inputDecoration(
                      label: 'كلمة المرور',
                      icon: Icons.lock_outline,
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.white54,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  _isLoadingLevels
                      ? const CircularProgressIndicator()
                      : DropdownButtonFormField<int>(
                          value: _selectedLevelId,
                          dropdownColor: const Color(0xFF1E2538),
                          style: const TextStyle(color: Colors.white),
                          decoration: _inputDecoration(
                            label: 'اختر المرحلة الدراسية',
                            icon: Icons.school_outlined,
                          ),
                          items: _levels.map((level) {
                            return DropdownMenuItem<int>(
                              value: level['id'] as int,
                              child: Text(
                                level['name'].toString(),
                                style: const TextStyle(color: Colors.white),
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedLevelId = value;
                            });
                          },
                        ),

                  if (!_isLoadingLevels && _levels.isEmpty) ...[
                    const SizedBox(height: 12),
                    const Text(
                      'لا توجد مراحل دراسية حاليًا. يجب على الأدمن إضافة المرحلة الدراسية من لوحة التحكم أولًا.',
                      style: TextStyle(color: Colors.orangeAccent),
                      textAlign: TextAlign.center,
                    ),
                  ],

                  const SizedBox(height: 24),

                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: _isLoading ? null : _register,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: _isLoading
                          ? const SizedBox(
                              width: 22,
                              height: 22,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                          : const Text(
                              'إنشاء الحساب',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                  ),

                  const SizedBox(height: 18),

                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('لديك حساب؟ تسجيل الدخول'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration({
    required String label,
    required IconData icon,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: Colors.white54),
      prefixIcon: Icon(icon, color: Colors.white54),
      suffixIcon: suffixIcon,
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
}
