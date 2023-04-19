import 'package:demo_flutter_app/model/api/services_api.dart';
import 'package:demo_flutter_app/model/food_models.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'food_api_test.mocks.dart';

@GenerateMocks([MyService])
void main() {
  MyService service = MockMyService();
  test('get all foods return data', () async {
    when(service.fetchFood()).thenAnswer(
      (_) async => <FoodModel>[
        FoodModel(id: 1, name: 'a'),
      ],
    );
    var foods = await service.fetchFood();
    expect(foods.isNotEmpty, true);
  });
}
