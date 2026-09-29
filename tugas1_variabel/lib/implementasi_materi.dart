/* ======================= BAB: VARIABEL ========================== */
void kata() {
  var kata = 'Hello World';

  // boleh juga print("$kata");
  print(kata);
}

void angka() {
  var angka = 80;

  print(angka);
}

void cetakTanggalLahir() {
  final tglLahir = '1996-01-01';

  print(tglLahir);
}

void cetakTglSekarang() {
  final tglSekarang = DateTime.now();

  print(tglSekarang);
}

void cetakJmlHariSeminggu() {
  const jmlHariSeminggu = 7;

  print(jmlHariSeminggu);
}

/* late dan late final digunakan untuk membuat variabel yang
    dapat ditunda pengisian nilainya.

    contoh:
    late String message;
    late final String title;
*/

/* ======================= BAB: TIPE DATA ========================== */
void penggunaanString() {
  String kata = 'Hello';
  String kata2 = 'World!';

  print('$kata + $kata2');
}

void penggunaanTipeLain() {
  int angka1 = 5;
  double angka2 = 5;
  num angka3 = 5.0;
  bool cek = true;

  print(angka1);
  print(angka2);
  print(angka3);
  print(cek);
}

/* ======================= BAB: OPERATOR ========================== */
void operatorMatematika() {
  var penjumlahan = 1 + 2;
  var pengurangan = 4 - 3;
  var perkalian = 4 * 3;
  var pembagian = 5 / 2;
  var pembagianHasilBulat = 5 ~/ 2;
  var modulus = 5 % 2;

  print(penjumlahan);
  print(pengurangan);
  print(perkalian);
  print(pembagian);
  print(pembagianHasilBulat);
  print(modulus);
}

void incrementDecrement() {
  var a = 2;
  var b = 7;

  a++;
  b--;

  print(a);
  print(b);
}

/* ======================= BAB: FUNCTION ========================== */
void functionTeks() {
  print("Teks di dalam fungsi");
}

void functionWithParams(String nama, String negara) {
  print("Hi, nama saya $nama, saya daru negara $negara");
}
