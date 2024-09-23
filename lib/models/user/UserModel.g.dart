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
      name: json["name"] as IName,
      address: json["address"] as IAddress,
      phone: json["phone"] as String,
      token: json["token"] as String,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      "id": instance.id,
      "email": instance.email,
      "username": instance.username,
      "password": instance.password,
      "name": instance.name,
      "address": instance.address,
      "phone": instance.phone,
      "token": instance.token,
    };
