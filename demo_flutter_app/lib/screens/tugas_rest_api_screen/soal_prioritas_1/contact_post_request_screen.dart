import 'package:demo_flutter_app/model/contact_post_models.dart';
import 'package:demo_flutter_app/model/api/services_api.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ContactPostScreen extends StatefulWidget {
  const ContactPostScreen({super.key});

  @override
  State<ContactPostScreen> createState() => _ContactPostScreenState();
}

class _ContactPostScreenState extends State<ContactPostScreen> {
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
    try {
      users = await service.createUser(
        name: name,
        phone: phone,
        status: status,
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
        title: const Text('REST API'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
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
                const SizedBox(
                  height: 10,
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
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: statusController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'Status',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter your status!';
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
                    await post(
                        name: nameController.text,
                        phone: phoneController.text,
                        status: statusController.text);
                    setState(() {
                      service;
                    });
                  },
                  child: const Text('Post'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    await put(
                      name: nameController.text,
                      phone: phoneController.text,
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
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: 50,
                            child: Text('Status',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          SizedBox(
                              width: 220, child: Text(': ${users?.status}'))
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
                      Navigator.of(context).pushNamed('/contact-put');
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
