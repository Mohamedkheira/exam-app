import 'package:flutter/material.dart';

class AppTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final EdgeInsetsGeometry? padding;
  final TextAlign? textAlign;
  final bool underline;
  final TextStyle? textStyle;

  const AppTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.textColor,
    this.fontSize,
    this.fontWeight,
    this.padding,
    this.textAlign,
    this.underline = false,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Padding(
        padding: padding ?? EdgeInsets.zero,
        child: Text(
          text,
          textAlign: textAlign,
          style:
              textStyle ??
              Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: textColor ?? Colors.black,
                fontSize: fontSize,
                fontWeight: fontWeight,
                decoration: underline
                    ? TextDecoration.underline
                    : TextDecoration.none,
              ),
        ),
      ),
    );
  }
}
