import 'package:flutter/material.dart';
import '../core/constants/colors.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.secondaryColor,
      child: Column(
        children: [
          DrawerHeader(child: Column(
            children: [
              Icon(Icons.school, color: Colors.blue, size: 40),
              const SizedBox(height: 10),
              const Text("Student", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
            ],
          )),
          _menuItem("Dashboard", Icons.home, true),
          _menuItem("Lessons", Icons.assignment, false),
          _menuItem("Quizzes", Icons.quiz, false),
          _menuItem("Progress", Icons.analytics, false),
          _menuItem("Settings", Icons.settings, false),
        ],
      ),
    );
  }

  Widget _menuItem(String title, IconData icon, bool isActive) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        // ignore: deprecated_member_use
        color: isActive ? Colors.blue.withOpacity(0.1) : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Icon(icon, color: isActive ? Colors.blue : Colors.white54),
        title: Text(title, style: TextStyle(color: isActive ? Colors.blue : Colors.white54)),
        onTap: () {},
      ),
    );
  }
}