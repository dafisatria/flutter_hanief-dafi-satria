import 'package:flutter/material.dart';
import '../../../../model/api/services_api.dart';
import '../../../../model/contact_post_models.dart';

enum ContactPostRequestViewState {
  none,
  loading,
  error,
}

class ContactPostRequestViewModel with ChangeNotifier {
  ContactPostRequestViewState state = ContactPostRequestViewState.none;
  final MyService service = MyService();
  ContactPostModels? users;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController statusController = TextEditingController();
  Future post({
    required String name,
    required String phone,
    required String status,
  }) async {
    changeState(ContactPostRequestViewState.loading);
    try {
      users = await service.createUser(
        name: name,
        phone: phone,
        status: status,
      );
      notifyListeners();
      changeState(ContactPostRequestViewState.none);
    } catch (e) {
      changeState(ContactPostRequestViewState.error);
      // if (e is DioError) {
      //   e.response!.statusCode;
      // }
    }
  }

  Future put({
    required String name,
    required String phone,
  }) async {
    try {
      changeState(ContactPostRequestViewState.loading);

      users = await service.updateUser(
        name: name,
        phone: phone,
      );
      notifyListeners();
      changeState(ContactPostRequestViewState.none);
    } catch (e) {
      changeState(ContactPostRequestViewState.error);

      // if (e is DioError) {
      //   e.response!.statusCode;
      // }
    }
  }

  changeState(ContactPostRequestViewState s) {
    state = s;
    notifyListeners();
  }
}
