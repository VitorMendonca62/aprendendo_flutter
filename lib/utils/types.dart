enum InputTypes { username, password }

abstract class IName {
  String get firstName;
  String get lastName;
}

abstract class IGeoLocation {
  String get lat;
  String get long;
}

abstract class IAddress {
  String get city;
  String get street;
  int get number;
  String get zipcode;
  IGeoLocation get geolocation;
}
