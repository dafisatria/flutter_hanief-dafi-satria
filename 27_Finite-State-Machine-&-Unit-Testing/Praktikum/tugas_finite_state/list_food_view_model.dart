import 'package:demo_flutter_app/model/api/services_api.dart';
import 'package:demo_flutter_app/model/food_models.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class FoodProvider with ChangeNotifier {
  List foods = <FoodModel>[];
  MyService service = MyService();

  Future get() async {
    try {
      foods = await service.fetchFood();
    } catch (e) {
      if (e is DioError) {
        e.response!.statusCode;
      }
    }
    notifyListeners();
  }
}
