import 'dart:ui';

import 'package:exam_app/app/core/extension/build_context_extensions.dart';
import 'package:flutter/material.dart';


class SubjectCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const SubjectCard({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: onTap,
      child: Container(
        height: 80,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              offset: const Offset(0, 4),
              color: Colors.black.withOpacity(0.15),
            ),
          ],
        ),
        child: Row(
          children: [
            // Icon / Image
            const SizedBox(width: 16),

            // Title
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  color: context.colorScheme.scrim,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
