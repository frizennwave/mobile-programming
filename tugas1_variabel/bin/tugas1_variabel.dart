import 'package:tugas1_variabel/tugas1_variabel.dart' as tugas1_variabel;

// function yang dipanggil pertama kali ketika program dijalankan.
void main(List<String> arguments) {
  var a = 10;
  var b = 5;

  print('\n');
  print('Penjumlahan $a + $b = ${tugas1_variabel.addition(a, b)}');
  print('Pengurangan $a - $b = ${tugas1_variabel.subtraction(a, b)}');
  print('Perkalian $a * $b = ${tugas1_variabel.multiplication(a, b)}');
  print('Pembagian $a / $b = ${tugas1_variabel.division(a, b)}');
}
