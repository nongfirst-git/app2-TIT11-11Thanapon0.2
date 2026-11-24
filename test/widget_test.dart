import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:app2_tit11_11/main.dart';

class TestHttpOverrides extends HttpOverrides {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = TestHttpOverrides();

  testWidgets('HomePage renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('หน้าแรก'), findsOneWidget);
    expect(find.text('Hello'), findsNWidgets(4));
    expect(find.text('ปุ่ม 1'), findsOneWidget);
    expect(find.text('ปุ่ม 2'), findsOneWidget);
  });
}
