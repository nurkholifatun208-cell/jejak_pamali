import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../data/app_state.dart';
import '../data/episode_content.dart';
import '../data/episodes.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  int tabIndex = 0;

  /// Episode yang ditampilkan di catatan:
  /// prioritas episode yang sedang dimainkan, atau terakhir selesai
  int get _episodeId {
    final state = AppState.instance;
    if (state.statusOf(state.currentEpisodeId) == EpisodeStatus.current) {
      return state.currentEpisodeId;
    }
    for (int i = 10; i >= 1; i--) {
      if (state.statusOf(i) == EpisodeStatus.completed) return i;
    }
    return 1;
  }

  IconData _iconFromName(String? name) {
    switch (name) {
      case 'forest':
        return Icons.forest;
      case 'water':
        return Icons.water_drop;
      case 'warning':
        return Icons.warning_amber;
      case 'eco':
        return Icons.eco;
      case 'anchor':
        return Icons.anchor;
      case 'gavel':
        return Icons.gavel;
      case 'terrain':
        return Icons.terrain;
      case 'science':
        return Icons.science;
      case 'volume_off':
        return Icons.volume_off;
      case 'smoke':
        return Icons.cloud;
      case 'landscape':
        return Icons.landscape;
      case 'nightlight':
        return Icons.nightlight;
      case 'waves':
        return Icons.waves;
      case 'storm':
        return Icons.thunderstorm;
      case 'sailing':
        return Icons.sailing;
      case 'delete':
        return Icons.delete_outline;
      case 'explore':
        return Icons.explore;
      case 'grass':
        return Icons.grass;
      case 'park':
        return Icons.park;
      case 'water_drop':
        return Icons.water_drop;
      case 'local_fire_department':
        return Icons.local_fire_department;
      case 'groups':
        return Icons.groups;
      case 'menu_book':
        return Icons.menu_book;
      case 'home':
        return Icons.home;
      case 'public':
        return Icons.public;
      case 'visibility':
        return Icons.visibility;
      default:
        return Icons.lightbulb_outline;
    }
  }

  void _showDetail(String title, String detail) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.card,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(24, 20, 24, 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.border,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                detail,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.textSecondary,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Tutup'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final episodeId = _episodeId;
    final content = contentForEpisode(episodeId);
    final episode = allEpisodes.firstWhere((e) => e.id == episodeId);
    final unlocked = AppState.instance.cluesOf(episodeId);
    final totalClues = content.petunjuk.length;

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Catatan petunjuk',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              Text(
                '$unlocked / $totalClues',
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            'Episode $episodeId · ${episode.title}',
            style: const TextStyle(
              fontSize: 13,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _Tab(
                label: 'Petunjuk',
                active: tabIndex == 0,
                onTap: () => setState(() => tabIndex = 0),
              ),
              const SizedBox(width: 8),
              _Tab(
                label: 'Tokoh',
                active: tabIndex == 1,
                onTap: () => setState(() => tabIndex = 1),
              ),
              const SizedBox(width: 8),
              _Tab(
                label: 'Mitos',
                active: tabIndex == 2,
                onTap: () => setState(() => tabIndex = 2),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Tab Petunjuk
          if (tabIndex == 0)
            ...List.generate(content.petunjuk.length, (i) {
              final c = content.petunjuk[i];
              final isUnlocked = i < unlocked ||
                  AppState.instance.statusOf(episodeId) ==
                      EpisodeStatus.completed;
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: InkWell(
                  onTap: isUnlocked
                      ? () => _showDetail(
                            c['title'] as String,
                            c['detail'] as String? ?? c['desc'] as String,
                          )
                      : null,
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: isUnlocked
                          ? AppColors.card
                          : AppColors.card.withValues(alpha: 0.5),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColors.border),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                            color: AppColors.surface,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            isUnlocked
                                ? _iconFromName(c['icon'] as String?)
                                : Icons.lock,
                            color: isUnlocked
                                ? const Color(0xFF2DD4BF)
                                : AppColors.textMuted,
                            size: 22,
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                isUnlocked
                                    ? c['title'] as String
                                    : 'Petunjuk ${i + 1}',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: isUnlocked
                                      ? AppColors.textPrimary
                                      : AppColors.textMuted,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                isUnlocked
                                    ? c['desc'] as String
                                    : 'Jawab kuiz untuk membuka',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: AppColors.textSecondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (isUnlocked)
                          const Icon(
                            Icons.chevron_right,
                            color: AppColors.textMuted,
                          ),
                      ],
                    ),
                  ),
                ),
              );
            }),

          // Tab Tokoh
          if (tabIndex == 1)
            ...content.tokoh.map((t) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: InkWell(
                  onTap: () => _showDetail(t['nama']!, t['info']!),
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: AppColors.card,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColors.border),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                            color: AppColors.surface,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.person,
                            color: AppColors.gold,
                            size: 22,
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                t['nama']!,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                              Text(
                                t['peran']!,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: AppColors.textSecondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Icon(
                          Icons.chevron_right,
                          color: AppColors.textMuted,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),

          // Tab Mitos
          if (tabIndex == 2)
            ...content.mitosList.map((m) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: InkWell(
                  onTap: () => _showDetail(m['judul']!, m['isi']!),
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: AppColors.card,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColors.border),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          m['judul']!,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.gold,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          m['isi']!,
                          style: const TextStyle(
                            fontSize: 13,
                            color: AppColors.textSecondary,
                            height: 1.4,
                          ),
                        ),
                      ],
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

class _Tab extends StatelessWidget {
  final String label;
  final bool active;
  final VoidCallback onTap;

  const _Tab({
    required this.label,
    required this.active,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: active ? AppColors.gold : AppColors.card,
          borderRadius: BorderRadius.circular(20),
          border: active ? null : Border.all(color: AppColors.border),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: active ? FontWeight.w600 : FontWeight.normal,
            color: active ? AppColors.bg : AppColors.textSecondary,
          ),
        ),
      ),
    );
  }
}