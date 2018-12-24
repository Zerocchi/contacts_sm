import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';

import 'package:contacts_sm/models/contact.dart';
import 'package:contacts_sm/scoped_models/contact_sm.dart';

import 'package:contacts_sm/screens/details_page.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts"),
      ),
      body: ContactList(),
    );
  }
}

class ContactList extends StatefulWidget {
  @override
  _ContactListState createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {

  ContactScopedModel contactModel;

  @override
  void initState() {
    contactModel = ContactScopedModel();
    getContacts();
    super.initState();
  }

  getContacts() {
    contactModel.getContacts();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel<ContactScopedModel>(
      model: contactModel,
      child: Container(
        child: ScopedModelDescendant<ContactScopedModel>(
          builder: (BuildContext context, Widget child, ContactScopedModel model) {
            return FutureBuilder(
              future: model.contacts,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if(!snapshot.hasData) return Center(child: CircularProgressIndicator(),);
                else return ContactListWidget(contacts: snapshot.data, model: contactModel);
              }
            );
          },
        ) ,
      ),
    );
  }
}

class ContactListWidget extends StatelessWidget {

  final List<Contact> contacts;
  final ContactScopedModel model;

  ContactListWidget({this.contacts, this.model});

  @override
  Widget build(BuildContext context) {

    Contact contact;

    return ListView.builder(
      itemCount: contacts.length,
      itemBuilder: (BuildContext context, int index) {

        contact = contacts[index];

        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(contact.picture.thumbnail),
          ),
          title: Text("${contact.name.first} ${contact.name.last}"),
          subtitle: Text(contact.phone),
          // part 2
          //onTap: () {
          //  contact = contacts[index];
          //  ScopedModel.of<ContactScopedModel>(context, rebuildOnChange: true).selectedContact = contact;
          //  Navigator.push(
          //    context,
          //    MaterialPageRoute(builder: (context) => DetailsPage(model: model)),
          //  );
          //},
        );
      },
    );
  }
}