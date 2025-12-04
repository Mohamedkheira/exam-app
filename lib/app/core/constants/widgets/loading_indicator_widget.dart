import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  final double size;
  final bool repeat;
  final BoxFit fit;
  final Color? backgroundColor;

  const LoadingIndicator({
    super.key,
    this.size = 150,
    this.repeat = true,
    this.fit = BoxFit.contain,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      alignment: Alignment.center,
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(
          Theme.of(context).primaryColor,
        ),
        strokeWidth: 5,
        value: repeat ? null : 1,
      ),
    );
  }
}
