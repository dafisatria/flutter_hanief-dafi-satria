import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';

class MyContact extends StatefulWidget {
  const MyContact({super.key});

  @override
  State<MyContact> createState() => _MyContactState();
}

class Contacts {
  String name;
  String number;
  String date;
  Color colors;
  dynamic file;
  Contacts({
    required this.name,
    required this.number,
    required this.date,
    required this.colors,
    required this.file,
  });
}

class _MyContactState extends State<MyContact> {
  var formKey = GlobalKey<FormState>();
  final inputControllerName = TextEditingController();
  final inputControllerNumber = TextEditingController();
  final inputControllerDate = TextEditingController();
  // Map listOfContact = <String, String>{};
  List listOfContact = <Contacts>[];
  int indexUser = -1;
  var regExp = RegExp(r"\w+(\'\w+)?");
  final DateTime _dueDate = DateTime.now();
  final currentDate = DateTime.now();
  Color _currentColor = Color(0xff6200EE);
  String textt = '';
  dynamic placeholder = NetworkImage('');
  bool profile = true;

  void editContact(int index) {
    setState(() {
      inputControllerName.text = listOfContact[index].name;
      inputControllerNumber.text = listOfContact[index].number;
      inputControllerDate.text = listOfContact[index].date;
      _currentColor = listOfContact[index].colors;
      placeholder = listOfContact[index].file;
      indexUser = index;
    });
  }

  void deleteContact(int index) {
    setState(() {
      listOfContact.removeAt(index);
    });
  }

  // void _pickFile() async {
  //   final result = await FilePicker.platform.pickFiles();
  //   if (result == null) return;
  // }

  Widget listContact(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 49),
      child: Column(
        children: [
          const Text(
            'List Contacts',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 15,
          ),
          ListView.separated(
            shrinkWrap: true,
            itemCount: listOfContact.length,
            itemBuilder: (context, index) {
              return ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                  side: BorderSide(
                      color: listOfContact[index].colors, width: 1.5),
                ),
                leading: (listOfContact[index].file == null)
                    ? CircleAvatar(
                        backgroundColor: Color(0xffEADDFF),
                        foregroundColor: Color(0xff21005D),
                        child: Text(listOfContact[index].name[0]),
                      )
                    : CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: SizedBox(
                          width: 60,
                          height: 60,
                          child: ClipOval(
                            child: Image(
                              image: listOfContact[index].file,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                title: Text(
                  listOfContact[index].name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff1C1B1F),
                  ),
                ),
                subtitle: Text(
                  '+62-${listOfContact[index].number} | ${listOfContact[index].date}',
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
                      onPressed: () => editContact(index),
                      icon: const Icon(Icons.mode_edit_outlined),
                      color: listOfContact[index].colors,
                    ),
                    IconButton(
                      onPressed: () => deleteContact(index),
                      icon: const Icon(Icons.delete_outline_outlined),
                      color: listOfContact[index].colors,
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) => SizedBox(
              height: 5,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Contacts',
        ),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Container(
            padding:
                const EdgeInsets.only(left: 17, top: 30, right: 17, bottom: 17),
            child: Center(
              child: Column(
                children: [
                  const Icon(
                    Icons.mobile_friendly_rounded,
                    size: 24,
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  const Text(
                    'Create New Contacts',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    'A dialog is a type of modal window that appears in\nfront of app content to provide critical information, or\nprompt for a decision to be made.',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  const Divider(
                    color: Color(0xffCAC4D0),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    textCapitalization: TextCapitalization.words,
                    validator: (value) {
                      final wordscount = regExp.allMatches(value!).length;
                      final splitted = value.split('');
                      if (value.isEmpty) {
                        return 'Enter your name!';
                      } else if (wordscount < 2) {
                        return 'Too short';
                      } else if (!RegExp('.*[A-Z].*').hasMatch(splitted[0])) {
                        return 'You must use Capitalize in first letter';
                      }
                      return null;
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp(r'[a-zA-Z]+|\s'),
                      ),
                    ],
                    controller: inputControllerName,
                    decoration: const InputDecoration(
                      hintText: 'Insert Your Name',
                      labelText: 'Name',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      filled: true,
                      fillColor: Color(0xffE7E0EC),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      final splitted = value!.split('');
                      if (value.isEmpty) {
                        return 'Enter your number!';
                      } else if (splitted.length < 8 || splitted.length > 15) {
                        return 'Too short/Too long';
                      } else if (!RegExp('[0]').hasMatch(splitted[0])) {
                        return 'You must enter "0" in first number';
                      }
                      return null;
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp(r'[0-9]'),
                      ),
                    ],
                    controller: inputControllerNumber,
                    decoration: const InputDecoration(
                      hintText: '+62...',
                      labelText: 'Number',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      filled: true,
                      fillColor: Color(0xffE7E0EC),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter your date of birth!';
                            }
                            return null;
                          },
                          controller: inputControllerDate,
                          decoration: InputDecoration(
                            hintText: DateFormat('dd-MM-yyyy').format(_dueDate),
                            labelText: 'Date',
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            filled: true,
                            fillColor: const Color(0xffE7E0EC),
                            suffixIcon:
                                const Icon(Icons.calendar_month_outlined),
                          ),
                          onTap: () async {
                            final selectDate = await showDatePicker(
                              context: context,
                              initialDate: currentDate,
                              firstDate: DateTime(1990),
                              lastDate: DateTime(currentDate.year + 5),
                            );
                            if (selectDate != null) {
                              String formattedDate =
                                  DateFormat('dd-MM-yyyy').format(selectDate);
                              setState(
                                () {
                                  inputControllerDate.text = formattedDate;
                                },
                              );
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(_currentColor),
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('Pick Your Color'),
                                content: SingleChildScrollView(
                                  child: BlockPicker(
                                    pickerColor: _currentColor,
                                    onColorChanged: (color) {
                                      setState(() {
                                        _currentColor = color;
                                      });
                                    },
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Save'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: const Text('Pick Color'),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        final result = await FilePicker.platform
                            .pickFiles(allowMultiple: false);
                        if (result == null) return;
                        final files = result
                            .files; //EDIT: THIS PROBABLY CAUSED YOU AN ERROR
                        textt = result.files.first.path.toString();
                        placeholder = FileImage(File(textt));
                        // setState(() {});
                      },
                      child: const Text('Pick File'),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            Contacts contact = Contacts(
                              name: inputControllerName.text,
                              number: inputControllerNumber.text,
                              date: inputControllerDate.text,
                              colors: _currentColor,
                              file: placeholder,
                            );
                            setState(
                              () {
                                if (indexUser == -1) {
                                  listOfContact.add(
                                    Contacts(
                                      name: contact.name,
                                      number: contact.number,
                                      date: contact.date,
                                      colors: contact.colors,
                                      file: contact.file,
                                    ),
                                  );
                                } else {
                                  listOfContact[indexUser].name = contact.name;
                                  listOfContact[indexUser].number =
                                      contact.number;
                                  listOfContact[indexUser].date = contact.date;
                                  listOfContact[indexUser].colors =
                                      contact.colors;
                                  listOfContact[indexUser].file = contact.file;
                                  indexUser = -1;
                                }
                                inputControllerName.clear();
                                inputControllerNumber.clear();
                                inputControllerDate.clear();
                                _currentColor = Color(0xff6200EE);
                                placeholder = null;
                              },
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                          fixedSize: const Size(94, 40),
                        ),
                        child: const Text('Submit'),
                      ),
                    ],
                  ),
                  listContact(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
