import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class CenterGlowButton extends StatelessWidget {
  final VoidCallback onTap;
  const CenterGlowButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 80,
        height: 80,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [AppColors.neonYellow, AppColors.neonPink],
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.neonPink,
              blurRadius: 16,
              spreadRadius: 2,
            ),
          ],
        ),
        child: const Icon(Icons.auto_awesome, color: Colors.black, size: 36),
      ),
    );
  }
}
