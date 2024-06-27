import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:poorlex/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group("end-to-end test", () {
    testWidgets(
      "app open",
      (widgetTester) async {
        await integrationInitialized();
        await widgetTester.pumpWidget(MyApp());
        final kakaoLogin = find.byKey(Key("kakao_login"));
        await widgetTester.tap(kakaoLogin);
        await widgetTester.pumpAndSettle(Duration(seconds: 7));

        final bottomButton = find.text("지출 추가하기");
        expect(bottomButton, findsOneWidget);
        await widgetTester.pumpAndSettle(Duration(seconds: 7));
      },
    );
  });
}
