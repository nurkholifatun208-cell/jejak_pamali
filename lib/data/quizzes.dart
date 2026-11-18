/// Kuiz per episode — jumlah soal & tingkat kesulitan naik
List<Map<String, dynamic>> quizForEpisode(int id) {
  switch (id) {
    case 1: // Mudah — 3 soal
      return [
        {
          'speaker': 'Mbah Sarni',
          'dialogue':
              'Pohon itu sudah ada sejak buyutku masih kecil, Nak. Jangan pernah menebang atau menaruh kaki di akarnya setelah magrib.',
          'question': 'Kenapa warga menghindari pohon itu?',
          'options': [
            'Karena pohonnya sudah mati',
            'Karena dianggap keramat / pamali',
            'Karena ada ular berbisa',
            'Karena milik pemerintah',
          ],
          'correctIndex': 1,
          'clueName': 'Pohon keramat',
        },
        {
          'speaker': 'Pak RT',
          'dialogue':
              'Dulu ada orang luar yang nekat tebang cabangnya. Besoknya dia sakit panas sampai semingguan.',
          'question': 'Apa yang terjadi setelah cabang ditebang?',
          'options': [
            'Hujan deras semalaman',
            'Orang itu sakit panas',
            'Pohonnya tumbang',
            'Tidak terjadi apa-apa',
          ],
          'correctIndex': 1,
          'clueName': 'Akibat pelanggaran',
        },
        {
          'speaker': 'Ibu Karti',
          'dialogue':
              'Sebenarnya pamali itu supaya akar pohon tetap kuat menahan tanah di tepi sungai. Kalau ditebang, longsor bisa datang.',
          'question': 'Apa makna sebenarnya di balik pamali pohon ini?',
          'options': [
            'Menjaga agar tidak longsor',
            'Supaya hantu tidak marah',
            'Agar buahnya tidak dicuri',
            'Karena pohonnya beracun',
          ],
          'correctIndex': 0,
          'clueName': 'Kearifan lokal',
        },
      ];

    case 2: // Mudah — 3 soal
      return [
        {
          'speaker': 'Mbah Karto',
          'dialogue':
              'Jangan masuk hutan itu selepas magrib, Nak. Sudah pamali dari zaman dulu.',
          'question': 'Mengapa warga dilarang masuk hutan larangan malam hari?',
          'options': [
            'Karena banyak binatang buas',
            'Karena pamali / penunggu hutan',
            'Karena jalan rusak',
            'Karena milik negara',
          ],
          'correctIndex': 1,
          'clueName': 'Larangan hutan',
        },
        {
          'speaker': 'Warga desa',
          'dialogue':
              'Dulu ada yang nekat tebang pohon di lereng. Setelah itu sungai jadi keruh setiap hujan.',
          'question': 'Apa akibat menebang pohon di lereng hutan?',
          'options': [
            'Sungai menjadi keruh',
            'Hutan langsung hilang',
            'Tidak ada akibat',
            'Hewan pergi semua',
          ],
          'correctIndex': 0,
          'clueName': 'Sungai keruh',
        },
        {
          'speaker': 'Bu Guru',
          'dialogue':
              'Sebenarnya pamali itu menjaga hulu sungai dan lereng agar tidak longsor.',
          'question': 'Apa makna sebenarnya dari pamali hutan larangan?',
          'options': [
            'Menjaga hulu sungai & mencegah longsor',
            'Supaya hantu tidak marah',
            'Agar kayu tidak dicuri',
            'Karena tanahnya beracun',
          ],
          'correctIndex': 0,
          'clueName': 'Konservasi hutan & air',
        },
      ];

    case 3: // Sedang — 4 soal (Sasi, Maluku)
      return [
        {
          'speaker': 'Kepala adat',
          'dialogue':
              'Sasi melarang mengambil hasil laut di waktu tertentu. Siapa melanggar didenda adat.',
          'question': 'Apa itu sasi?',
          'options': [
            'Pesta rakyat Maluku',
            'Larangan adat mengambil sumber daya alam sementara',
            'Nama ikan lokal',
            'Ritual menari di pantai',
          ],
          'correctIndex': 1,
          'clueName': 'Arti sasi',
        },
        {
          'speaker': 'Nelayan tua',
          'dialogue':
              'Kalau sasi dibuka, ikan dan kerang sudah banyak lagi. Kalau terus diambil, habis.',
          'question': 'Mengapa sasi penting bagi nelayan?',
          'options': [
            'Supaya laut terlihat indah',
            'Agar sumber daya laut sempat pulih',
            'Karena perintah pemerintah saja',
            'Supaya wisatawan datang',
          ],
          'correctIndex': 1,
          'clueName': 'Pemulihan laut',
        },
        {
          'speaker': 'Pemuda desa',
          'dialogue':
              'Dulu ada yang selundup ambil teripang saat sasi. Dia dihukum kerja bakti di pantai.',
          'question': 'Apa sanksi melanggar sasi di cerita ini?',
          'options': [
            'Dipenjara seumur hidup',
            'Kerja bakti / denda adat',
            'Tidak ada sanksi',
            'Diusir dari pulau',
          ],
          'correctIndex': 1,
          'clueName': 'Sanksi adat',
        },
        {
          'speaker': 'Bu guru biologi',
          'dialogue':
              'Secara ilmiah, sasi mirip zona konservasi sementara agar populasi spesies pulih.',
          'question': 'Makna modern dari sasi paling tepat adalah?',
          'options': [
            'Mitos semata tanpa manfaat',
            'Pengelolaan sumber daya berkelanjutan',
            'Cara menakut-nakuti anak',
            'Tradisi yang harus dihapus',
          ],
          'correctIndex': 1,
          'clueName': 'Konservasi modern',
        },
      ];

    case 4: // Sedang — 4 soal (Gunung berapi, Jatim)
      return [
        {
          'speaker': 'Juru kunci',
          'dialogue':
              'Jangan buang sampah atau berkata kasar di dekat kawah. Itu pamali turun-temurun.',
          'question': 'Apa yang dilarang di sekitar kawah menurut pamali?',
          'options': [
            'Hanya memotret',
            'Membuang sampah & berkata kasar',
            'Membawa air',
            'Datang siang hari',
          ],
          'correctIndex': 1,
          'clueName': 'Pamali kawah',
        },
        {
          'speaker': 'Pendaki lokal',
          'dialogue':
              'Orang yang meremehkan peringatan sering tertangkap hujan abu atau tersesat kabut.',
          'question': 'Apa risiko mengabaikan peringatan di gunung api?',
          'options': [
            'Hanya kedinginan',
            'Bahaya alam: abu, kabut, jalur berbahaya',
            'Tidak ada risiko',
            'Hanya denda tiket',
          ],
          'correctIndex': 1,
          'clueName': 'Risiko alam',
        },
        {
          'speaker': 'Petugas PVMBG',
          'dialogue':
              'Zona terlarang ada karena gas beracun dan longsoran bisa terjadi tiba-tiba.',
          'question': 'Mengapa ada zona terlarang di gunung api aktif?',
          'options': [
            'Agar tiket lebih mahal',
            'Karena gas beracun & bahaya longsoran',
            'Supaya sepi pengunjung',
            'Karena lahan pribadi',
          ],
          'correctIndex': 1,
          'clueName': 'Zona bahaya',
        },
        {
          'speaker': 'Sesepuh',
          'dialogue':
              'Menghormati gunung berarti menghormati alam yang bisa memberi air sekaligus bahaya.',
          'question': 'Makna kearifan lokal di gunung berapi?',
          'options': [
            'Takut pada roh saja',
            'Menghormati kekuatan alam & keselamatan',
            'Melarang semua pendakian',
            'Menghindari ilmu pengetahuan',
          ],
          'correctIndex': 1,
          'clueName': 'Hormati alam',
        },
      ];

    case 5: // Sulit — 5 soal (Goa batu, Sulsel)
      return [
        {
          'speaker': 'Penjaga goa',
          'dialogue':
              'Jangan berteriak di dalam goa. Gema itu dianggap memanggil penunggu.',
          'question': 'Apa pamali utama di dalam goa?',
          'options': [
            'Tidak boleh membawa lampu',
            'Tidak boleh berteriak / membuat gaduh',
            'Tidak boleh duduk',
            'Tidak boleh minum air',
          ],
          'correctIndex': 1,
          'clueName': 'Larangan teriak',
        },
        {
          'speaker': 'Arkeolog muda',
          'dialogue':
              'Getaran suara keras bisa memicu longsoran batuan di langit-langit goa yang rapuh.',
          'question': 'Alasan ilmiah menghindari suara keras di goa?',
          'options': [
            'Supaya tidak takut',
            'Mengurangi risiko longsoran batuan',
            'Agar echo terdengar indah',
            'Tidak ada alasan ilmiah',
          ],
          'correctIndex': 1,
          'clueName': 'Longsoran batuan',
        },
        {
          'speaker': 'Pemuda desa',
          'dialogue':
              'Ada yang pernah nyalakan api besar di dalam. Asapnya memenuhi lorong, mereka hampir sesak napas.',
          'question': 'Bahaya menyalakan api besar di goa tertutup?',
          'options': [
            'Hanya panas',
            'Asap & kekurangan oksigen',
            'Tidak berbahaya',
            'Membuat goa lebih terang saja',
          ],
          'correctIndex': 1,
          'clueName': 'Bahaya asap',
        },
        {
          'speaker': 'Pemandu wisata',
          'dialogue':
              'Kita hanya boleh menyentuh jalur yang diizinkan. Formasi stalaktit butuh ribuan tahun.',
          'question': 'Mengapa formasi goa tidak boleh dipegang sembarangan?',
          'options': [
            'Agar tidak kotor tangan',
            'Karena pembentukan formasi sangat lambat & mudah rusak',
            'Karena beracun',
            'Supaya foto bagus',
          ],
          'correctIndex': 1,
          'clueName': 'Jaga formasi goa',
        },
        {
          'speaker': 'Bu guru',
          'dialogue':
              'Pamali goa mengajarkan kehati-hatian di ruang sempit dan penghormatan pada warisan alam.',
          'question': 'Inti kearifan lokal episode goa?',
          'options': [
            'Menghindari semua goa',
            'Kehati-hatian & pelestarian warisan alam',
            'Percaya hantu saja',
            'Melarang penelitian',
          ],
          'correctIndex': 1,
          'clueName': 'Kehati-hatian & pelestarian',
        },
      ];

    case 6: // Sulit — 5 soal (Rawa, Kalimantan)
      return [
        {
          'speaker': 'Nelayan rawa',
          'dialogue':
              'Jangan masuk rawa saat air pasang malam. Banyak yang bilang ada bayangan ikut.',
          'question': 'Kapan warga paling menghindari rawa?',
          'options': [
            'Siang cerah',
            'Air pasang di malam hari',
            'Saat kemarau saja',
            'Saat ada festival',
          ],
          'correctIndex': 1,
          'clueName': 'Pasang malam',
        },
        {
          'speaker': 'Ahli ekologi',
          'dialogue':
              'Rawa gambut menyimpan karbon. Jika dibakar atau dikeringkan, asap dan banjir mengancam.',
          'question': 'Mengapa rawa gambut penting dijaga?',
          'options': [
            'Hanya untuk ikan',
            'Menyimpan karbon & menahan banjir',
            'Tidak penting',
            'Agar terlihat angker',
          ],
          'correctIndex': 1,
          'clueName': 'Fungsi gambut',
        },
        {
          'speaker': 'Kepala desa',
          'dialogue':
              'Orang luar yang membakar lahan untuk kebun sering memicu kabut asap sampai ke kota.',
          'question': 'Dampak membakar lahan rawa?',
          'options': [
            'Tanah lebih subur saja',
            'Kabut asap & kerusakan ekosistem',
            'Tidak ada dampak',
            'Hanya mengusir nyamuk',
          ],
          'correctIndex': 1,
          'clueName': 'Bahaya pembakaran',
        },
        {
          'speaker': 'Ibu-ibu pengumpul purun',
          'dialogue':
              'Kami ambil purun secukupnya. Kalau habis semua, anyaman kami juga ikut hilang.',
          'question': 'Praktik berkelanjutan di rawa menurut warga?',
          'options': [
            'Mengambil semua sekaligus',
            'Mengambil secukupnya agar regenerasi',
            'Mengeringkan seluruh rawa',
            'Melarang semua aktivitas',
          ],
          'correctIndex': 1,
          'clueName': 'Panen bijak',
        },
        {
          'speaker': 'Sesepuh',
          'dialogue':
              'Bayangan di rawa mengingatkan kita: alam yang diabaikan bisa “membalas” lewat banjir dan asap.',
          'question': 'Makna simbolis “bayangan” di episode ini?',
          'options': [
            'Hantu yang nyata',
            'Peringatan menjaga keseimbangan rawa',
            'Cerita untuk menakut-nakuti saja',
            'Tidak ada makna',
          ],
          'correctIndex': 1,
          'clueName': 'Peringatan ekosistem',
        },
      ];

    case 7: // Sangat sulit — 5 soal (Pesisir, Sumbar)
      return [
        {
          'speaker': 'Nelayan Minang',
          'dialogue':
              'Kalau mendengar lagu aneh dari laut malam, jangan menjawab. Itu pertanda ombak besar.',
          'question': 'Apa arti “lagu dari laut” bagi nelayan?',
          'options': [
            'Undangan pesta',
            'Peringatan cuaca/ombak berbahaya',
            'Hiburan malam',
            'Suara kapal lain',
          ],
          'correctIndex': 1,
          'clueName': 'Peringatan ombak',
        },
        {
          'speaker': 'BMKG lokal',
          'dialogue':
              'Angin kencang dan gelombang tinggi sering datang mendadak di pesisir barat Sumatra.',
          'question': 'Mengapa peringatan lokal penting di pesisir barat?',
          'options': [
            'Agar nelayan takut',
            'Karena cuaca laut bisa berubah cepat & berbahaya',
            'Hanya tradisi kosong',
            'Supaya tidak melaut sama sekali',
          ],
          'correctIndex': 1,
          'clueName': 'Cuaca berubah cepat',
        },
        {
          'speaker': 'Pemilik bagan',
          'dialogue':
              'Kami tidak memasang bagan di jalur arus kuat. Sudah ada yang hanyut dulu.',
          'question': 'Praktik aman memasang bagan?',
          'options': [
            'Di mana saja bebas',
            'Menghindari jalur arus berbahaya',
            'Hanya di laut lepas',
            'Dekat batu karang saja',
          ],
          'correctIndex': 1,
          'clueName': 'Hindari arus bahaya',
        },
        {
          'speaker': 'Aktivis pantai',
          'dialogue':
              'Sampah plastik di pantai ikut “menyanyikan” kerusakan: ikan mati, nelayan rugi.',
          'question': 'Hubungan sampah pantai dengan “lagu” kerusakan?',
          'options': [
            'Tidak berhubungan',
            'Sampah merusak ekosistem & mata pencaharian',
            'Hanya masalah estetika',
            'Hanya urusan wisatawan',
          ],
          'correctIndex': 1,
          'clueName': 'Sampah & ekosistem',
        },
        {
          'speaker': 'Niniak mamak',
          'dialogue':
              'Adat mengajarkan membaca tanda alam sebelum melaut. Itu ilmu keselamatan, bukan takut.',
          'question': 'Inti kearifan pesisir di episode ini?',
          'options': [
            'Melarang melaut selamanya',
            'Membaca tanda alam untuk keselamatan',
            'Mengabaikan prakiraan cuaca',
            'Hanya ritual tanpa makna',
          ],
          'correctIndex': 1,
          'clueName': 'Baca tanda alam',
        },
      ];

    case 8: // Sangat sulit — 5 soal (Padang pasir / savana NTT)
      return [
        {
          'speaker': 'Penggembala',
          'dialogue':
              'Jejak yang hilang saat matahari terbit mengingatkan: jangan memaksa ternak di tanah gersang tanpa istirahat.',
          'question': 'Apa pesan utama pamali “jejak hilang”?',
          'options': [
            'Jangan berjalan pagi',
            'Mengelola ternak & lahan kering dengan bijak',
            'Takut pada roh pasir',
            'Pindah ke kota saja',
          ],
          'correctIndex': 1,
          'clueName': 'Kelola lahan kering',
        },
        {
          'speaker': 'Petugas Taman Nasional',
          'dialogue':
              'Overgrazing membuat rumput tidak sempat tumbuh. Tanah lalu mudah erosi.',
          'question': 'Dampak penggembalaan berlebih?',
          'options': [
            'Rumput lebih subur',
            'Erosi & lahan semakin gersang',
            'Tidak ada dampak',
            'Hanya menambah air',
          ],
          'correctIndex': 1,
          'clueName': 'Bahaya overgrazing',
        },
        {
          'speaker': 'Ibu penenun',
          'dialogue':
              'Kami tanam pohon di musim hujan. Tanpa itu, angin kencang membawa debu ke rumah.',
          'question': 'Mengapa penanaman pohon penting di daerah kering?',
          'options': [
            'Hanya untuk keindahan',
            'Menahan angin, debu, dan menjaga tanah',
            'Supaya hujan terus-menerus',
            'Tidak penting',
          ],
          'correctIndex': 1,
          'clueName': 'Pohon penahan angin',
        },
        {
          'speaker': 'Kepala suku',
          'dialogue':
              'Musim kering panjang diajari turun-temurun: simpan air, jangan boros.',
          'question': 'Kearifan menghadapi musim kering?',
          'options': [
            'Menggunakan air sebebasnya',
            'Menyimpan & menghemat air',
            'Mengabaikan musim',
            'Hanya mengandalkan sumur bor tanpa batas',
          ],
          'correctIndex': 1,
          'clueName': 'Hemat air',
        },
        {
          'speaker': 'Mahasiswa lingkungan',
          'dialogue':
              'Mitos jejak yang hilang bisa dibaca sebagai metafora: jejak buruk manusia di lahan kering juga “menghilang” jadi bencana.',
          'question': 'Makna mendalam episode ini?',
          'options': [
            'Cerita hantu semata',
            'Tanggung jawab menjaga lahan kering',
            'Melarang semua penggembalaan',
            'Tidak relevan hari ini',
          ],
          'correctIndex': 1,
          'clueName': 'Tanggung jawab lahan',
        },
      ];

    case 9: // Expert — 6 soal (Bali, api gunung)
      return [
        {
          'speaker': 'Pemangku Pura',
          'dialogue':
              'Api di upacara bukan untuk dimainkan. Itu simbol penyucian dan keseimbangan.',
          'question': 'Apa makna api dalam konteks ritual di episode ini?',
          'options': [
            'Hanya penerangan',
            'Simbol penyucian & keseimbangan',
            'Alat masak',
            'Hiburan turis',
          ],
          'correctIndex': 1,
          'clueName': 'Simbol api',
        },
        {
          'speaker': 'Petani terasering',
          'dialogue':
              'Subak mengatur air adil. Kalau satu sawah rakus, yang lain kekeringan.',
          'question': 'Prinsip utama subak?',
          'options': [
            'Air untuk yang terkuat',
            'Pembagian air yang adil & bersama',
            'Air hanya untuk pura',
            'Tidak ada aturan',
          ],
          'correctIndex': 1,
          'clueName': 'Subak adil',
        },
        {
          'speaker': 'Ahli vulkanologi',
          'dialogue':
              'Gunung berapi memberi tanah subur, tapi zona bahaya harus dihormati.',
          'question': 'Sikap bijak terhadap gunung api?',
          'options': [
            'Mengabaikan zona bahaya',
            'Manfaatkan kesuburan, hormati zona bahaya',
            'Pindahkan semua desa jauh selamanya',
            'Tutup semua aktivitas pertanian',
          ],
          'correctIndex': 1,
          'clueName': 'Seimbang manfaat-bahaya',
        },
        {
          'speaker': 'Ibu canang',
          'dialogue':
              'Menjaga sungai bersih bagian dari menjaga hubungan dengan alam dan sesama.',
          'question': 'Mengapa kebersihan sungai penting dalam kearifan lokal?',
          'options': [
            'Hanya agar foto bagus',
            'Menjaga alam, kesehatan, dan harmoni sosial',
            'Tidak penting',
            'Hanya urusan hotel',
          ],
          'correctIndex': 1,
          'clueName': 'Sungai bersih',
        },
        {
          'speaker': 'Pemuda pecalang',
          'dialogue':
              'Saat upacara besar, lalu lintas dan sampah diatur bersama. Itu gotong royong modern.',
          'question': 'Contoh penerapan nilai tradisional di kehidupan modern?',
          'options': [
            'Mengabaikan aturan bersama',
            'Gotong royong mengatur lingkungan & ketertiban',
            'Hanya ritual di pura',
            'Menyerahkan semua ke turis',
          ],
          'correctIndex': 1,
          'clueName': 'Gotong royong modern',
        },
        {
          'speaker': 'Guru besar budaya',
          'dialogue':
              'Tri Hita Karana: seimbang dengan Tuhan, manusia, dan alam. Itulah “api” yang menjaga Bali.',
          'question': 'Inti ajaran yang menjadi makna episode ini?',
          'options': [
            'Hanya pariwisata',
            'Keseimbangan spiritual, sosial, dan alam',
            'Menghindari teknologi',
            'Hidup tanpa aturan',
          ],
          'correctIndex': 1,
          'clueName': 'Tri Hita Karana',
        },
      ];

    case 10: // Expert — 6 soal (Papua)
      return [
        {
          'speaker': 'Ondoafi / kepala adat',
          'dialogue':
              'Hutan bukan kosong. Ada wilayah keramat, jalur berburu, dan tempat tumbuh sagu.',
          'question': 'Bagaimana hutan dipandang dalam adat setempat?',
          'options': [
            'Lahan kosong siap ditebang',
            'Ruang hidup dengan zona & aturan adat',
            'Hanya untuk foto',
            'Tidak ada aturan',
          ],
          'correctIndex': 1,
          'clueName': 'Hutan beraturan adat',
        },
        {
          'speaker': 'Perempuan pembuat sagu',
          'dialogue':
              'Sagu dipanen bergilir. Kalau serakah, pohon muda ikut habis.',
          'question': 'Praktik berkelanjutan memanen sagu?',
          'options': [
            'Ambil semua sekaligus',
            'Panen bergilir, jaga pohon muda',
            'Ganti semua dengan sawit',
            'Tidak perlu aturan',
          ],
          'correctIndex': 1,
          'clueName': 'Panen sagu bijak',
        },
        {
          'speaker': 'Aktivis lingkungan',
          'dialogue':
              'Tambang dan pembukaan lahan besar bisa merusak sungai dan mata pencaharian adat.',
          'question': 'Risiko eksploitasi besar tanpa konsultasi adat?',
          'options': [
            'Selalu menguntungkan semua pihak',
            'Kerusakan sungai & penghidupan lokal',
            'Tidak ada risiko',
            'Hanya masalah sementara',
          ],
          'correctIndex': 1,
          'clueName': 'Risiko eksploitasi',
        },
        {
          'speaker': 'Guru sekolah kampung',
          'dialogue':
              'Anak-anak belajar nama pohon dan burung dari orang tua. Itu ilmu ekologi lokal.',
          'question': 'Mengapa pengetahuan lokal tentang spesies penting?',
          'options': [
            'Hanya cerita lama',
            'Dasar menjaga keanekaragaman hayati',
            'Tidak berguna di sekolah',
            'Menghambat kemajuan',
          ],
          'correctIndex': 1,
          'clueName': 'Ilmu ekologi lokal',
        },
        {
          'speaker': 'Pemuda adat',
          'dialogue':
              'Kami ingin pembangunan, tapi yang menghormati tanah dan sungai kami.',
          'question': 'Sikap yang digambarkan pemuda adat?',
          'options': [
            'Menolak semua perubahan',
            'Pembangunan yang menghormati tanah & sungai',
            'Menyerahkan semua hutan',
            'Tidak peduli lingkungan',
          ],
          'correctIndex': 1,
          'clueName': 'Pembangunan beradab',
        },
        {
          'speaker': 'Peneliti budaya',
          'dialogue':
              'Semua jejak pamali dari Aceh sampai Papua mengajarkan satu hal: batas manusia atas alam.',
          'question': 'Kesimpulan seluruh perjalanan Jejak Pamali?',
          'options': [
            'Mitos harus dihapus',
            'Kearifan lokal menjaga batas manusia & alam',
            'Hanya hiburan',
            'Tidak ada hubungan antar daerah',
          ],
          'correctIndex': 1,
          'clueName': 'Batas manusia & alam',
        },
      ];

    default:
      return quizForEpisode(1);
  }
}