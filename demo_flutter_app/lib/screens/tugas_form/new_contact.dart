import 'dart:io';
import 'package:demo_flutter_app/models/data_form.dart';
import 'package:demo_flutter_app/models/form_detail.dart';
import 'package:demo_flutter_app/providers/new_contact_providers.dart';
import 'package:demo_flutter_app/screens/tugas_form/detail_contact.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class MyContact extends StatefulWidget {
  const MyContact({super.key});

  @override
  State<MyContact> createState() => _MyContactState();
}

class _MyContactState extends State<MyContact> {
  @override
  Widget build(BuildContext context) {
    final contactProvider =
        Provider.of<ContactProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Contacts',
        ),
      ),
      body: Form(
        key: contactProvider.formKey,
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
                    validator: (value) => contactProvider.nameValidator(value),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp(r'[a-zA-Z]+|\s'),
                      ),
                    ],
                    controller: contactProvider.inputControllerName,
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
                    validator: (value) =>
                        contactProvider.numberValidator(value),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp(r'[0-9]'),
                      ),
                    ],
                    controller: contactProvider.inputControllerNumber,
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
                          validator: (value) =>
                              contactProvider.dateValidator(value),
                          controller: contactProvider.inputControllerDate,
                          decoration: InputDecoration(
                            hintText: DateFormat('dd-MM-yyyy')
                                .format(contactProvider.dueDate),
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
                              initialDate: contactProvider.currentDate,
                              firstDate: DateTime(1990),
                              lastDate: DateTime(
                                  contactProvider.currentDate.year + 5),
                            );
                            if (selectDate != null) {
                              String formattedDate =
                                  DateFormat('dd-MM-yyyy').format(selectDate);

                              contactProvider.inputControllerDate.text =
                                  formattedDate;
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Consumer<ContactProvider>(
                          builder: (context, provider, _) {
                        return ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                provider.currentColor),
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Pick Your Color'),
                                  content: SingleChildScrollView(
                                    child: BlockPicker(
                                      pickerColor: provider.currentColor,
                                      onColorChanged: (color) =>
                                          provider.colorChanged(color),
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
                        );
                      }),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => contactProvider.filePicker(),
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
                        onPressed: () => contactProvider.addContact(),
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
                  Padding(
                    padding: const EdgeInsets.only(top: 49),
                    child: Column(
                      children: [
                        const Text(
                          'List Contacts',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Consumer<ContactProvider>(
                          builder: (context, providers, _) {
                            return ListView.separated(
                              shrinkWrap: true,
                              itemCount: providers.listOfContact.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      PageRouteBuilder(pageBuilder: (context,
                                          animation, secondaryAnimation) {
                                        return DetailContact(
                                          parameter: DetailContactData(
                                            providers.listOfContact[index].name,
                                            providers
                                                .listOfContact[index].number,
                                            providers.listOfContact[index].file,
                                          ),
                                        );
                                      }, transitionsBuilder: (context,
                                          animation,
                                          secondaryAnimation,
                                          child) {
                                        final tween = Tween(
                                            begin: const Offset(0, .5),
                                            end: Offset.zero);
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
                                          color: providers
                                              .listOfContact[index].colors,
                                          width: 1.5),
                                    ),
                                    leading: (providers
                                                .listOfContact[index].file ==
                                            null)
                                        ? CircleAvatar(
                                            backgroundColor:
                                                const Color(0xffEADDFF),
                                            foregroundColor:
                                                const Color(0xff21005D),
                                            child: Text(providers
                                                .listOfContact[index].name[0]),
                                          )
                                        : CircleAvatar(
                                            backgroundColor: Colors.transparent,
                                            child: SizedBox(
                                              width: 60,
                                              height: 60,
                                              child: ClipOval(
                                                child: Image(
                                                  image: providers
                                                      .listOfContact[index]
                                                      .file,
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
                                          onPressed: () =>
                                              providers.editContact(index),
                                          icon: const Icon(
                                              Icons.mode_edit_outlined),
                                          color: providers
                                              .listOfContact[index].colors,
                                        ),
                                        IconButton(
                                          onPressed: () =>
                                              providers.deleteContact(index),
                                          icon: const Icon(
                                              Icons.delete_outline_outlined),
                                          color: providers
                                              .listOfContact[index].colors,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      const SizedBox(
                                height: 5,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
