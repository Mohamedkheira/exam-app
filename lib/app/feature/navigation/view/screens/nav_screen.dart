import 'package:exam_app/app/config/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:exam_app/app/feature/navigation/view/view_model/nav_viewmodel.dart';
import '../../../result/presentation/views/screens/result_screen.dart';
import '../cubit/nav_state.dart';

import '../../../explore/presentation/views/screens/explore_screen.dart';
import '../../../profile/presentation/views/screens/profile_screen.dart';

class NavScreen extends StatelessWidget {
  const NavScreen({super.key});

  // الشاشات اللي هتتنقل بينها الـ BottomNav
  static final List<Widget> screens = const [
    ExploreScreen(),   // index 0 → Explore
    ResultScreen(),   // index 1 → Result (مؤقتًا نفس الـ Explore لحد ما تعملي ResultScreen)
    ProfileScreen(),   // index 2 → Profile
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>NavViewmodel(), // أو getIt<NavViewmodel>() لو عندك DI
      child: const _NavScreenBody(),
    );
  }
}

class _NavScreenBody extends StatelessWidget {
  const _NavScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavViewmodel, NavState>(
      builder: (context, state) {
        return Scaffold(
          body: NavScreen.screens[state.currentIndex],

          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state.currentIndex,
            onTap: (index) =>
                context.read<NavViewmodel>().changeTab(index),
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.explore),
                label: "Explore",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: "Result",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Profile",
              ),
            ],
          ),
        );
      },
    );
  }
}
