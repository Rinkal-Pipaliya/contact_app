import 'package:contact_app/screens/home/model/home_model.dart';
import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  List<ContactModel> contactList = [];

  int selectedIndex = 0;

  void changeIndex(int index) {
    selectedIndex = index;
  }

  void addContact(ContactModel contact) {
    contactList.add(contact);
    notifyListeners();
  }

  void deleteContact(int index) {
    contactList.removeAt(index);
    notifyListeners();
  }

  void updateContact(ContactModel model) {
    contactList[selectedIndex] = model;
    notifyListeners();
  }
}
