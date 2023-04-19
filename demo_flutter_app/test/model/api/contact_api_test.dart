import 'package:demo_flutter_app/model/api/services_api.dart';
import 'package:demo_flutter_app/model/contact_post_models.dart';
import 'package:test/test.dart';

void main() {
  MyService service = MyService();
  test('post contact return data', () async {
    var contacts = await service.createUser(
        name: 'Dafi', phone: '089384', status: 'taken');
    expect(contacts != null, true);
  });
}
