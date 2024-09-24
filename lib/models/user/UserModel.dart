import 'package:json_annotation/json_annotation.dart';

part 'UserModel.g.dart';

@JsonSerializable()
class UserModel {
  int id;
  String email;
  String username;
  String password;
  IName name;
  IAddress address;
  String phone;
  String token;

  UserModel({
    required this.id,
    required this.email,
    required this.username,
    required this.password,
    required this.name,
    required this.address,
    required this.phone,
    required this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

@JsonSerializable()
class IName {
  String firstname;
  String lastname;

  IName({
    required this.firstname,
    required this.lastname,
  });

  factory IName.fromJson(Map<String, dynamic> json) => _$INameFromJson(json);
  Map<String, dynamic> toJson() => _$INameToJson(this);
}

@JsonSerializable()
class IGeoLocation {
  String lat;
  String long;

  IGeoLocation({
    required this.lat,
    required this.long,
  });

  factory IGeoLocation.fromJson(Map<String, dynamic> json) =>
      _$IGeoLocationFromJson(json);
  Map<String, dynamic> toJson() => _$IGeoLocationToJson(this);
}

@JsonSerializable()
class IAddress {
  String city;
  String street;
  int number;
  String zipcode;
  IGeoLocation geolocation;

  IAddress({
    required this.city,
    required this.street,
    required this.number,
    required this.zipcode,
    required this.geolocation,
  });

  factory IAddress.fromJson(Map<String, dynamic> json) =>
      _$IAddressFromJson(json);
  Map<String, dynamic> toJson() => _$IAddressToJson(this);
}
