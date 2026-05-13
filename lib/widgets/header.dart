import 'package:flutter/material.dart';
import '../core/constants/colors.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          "لوحة التحكم", 
          style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)
        ),
        const Spacer(flex: 2),
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: "بحث...",
              hintStyle: const TextStyle(color: Colors.white54),
              fillColor: AppColors.secondaryColor,
              filled: true,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
              prefixIcon: const Icon(Icons.search, color: Colors.white54),
            ),
          ),
        ),
        const _ProfileCard()
      ],
    );
  }
}

class _ProfileCard extends StatelessWidget {
  const _ProfileCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16.0),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundColor: AppColors.primaryColor,
            child: Icon(Icons.person, color: Colors.white),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text("Admin", style: TextStyle(color: Colors.white)),
          ),
          const Icon(Icons.keyboard_arrow_down, color: Colors.white),
        ],
      ),
    );
  }
}