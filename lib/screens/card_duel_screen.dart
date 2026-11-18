import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class GameCard {
  final String name;
  final String type;
  final int power;
  final String imagePath;
  final Color color;

  const GameCard({
    required this.name,
    required this.type,
    required this.power,
    required this.imagePath,
    required this.color,
  });
}

const List<GameCard> allCards = [
  GameCard(
    name: 'Pocong Lucu',
    type: 'serangan',
    power: 3,
    imagePath: 'assets/images/cards/pocong.png',
    color: Color(0xFFA78BFA),
  ),
  GameCard(
    name: 'Tuyul Ceria',
    type: 'khusus',
    power: 2,
    imagePath: 'assets/images/cards/tuyul.png',
    color: Color(0xFF34D399),
  ),
  GameCard(
    name: 'Kuntilanak Manis',
    type: 'serangan',
    power: 4,
    imagePath: 'assets/images/cards/kuntilanak.png',
    color: Color(0xFFF472B6),
  ),
  GameCard(
    name: 'Genderuwo Baik',
    type: 'bertahan',
    power: 3,
    imagePath: 'assets/images/cards/genderuwo.png',
    color: Color(0xFF60A5FA),
  ),
  GameCard(
    name: 'Wewe Gombel',
    type: 'khusus',
    power: 3,
    imagePath: 'assets/images/cards/wewe_gombel.png',
    color: Color(0xFFFBBF24),
  ),
  GameCard(
    name: 'Banaspati',
    type: 'serangan',
    power: 5,
    imagePath: 'assets/images/cards/banaspati.png',
    color: Color(0xFFF97316),
  ),
  GameCard(
    name: 'Leak Bali',
    type: 'khusus',
    power: 4,
    imagePath: 'assets/images/cards/leak.png',
    color: Color(0xFF2DD4BF),
  ),
  GameCard(
    name: 'Jelangkung',
    type: 'bertahan',
    power: 2,
    imagePath: 'assets/images/cards/jelangkung.png',
    color: Color(0xFF94A3B8),
  ),
];

class CardDuelScreen extends StatefulWidget {
  const CardDuelScreen({super.key});

  @override
  State<CardDuelScreen> createState() => _CardDuelScreenState();
}

class _CardDuelScreenState extends State<CardDuelScreen> {
  late List<GameCard> playerHand;
  late List<GameCard> enemyHand;
  GameCard? playerPlayed;
  GameCard? enemyPlayed;
  int playerScore = 0;
  int enemyScore = 0;
  String? resultText;
  bool roundDone = false;

  @override
  void initState() {
    super.initState();
    _deal();
  }

  void _deal() {
    final deck = List<GameCard>.from(allCards)..shuffle();
    playerHand = deck.take(4).toList();
    enemyHand = deck.skip(4).take(4).toList();
    playerPlayed = null;
    enemyPlayed = null;
    resultText = null;
    roundDone = false;
    playerScore = 0;
    enemyScore = 0;
  }

  void _playCard(GameCard card) {
    if (roundDone || playerPlayed != null) return;
    setState(() {
      playerPlayed = card;
      playerHand.remove(card);
      enemyHand.shuffle();
      enemyPlayed = enemyHand.removeAt(0);

      if (playerPlayed!.power > enemyPlayed!.power) {
        playerScore++;
        resultText = 'Kamu menang ronde ini!';
      } else if (playerPlayed!.power < enemyPlayed!.power) {
        enemyScore++;
        resultText = 'Lawan menang ronde ini.';
      } else {
        resultText = 'Seri!';
      }
      roundDone = true;
    });
  }

  void _nextRound() {
    if (playerHand.isEmpty || enemyHand.isEmpty) {
      _showEnd();
      return;
    }
    setState(() {
      playerPlayed = null;
      enemyPlayed = null;
      resultText = null;
      roundDone = false;
    });
  }

  void _showEnd() {
    final win = playerScore > enemyScore;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.card,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text(
          win ? 'Menang!' : (playerScore == enemyScore ? 'Seri' : 'Kalah'),
          style: const TextStyle(color: AppColors.textPrimary),
        ),
        content: Text(
          'Skor akhir: $playerScore - $enemyScore',
          style: const TextStyle(color: AppColors.textSecondary),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              setState(_deal);
            },
            child: const Text('Main lagi'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(ctx);
              Navigator.pop(context);
            },
            child: const Text('Kembali'),
          ),
        ],
      ),
    );
  }

  Widget _cardImage(String path, {double size = 64}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset(
        path,
        width: size,
        height: size,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => Container(
          width: size,
          height: size,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Text('?', style: TextStyle(fontSize: 28, color: AppColors.textMuted)),
        ),
      ),
    );
  }

  Widget _cardWidget(GameCard c, {bool small = false, VoidCallback? onTap}) {
    final w = small ? 100.0 : 120.0;
    final h = small ? 150.0 : 175.0;
    final imgSize = small ? 56.0 : 72.0;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: w,
        height: h,
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: c.color, width: 2),
          boxShadow: [
            BoxShadow(color: c.color.withValues(alpha: 0.35), blurRadius: 10),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _cardImage(c.imagePath, size: imgSize),
            const SizedBox(height: 8),
            Text(
              c.name,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: small ? 10 : 12,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '${c.type} · ${c.power}',
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500, color: c.color),
            ),
          ],
        ),
      ),
    );
  }

  /// Kartu tertutup lawan (tanpa Icon, supaya tidak X)
  Widget _backCard() {
    return Container(
      width: 70,
      height: 100,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.gold.withValues(alpha: 0.5), width: 1.5),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.gold.withValues(alpha: 0.25),
            AppColors.card,
            AppColors.surface,
          ],
        ),
      ),
      child: const Center(
        child: Text(
          '?',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: AppColors.gold,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Duel Kartu Hantu'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                'Skor  $playerScore  -  $enemyScore',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.gold,
                ),
              ),
              const SizedBox(height: 12),
              const Text('Lawan', style: TextStyle(color: AppColors.textSecondary)),
              const SizedBox(height: 8),
              SizedBox(
                height: 110,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(enemyHand.length, (_) => _backCard()),
                ),
              ),
              const SizedBox(height: 16),
              if (playerPlayed != null && enemyPlayed != null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _cardWidget(playerPlayed!, small: true),
                    const Text(
                      'VS',
                      style: TextStyle(
                        color: AppColors.gold,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    _cardWidget(enemyPlayed!, small: true),
                  ],
                ),
              if (resultText != null) ...[
                const SizedBox(height: 12),
                Text(
                  resultText!,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: _nextRound,
                  child: Text(
                    playerHand.isEmpty ? 'Lihat hasil' : 'Ronde berikutnya',
                  ),
                ),
              ],
              const Spacer(),
              const Text(
                'Kartu kamu — ketuk untuk mainkan',
                style: TextStyle(color: AppColors.textSecondary, fontSize: 12),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 185,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: playerHand
                      .map((c) => _cardWidget(c, onTap: () => _playCard(c)))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}