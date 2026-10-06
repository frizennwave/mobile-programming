import 'dart:vmservice_io';

String printAgeCategory(int age) {
  if (age < 12) {
    return "Anak-anak";
  } else if (age >= 12 && age <= 17) {
    return "Remaja";
  } else if (age >= 18 && age <= 64) {
    return "Dewasa";
  } else if (age >= 65) {
    return "Lansia";
  } else {
    return "Input $age tidak valid.";
  }
}

void printNumbers() {
  for (int i = 1; i <= 50; i++) {
    print(i);
  }
}

void printMultipleOfThree() {
  int angka = 3;

  while (angka <= 15) {
    print(angka);

    angka += 3;
  }
}

String printTotalHariPerBulan(int bulan) {
  switch (bulan) {
    case 1:
      return '31';
    case 2:
      return '28/29';
    case 3:
      return '31';
    case 4:
      return '30';
    case 5:
      return '31';
    case 6:
      return '30';
    case 7:
      return '31';
    case 8:
      return '31';
    case 9:
      return '30';
    case 10:
      return '31';
    case 11:
      return '30';
    case 12:
      return '31';
    default:
      return 'Invalid';
  }
}
