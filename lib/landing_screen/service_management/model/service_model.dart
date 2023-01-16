import 'package:cloud_firestore/cloud_firestore.dart';

class ServiceModel {
  String? id;
  String? imageUrl;
  String? serviceName;
  FirstTimeServiceModel? firstTimeServiceModel;
  SecondTimeServiceModel? secondTimeServiceModel;

  ServiceModel({
    this.id,
    this.imageUrl,
    this.serviceName,
    this.firstTimeServiceModel,
    this.secondTimeServiceModel,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'imageUrl': imageUrl,
      'serviceName': serviceName,
      'firstTimeServiceModel': firstTimeServiceModel?.toMap(),
      'secondTimeServiceModel': secondTimeServiceModel?.toMap(),
    };
  }

  factory ServiceModel.fromMap(Map<String, dynamic> map) {
    return ServiceModel(
      id: map['id'],
      imageUrl: map['imageUrl'],
      serviceName: map['serviceName'] ?? '',
      firstTimeServiceModel:map['firstTimeServiceModel'] == null
          ? null
          : FirstTimeServiceModel.fromMap(map['firstTimeServiceModel']),
        secondTimeServiceModel:map['secondTimeServiceModel'] == null
          ? null
          : SecondTimeServiceModel.fromMap(map['secondTimeServiceModel']),
    );
  }
}


class FirstTimeServiceModel {
  String? bhk1;
  String? bhk2;
  String? bhk3;
  String? bhk4;
  String? bhk5;

  FirstTimeServiceModel({
    this.bhk1,
    this.bhk2,
    this.bhk3,
    this.bhk4,
    this.bhk5,
  });

  Map<String, dynamic> toMap() {
    return {
      "bhk1": bhk1,
      "bhk2": bhk2,
      "bhk3": bhk3,
      "bhk4": bhk4,
      "bhk5": bhk5,
    };
  }

  factory FirstTimeServiceModel.fromMap(Map<String, dynamic> map) => FirstTimeServiceModel(
        bhk1: map["bhk1"] ?? "",
        bhk2: map["bhk2"] ?? "",
        bhk3: map["bhk3"] ?? "",
        bhk4: map["bhk4"] ?? "",
        bhk5: map["bhk5"] ?? "",
      );
}
class SecondTimeServiceModel {
  String? bhk1;
  String? bhk2;
  String? bhk3;
  String? bhk4;
  String? bhk5;

  SecondTimeServiceModel({
    this.bhk1,
    this.bhk2,
    this.bhk3,
    this.bhk4,
    this.bhk5,
  });

  Map<String, dynamic> toMap() {
    return {
      "bhk1": bhk1,
      "bhk2": bhk2,
      "bhk3": bhk3,
      "bhk4": bhk4,
      "bhk5": bhk5,
    };
  }

  factory SecondTimeServiceModel.fromMap(Map<String, dynamic> map) => SecondTimeServiceModel(
        bhk1: map["bhk1"] ?? "",
        bhk2: map["bhk2"] ?? "",
        bhk3: map["bhk3"] ?? "",
        bhk4: map["bhk4"] ?? "",
        bhk5: map["bhk5"] ?? "",
      );
}


class ServiceCheckListModel {
  final ServiceModel service;
  bool isChecked;

  ServiceCheckListModel({
    required this.service,
    this.isChecked = false,
  });
}
