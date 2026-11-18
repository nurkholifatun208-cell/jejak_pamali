# Jejak Pamali (Flutter)

Aplikasi Flutter untuk menyelisik mitos Nusantara — desain mengikuti mockup yang diberikan.

## Cara menjalankan di VS Code

1. Pastikan Flutter sudah terinstall (`flutter doctor`)
2. Buka folder `flutter_jejak_pamali` di VS Code
3. Buka terminal, jalankan:

```bash
flutter pub get
flutter run
```

Atau tekan **F5** / klik tombol Run.

## Struktur

```
lib/
  main.dart
  theme/app_theme.dart
  widgets/bottom_nav.dart
  screens/
    splash_screen.dart
    episode_list_screen.dart
    investigation_screen.dart
    notes_screen.dart
    map_screen.dart
    profile_screen.dart
    card_duel_screen.dart
    creature_book_screen.dart
    episode_complete_screen.dart
    meaning_reveal_screen.dart
```

## Layar yang tersedia

- Splash / Pembuka
- Daftar Episode
- Penyelidikan
- Catatan Petunjuk
- Peta Misteri
- Profil
- Duel Kartu
- Kitab Makhluk
- Episode Selesai
- Di Balik Cerita (makna)

## Catatan

Ini adalah prototype UI. Data masih hard-coded sesuai desain.
Kamu bisa lanjut menambahkan state management, navigasi lebih kompleks, atau backend.
