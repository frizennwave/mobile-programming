class Catatan {
  final String id;
  final String judul;
  final String isi;
  final DateTime waktu;

  Catatan({
    required this.id,
    required this.judul,
    required this.isi,
    required this.waktu,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'judul': judul,
    'isi': isi,
    'waktu': waktu.toIso8601String(),
  };

  factory Catatan.fromJson(Map<String, dynamic> json) {
    final parsedId =
        json['id']?.toString() ??
        json['waktu']?.toString() ??
        DateTime.now().toIso8601String();
    final parsedJudul =
        json['judul']?.toString() ??
        (json['isi'] != null && json['isi'].toString().isNotEmpty
            ? json['isi'].toString().split('\n').first
            : 'Tanpa Judul');
    final parsedIsi = json['isi']?.toString() ?? '';

    DateTime parsedWaktu;
    try {
      parsedWaktu = json['waktu'] != null
          ? DateTime.parse(json['waktu'] as String)
          : DateTime.now();
    } catch (_) {
      parsedWaktu = DateTime.now();
    }

    return Catatan(
      id: parsedId,
      judul: parsedJudul,
      isi: parsedIsi,
      waktu: parsedWaktu,
    );
  }
}
