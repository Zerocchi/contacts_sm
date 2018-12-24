class Contact {
  String gender;
  Name name;
  Location location;
  String email;
  Login login;
  Dob dob;
  Registered registered;
  String phone;
  String cell;
  Id id;
  Picture picture;
  String nat;

  Contact(
      {this.gender,
      this.name,
      this.location,
      this.email,
      this.login,
      this.dob,
      this.registered,
      this.phone,
      this.cell,
      this.id,
      this.picture,
      this.nat});

  Contact.fromJson(Map<String, dynamic> json) {
    gender = json['gender'];
    name = json['name'] != null ? new Name.fromJson(json['name']) : null;
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    email = json['email'];
    login = json['login'] != null ? new Login.fromJson(json['login']) : null;
    dob = json['dob'] != null ? new Dob.fromJson(json['dob']) : null;
    registered = json['registered'] != null
        ? new Registered.fromJson(json['registered'])
        : null;
    phone = json['phone'];
    cell = json['cell'];
    id = json['id'] != null ? new Id.fromJson(json['id']) : null;
    picture =
        json['picture'] != null ? new Picture.fromJson(json['picture']) : null;
    nat = json['nat'];
  }
}

class Name {
  String title;
  String first;
  String last;

  Name({this.title, this.first, this.last});

  Name.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    first = json['first'];
    last = json['last'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['first'] = this.first;
    data['last'] = this.last;
    return data;
  }
}

class Location {
  String street;
  String city;
  String state;
  var postcode;
  Coordinates coordinates;
  Timezone timezone;

  Location(
      {this.street,
      this.city,
      this.state,
      this.postcode,
      this.coordinates,
      this.timezone});

  Location.fromJson(Map<String, dynamic> json) {
    street = json['street'];
    city = json['city'];
    state = json['state'];
    postcode = json['postcode'];
    coordinates = json['coordinates'] != null
        ? new Coordinates.fromJson(json['coordinates'])
        : null;
    timezone = json['timezone'] != null
        ? new Timezone.fromJson(json['timezone'])
        : null;
  }
}

class Coordinates {
  String latitude;
  String longitude;

  Coordinates({this.latitude, this.longitude});

  Coordinates.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }
}

class Timezone {
  String offset;
  String description;

  Timezone({this.offset, this.description});

  Timezone.fromJson(Map<String, dynamic> json) {
    offset = json['offset'];
    description = json['description'];
  }
}

class Login {
  String uuid;
  String username;
  String password;
  String salt;
  String md5;
  String sha1;
  String sha256;

  Login(
      {this.uuid,
      this.username,
      this.password,
      this.salt,
      this.md5,
      this.sha1,
      this.sha256});

  Login.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    username = json['username'];
    password = json['password'];
    salt = json['salt'];
    md5 = json['md5'];
    sha1 = json['sha1'];
    sha256 = json['sha256'];
  }
}

class Dob {
  String date;
  var age;

  Dob({this.date, this.age});

  Dob.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    age = json['age'];
  }
}

class Registered {
  String date;
  var age;

  Registered({this.date, this.age});

  Registered.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    age = json['age'];
  }
}

class Id {
  String name;
  String value;

  Id({this.name, this.value});

  Id.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    value = json['value'];
  }
}

class Picture {
  String large;
  String medium;
  String thumbnail;

  Picture({this.large, this.medium, this.thumbnail});

  Picture.fromJson(Map<String, dynamic> json) {
    large = json['large'];
    medium = json['medium'];
    thumbnail = json['thumbnail'];
  }
}