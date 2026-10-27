import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigasi Wisata',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/pantai': (context) =>
            const MenuPage(menuTitle: 'Pantai', icon: Icons.beach_access),
        '/gunung': (context) =>
            const MenuPage(menuTitle: 'Gunung', icon: Icons.terrain),
        '/budaya': (context) =>
            const MenuPage(menuTitle: 'Budaya', icon: Icons.museum),
        '/kuliner': (context) =>
            const MenuPage(menuTitle: 'Kuliner', icon: Icons.restaurant),
        '/detail': (context) => const DetailPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beranda'),
        backgroundColor: Colors.blue[700],
        foregroundColor: Colors.white,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 20.0,
        mainAxisSpacing: 20.0,
        padding: const EdgeInsets.all(20.0),
        children: [
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, '/pantai');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue[700],
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            icon: const Icon(Icons.beach_access),
            label: const Text('Pantai'),
          ),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, '/gunung');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue[700],
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            icon: const Icon(Icons.terrain),
            label: const Text('Gunung'),
          ),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, '/budaya');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue[700],
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            icon: const Icon(Icons.museum),
            label: const Text('Budaya'),
          ),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, '/kuliner');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue[700],
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            icon: const Icon(Icons.restaurant),
            label: const Text('Kuliner'),
          ),
        ],
      ),
    );
  }
}

class MenuPage extends StatelessWidget {
  final String menuTitle;
  final IconData icon;

  const MenuPage({super.key, required this.menuTitle, required this.icon});

  static List<Map<String, String>> getDummyDataFor(String title) {
    if (title == 'Pantai') {
      return [
        {
          'title': 'Pantai Kuta',
          'description': 'Pantai Kuta adalah jantung pariwisata Bali yang terkenal di seluruh dunia sebagai surga matahari terbenam (sunset) dan pusat selancar internasional. Berada di pesisir barat Kabupaten Badung, pantai berpasir putih ini membentang luas membentuk bulan sabit dengan ombak Samudra Hindia yang bergulung landai, menjadikannya tempat paling ideal bagi para peselancar pemula maupun profesional.\n\nSeiring berjalannya waktu, Pantai Kuta telah bertransformasi menjadi destinasi modern tanpa kehilangan pesona alamnya. Jalur pedestrian tepi pantai yang rapi berbatasan langsung dengan deretan pusat perbelanjaan mewah, restoran kelas dunia, hingga pasar seni lokal. Saat senja tiba, langit Kuta berubah menjadi kanvas jingga yang dramatis, mengundang ribuan wisatawan untuk duduk bersantai di atas pasir hangat sambil menikmati atmosfer liburan yang hidup dan tak terlupakan.',
          'image': 'assets/pantai_kuta.jpg',
        },
        {
          'title': 'Pantai Sanur',
          'description': 'Pantai Sanur adalah ikon pariwisata klasik Bali yang terkenal di seluruh dunia sebagai surga matahari terbit (sunrise) yang tenang dan damai. Berbeda kontras dengan Pantai Kuta yang ramai, pantai yang terletak di timur Kota Denpasar ini menawarkan garis pantai berpasir putih bersih dengan ombak yang sangat tenang berkat perlindungan gugusan terumbu karang di lepas pantai.\n\nSuasana di Pantai Sanur sangat ramah keluarga dan cocok untuk wisatawan yang mencari relaksasi. Pantai ini dilengkapi dengan jalur pedestrian (jogging track) sepanjang sekira 8 kilometer yang membentang di tepi pantai, ideal untuk bersepeda santai atau berjalan kaki di pagi hari sembari menikmati semburat fajar. Di sepanjang pesisir, Anda akan menemukan deretan perahu tradisional jukung yang ikonik, resor-resor legendaris, serta warung kuliner lokal yang menyajikan hidangan autentik khas Bali. Selain itu, Sanur juga menjadi gerbang utama (pelabuhan penyeberangan) bagi wisatawan yang ingin menyeberang menuju pulau Nusa Penida dan Nusa Lembongan.',
          'image': 'assets/pantai_sanur.jpg',
        },
      ];
    } else if (title == 'Gunung') {
      return [
        {
          'title': 'Gunung Rinjani',
          'description': 'Gunung Rinjani adalah gunung berapi aktif tertinggi kedua di Indonesia yang terkenal di dunia sebagai salah satu destinasi pendakian paling spektakuler dan menantang di Asia Tenggara. Menjulang setinggi 3.726 meter di atas permukaan laut di Pulau Lombok, Nusa Tenggara Barat, gunung ini merupakan bagian dari kawasan Taman Nasional Gunung Rinjani yang menyimpan kekayaan keanekaragaman hayati dan lanskap alam yang luar biasa.\n\nDaya tarik utama yang menjadi mahkota Gunung Rinjani adalah Segara Anak, sebuah danau kaldera raksasa berwarna biru kehijauan yang berada di ketinggian sekitar 2.000 mdpl. Di tengah danau ini, terdapat gunung berapi baru yang aktif bernama Gunung Barujari. Para pendaki dari berbagai belahan dunia datang demi menaklukkan jalur terjal menuju puncak tertinggi untuk menyaksikan panorama matahari terbit yang magis di atas awan, sembari memandang siluet Gunung Agung di Bali dan Gunung Tambora di Sumbawa dari kejauhan.agi kaum adat Sasak dan umat Hindu, Rinjani juga merupakan tempat suci yang sarat akan nilai spiritual.',
          'image': 'assets/gunung_rinjani.jpg',
        },
        {
          'title': 'Gunung Bromo',
          'description': 'Gunung Bromo adalah ikon pariwisata Jawa Timur yang terkenal di dunia sebagai surga matahari terbit dengan lanskap vulkanik paling dramatis dan magis di Indonesia. Menjulang setinggi 2.329 meter di atas permukaan laut di dalam kawasan Taman Nasional Bromo Tengger Semeru, gunung berapi aktif ini berdiri megah di tengah kaldera raksasa yang disebut Lautan Pasir.\n\nDaya tarik utama Bromo terletak pada kombinasi keindahan alam dan budayanya yang unik. Wisatawan dari berbagai belahan dunia rela berburu sunrise legendaris dari puncak Penanjakan, di mana kabut tebal yang menyelimuti lautan pasir membuat Gunung Bromo, Gunung Batok, dan latar belakang Gunung Semeru tampak seperti negeri di atas awan. Selain menikmati pemandangan dari kejauhan, Anda bisa menunggangi kuda atau menaiki mobil Jip 4x4 untuk menyeberangi lautan pasir, menaiki tangga menuju bibir kawah yang aktif, serta merasakan kearifan lokal suku Tengger yang menyucikan gunung ini melalui upacara adat Yadnya Kasada.',
          'image': 'assets/gunung_bromo.jpg',
        },
      ];
    } else if (title == 'Budaya') {
      return [
        {
          'title': 'Candi Borobudur',
          'description': 'Candi Borobudur adalah monumen Buddha terbesar di dunia yang diakui sebagai Situs Warisan Dunia UNESCO dan mahakarya arsitektur kuno tiada tanding. Terletak di Magelang, Jawa Tengah, candi megah ini dibangun pada abad ke-8 oleh Dinasti Syailendra, menggunakan jutaan balok batu andesit yang disusun presisi tanpa menggunakan semen atau perekat modern.\n\nStruktur bangunan Borobudur berbentuk punden berundak yang melambangkan kosmologi Buddha, terdiri dari sembilan platform (enam bujur sangkar dan tiga lingkaran) yang dipuncaki oleh sebuah stupa utama yang besar. Dinding-dindingnya dihiasi oleh 2.672 panel relief yang sangat detail—membentuk narasi epik tentang kehidupan Buddha dan ajaran dharma—serta 504 arca Buddha yang anggun. Selain nilai sejarah dan spiritualnya yang magis saat diselimuti kabut pagi, Borobudur juga menjadi pusat perayaan Hari Raya Waisak nasional yang menarik ribuan biksu dan wisatawan dari seluruh dunia setiap tahunnya.',
          'image': 'assets/candi_borobudur.jpg',
        },
      ];
    } else if (title == 'Kuliner') {
      return [
        {
          'title': 'Rumah Masakan Padang',
          'description': 'Rumah Makan Padang adalah ikon kuliner Nusantara terkaya yang terkenal di seluruh dunia sebagai simbol kelezatan masakan Minangkabau dengan tradisi penyajian yang unik. Menawarkan petualangan rasa yang berani, restoran ini menyajikan hidangan kaya rempah, bersantan kental, dan bercita rasa pedas gurih yang autentik, dengan Rendang—yang berulang kali dinobatkan sebagai salah satu makanan terlezat di dunia—sebagai primadonanya.\n\nDaya tarik utama Rumah Makan Padang terletak pada pengalaman visual dan budayanya yang khas. Di bagian depan toko, Anda akan selalu disambut oleh etalase kaca dengan piring-piring lauk yang disusun bertingkat tinggi (display piring yang memikat mata). Selain itu, daya tarik magisnya ada pada Tradisi Hidang, di mana para pelayan dengan lihai membawa belasan piring lauk sekaligus di atas satu lengan tanpa terjatuh, lalu menyajikannya langsung di meja makan agar pengunjung bisa memilih dan hanya membayar apa yang mereka makan. Mulai dari ayam pop, gulai tunjang, hingga sambal hijau, Rumah Makan Padang bukan sekadar tempat makan, melainkan representasi kehangatan budaya Indonesia.',
          'image': 'assets/rumah_makan_padang.jpg',
        },
      ];
    }

    return [];
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> items = getDummyDataFor(menuTitle);

    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar $menuTitle'),
        backgroundColor: Colors.blue[700],
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12.0),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16.0),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(8.0),
                  ),
                  child: Image.asset(
                    item['image']!,
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['title']!,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        item['description']!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                      const SizedBox(height: 16),
                      Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              '/detail',
                              arguments: item['title'],
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue[700],
                            foregroundColor: Colors.white,
                          ),
                          child: const Text('Lihat Detail'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final String wisataName =
        ModalRoute.of(context)!.settings.arguments as String;

    final List<Map<String, String>> allData = [
      ...MenuPage.getDummyDataFor('Pantai'),
      ...MenuPage.getDummyDataFor('Gunung'),
      ...MenuPage.getDummyDataFor('Budaya'),
      ...MenuPage.getDummyDataFor('Kuliner'),
    ];

    final wisata = allData.firstWhere(
      (item) => item['title'] == wisataName,
      orElse: () => {
        'title': wisataName,
        'description': 'Deskripsi belum tersedia untuk tempat wisata ini.',
        'image': 'assets/default.jpg',
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(wisata['title']!),
        backgroundColor: Colors.blue[700],
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              wisata['image']!,
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    wisata['title']!,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Informasi Lengkap:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 6),

                  Text(
                    wisata['description']!,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black87,
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[700],
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: const Text('Kembali'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
