import 'package:flutter/material.dart';

import '../utils/app_text_styles.dart';

class CustomNote extends StatelessWidget {
  const CustomNote({super.key, required this.note});
  final String note;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.green.shade50,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.info, color: Colors.green),
              SizedBox(width: 8),
              Text('ملاحظة', style: AppTextStyles.bold16),
            ],
          ),
          const SizedBox(height: 8),
          Text(note, style: AppTextStyles.medium15),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
