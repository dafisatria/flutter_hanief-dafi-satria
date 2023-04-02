import 'dart:io';
import 'package:demo_flutter_app/models/data_form.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';

class ContactProvider with ChangeNotifier {
  var formKey = GlobalKey<FormState>();
  final inputControllerName = TextEditingController();
  final inputControllerNumber = TextEditingController();
  final inputControllerDate = TextEditingController();
  List listOfContact = <Contacts>[];
  int indexUser = -1;
  var regExp = RegExp(r"\w+(\'\w+)?");
  final DateTime dueDate = DateTime.now();
  final currentDate = DateTime.now();
  Color currentColor = const Color(0xff6200EE);
  String? pathFiles;
  dynamic placeHolder;

  void editContact(int index) {
    inputControllerName.text = listOfContact[index].name;
    inputControllerNumber.text = listOfContact[index].number;
    inputControllerDate.text = listOfContact[index].date;
    currentColor = listOfContact[index].colors;
    placeHolder = listOfContact[index].file;
    indexUser = index;
    notifyListeners();
  }

  void deleteContact(int index) {
    listOfContact.removeAt(index);
    notifyListeners();
  }

  void colorChanged(color) {
    currentColor = color;
    notifyListeners();
  }

  void addContact() {
    if (formKey.currentState!.validate()) {
      Contacts contact = Contacts(
        name: inputControllerName.text,
        number: inputControllerNumber.text,
        date: inputControllerDate.text,
        colors: currentColor,
        file: placeHolder,
      );

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
        listOfContact[indexUser].number = contact.number;
        listOfContact[indexUser].date = contact.date;
        listOfContact[indexUser].colors = contact.colors;
        listOfContact[indexUser].file = contact.file;
        indexUser = -1;
      }
      inputControllerName.clear();
      inputControllerNumber.clear();
      inputControllerDate.clear();
      currentColor = const Color(0xff6200EE);
      placeHolder = null;
    }
    notifyListeners();
  }

  String? nameValidator(value) {
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
  }

  String? numberValidator(value) {
    final splitted = value!.split('');
    if (value.isEmpty) {
      return 'Enter your number!';
    } else if (splitted.length < 8 || splitted.length > 15) {
      return 'Too short/Too long';
    } else if (!RegExp('[0]').hasMatch(splitted[0])) {
      return 'You must enter "0" in first number';
    }
    return null;
  }

  String? dateValidator(value) {
    if (value!.isEmpty) {
      return 'Enter your date of birth!';
    }
    return null;
  }

  void filePicker() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);
    if (result == null) return;
    // final files = result.files;
    pathFiles = result.files.first.path.toString();
    placeHolder = FileImage(File(pathFiles!));
  }
}
