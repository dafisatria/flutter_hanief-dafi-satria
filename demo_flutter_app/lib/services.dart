import 'package:demo_flutter_app/models/contact_models.dart';
import 'package:dio/dio.dart';
import 'package:flutter/rendering.dart';

class MyService {
  final Dio dio = Dio();

  Future createUser({required String name, required String phone}) async {
    try {
      final Response response = await dio.post(
        "https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts",
        data: {'name': name, 'phone': phone},
      );
      debugPrint(response.data.toString());

      return ContactModels.fromJson(response.data);
    } catch (_) {
      rethrow;
    }
  }

  Future updateUser({required String name, required String phone}) async {
    try {
      final Response response = await dio.put(
        "https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts/2",
        data: {'name': name, 'phone': phone},
      );
      debugPrint(response.data.toString());

      return ContactModels.fromJson(response.data);
    } catch (_) {
      rethrow;
    }
  }

  Future secondUpdateUser(
      {required String title,
      required String body,
      required int userId}) async {
    try {
      final Response response = await dio.put(
        "https://jsonplaceholder.typicode.com/posts/1",
        data: {'title': title, 'body': body, 'userId': userId},
      );
      debugPrint(response.data.toString());

      return response.data;
    } catch (_) {
      rethrow;
    }
  }

  Future fetchImage() async {
    try {
      final Response response =
          await dio.get('https://api.dicebear.com/6.x/pixel-art/svg');
      debugPrint(response.data.toString());
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
