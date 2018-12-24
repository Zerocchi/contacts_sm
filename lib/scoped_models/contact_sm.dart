import 'package:flutter/widgets.dart';

import 'package:scoped_model/scoped_model.dart';

import 'package:contacts_sm/models/contact.dart';
import 'package:contacts_sm/services/api_fetcher.dart';

class ContactScopedModel extends Model {
  Future<List<Contact>> _contacts;
  Future<List<Contact>> get contacts => _contacts;

  set contacts(Future<List<Contact>> value) {
    _contacts = value;
    notifyListeners();
  }

  Contact _selectedContact;
  Contact get selectedContact => _selectedContact;
  set selectedContact(Contact value) {
    _selectedContact = value;
    notifyListeners();
  }

  static ContactScopedModel of(BuildContext context) =>
      ScopedModel.of<ContactScopedModel>(context);

  Future<bool> getContacts() async {
    contacts = ApiFetcher.fetchContacts();
    return contacts != null;
  }
}

