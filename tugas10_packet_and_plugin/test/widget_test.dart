import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:tugas10_packet_and_plugin/main.dart';

void main() {
  testWidgets('Test aplikasi catatan harian berjalan', (
    WidgetTester tester,
  ) async {
    await initializeDateFormatting('id_ID', null);
    await tester.pumpWidget(const CatatanApp());
    await tester.pumpAndSettle();

    expect(find.text('Catatan Harian'), findsOneWidget);
  });
}
