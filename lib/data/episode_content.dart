class EpisodeContent {
  final String mitos;
  final String makna;
  final String kearifan;
  final String bacaLebihLanjut;
  final List<Map<String, dynamic>> petunjuk;
  final List<Map<String, String>> tokoh;
  final List<Map<String, String>> mitosList;

  const EpisodeContent({
    required this.mitos,
    required this.makna,
    required this.kearifan,
    required this.bacaLebihLanjut,
    required this.petunjuk,
    required this.tokoh,
    required this.mitosList,
  });
}

EpisodeContent contentForEpisode(int id) {
  switch (id) {
    case 2:
      return const EpisodeContent(
        mitos:
            'Penunggu hutan akan marah jika ada yang masuk atau menebang pohon di hutan larangan setelah magrib.',
        makna:
            'Larangan ini menjaga hulu sungai dan lereng agar tidak longsor, serta menjaga warga dari bahaya gelap di hutan.',
        kearifan: 'Konservasi hutan dan air',
        bacaLebihLanjut:
            'Di banyak daerah, hutan larangan berfungsi melindungi daerah tangkapan air. Pamali masuk malam hari juga mengurangi risiko tersesat dan kecelakaan.',
        petunjuk: [
          {
            'title': 'Larangan hutan',
            'desc': 'Tidak boleh masuk hutan selepas magrib',
            'icon': 'forest',
            'detail': 'Pamali masuk hutan larangan setelah magrib.',
          },
          {
            'title': 'Sungai keruh',
            'desc': 'Tebang pohon membuat sungai keruh',
            'icon': 'water',
            'detail': 'Menebang di lereng menyebabkan erosi dan air keruh.',
          },
          {
            'title': 'Konservasi hutan & air',
            'desc': 'Menjaga hulu sungai dari longsor',
            'icon': 'eco',
            'detail': 'Makna pamali: jaga hutan agar air dan tanah aman.',
          },
        ],
        tokoh: [
          {'nama': 'Mbah Karto', 'peran': 'Sesepuh', 'info': 'Menjaga pamali hutan larangan.'},
          {'nama': 'Warga desa', 'peran': 'Saksi', 'info': 'Melihat akibat penebangan di lereng.'},
          {'nama': 'Bu Guru', 'peran': 'Pendidikan', 'info': 'Menjelaskan makna konservasi.'},
        ],
        mitosList: [
          {
            'judul': 'Penunggu hutan',
            'isi': 'Masuk atau menebang di hutan larangan dianggap mengundang murka penunggu.',
          },
          {
            'judul': 'Makna sebenarnya',
            'isi': 'Menjaga hulu sungai, lereng, dan keselamatan warga di malam hari.',
          },
        ],
      );

    case 3:
      return const EpisodeContent(
        mitos:
            'Sasi melarang mengambil hasil laut di waktu tertentu. Melanggar dianggap mengundang sial dan sanksi adat.',
        makna:
            'Sasi memberi waktu bagi ikan dan biota laut untuk berkembang biak agar hasil tangkapan tetap ada.',
        kearifan: 'Pengelolaan sumber daya laut berkelanjutan',
        bacaLebihLanjut:
            'Sasi di Maluku adalah sistem konservasi tradisional. Saat sasi ditutup, pengambilan dibatasi; saat dibuka, hasil laut biasanya lebih melimpah.',
        petunjuk: [
          {
            'title': 'Arti sasi',
            'desc': 'Larangan adat sementara atas sumber daya',
            'icon': 'anchor',
            'detail': 'Sasi mengatur kapan hasil laut boleh diambil.',
          },
          {
            'title': 'Pemulihan laut',
            'desc': 'Ikan sempat berkembang biak',
            'icon': 'water',
            'detail': 'Penutupan sementara memulihkan populasi.',
          },
          {
            'title': 'Sanksi adat',
            'desc': 'Pelanggar mendapat denda / kerja bakti',
            'icon': 'gavel',
            'detail': 'Aturan adat ditegakkan bersama masyarakat.',
          },
          {
            'title': 'Konservasi modern',
            'desc': 'Mirip zona konservasi sementara',
            'icon': 'eco',
            'detail': 'Prinsipnya sama dengan pengelolaan berkelanjutan.',
          },
        ],
        tokoh: [
          {'nama': 'Kepala adat', 'peran': 'Pemimpin adat', 'info': 'Menjelaskan aturan sasi.'},
          {'nama': 'Nelayan tua', 'peran': 'Nelayan', 'info': 'Merasakan manfaat sasi dibuka.'},
          {'nama': 'Pemuda desa', 'peran': 'Warga', 'info': 'Menyaksikan sanksi pelanggaran.'},
          {'nama': 'Bu guru biologi', 'peran': 'Pendidikan', 'info': 'Mengaitkan sasi dengan sains.'},
        ],
        mitosList: [
          {
            'judul': 'Larangan sasi',
            'isi': 'Mengambil hasil laut saat sasi ditutup membawa sial dan sanksi.',
          },
          {
            'judul': 'Makna sebenarnya',
            'isi': 'Memberi waktu regenerasi ekosistem laut.',
          },
        ],
      );

    case 4:
      return const EpisodeContent(
        mitos:
            'Berkata kasar atau membuang sampah di dekat kawah dianggap mengundang murka penunggu gunung.',
        makna:
            'Menghormati zona bahaya gunung api: gas beracun, longsoran, dan cuaca ekstrem bisa datang tiba-tiba.',
        kearifan: 'Keselamatan di kawasan gunung api',
        bacaLebihLanjut:
            'Pamali di sekitar kawah sering sejalan dengan zona terlarang resmi. Menghormati tanda bahaya menyelamatkan nyawa.',
        petunjuk: [
          {
            'title': 'Pamali kawah',
            'desc': 'Jangan buang sampah & berkata kasar',
            'icon': 'terrain',
            'detail': 'Larangan menjaga sikap hormat di kawasan sakral dan berbahaya.',
          },
          {
            'title': 'Risiko alam',
            'desc': 'Abu, kabut, jalur berbahaya',
            'icon': 'warning',
            'detail': 'Mengabaikan peringatan berisiko kecelakaan.',
          },
          {
            'title': 'Zona bahaya',
            'desc': 'Gas beracun & longsoran',
            'icon': 'science',
            'detail': 'Alasan ilmiah zona terlarang di gunung aktif.',
          },
          {
            'title': 'Hormati alam',
            'desc': 'Gunung memberi air sekaligus bahaya',
            'icon': 'eco',
            'detail': 'Keseimbangan manfaat dan kewaspadaan.',
          },
        ],
        tokoh: [
          {'nama': 'Juru kunci', 'peran': 'Penjaga adat', 'info': 'Menjaga pamali kawasan kawah.'},
          {'nama': 'Pendaki lokal', 'peran': 'Pendaki', 'info': 'Mengalami risiko mengabaikan peringatan.'},
          {'nama': 'Petugas PVMBG', 'peran': 'Ahli', 'info': 'Menjelaskan zona bahaya.'},
          {'nama': 'Sesepuh', 'peran': 'Tetua', 'info': 'Mengajarkan menghormati gunung.'},
        ],
        mitosList: [
          {
            'judul': 'Murka penunggu',
            'isi': 'Perilaku tidak hormat di kawah dianggap mengundang bahaya.',
          },
          {
            'judul': 'Makna sebenarnya',
            'isi': 'Keselamatan di kawasan vulkanik aktif.',
          },
        ],
      );

    case 5:
      return const EpisodeContent(
        mitos:
            'Berteriak di dalam goa dianggap memanggil penunggu dan membawa sial.',
        makna:
            'Suara keras dan api besar berbahaya di goa: longsoran batuan, asap, dan kekurangan oksigen.',
        kearifan: 'Kehati-hatian di goa & pelestarian formasi',
        bacaLebihLanjut:
            'Formasi stalaktit butuh waktu sangat lama. Menyentuh atau merusaknya menghilangkan warisan alam yang tidak tergantikan.',
        petunjuk: [
          {
            'title': 'Larangan teriak',
            'desc': 'Tidak boleh gaduh di dalam goa',
            'icon': 'volume_off',
            'detail': 'Pamali menjaga ketenangan di ruang sempit.',
          },
          {
            'title': 'Longsoran batuan',
            'desc': 'Getaran suara bisa picu longsoran',
            'icon': 'warning',
            'detail': 'Alasan ilmiah menghindari suara keras.',
          },
          {
            'title': 'Bahaya asap',
            'desc': 'Api besar di goa berbahaya',
            'icon': 'smoke',
            'detail': 'Asap dan oksigen terbatas mengancam napas.',
          },
          {
            'title': 'Jaga formasi goa',
            'desc': 'Stalaktit mudah rusak',
            'icon': 'landscape',
            'detail': 'Formasi goa terbentuk ribuan tahun.',
          },
          {
            'title': 'Kehati-hatian',
            'desc': 'Hormati warisan alam bawah tanah',
            'icon': 'eco',
            'detail': 'Inti kearifan episode goa.',
          },
        ],
        tokoh: [
          {'nama': 'Penjaga goa', 'peran': 'Penjaga', 'info': 'Menegakkan pamali di dalam goa.'},
          {'nama': 'Arkeolog muda', 'peran': 'Peneliti', 'info': 'Menjelaskan risiko longsoran.'},
          {'nama': 'Pemuda desa', 'peran': 'Saksi', 'info': 'Mengalami bahaya asap.'},
          {'nama': 'Pemandu wisata', 'peran': 'Pemandu', 'info': 'Mengatur jalur aman.'},
          {'nama': 'Bu guru', 'peran': 'Pendidikan', 'info': 'Merangkum makna pelestarian.'},
        ],
        mitosList: [
          {
            'judul': 'Gema penunggu',
            'isi': 'Teriakan di goa dianggap memanggil penunggu.',
          },
          {
            'judul': 'Makna sebenarnya',
            'isi': 'Keselamatan dan pelestarian formasi goa.',
          },
        ],
      );

    case 6:
      return const EpisodeContent(
        mitos:
            'Bayangan di rawa malam dianggap pertanda bahaya bagi yang masuk saat air pasang.',
        makna:
            'Rawa gambut menyimpan karbon dan menahan banjir. Membakar atau merusaknya menimbulkan asap dan bencana.',
        kearifan: 'Jaga ekosistem rawa gambut',
        bacaLebihLanjut:
            'Gambut yang dikeringkan atau dibakar sulit dipulihkan. Kearifan lokal mengingatkan batas manusia atas lahan basah.',
        petunjuk: [
          {
            'title': 'Pasang malam',
            'desc': 'Hindari rawa saat pasang malam',
            'icon': 'nightlight',
            'detail': 'Waktu paling berbahaya menurut warga.',
          },
          {
            'title': 'Fungsi gambut',
            'desc': 'Menyimpan karbon & menahan banjir',
            'icon': 'water',
            'detail': 'Peran ekologis rawa gambut.',
          },
          {
            'title': 'Bahaya pembakaran',
            'desc': 'Kabut asap & rusaknya ekosistem',
            'icon': 'warning',
            'detail': 'Dampak membakar lahan rawa.',
          },
          {
            'title': 'Panen bijak',
            'desc': 'Ambil secukupnya agar regenerasi',
            'icon': 'eco',
            'detail': 'Praktik berkelanjutan warga.',
          },
          {
            'title': 'Peringatan ekosistem',
            'desc': 'Bayangan sebagai peringatan',
            'icon': 'visibility',
            'detail': 'Simbol menjaga keseimbangan rawa.',
          },
        ],
        tokoh: [
          {'nama': 'Nelayan rawa', 'peran': 'Nelayan', 'info': 'Mengenal bahaya pasang malam.'},
          {'nama': 'Ahli ekologi', 'peran': 'Peneliti', 'info': 'Menjelaskan fungsi gambut.'},
          {'nama': 'Kepala desa', 'peran': 'Pemimpin', 'info': 'Melihat dampak asap.'},
          {'nama': 'Ibu pengumpul purun', 'peran': 'Warga', 'info': 'Memanen secara bijak.'},
          {'nama': 'Sesepuh', 'peran': 'Tetua', 'info': 'Menafsirkan makna bayangan.'},
        ],
        mitosList: [
          {
            'judul': 'Bayangan rawa',
            'isi': 'Sosok di malam pasang dianggap pertanda bahaya.',
          },
          {
            'judul': 'Makna sebenarnya',
            'isi': 'Menjaga gambut dari kerusakan dan bencana.',
          },
        ],
      );

    case 7:
      return const EpisodeContent(
        mitos:
            'Lagu aneh dari laut malam dianggap panggilan yang tidak boleh dijawab, tanda ombak besar.',
        makna:
            'Cuaca pesisir barat bisa berubah cepat. Membaca tanda alam adalah ilmu keselamatan nelayan.',
        kearifan: 'Keselamatan & baca tanda alam di pesisir',
        bacaLebihLanjut:
            'Nelayan tradisional mengamati angin, ombak, dan langit. Gabungan dengan prakiraan modern membuat melaut lebih aman.',
        petunjuk: [
          {
            'title': 'Peringatan ombak',
            'desc': 'Lagu laut sebagai tanda bahaya',
            'icon': 'waves',
            'detail': 'Isyarat tradisional cuaca buruk.',
          },
          {
            'title': 'Cuaca berubah cepat',
            'desc': 'Gelombang tinggi mendadak',
            'icon': 'storm',
            'detail': 'Karakter pesisir barat Sumatra.',
          },
          {
            'title': 'Hindari arus bahaya',
            'desc': 'Bagan tidak di jalur arus kuat',
            'icon': 'sailing',
            'detail': 'Praktik aman memasang bagan.',
          },
          {
            'title': 'Sampah & ekosistem',
            'desc': 'Plastik merusak laut & nelayan',
            'icon': 'delete',
            'detail': 'Kerusakan dari sampah pantai.',
          },
          {
            'title': 'Baca tanda alam',
            'desc': 'Ilmu keselamatan, bukan takut',
            'icon': 'explore',
            'detail': 'Inti kearifan pesisir.',
          },
        ],
        tokoh: [
          {'nama': 'Nelayan Minang', 'peran': 'Nelayan', 'info': 'Mengenal tanda lagu laut.'},
          {'nama': 'BMKG lokal', 'peran': 'Ahli cuaca', 'info': 'Menjelaskan perubahan cuaca.'},
          {'nama': 'Pemilik bagan', 'peran': 'Nelayan', 'info': 'Mengatur lokasi bagan aman.'},
          {'nama': 'Aktivis pantai', 'peran': 'Aktivis', 'info': 'Mengangkat isu sampah.'},
          {'nama': 'Niniak mamak', 'peran': 'Adat', 'info': 'Mengajarkan baca tanda alam.'},
        ],
        mitosList: [
          {
            'judul': 'Lagu dari laut',
            'isi': 'Nyanyian malam dianggap panggilan berbahaya.',
          },
          {
            'judul': 'Makna sebenarnya',
            'isi': 'Peringatan cuaca dan keselamatan melaut.',
          },
        ],
      );

    case 8:
      return const EpisodeContent(
        mitos:
            'Jejak yang hilang saat matahari terbit dianggap pertanda tidak boleh memaksa alam di tanah gersang.',
        makna:
            'Mengelola ternak dan lahan kering secara bijak: hindari overgrazing, tanam pohon, hemat air.',
        kearifan: 'Pengelolaan lahan kering berkelanjutan',
        bacaLebihLanjut:
            'Di Nusa Tenggara, musim kering panjang menuntut disiplin air dan vegetasi penahan angin agar tanah tidak semakin rusak.',
        petunjuk: [
          {
            'title': 'Kelola lahan kering',
            'desc': 'Jangan paksa ternak tanpa istirahat lahan',
            'icon': 'grass',
            'detail': 'Pesan pamali jejak yang hilang.',
          },
          {
            'title': 'Bahaya overgrazing',
            'desc': 'Rumput habis, tanah erosi',
            'icon': 'warning',
            'detail': 'Dampak penggembalaan berlebih.',
          },
          {
            'title': 'Pohon penahan angin',
            'desc': 'Tanam pohon kurangi debu',
            'icon': 'park',
            'detail': 'Vegetasi menjaga tanah kering.',
          },
          {
            'title': 'Hemat air',
            'desc': 'Simpan air di musim kering',
            'icon': 'water_drop',
            'detail': 'Kearifan menghadapi kemarau.',
          },
          {
            'title': 'Tanggung jawab lahan',
            'desc': 'Jejak manusia jadi bencana jika diabaikan',
            'icon': 'eco',
            'detail': 'Makna mendalam episode ini.',
          },
        ],
        tokoh: [
          {'nama': 'Penggembala', 'peran': 'Peternak', 'info': 'Menjalani pamali jejak.'},
          {'nama': 'Petugas TN', 'peran': 'Konservasi', 'info': 'Menjelaskan overgrazing.'},
          {'nama': 'Ibu penenun', 'peran': 'Warga', 'info': 'Menanam pohon di musim hujan.'},
          {'nama': 'Kepala suku', 'peran': 'Adat', 'info': 'Mengajarkan hemat air.'},
          {'nama': 'Mahasiswa lingkungan', 'peran': 'Peneliti muda', 'info': 'Menafsirkan metafora jejak.'},
        ],
        mitosList: [
          {
            'judul': 'Jejak hilang',
            'isi': 'Jejak menghilang di pagi hari sebagai pertanda.',
          },
          {
            'judul': 'Makna sebenarnya',
            'isi': 'Tanggung jawab menjaga lahan kering.',
          },
        ],
      );

    case 9:
      return const EpisodeContent(
        mitos:
            'Api upacara dan kawasan suci tidak boleh dipermainkan; pelanggaran dianggap merusak keseimbangan.',
        makna:
            'Tri Hita Karana: seimbang dengan Tuhan, manusia, dan alam — termasuk subak, sungai bersih, dan zona bahaya gunung.',
        kearifan: 'Tri Hita Karana & subak',
        bacaLebihLanjut:
            'Subak mengatur air secara adil. Nilai ini relevan untuk pengelolaan sumber daya bersama di mana pun.',
        petunjuk: [
          {
            'title': 'Simbol api',
            'desc': 'Api sebagai penyucian & keseimbangan',
            'icon': 'local_fire_department',
            'detail': 'Makna api dalam ritual.',
          },
          {
            'title': 'Subak adil',
            'desc': 'Pembagian air bersama',
            'icon': 'water',
            'detail': 'Sistem irigasi tradisional Bali.',
          },
          {
            'title': 'Manfaat & bahaya gunung',
            'desc': 'Subur tapi zona bahaya dihormati',
            'icon': 'terrain',
            'detail': 'Sikap bijak pada gunung api.',
          },
          {
            'title': 'Sungai bersih',
            'desc': 'Bagian dari harmoni sosial-alam',
            'icon': 'waves',
            'detail': 'Kebersihan sungai sebagai nilai.',
          },
          {
            'title': 'Gotong royong modern',
            'desc': 'Atur sampah & lalu lintas bersama',
            'icon': 'groups',
            'detail': 'Nilai adat di kehidupan hari ini.',
          },
          {
            'title': 'Tri Hita Karana',
            'desc': 'Seimbang spiritual, sosial, alam',
            'icon': 'eco',
            'detail': 'Inti ajaran episode Bali.',
          },
        ],
        tokoh: [
          {'nama': 'Pemangku Pura', 'peran': 'Pemangku', 'info': 'Menjelaskan makna api.'},
          {'nama': 'Petani terasering', 'peran': 'Petani', 'info': 'Menjalankan subak.'},
          {'nama': 'Ahli vulkanologi', 'peran': 'Ahli', 'info': 'Zona bahaya gunung.'},
          {'nama': 'Ibu canang', 'peran': 'Warga', 'info': 'Menjaga sungai bersih.'},
          {'nama': 'Pemuda pecalang', 'peran': 'Pecalang', 'info': 'Gotong royong upacara.'},
          {'nama': 'Guru besar budaya', 'peran': 'Akademisi', 'info': 'Merangkum Tri Hita Karana.'},
        ],
        mitosList: [
          {
            'judul': 'Api suci',
            'isi': 'Mempermainkan api upacara merusak keseimbangan.',
          },
          {
            'judul': 'Makna sebenarnya',
            'isi': 'Keseimbangan manusia, alam, dan nilai spiritual.',
          },
        ],
      );

    case 10:
      return const EpisodeContent(
        mitos:
            'Hutan adat punya wilayah keramat. Melanggar batas dianggap mengganggu penunggu dan merusak kesuburan tanah.',
        makna:
            'Hutan adalah ruang hidup: sagu, air, dan pengetahuan lokal. Pembangunan harus menghormati tanah dan sungai.',
        kearifan: 'Hak atas tanah, hutan, dan pengetahuan lokal',
        bacaLebihLanjut:
            'Dari Aceh sampai Papua, jejak pamali mengajarkan batas manusia atas alam. Pembangunan bijak mendengar adat dan sains.',
        petunjuk: [
          {
            'title': 'Hutan beraturan adat',
            'desc': 'Ada zona keramat dan jalur adat',
            'icon': 'forest',
            'detail': 'Hutan bukan lahan kosong.',
          },
          {
            'title': 'Panen sagu bijak',
            'desc': 'Bergilir, jaga pohon muda',
            'icon': 'eco',
            'detail': 'Praktik berkelanjutan sagu.',
          },
          {
            'title': 'Risiko eksploitasi',
            'desc': 'Tambang & lahan rusak sungai',
            'icon': 'warning',
            'detail': 'Dampak tanpa konsultasi adat.',
          },
          {
            'title': 'Ilmu ekologi lokal',
            'desc': 'Nama pohon & burung dari orang tua',
            'icon': 'menu_book',
            'detail': 'Pengetahuan menjaga biodiversitas.',
          },
          {
            'title': 'Pembangunan beradab',
            'desc': 'Hormati tanah & sungai',
            'icon': 'home',
            'detail': 'Sikap pemuda adat.',
          },
          {
            'title': 'Batas manusia & alam',
            'desc': 'Kesimpulan seluruh jejak pamali',
            'icon': 'public',
            'detail': 'Pesan penutup permainan.',
          },
        ],
        tokoh: [
          {'nama': 'Ondoafi', 'peran': 'Kepala adat', 'info': 'Menjaga wilayah keramat.'},
          {'nama': 'Perempuan sagu', 'peran': 'Warga', 'info': 'Memanen sagu bergilir.'},
          {'nama': 'Aktivis lingkungan', 'peran': 'Aktivis', 'info': 'Mengingatkan risiko eksploitasi.'},
          {'nama': 'Guru kampung', 'peran': 'Guru', 'info': 'Mengajar pengetahuan lokal.'},
          {'nama': 'Pemuda adat', 'peran': 'Pemuda', 'info': 'Ingin pembangunan yang menghormati tanah.'},
          {'nama': 'Peneliti budaya', 'peran': 'Peneliti', 'info': 'Merangkum makna nusantara.'},
        ],
        mitosList: [
          {
            'judul': 'Wilayah keramat',
            'isi': 'Melanggar batas hutan adat mengundang sial.',
          },
          {
            'judul': 'Makna sebenarnya',
            'isi': 'Menghormati hutan, air, dan hak masyarakat adat.',
          },
        ],
      );

    default: // Episode 1
      return const EpisodeContent(
        mitos:
            'Pohon tua di tepi desa dianggap keramat. Siapa yang menebang atau menginjak akarnya setelah magrib akan mendapat sial.',
        makna:
            'Larangan ini menjaga akar pohon tetap utuh agar tanah di tepi sungai tidak longsor, serta melindungi warga dari bahaya malam di sekitar pohon besar.',
        kearifan: 'Konservasi tanah & pohon',
        bacaLebihLanjut:
            'Di banyak desa di Jawa, pohon besar di tepi sungai sering dilindungi dengan pamali. Larangan menebang berfungsi menjaga akar tetap kuat agar tanah tidak longsor saat hujan deras.\n\nIni adalah bentuk konservasi tradisional yang diwariskan turun-temurun.',
        petunjuk: [
          {
            'title': 'Pohon keramat',
            'desc': 'Warga menghindari pohon tua di tepi desa',
            'icon': 'eco',
            'detail': 'Pohon dianggap pamali; tidak boleh ditebang atau diinjak akarnya setelah magrib.',
          },
          {
            'title': 'Akibat pelanggaran',
            'desc': 'Orang yang menebang cabang sakit panas',
            'icon': 'warning',
            'detail': 'Kesaksian warga tentang akibat melanggar pamali.',
          },
          {
            'title': 'Kearifan lokal',
            'desc': 'Menjaga tanah agar tidak longsor',
            'icon': 'water',
            'detail': 'Makna sebenarnya: akar menahan tanah di tepi sungai.',
          },
        ],
        tokoh: [
          {'nama': 'Mbah Sarni', 'peran': 'Sesepuh desa', 'info': 'Menjaga tradisi pamali pohon tua.'},
          {'nama': 'Pak RT', 'peran': 'Ketua RT', 'info': 'Menyaksikan akibat pelanggaran.'},
          {'nama': 'Ibu Karti', 'peran': 'Warga', 'info': 'Menjelaskan makna di balik larangan.'},
        ],
        mitosList: [
          {
            'judul': 'Pohon keramat',
            'isi': 'Siapa yang menebang atau menginjak akar pohon setelah magrib akan mendapat sial.',
          },
          {
            'judul': 'Makna sebenarnya',
            'isi': 'Larangan menjaga akar tetap utuh agar tanah tidak longsor dan warga aman di malam hari.',
          },
        ],
      );
  }
}