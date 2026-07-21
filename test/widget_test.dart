import 'package:flutter_test/flutter_test.dart';
import 'package:ride_booking/main.dart';

void main() {
  testWidgets('App should render', (WidgetTester tester) async {
    await tester.pumpWidget(const ZeroTransApp());
    expect(find.byType(ZeroTransApp), findsOneWidget);
  });
}
