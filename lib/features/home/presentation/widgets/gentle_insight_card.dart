import 'package:flutter/material.dart';
import 'package:mood_sync/core/theme/app_colors.dart';

class GentleInsightCard extends StatelessWidget {
  final String insightText;
  final List<Color> patternColors;

  const GentleInsightCard({
    Key? key,
    required this.insightText,
    required this.patternColors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.divider,
          width: 1.2,
        ),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Gentle Insight',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                const Icon(Icons.star_border_rounded,
                    color: AppColors.neonYellow, size: 22),
              ],
            ),
            const SizedBox(height: 14),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.surface.withOpacity(0.7),
                borderRadius: BorderRadius.circular(14),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
              child: Text(
                insightText,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),
            ),
            const SizedBox(height: 18),
            Row(
              children: [
                const Icon(Icons.calendar_today,
                    size: 16, color: AppColors.textSecondary),
                const SizedBox(width: 6),
                Text(
                  '7-day pattern',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                const Spacer(),
                Row(
                  children: List.generate(
                      7,
                      (i) => Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 1.5),
                            child: Container(
                              width: 8,
                              height: 22,
                              decoration: BoxDecoration(
                                color: patternColors.length > i
                                    ? patternColors[i]
                                    : AppColors.progressBarBg,
                                borderRadius: BorderRadius.circular(3),
                              ),
                            ),
                          )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
