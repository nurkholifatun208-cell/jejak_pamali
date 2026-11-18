import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../data/episodes.dart';
import '../data/app_state.dart';
import 'investigation_screen.dart';

class EpisodeListScreen extends StatelessWidget {
  const EpisodeListScreen({super.key});

  Color _difficultyColor(EpisodeDifficulty d) {
    switch (d) {
      case EpisodeDifficulty.mudah:
        return const Color(0xFF34D399);
      case EpisodeDifficulty.sedang:
        return const Color(0xFF60A5FA);
      case EpisodeDifficulty.sulit:
        return const Color(0xFFFBBF24);
      case EpisodeDifficulty.sangatSulit:
        return const Color(0xFFF97316);
      case EpisodeDifficulty.expert:
        return const Color(0xFFEF4444);
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = AppState.instance;

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Jejak Pamali',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    '10 episode · tingkat kesulitan naik',
                    style: TextStyle(
                      fontSize: 13,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.card,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.border),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.star, size: 16, color: AppColors.gold),
                    const SizedBox(width: 4),
                    Text(
                      '${state.totalPoints}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppColors.gold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const Text(
                'Tingkat seram: ',
                style: TextStyle(fontSize: 13, color: AppColors.textSecondary),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFF10B981).withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Ringan',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF34D399),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ...allEpisodes.map((ep) {
            final status = state.statusOf(ep.id);
            final stars = state.starsOf(ep.id);
            final clues = state.cluesOf(ep.id);
            final isCurrent = status == EpisodeStatus.current;
            final isCompleted = status == EpisodeStatus.completed;
            final isLocked = status == EpisodeStatus.locked;
            final diffColor = _difficultyColor(ep.difficulty);

            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Opacity(
                opacity: isLocked ? 0.55 : 1,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.card,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: isCurrent
                          ? AppColors.gold.withValues(alpha: 0.6)
                          : AppColors.border,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 42,
                            height: 42,
                            decoration: BoxDecoration(
                              color: isCompleted
                                  ? const Color(0xFF10B981)
                                      .withValues(alpha: 0.2)
                                  : isCurrent
                                      ? AppColors.gold.withValues(alpha: 0.2)
                                      : AppColors.surface,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(
                              isCompleted
                                  ? Icons.check
                                  : isCurrent
                                      ? Icons.search
                                      : Icons.lock_outline,
                              color: isCompleted
                                  ? const Color(0xFF34D399)
                                  : isCurrent
                                      ? AppColors.gold
                                      : AppColors.textMuted,
                              size: 20,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Episode ${ep.id}',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: isCompleted
                                            ? const Color(0xFF34D399)
                                            : AppColors.textSecondary,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 2,
                                      ),
                                      decoration: BoxDecoration(
                                        color:
                                            diffColor.withValues(alpha: 0.15),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Text(
                                        ep.difficultyLabel,
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w600,
                                          color: diffColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  ep.title,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  '${ep.region} · $clues/${ep.totalClues} petunjuk',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: AppColors.textSecondary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (isCompleted)
                            Row(
                              children: List.generate(
                                stars.clamp(0, 3),
                                (i) => const Icon(
                                  Icons.star,
                                  size: 14,
                                  color: AppColors.gold,
                                ),
                              ),
                            ),
                        ],
                      ),
                      if (isCurrent) ...[
                        const SizedBox(height: 12),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: LinearProgressIndicator(
                            value: ep.totalClues == 0
                                ? 0
                                : (clues / ep.totalClues).clamp(0.0, 1.0),
                            backgroundColor: AppColors.surface,
                            color: AppColors.gold,
                            minHeight: 6,
                          ),
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => InvestigationScreen(
                                    episodeId: ep.id,
                                  ),
                                ),
                              );
                            },
                            child: const Text('Lanjutkan penyelidikan'),
                          ),
                        ),
                      ],
                      if (isCompleted) ...[
                        const SizedBox(height: 12),
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => InvestigationScreen(
                                    episodeId: ep.id,
                                  ),
                                ),
                              );
                            },
                            style: OutlinedButton.styleFrom(
                              foregroundColor: AppColors.gold,
                              side: const BorderSide(color: AppColors.gold),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text('Mainkan lagi'),
                          ),
                        ),
                      ],
                      if (isLocked) ...[
                        const SizedBox(height: 8),
                        const Text(
                          'Selesaikan episode sebelumnya untuk membuka',
                          style: TextStyle(
                            fontSize: 11,
                            color: AppColors.textMuted,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            );
          }),
          const SizedBox(height: 8),
          const Center(
            child: Text(
              '☐ Cerita ditinjau budayawan setempat',
              style: TextStyle(fontSize: 11, color: AppColors.textMuted),
            ),
          ),
        ],
      ),
    );
  }
}