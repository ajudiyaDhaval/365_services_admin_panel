import 'package:cloud_firestore/cloud_firestore.dart';

class ServiceModel {
  String? id;
  String? imageUrl;
  String serviceName;
  // FirstTimeService? firstTimeService;
  // SecondTimeService? secondTimeService;
  ServiceModel({
    this.id,
    this.imageUrl,
    required this.serviceName,
    // this.firstTimeService,
    // this.secondTimeService,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'imageUrl': imageUrl,
      'serviceName': serviceName,
      // 'firstTimeService': firstTimeService,
      // 'secondTimeService': secondTimeService,
    };
  }

  factory ServiceModel.fromMap(Map<String, dynamic> map) {
    return ServiceModel(
      id: map['id'],
      imageUrl: map['imageUrl'],
      serviceName: map['serviceName'] ?? '',
      // firstTimeService: map['firstTimeService'] ?? '',
      // secondTimeService: map['secondTimeService'] ?? '',
    );
  }
}

class FirstTimeService {
  String? bhk1;
  String? bhk2;
  String? bhk3;
  String? bhk4;
  String? bhk5;

  FirstTimeService({
    this.bhk1,
    this.bhk2,
    this.bhk3,
    this.bhk4,
    this.bhk5,
  });

  FirstTimeService.fromDocumentSnapshot(
    DocumentSnapshot documentSnapshot,
  ) {
    Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
    bhk1 = data['bhk1'] ?? '';
    bhk2 = data['bhk2'] ?? '';
    bhk3 = data['bhk3'] ?? '';
    bhk4 = data['bhk4'] ?? '';
    bhk5 = data['bhk5'] ?? '';
  }

  FirstTimeService.fromJson(Map<String, dynamic> json) {
    bhk1 = json['bhk1'] ?? '';
    bhk2 = json['bhk2'] ?? '';
    bhk3 = json['bhk3'] ?? '';
    bhk4 = json['bhk4'] ?? '';
    bhk5 = json['bhk5'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bhk1'] = bhk1;
    data['bhk2'] = bhk2;
    data['bhk3'] = bhk3;
    data['bhk4'] = bhk4;
    data['bhk5'] = bhk5;

    return data;
  }
}

class SecondTimeService {
  String? bhk1;
  String? bhk2;
  String? bhk3;
  String? bhk4;
  String? bhk5;

  SecondTimeService({
    this.bhk1,
    this.bhk2,
    this.bhk3,
    this.bhk4,
    this.bhk5,
  });

  SecondTimeService.fromDocumentSnapshot(
    DocumentSnapshot documentSnapshot,
  ) {
    Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
    bhk1 = data['bhk1'] ?? '';
    bhk2 = data['bhk2'] ?? '';
    bhk3 = data['bhk3'] ?? '';
    bhk4 = data['bhk4'] ?? '';
    bhk5 = data['bhk5'] ?? '';
  }

  SecondTimeService.fromJson(Map<String, dynamic> json) {
    bhk1 = json['bhk1'] ?? '';
    bhk2 = json['bhk2'] ?? '';
    bhk3 = json['bhk3'] ?? '';
    bhk4 = json['bhk4'] ?? '';
    bhk5 = json['bhk5'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bhk1'] = bhk1;
    data['bhk2'] = bhk2;
    data['bhk3'] = bhk3;
    data['bhk4'] = bhk4;
    data['bhk5'] = bhk5;

    return data;
  }
}

class ServiceCheckListModel {
  final ServiceModel service;
  bool isChecked;
  ServiceCheckListModel({
    required this.service,
    this.isChecked = false,
  });
}
