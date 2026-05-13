import 'package:flutter/material.dart';
import '../core/constants/colors.dart';
import '../screens/dashboard/dashboard_screen.dart'; // سننشئها في الخطوة التالية
import '../widgets/side_menu.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key}); // إضافة الـ key هنا
  // ... بقية الكود كما هو {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // القائمة الجانبية (Side Menu)
            Expanded(
              child: SideMenu(),
            ),
            // المحتوى الرئيسي (Main Body)
            Expanded(
              flex: 5,
              child: DashboardScreen(),
            ),
          ],
        ),
      ),
    );
  }
}