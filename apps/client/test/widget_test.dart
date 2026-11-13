import 'package:flutter_test/flutter_test.dart';
import 'package:mbarani_client/app/mbarani_app.dart';

void main() {
  testWidgets('app shows MBarani dashboard', (tester) async {
    await tester.pumpWidget(const MbaraniApp());
    await tester.pumpAndSettle();

    expect(find.text('mbarani'), findsOneWidget);
    expect(find.text('Your connection,'), findsOneWidget);
    expect(find.text('Preview connect'), findsOneWidget);
  });
}
