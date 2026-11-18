enum EpisodeDifficulty { mudah, sedang, sulit, sangatSulit, expert }

enum EpisodeStatus { locked, available, current, completed }

class Episode {
  final int id;
  final String title;
  final String region;
  final String description;
  final EpisodeDifficulty difficulty;
  final int totalClues;
  final int pointsReward;

  const Episode({
    required this.id,
    required this.title,
    required this.region,
    required this.description,
    required this.difficulty,
    required this.totalClues,
    required this.pointsReward,
  });

  String get difficultyLabel {
    switch (difficulty) {
      case EpisodeDifficulty.mudah:
        return 'Mudah';
      case EpisodeDifficulty.sedang:
        return 'Sedang';
      case EpisodeDifficulty.sulit:
        return 'Sulit';
      case EpisodeDifficulty.sangatSulit:
        return 'Sangat Sulit';
      case EpisodeDifficulty.expert:
        return 'Expert';
    }
  }
}

const List<Episode> allEpisodes = [
  Episode(
    id: 1,
    title: 'Pohon tua di tepi desa',
    region: 'Jawa Tengah',
    description: 'Selidiki pohon keramat yang dihindari warga.',
    difficulty: EpisodeDifficulty.mudah,
    totalClues: 3,
    pointsReward: 100,
  ),
  Episode(
    id: 2,
    title: 'Suara dari hutan larangan',
    region: 'Jawa Barat',
    description: 'Temukan makna pamali di hutan larangan.',
    difficulty: EpisodeDifficulty.mudah,
    totalClues: 4,
    pointsReward: 150,
  ),
  Episode(
    id: 3,
    title: 'Sasi di pulau seberang',
    region: 'Maluku',
    description: 'Pahami aturan sasi yang menjaga laut.',
    difficulty: EpisodeDifficulty.sedang,
    totalClues: 5,
    pointsReward: 180,
  ),
  Episode(
    id: 4,
    title: 'Penunggu gunung berapi',
    region: 'Jawa Timur',
    description: 'Mitos di sekitar kawah yang aktif.',
    difficulty: EpisodeDifficulty.sedang,
    totalClues: 5,
    pointsReward: 200,
  ),
  Episode(
    id: 5,
    title: 'Gema di goa batu',
    region: 'Sulawesi Selatan',
    description: 'Suara aneh di dalam goa kuno.',
    difficulty: EpisodeDifficulty.sulit,
    totalClues: 6,
    pointsReward: 220,
  ),
  Episode(
    id: 6,
    title: 'Bayangan di rawa malam',
    region: 'Kalimantan',
    description: 'Makhluk yang muncul saat air pasang.',
    difficulty: EpisodeDifficulty.sulit,
    totalClues: 6,
    pointsReward: 250,
  ),
  Episode(
    id: 7,
    title: 'Lagu dari pesisir barat',
    region: 'Sumatra Barat',
    description: 'Nyanyian yang memanggil badai.',
    difficulty: EpisodeDifficulty.sangatSulit,
    totalClues: 7,
    pointsReward: 280,
  ),
  Episode(
    id: 8,
    title: 'Jejak di padang pasir',
    region: 'Nusa Tenggara',
    description: 'Jejak yang hilang saat matahari terbit.',
    difficulty: EpisodeDifficulty.sangatSulit,
    totalClues: 7,
    pointsReward: 300,
  ),
  Episode(
    id: 9,
    title: 'Api di puncak gunung',
    region: 'Bali',
    description: 'Ritual yang menjaga keseimbangan alam.',
    difficulty: EpisodeDifficulty.expert,
    totalClues: 8,
    pointsReward: 350,
  ),
  Episode(
    id: 10,
    title: 'Rahasia di ujung nusantara',
    region: 'Papua',
    description: 'Misteri terakhir yang menghubungkan semua mitos.',
    difficulty: EpisodeDifficulty.expert,
    totalClues: 8,
    pointsReward: 400,
  ),
];