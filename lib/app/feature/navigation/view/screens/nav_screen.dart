import 'package:exam_app/app/feature/navigation/view/view_model/nav_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/nav_state.dart';


class NavScreen extends StatelessWidget {
  const NavScreen({super.key});

  static final List<Widget> _screens = const [
   // ExplorePage(),
  //  ResultPage(),
 //   ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavViewmodel, NavState>(
      builder: (context, state) {
        return Scaffold(
          body: _screens[state.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state.currentIndex,
            onTap: (index) =>
                context.read<NavViewmodel>().changeTab(index),
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
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
