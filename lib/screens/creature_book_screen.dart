import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class CreatureBookScreen extends StatelessWidget {
  const CreatureBookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Kitab makhluk',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
                ),
                Text('2 / 12', style: TextStyle(fontSize: 12, color: AppColors.textSecondary)),
              ],
            ),
            const SizedBox(height: 4),
            const Text(
              'Koleksi mitologi nusantara',
              style: TextStyle(fontSize: 13, color: AppColors.textSecondary),
            ),
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _Tab(label: 'Semua', active: true),
                  const SizedBox(width: 8),
                  _Tab(label: 'Jawa', active: false),
                  const SizedBox(width: 8),
                  _Tab(label: 'Sumatra', active: false),
                  const SizedBox(width: 8),
                  _Tab(label: 'Bali', active: false),
                ],
              ),
            ),
            const SizedBox(height: 20),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.9,
              children: const [
                _CreatureCard(name: 'Banaspati', region: 'Jawa', icon: Icons.local_fire_department, color: AppColors.gold, unlocked: true),
                _CreatureCard(name: 'Wewe gombel', region: 'Jawa', icon: Icons.nightlight, color: AppColors.purple, unlocked: true),
                _CreatureCard(name: '???', region: 'Terkunci', icon: Icons.lock, color: AppColors.textMuted, unlocked: false),
                _CreatureCard(name: '???', region: 'Terkunci', icon: Icons.lock, color: AppColors.textMuted, unlocked: false),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              'Asal-usul dan makna tiap makhluk terbuka setelah episode terkait selesai.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: AppColors.textMuted),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () => Navigator.pushNamed(context, '/duel'),
                icon: const Text('🎴'),
                label: const Text('Mainkan duel kartu'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.textPrimary,
                  side: const BorderSide(color: AppColors.border),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Tab extends StatelessWidget {
  final String label;
  final bool active;
  const _Tab({required this.label, required this.active});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
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
    );
  }
}

class _CreatureCard extends StatelessWidget {
  final String name;
  final String region;
  final IconData icon;
  final Color color;
  final bool unlocked;

  const _CreatureCard({
    required this.name,
    required this.region,
    required this.icon,
    required this.color,
    required this.unlocked,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Opacity(
        opacity: unlocked ? 1 : 0.55,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 36, color: color),
            const SizedBox(height: 12),
            Text(
              name,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: unlocked ? AppColors.textPrimary : AppColors.textMuted,
              ),
            ),
            const SizedBox(height: 4),
            Text(region, style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
          ],
        ),
      ),
    );
  }
}
