import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../data/app_state.dart';
import '../data/episodes.dart';
import '../data/quizzes.dart';
import 'meaning_reveal_screen.dart';

class InvestigationScreen extends StatefulWidget {
  final int episodeId;

  const InvestigationScreen({super.key, this.episodeId = 1});

  @override
  State<InvestigationScreen> createState() => _InvestigationScreenState();
}

class _InvestigationScreenState extends State<InvestigationScreen> {
  int step = 0;
  int correctCount = 0;
  String? feedback;
  bool answered = false;
  int? selectedIndex;

  late final List<Map<String, dynamic>> steps;
  late final Episode episode;

  @override
  void initState() {
    super.initState();
    episode = allEpisodes.firstWhere((e) => e.id == widget.episodeId);
    steps = _shuffleQuiz(quizForEpisode(widget.episodeId));
  }

  List<Map<String, dynamic>> _shuffleQuiz(List<Map<String, dynamic>> raw) {
    return raw.map((q) {
      final options = List<String>.from(q['options'] as List);
      final correctText = options[q['correctIndex'] as int];
      options.shuffle();
      return {
        ...q,
        'options': options,
        'correctIndex': options.indexOf(correctText),
      };
    }).toList();
  }

  void _answer(int index) {
    if (answered) return;
    final current = steps[step];
    final correctIndex = current['correctIndex'] as int;
    final isCorrect = index == correctIndex;
    final options = current['options'] as List<String>;

    setState(() {
      selectedIndex = index;
      answered = true;
      if (isCorrect) {
        correctCount++;
        feedback = 'Benar! Petunjuk: ${current['clueName']}';
      } else {
        feedback = 'Salah. Jawaban benar: "${options[correctIndex]}"';
      }
    });
  }

  void _next() {
    if (step < steps.length - 1) {
      setState(() {
        step++;
        answered = false;
        feedback = null;
        selectedIndex = null;
      });
    } else {
      _finishQuiz();
    }
  }

  void _finishQuiz() {
    final total = steps.length;

    if (correctCount == 0) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (ctx) => AlertDialog(
          backgroundColor: AppColors.card,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: const Text(
            'Belum lulus',
            style: TextStyle(color: AppColors.textPrimary),
          ),
          content: const Text(
            'Kamu menjawab semua pertanyaan dengan salah.\n\nTidak ada poin dan bintang. Silakan ulangi episode ini.',
            style: TextStyle(color: AppColors.textSecondary, height: 1.4),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(ctx);
                setState(() {
                  step = 0;
                  correctCount = 0;
                  answered = false;
                  feedback = null;
                  selectedIndex = null;
                  steps.clear();
                  steps.addAll(_shuffleQuiz(quizForEpisode(widget.episodeId)));
                });
              },
              child: const Text('Ulangi episode'),
            ),
          ],
        ),
      );
      return;
    }

    AppState.instance.completeEpisode(widget.episodeId, correctCount, total);
    final stars = AppState.instance.starsOf(widget.episodeId);
    final points = (episode.pointsReward * stars / 3).round();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const MeaningRevealScreen(),
        settings: RouteSettings(
          arguments: {
            'correct': correctCount,
            'total': total,
            'stars': stars,
            'points': points,
            'episodeId': widget.episodeId,
          },
        ),
      ),
    );
  }

  Color _borderColor(int i) {
    if (!answered) return AppColors.border;
    final correctIndex = steps[step]['correctIndex'] as int;
    if (i == correctIndex) return const Color(0xFF34D399);
    if (i == selectedIndex) return Colors.redAccent;
    return AppColors.border;
  }

  Color _bgColor(int i) {
    if (!answered) return AppColors.surface;
    final correctIndex = steps[step]['correctIndex'] as int;
    if (i == correctIndex) {
      return const Color(0xFF10B981).withValues(alpha: 0.15);
    }
    if (i == selectedIndex) {
      return Colors.redAccent.withValues(alpha: 0.12);
    }
    return AppColors.surface;
  }

  @override
  Widget build(BuildContext context) {
    final current = steps[step];
    final options = current['options'] as List<String>;
    final correctIndex = current['correctIndex'] as int;

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    episode.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
                Text(
                  'Benar $correctCount / ${steps.length}',
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.gold,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              'Episode ${episode.id} · ${episode.region} · ${episode.difficultyLabel}',
              style: const TextStyle(
                fontSize: 13,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: (step + (answered ? 1 : 0)) / steps.length,
                backgroundColor: AppColors.surface,
                color: AppColors.gold,
                minHeight: 6,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.card,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.border),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    current['speaker'] as String,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppColors.gold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    current['dialogue'] as String,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.textPrimary,
                      height: 1.45,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Text(
              current['question'] as String,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 12),
            for (int i = 0; i < options.length; i++)
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: InkWell(
                  onTap: answered ? null : () => _answer(i),
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    decoration: BoxDecoration(
                      color: _bgColor(i),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: _borderColor(i),
                        width: answered &&
                                (i == selectedIndex || i == correctIndex)
                            ? 1.5
                            : 1,
                      ),
                    ),
                    child: Text(
                      options[i],
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                ),
              ),
            if (feedback != null) ...[
              const SizedBox(height: 8),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.card,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.border),
                ),
                child: Text(
                  feedback!,
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _next,
                  child: Text(
                    step < steps.length - 1
                        ? 'Lanjut'
                        : 'Selesaikan penyelidikan',
                  ),
                ),
              ),
            ],
            const SizedBox(height: 16),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                '← Kembali ke daftar episode',
                style: TextStyle(color: AppColors.textSecondary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}