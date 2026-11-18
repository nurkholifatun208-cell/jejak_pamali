import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../data/episodes.dart';
import '../data/app_state.dart';
import 'investigation_screen.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = AppState.instance;
    final completedCount = allEpisodes
        .where((e) => state.statusOf(e.id) == EpisodeStatus.completed)
        .length;

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Peta misteri',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              Text(
                '$completedCount dari 10 daerah',
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              'assets/images/peta_indonesia.png',
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                height: 160,
                alignment: Alignment.center,
                color: AppColors.card,
                child: const Text(
                  'Tambahkan assets/images/peta_indonesia.png',
                  style: TextStyle(color: AppColors.textMuted, fontSize: 12),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            decoration: BoxDecoration(
              color: AppColors.card,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.border),
            ),
            child: Column(
              children: [
                Wrap(
                  spacing: 8,
                  runSpacing: 10,
                  alignment: WrapAlignment.center,
                  children: allEpisodes.map((ep) {
                    final status = state.statusOf(ep.id);
                    final color = status == EpisodeStatus.completed
                        ? const Color(0xFF34D399)
                        : status == EpisodeStatus.current
                            ? AppColors.gold
                            : AppColors.textMuted;
                    return Column(
                      children: [
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: color.withValues(alpha: 0.2),
                            border: Border.all(color: color, width: 2),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            '${ep.id}',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: color,
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        SizedBox(
                          width: 56,
                          child: Text(
                            ep.region.split(' ').first,
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 9, color: color),
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
                const SizedBox(height: 12),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _Legend(color: Color(0xFF34D399), label: 'Selesai'),
                    SizedBox(width: 12),
                    _Legend(color: AppColors.gold, label: 'Sekarang'),
                    SizedBox(width: 12),
                    _Legend(color: AppColors.textMuted, label: 'Terkunci'),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          ...allEpisodes.map((ep) {
            final status = state.statusOf(ep.id);
            final isCompleted = status == EpisodeStatus.completed;
            final isCurrent = status == EpisodeStatus.current;
            final isLocked = status == EpisodeStatus.locked;

            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Opacity(
                opacity: isLocked ? 0.5 : 1,
                child: InkWell(
                  onTap: isLocked
                      ? null
                      : () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  InvestigationScreen(episodeId: ep.id),
                            ),
                          );
                        },
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: AppColors.card,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: isCurrent ? AppColors.gold : AppColors.border,
                        width: isCurrent ? 1.5 : 1,
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: isCompleted
                                ? const Color(0xFF34D399)
                                : isCurrent
                                    ? AppColors.gold
                                    : AppColors.surface,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            '${ep.id}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: isLocked
                                  ? AppColors.textMuted
                                  : (isCompleted || isCurrent
                                      ? AppColors.bg
                                      : AppColors.textPrimary),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                ep.region,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                              Text(
                                ep.title,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: AppColors.textSecondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (isCompleted)
                          const Icon(Icons.check_circle,
                              color: Color(0xFF34D399), size: 22),
                        if (isCurrent)
                          const Text(
                            'Lanjut',
                            style: TextStyle(
                              color: AppColors.gold,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        if (isLocked)
                          const Icon(Icons.lock_outline,
                              color: AppColors.textMuted, size: 20),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}

class _Legend extends StatelessWidget {
  final Color color;
  final String label;

  const _Legend({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 11, color: AppColors.textSecondary),
        ),
      ],
    );
  }
}