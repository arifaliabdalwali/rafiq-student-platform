import 'package:flutter/material.dart';
import '../../core/database/database_helper.dart';
import '../../widgets/header.dart';
import '../admin/admin_content_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final DatabaseHelper _dbHelper = DatabaseHelper();
  Map<String, dynamic> _stats = {
    'users': 0,
    'levels': 0,
    'lessons': 0,
    'quizzes': 0,
  };
  List<Map<String, dynamic>> _recentLessons = [];

  @override
  void initState() {
    super.initState();
    _loadDashboardData();
  }

  Future<void> _loadDashboardData() async {
    final stats = await _dbHelper.getDashboardStats();
    final lessons = await _dbHelper.getRecentLessons();
    if (mounted) {
      setState(() {
        _stats = stats;
        _recentLessons = lessons;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // تحديد ما إذا كانت الشاشة جوال (أصغر من 850 بكسل)
        bool isMobile = constraints.maxWidth < 850;

        return Scaffold(
          backgroundColor: const Color(0xFF111729),
          // القائمة الجانبية تظهر كـ Drawer في الجوال فقط
          drawer: isMobile ? Drawer(child: _buildSidebar()) : null,
          appBar: isMobile
              ? AppBar(
                  backgroundColor: const Color(0xFF171D2D),
                  elevation: 0,
                  title: const Text(
                    "Rafiq App",
                    style: TextStyle(fontSize: 18),
                  ),
                )
              : null,
          body: Row(
            children: [
              // القائمة الجانبية ثابتة في الويب فقط
              if (!isMobile) _buildSidebar(),

              Expanded(
                flex: 5,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Header(),
                      const SizedBox(height: 25),
                      const Text(
                        "Dashboard",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // بطاقات الإحصائيات (تتغير حسب المساحة)
                      _buildResponsiveStats(isMobile),

                      const SizedBox(height: 30),

                      // جدول الدروس
                      _buildRecentLessonsTable(isMobile),
                    ],
                  ),
                ),
              ),

              // اللوحة اليمنى تظهر في الويب فقط
              if (!isMobile) _buildRightPanel(),
            ],
          ),
        );
      },
    );
  }

  // دالة بناء الإحصائيات بشكل مرن
  Widget _buildResponsiveStats(bool isMobile) {
    if (isMobile) {
      return Column(
        children: [
          Row(
            children: [
              _statCard(
                "Users",
                "${_stats['users']}",
                Icons.person,
                Colors.blue,
                0.7,
              ),
              const SizedBox(width: 15),
              _statCard(
                "Levels",
                "${_stats['levels']}",
                Icons.folder,
                Colors.orange,
                0.4,
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              _statCard(
                "Lessons",
                "${_stats['lessons']}",
                Icons.play_circle,
                Colors.cyan,
                0.8,
              ),
              const SizedBox(width: 15),
              _statCard(
                "Quizzes",
                "${_stats['quizzes']}",
                Icons.quiz,
                Colors.purple,
                0.5,
              ),
            ],
          ),
        ],
      );
    }
    return Row(
      children: [
        _statCard(
          "Users",
          "${_stats['users']}",
          Icons.person,
          Colors.blue,
          0.7,
        ),
        const SizedBox(width: 15),
        _statCard(
          "Levels",
          "${_stats['levels']}",
          Icons.folder,
          Colors.orange,
          0.4,
        ),
        const SizedBox(width: 15),
        _statCard(
          "Lessons",
          "${_stats['lessons']}",
          Icons.play_circle,
          Colors.cyan,
          0.8,
        ),
        const SizedBox(width: 15),
        _statCard(
          "Quizzes",
          "${_stats['quizzes']}",
          Icons.quiz,
          Colors.purple,
          0.5,
        ),
      ],
    );
  }

  Widget _buildSidebar() {
    return Container(
      width: 220,
      color: const Color(0xFF171D2D),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.school, color: Colors.blue, size: 30),
                SizedBox(width: 10),
                Text(
                  "Rafiq App",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          _sidebarItem(Icons.dashboard, "Dashboard", true, onTap: () {}),

          _sidebarItem(
            Icons.library_books,
            "Manage Content",
            false,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AdminContentScreen()),
              ).then((_) {
                _loadDashboardData();
              });
            },
          ),

          _sidebarItem(Icons.people, "Users", false, onTap: () {}),

          _sidebarItem(Icons.layers, "Levels", false, onTap: () {}),

          _sidebarItem(Icons.book, "Lessons", false, onTap: () {}),

          const Spacer(),

          _sidebarItem(Icons.settings, "Settings", false, onTap: () {}),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _sidebarItem(
    IconData icon,
    String title,
    bool isActive, {
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: isActive ? Colors.blue : Colors.white54),
      title: Text(
        title,
        style: TextStyle(
          color: isActive ? Colors.white : Colors.white54,
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      onTap: () {
        Navigator.maybePop(context);
        onTap();
      },
    );
  }

  Widget _statCard(
    String title,
    String count,
    IconData icon,
    Color color,
    double progress,
  ) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFF1E2538),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(icon, color: color, size: 30),
                const Icon(Icons.more_vert, color: Colors.white54),
              ],
            ),
            const SizedBox(height: 15),
            Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(height: 5),
            Text(
              count,
              style: const TextStyle(color: Colors.white54, fontSize: 12),
            ),
            const SizedBox(height: 15),
            LinearProgressIndicator(
              value: progress,
              color: color,
              // ignore: deprecated_member_use
              backgroundColor: color.withOpacity(
                0.1,
              ), // تم استبدال withValues بـ withOpacity للتوافق
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentLessonsTable(bool isMobile) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1E2538),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Recent Lessons",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          const SizedBox(height: 15),
          // تم إضافة Scroll أفقي للجداول في الجوال لمنع الـ Overflow
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: isMobile ? 500 : 0),
              child: Table(
                columnWidths: const {
                  0: FlexColumnWidth(3),
                  1: FlexColumnWidth(2),
                  2: FlexColumnWidth(1),
                },
                children: [
                  const TableRow(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          "Lesson Title",
                          style: TextStyle(color: Colors.white54),
                        ),
                      ),
                      Text("Unit ID", style: TextStyle(color: Colors.white54)),
                      Text("ID", style: TextStyle(color: Colors.white54)),
                    ],
                  ),
                  ..._recentLessons.map(
                    (lesson) => TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Text(
                            "${lesson['title']}",
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        Text(
                          "${lesson['unit_id']}",
                          style: const TextStyle(color: Colors.white),
                        ),
                        Text(
                          "${lesson['id']}",
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRightPanel() {
    return Container(
      width: 280,
      color: const Color(0xFF171D2D),
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text(
            "Database Details",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 180,
                width: 180,
                child: CircularProgressIndicator(
                  value: 0.75,
                  strokeWidth: 15,
                  color: Colors.cyan,
                  // ignore: deprecated_member_use
                  backgroundColor: Colors.redAccent.withOpacity(0.2),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "${_stats['users'] + _stats['lessons']}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "Total Assets",
                    style: TextStyle(color: Colors.white54, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 40),
          _detailRow("Vocabulary", "1.3 GB", Colors.blue, Icons.translate),
          _detailRow("Questions", "15.1 GB", Colors.cyan, Icons.help_outline),
          _detailRow("Choices", "1.3 GB", Colors.orange, Icons.list),
          _detailRow("Grades", "1.3 GB", Colors.redAccent, Icons.grade),
        ],
      ),
    );
  }

  Widget _detailRow(String title, String size, Color color, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white10),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(icon, color: color),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                ),
                const Text(
                  "Table Records",
                  style: TextStyle(color: Colors.white54, fontSize: 10),
                ),
              ],
            ),
          ),
          Text(size, style: const TextStyle(color: Colors.white, fontSize: 12)),
        ],
      ),
    );
  }
}
