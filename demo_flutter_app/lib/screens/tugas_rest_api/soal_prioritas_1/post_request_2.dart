import 'package:demo_flutter_app/models/contact_models.dart';
import 'package:demo_flutter_app/services.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class PostRequestScreen extends StatefulWidget {
  const PostRequestScreen({super.key});

  @override
  State<PostRequestScreen> createState() => _PostRequestScreenState();
}

class _PostRequestScreenState extends State<PostRequestScreen> {
  final MyService service = MyService();
  ContactModels? users;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();
  final TextEditingController userIdController = TextEditingController();

  Future post({
    required String title,
    required String body,
    required int userId,
  }) async {
    try {
      users = await service.secondUpdateUser(
          title: title, body: body, userId: userId);
    } catch (e) {
      if (e is DioError) {
        e.response!.statusCode;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rest Api'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: 'Title',
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r'[a-zA-Z]+|\s'),
                  ),
                ],
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter title!';
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                controller: bodyController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: 'Body',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter body!';
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                controller: userIdController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: 'User ID',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter User ID!';
                  } else {
                    return null;
                  }
                },
              ),
              ElevatedButton(
                onPressed: () async {
                  int userId = int.parse(userIdController.text);
                  await post(
                    title: titleController.text,
                    body: bodyController.text,
                    userId: userId,
                  );
                },
                child: const Text('Post'),
              ),
              // Container(
              //   padding: const EdgeInsets.all(15),
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(8),
              //     color: Colors.purple[100],
              //   ),
              //   child: Text()
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
