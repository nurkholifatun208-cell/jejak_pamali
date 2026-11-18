import 'package:audioplayers/audioplayers.dart';

class AudioService {
  static final AudioService instance = AudioService._();
  AudioService._();

  final AudioPlayer _bgm = AudioPlayer();
  bool muted = false;
  bool _started = false;

  Future<void> playBgm() async {
    if (muted) return;
    try {
      await _bgm.setReleaseMode(ReleaseMode.loop);
      await _bgm.setVolume(0.35);
      await _bgm.play(AssetSource('audio/bgm.mp3'));
      _started = true;
    } catch (e) {
      debugPrint('BGM gagal: $e');
    }
  }

  Future<void> stopBgm() async {
    await _bgm.stop();
    _started = false;
  }

  Future<void> toggleMute() async {
    muted = !muted;
    if (muted) {
      await _bgm.setVolume(0);
    } else {
      await _bgm.setVolume(0.35);
      if (!_started || _bgm.state != PlayerState.playing) {
        await playBgm();
      }
    }
  }
}

void debugPrint(String msg) {
  // ignore: avoid_print
  print(msg);
}