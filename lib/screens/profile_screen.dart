import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../data/app_state.dart';
import 'card_duel_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = AppState.instance;
    final initial = state.playerName.isNotEmpty
        ? state.playerName.substring(0, 1).toUpperCase()
        : 'N';

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
        children: [
          Row(
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [AppColors.gold, Color(0xFFD97706)],
                  ),
                ),
                child: Center(
                  child: Text(
                    initial,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.bg,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      state.playerName,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    Text(
                      'Detektif pemula · Level ${state.completedCount + 1}',
                      style: const TextStyle(
                        fontSize: 13,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: LinearProgressIndicator(
                        value: (state.completedCount / 10).clamp(0.0, 1.0),
                        backgroundColor: AppColors.surface,
                        color: AppColors.gold,
                        minHeight: 6,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              _StatCard(value: '${state.completedCount}', label: 'Episode'),
              const SizedBox(width: 10),
              _StatCard(value: '${state.totalCluesFound}', label: 'Petunjuk'),
              const SizedBox(width: 10),
              _StatCard(
                value: '${state.totalPoints}',
                label: 'Poin',
                highlight: true,
              ),
            ],
          ),
          const SizedBox(height: 28),
          const Text(
            'Lencana',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              _Badge(
                icon: Icons.shield,
                label: 'Penjaga hutan',
                unlocked: state.completedCount >= 1,
              ),
              const SizedBox(width: 10),
              _Badge(
                icon: Icons.hearing,
                label: 'Pendengar sesepuh',
                unlocked: state.completedCount >= 2,
              ),
              const SizedBox(width: 10),
              _Badge(
                icon: Icons.explore,
                label: 'Pencari jejak',
                unlocked: state.completedCount >= 5,
              ),
            ],
          ),
          const SizedBox(height: 28),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const CardDuelScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.style),
              label: const Text('Duel Kartu Hantu'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
            ),
          ),
          const SizedBox(height: 28),
          const _SettingRow(
            icon: Icons.volume_up,
            label: 'Tingkat seram',
            value: 'Ringan',
            valueColor: Color(0xFF34D399),
          ),
          const _SettingRow(
            icon: Icons.language,
            label: 'Bahasa',
            value: 'Indonesia',
          ),
          const _SettingRow(
            icon: Icons.wifi_off,
            label: 'Mode offline',
            value: 'Aktif',
            valueColor: Color(0xFF34D399),
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String value;
  final String label;
  final bool highlight;

  const _StatCard({
    required this.value,
    required this.label,
    this.highlight = false,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          children: [
            Text(
              value,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: highlight ? AppColors.gold : AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(
                fontSize: 11,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool unlocked;

  const _Badge({
    required this.icon,
    required this.label,
    required this.unlocked,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.border),
        ),
        child: Opacity(
          opacity: unlocked ? 1 : 0.45,
          child: Column(
            children: [
              Icon(
                unlocked ? icon : Icons.lock,
                color: unlocked ? AppColors.gold : AppColors.textMuted,
                size: 28,
              ),
              const SizedBox(height: 8),
              Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 11,
                  color:
                      unlocked ? AppColors.textPrimary : AppColors.textMuted,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SettingRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color? valueColor;

  const _SettingRow({
    required this.icon,
    required this.label,
    required this.value,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Icon(icon, size: 18, color: AppColors.textSecondary),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 13,
              color: valueColor ?? AppColors.textSecondary,
              fontWeight:
                  valueColor != null ? FontWeight.w500 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}