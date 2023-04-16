import 'package:flutter/material.dart';

import '../widgets/about_us_widget.dart';
import '../widgets/drawer_widget.dart';
import '../widgets/email_field.dart';
import '../widgets/first_name_field.dart';
import '../widgets/last_name_field.dart';
import '../widgets/message_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Competence App'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[100],
      ),
      drawer: const DrawerWidget(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                SizedBox(
                  height: 603,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    'assets/background_splash.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, bottom: 110),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Welcome to Our App',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Scroll up to sign up so enjoy our best features \nin this application',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Contact us',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Need to get in touch with us? Either fill out the form\nwith your inquiry or find the department email you`d\nlike to contact below.',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: FirstNameField(
                                firstNameController: firstNameController),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: LastNameField(
                                lastNameController: lastNameController),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      EmailField(emailController: emailController),
                      const SizedBox(
                        height: 20,
                      ),
                      MessageField(messageController: messageController),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Thanks for your response'),
                            content: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      'Name : ${firstNameController.text} ${lastNameController.text}'),
                                  Text('Email : ${emailController.text}'),
                                  Text('Message : ${messageController.text}'),
                                ],
                              ),
                            ),
                            elevation: 24,
                          ),
                        );
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple[900],
                      fixedSize: const Size.fromWidth(100),
                    ),
                    child: const Text(
                      'Submit',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'About Us',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Our Best Direction',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            const AboutUsWidget(),
          ],
        ),
      ),
    );
  }
}
