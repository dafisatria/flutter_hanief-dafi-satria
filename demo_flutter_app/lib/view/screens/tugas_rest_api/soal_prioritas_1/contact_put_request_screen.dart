import 'package:demo_flutter_app/model/contact_put_models.dart';
import 'package:demo_flutter_app/model/api/services_api.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ContactPutScreen extends StatefulWidget {
  const ContactPutScreen({super.key});

  @override
  State<ContactPutScreen> createState() => _ContactPutScreenState();
}

class _ContactPutScreenState extends State<ContactPutScreen> {
  final MyService service = MyService();
  ContactPutModels? users;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();
  final TextEditingController userIdController = TextEditingController();

  Future put({
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
        title: const Text('SECOND TEST API'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
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
                const SizedBox(
                  height: 10,
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
                const SizedBox(
                  height: 10,
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
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    int userId = int.parse(userIdController.text);
                    await put(
                      title: titleController.text,
                      body: bodyController.text,
                      userId: userId,
                    );
                    setState(() {
                      service;
                    });
                  },
                  child: const Text('Put'),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.purple[100],
                  ),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: 50,
                            child: Text('Title',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          SizedBox(width: 220, child: Text(': ${users?.title}'))
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: 50,
                            child: Text('Body',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          SizedBox(width: 220, child: Text(': ${users?.body}'))
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: 50,
                            child: Text('User ID',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          SizedBox(
                              width: 220, child: Text(': ${users?.userId}'))
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xff6200EE)),
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/image-generator');
                    },
                    icon: const Icon(Icons.arrow_forward_ios_rounded),
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
