import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:contacts_sm/models/contact.dart';

class ApiFetcher {

  static const URL = "https://randomuser.me/api/?results=20";

  static final ApiFetcher _singleton = ApiFetcher._internal();
  factory ApiFetcher() => _singleton;
  ApiFetcher._internal();

  static Future<List<Contact>> fetchContacts() async {
    var response = await http.get(URL);
    List json = jsonDecode(response.body)["results"];
    return json.map((contact)=>Contact.fromJson(contact)).toList();
  }
}