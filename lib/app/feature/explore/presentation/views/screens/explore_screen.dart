import 'package:exam_app/app/core/extension/build_context_extensions.dart';
import 'package:flutter/material.dart';

import '../../../widgets/subject_card.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("survey",style:context.textTheme.headlineLarge,),
          const SizedBox(height: 24),

          // Search Bar
          Container(
            height: 48,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: Colors.black,
                width: 0.7,
              ),
              boxShadow: [
                BoxShadow(
                  blurRadius: 16,
                  offset: const Offset(0, 2),
                  color: Colors.black.withOpacity(0.04),
                )
              ],
            ),
            child: Center(
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search),

                ),
              ),
            ),
          ),

          const SizedBox(height: 24),

          Text(
            'Browse by subject',
            style:context.textTheme.labelMedium,
            textAlign: TextAlign.start,
          ),

          const SizedBox(height: 16),

          SubjectCard(
            title: 'Language',
            // replace with Image.asset if you have an image
            icon: Icons.language,
            onTap: () {},
          ),
        ],
      ),
    ),);
  }
}
