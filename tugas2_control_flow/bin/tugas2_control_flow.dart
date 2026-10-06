import 'package:tugas2_control_flow/tugas2_control_flow.dart'
    as tugas2_control_flow;

void main(List<String> arguments) {
  print("\n============== IF-ELSE ==============");
  int age = 18;
  print(
    "Kategori Umur: $age masuk dalam kategori ${tugas2_control_flow.printAgeCategory(age)}",
  );

  print("\n============== FOR ==============");
  print("Angka 1-50: ");
  tugas2_control_flow.printNumbers();

  print("\n============== WHILE ==============");
  print("Kelipatan 3: ");
  tugas2_control_flow.printMultipleOfThree();

  print("\n============== SWITCH-CASE ==============");
  var bulan = 3;
  print(
    "Total hari pada bulan ke-$bulan: ${tugas2_control_flow.printTotalHariPerBulan(bulan)} hari",
  );
}
