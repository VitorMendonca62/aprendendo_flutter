// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json["id"] as int,
      email: json["email"] as String,
      username: json["username"] as String,
      password: json["password"] as String,
      name: IName.fromJson(json['name']),
      address: IAddress.fromJson(json['address']),
      phone: json["phone"] as String,
      token: json["token"] as String,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      "id": instance.id,
      "email": instance.email,
      "username": instance.username,
      "password": instance.password,
      "name": instance.name.toJson(),
      "address": instance.address.toJson(),
      "phone": instance.phone,
      "token": instance.token,
    };

IName _$INameFromJson(Map<String, dynamic> json) => IName(
      firstname: json["firstname"] as String,
      lastname: json["lastname"] as String,
    );

Map<String, dynamic> _$INameToJson(IName instance) => <String, dynamic>{
      "firstName": instance.firstname,
      "lastname": instance.lastname,
    };

IGeoLocation _$IGeoLocationFromJson(Map<String, dynamic> json) => IGeoLocation(
      lat: json["lat"] as String,
      long: json["long"] as String,
    );

Map<String, dynamic> _$IGeoLocationToJson(IGeoLocation instance) =>
    <String, dynamic>{
      "lat": instance.lat,
      "long": instance.long,
    };

IAddress _$IAddressFromJson(Map<String, dynamic> json) => IAddress(
      city: json["city"] as String,
      street: json["street"] as String,
      number: json["number"] as int,
      zipcode: json["zipcode"] as String,
      geolocation: IGeoLocation.fromJson(
        json['geolocation'],
      ),
    );

Map<String, dynamic> _$IAddressToJson(IAddress instance) => <String, dynamic>{
      "city": instance.city,
      "street": instance.street,
      "number": instance.number,
      "zipcode": instance.zipcode,
      "geolocation": instance.geolocation.toJson(),
    };
