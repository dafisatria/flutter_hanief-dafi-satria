import 'package:demo_flutter_app/screens/tugas_form/new_contact.dart';
import 'package:demo_flutter_app/screens/tugas_storage/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/form_detail.dart';
import '../../providers/new_contact_providers.dart';
import 'detail_contact.dart';

class ListContact extends StatefulWidget {
  const ListContact({
    super.key,
  });

  @override
  State<ListContact> createState() => _ListContactState();
}

class _ListContactState extends State<ListContact> {
  late SharedPreferences loginData;
  String username = '';
  String password = '';

  @override
  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    loginData = await SharedPreferences.getInstance();
    setState(() {
      username = loginData.getString('username').toString();
      password = loginData.getString('password').toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'List Contacts',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Consumer<ContactProvider>(builder: (context, providers, _) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Hello, $username',
                style: const TextStyle(fontSize: 24),
              ),
              ListView.separated(
                shrinkWrap: true,
                itemCount: providers.listOfContact.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(pageBuilder:
                            (context, animation, secondaryAnimation) {
                          return DetailContact(
                            parameter: DetailContactData(
                              providers.listOfContact[index].name,
                              providers.listOfContact[index].number,
                              providers.listOfContact[index].file,
                            ),
                          );
                        }, transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          final tween = Tween(
                              begin: const Offset(0, .5), end: Offset.zero);
                          return SlideTransition(
                            position: animation.drive(tween),
                            child: child,
                          );
                        }),
                      );
                    },
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                        side: BorderSide(
                            color: providers.listOfContact[index].colors,
                            width: 1.5),
                      ),
                      leading: (providers.listOfContact[index].file == null)
                          ? CircleAvatar(
                              backgroundColor: const Color(0xffEADDFF),
                              foregroundColor: const Color(0xff21005D),
                              child:
                                  Text(providers.listOfContact[index].name[0]),
                            )
                          : CircleAvatar(
                              backgroundColor: Colors.transparent,
                              child: SizedBox(
                                width: 60,
                                height: 60,
                                child: ClipOval(
                                  child: Image(
                                    image: providers.listOfContact[index].file,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                      title: Text(
                        providers.listOfContact[index].name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff1C1B1F),
                        ),
                      ),
                      subtitle: Text(
                        '+62-${providers.listOfContact[index].number} | ${providers.listOfContact[index].date}',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff49454F),
                        ),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () => providers.editContact(index),
                            icon: const Icon(Icons.mode_edit_outlined),
                            color: providers.listOfContact[index].colors,
                          ),
                          IconButton(
                            onPressed: () => providers.deleteContact(index),
                            icon: const Icon(Icons.delete_outline_outlined),
                            color: providers.listOfContact[index].colors,
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(
                  height: 5,
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    loginData.setBool('login', true);
                    loginData.remove('username');
                    loginData.remove('password');
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                  child: const Text('Logout'),
                ),
              ),
            ],
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) {
              return const MyContact();
            }, transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
              final tween = Tween(begin: 0.0, end: 1.0);
              return ScaleTransition(
                scale: animation.drive(tween),
                child: child,
              );
            }),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
