import 'episodes.dart';

class AppState {
  static final AppState instance = AppState._();
  AppState._();

  String playerName = 'NAMA PEMAIN';
  int totalPoints = 0;
  int currentEpisodeId = 1;

  final Map<int, EpisodeStatus> episodeStatus = {
    1: EpisodeStatus.current,
    2: EpisodeStatus.locked,
    3: EpisodeStatus.locked,
    4: EpisodeStatus.locked,
    5: EpisodeStatus.locked,
    6: EpisodeStatus.locked,
    7: EpisodeStatus.locked,
    8: EpisodeStatus.locked,
    9: EpisodeStatus.locked,
    10: EpisodeStatus.locked,
  };

  final Map<int, int> episodeStars = {};
  final Map<int, int> episodeClues = {};

  void setPlayerName(String name) {
    if (name.trim().isNotEmpty) {
      playerName = name.trim();
    }
  }

  void completeEpisode(int episodeId, int correctAnswers, int totalQuestions) {
    int stars = 0;
    if (correctAnswers == totalQuestions) {
      stars = 3;
    } else if (correctAnswers >= (totalQuestions * 0.66).ceil()) {
      stars = 2;
    } else if (correctAnswers >= 1) {
      stars = 1;
    }

    episodeStars[episodeId] = stars;
    episodeClues[episodeId] = correctAnswers;

    if (stars > 0) {
      episodeStatus[episodeId] = EpisodeStatus.completed;
      final ep = allEpisodes.firstWhere((e) => e.id == episodeId);
      totalPoints += (ep.pointsReward * stars / 3).round();

      final nextId = episodeId + 1;
      if (nextId <= 10 && episodeStatus[nextId] == EpisodeStatus.locked) {
        episodeStatus[nextId] = EpisodeStatus.current;
        currentEpisodeId = nextId;
      }
    }
  }

  EpisodeStatus statusOf(int id) =>
      episodeStatus[id] ?? EpisodeStatus.locked;

  int starsOf(int id) => episodeStars[id] ?? 0;

  int cluesOf(int id) => episodeClues[id] ?? 0;

  int get completedCount =>
      episodeStatus.values.where((s) => s == EpisodeStatus.completed).length;

  int get totalCluesFound =>
      episodeClues.values.fold(0, (a, b) => a + b);
}