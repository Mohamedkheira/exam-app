
import 'package:exam_app/app/core/resources/app_colors.dart';
import 'package:flutter/material.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  final bool? haveBackButton;
  final VoidCallback? onBackButtonPressed;
  const CustomAppBar({super.key, required this.title, this.haveBackButton, this.onBackButtonPressed});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(title,style:TextStyle(fontSize:20, color: AppColors.blackColor ) ,),
      leading:  Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: GestureDetector(
          onTap: () {
              Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back,
            color: AppColors.blackColor,
            size: 24,
          )
        ),
      )

    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
