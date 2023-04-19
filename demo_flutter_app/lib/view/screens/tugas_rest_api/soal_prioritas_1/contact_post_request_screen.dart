import 'package:demo_flutter_app/view/screens/tugas_rest_api/soal_prioritas_1/contact_post_request_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class ContactPostScreen extends StatefulWidget {
  const ContactPostScreen({super.key});

  @override
  State<ContactPostScreen> createState() => _ContactPostScreenState();
}

class _ContactPostScreenState extends State<ContactPostScreen> {
  @override
  Widget build(BuildContext context) {
    ContactPostRequestViewModel viewModel =
        Provider.of<ContactPostRequestViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('REST API'),
      ),
      body: body(viewModel),
    );
  }

  Widget body(ContactPostRequestViewModel viewModel) {
    final isLoading = viewModel.state == ContactPostRequestViewState.loading;
    final isError = viewModel.state == ContactPostRequestViewState.error;

    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (isError) {
      return const Center(
        child: Text('Gagal mengambil data'),
      );
    }
    return mainData(viewModel);
  }
}

Widget mainData(ContactPostRequestViewModel viewModel) {
  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: viewModel.formKey,
        child: Column(
          children: [
            TextFormField(
              controller: viewModel.nameController,
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
              controller: viewModel.phoneController,
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
              controller: viewModel.statusController,
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
                await viewModel.post(
                    name: viewModel.nameController.text,
                    phone: viewModel.phoneController.text,
                    status: viewModel.statusController.text);
              },
              child: const Text('Post'),
            ),
            ElevatedButton(
              onPressed: () async {
                await viewModel.put(
                  name: viewModel.nameController.text,
                  phone: viewModel.phoneController.text,
                );
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
                      SizedBox(
                          width: 220, child: Text(': ${viewModel.users?.name}'))
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
                      SizedBox(
                          width: 220,
                          child: Text(': ${viewModel.users?.phone}'))
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
                          width: 220,
                          child: Text(': ${viewModel.users?.status}'))
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
