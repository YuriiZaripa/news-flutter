import 'package:flutter/material.dart';
import 'package:news/presentation/theme/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.disabled,
    this.width,
    this.color = AppColors.lightGray,
  });
  final void Function()? onPressed;
  final Widget child;
  final double? width;
  final Color color;
  final bool? disabled;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Material(
            color: color,
            borderRadius: BorderRadius.circular(8),
            child: InkWell(
              onTap: disabled == true ? null : onPressed,
              child: SizedBox(
                height: 50,
                width: width,
                child: Center(
                  child: child,
                ),
              ),
            ),
          ),
          if (disabled == true)
            Container(
              height: 50,
              width: width,
              color: AppColors.white.withOpacity(0.5),
            ),
        ],
      ),
    );
  }
}
