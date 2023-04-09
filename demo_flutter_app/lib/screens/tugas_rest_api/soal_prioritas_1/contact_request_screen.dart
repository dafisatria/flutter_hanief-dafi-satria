import 'package:demo_flutter_app/models/contact_models.dart';
import 'package:demo_flutter_app/services.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ContactRequestScreen extends StatefulWidget {
  const ContactRequestScreen({super.key});

  @override
  State<ContactRequestScreen> createState() => _ContactRequestScreenState();
}

class _ContactRequestScreenState extends State<ContactRequestScreen> {
  final MyService service = MyService();
  ContactModels? users;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  Future post({
    required String name,
    required String phone,
  }) async {
    try {
      users = await service.createUser(
        name: name,
        phone: phone,
      );
    } catch (e) {
      if (e is DioError) {
        e.response!.statusCode;
      }
    }
  }

  Future put({
    required String name,
    required String phone,
  }) async {
    try {
      users = await service.updateUser(
        name: name,
        phone: phone,
      );
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
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: 'Name',
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r'[a-zA-Z]+|\s'),
                  ),
                ],
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter your name!';
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                controller: phoneController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: 'Phone',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter your number!';
                  } else {
                    return null;
                  }
                },
              ),
              ElevatedButton(
                onPressed: () async {
                  await post(
                    name: nameController.text,
                    phone: phoneController.text,
                  );
                },
                child: const Text('Post'),
              ),
              ElevatedButton(
                onPressed: () async {
                  await put(
                    name: nameController.text,
                    phone: phoneController.text,
                  );
                },
                child: const Text('Put'),
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
                          child: Text('Name',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        SizedBox(width: 220, child: Text(': ${users?.name}'))
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: 50,
                          child: Text('Phone',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        SizedBox(width: 220, child: Text(': ${users?.phone}'))
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
