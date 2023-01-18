class ServiceCheckListModel {
  final ServiceModel service;
  bool isChecked;

  ServiceCheckListModel({
    required this.service,
    this.isChecked = false,
  });
}

class ServiceModel {
  String? id;
  String? imageUrl;
  String? serviceName;
  // FirstTimeServiceModel? firstTimeServiceModel;
  // SecondTimeServiceModel? secondTimeServiceModel;
  // CookFirstServiceModel? cookFirstServiceModel;
  // CookSecondTimeServiceModel? cookSecondTimeServiceModel;
  // DriverModel? driverModel;

  ServiceModel({
    this.id,
    this.imageUrl,
    this.serviceName,
    // this.firstTimeServiceModel,
    // this.secondTimeServiceModel,
    // this.cookFirstServiceModel,
    // this.cookSecondTimeServiceModel,
    // this.driverModel,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'imageUrl': imageUrl,
      'serviceName': serviceName,
      // 'firstTimeServiceModel': firstTimeServiceModel?.toMap(),
      // 'secondTimeServiceModel': secondTimeServiceModel?.toMap(),
      // 'cookFirstServiceModel': cookFirstServiceModel?.toMap(),
      // 'cookSecondTimeServiceModel': cookSecondTimeServiceModel?.toMap(),
      // 'driverModel': driverModel?.toMap(),
    };
  }

  factory ServiceModel.fromMap(Map<String, dynamic> map) {
    return ServiceModel(
      id: map['id'],
      imageUrl: map['imageUrl'],
      serviceName: map['serviceName'] ?? '',
      // firstTimeServiceModel: map['firstTimeServiceModel'] == null
      //     ? null
      // : FirstTimeServiceModel.fromMap(map['firstTimeServiceModel']),
      // secondTimeServiceModel: map['secondTimeServiceModel'] == null
      //     ? null
      //     : SecondTimeServiceModel.fromMap(map['secondTimeServiceModel']),
      // cookFirstServiceModel: map['cookFirstServiceModel'] == null
      //     ? null
      //     : CookFirstServiceModel.fromMap(map['cookFirstServiceModel']),
      // cookSecondTimeServiceModel: map['cookSecondTimeServiceModel'] == null
      //     ? null
      //     : CookSecondTimeServiceModel.fromMap(
      //         map['cookSecondTimeServiceModel']),
      // driverModel: map['driverModel'] == null
      //     ? null
      //     : DriverModel.fromMap(map['driverModel']),
    );
  }
}

class MaidService {
  String? id;
  String? serviceName;
  String? bhk1;
  String? bhk2;
  String? bhk3;
  String? bhk4;
  String? bhk5;
  String? bhk1_2;
  String? bhk2_2;
  String? bhk3_2;
  String? bhk4_2;
  String? bhk5_2;

  MaidService({
    this.id,
    this.serviceName,
    this.bhk1,
    this.bhk2,
    this.bhk3,
    this.bhk4,
    this.bhk5,
    this.bhk1_2,
    this.bhk2_2,
    this.bhk3_2,
    this.bhk4_2,
    this.bhk5_2,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "serviceName": serviceName,
      "bhk1": bhk1,
      "bhk2": bhk2,
      "bhk3": bhk3,
      "bhk4": bhk4,
      "bhk5": bhk5,
      "bhk1_2": bhk1_2,
      "bhk2_2": bhk2_2,
      "bhk3_2": bhk3_2,
      "bhk4_2": bhk4_2,
      "bhk5_2": bhk5_2,
    };
  }

  factory MaidService.fromMap(Map<String, dynamic> map) => MaidService(
        id: map["id"] ?? "",
        serviceName: map["serviceName"] ?? "",
        bhk1: map["bhk1"] ?? "",
        bhk2: map["bhk2"] ?? "",
        bhk3: map["bhk3"] ?? "",
        bhk4: map["bhk4"] ?? "",
        bhk5: map["bhk5"] ?? "",
        bhk1_2: map["bhk1_2"] ?? "",
        bhk2_2: map["bhk2_2"] ?? "",
        bhk3_2: map["bhk3_2"] ?? "",
        bhk4_2: map["bhk4_2"] ?? "",
        bhk5_2: map["bhk5_2"] ?? "",
      );
}

class CookService {
  String? id;
  String? serviceName;
  String? person_1_1time;
  String? person_2_1time;
  String? person_3_1time;
  String? person_4_1time;
  String? person_5_1time;
  String? person_6_1time;
  String? person_1_2time;
  String? person_2_2time;
  String? person_3_2time;
  String? person_4_2time;
  String? person_5_2time;
  String? person_6_2time;

  CookService({
    this.id,
    this.serviceName,
    this.person_1_1time,
    this.person_2_1time,
    this.person_3_1time,
    this.person_4_1time,
    this.person_5_1time,
    this.person_6_1time,
    this.person_1_2time,
    this.person_2_2time,
    this.person_3_2time,
    this.person_4_2time,
    this.person_5_2time,
    this.person_6_2time,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "serviceName": serviceName,
      "person_1_1time": person_1_1time,
      "person_2_1time": person_2_1time,
      "person_3_1time": person_3_1time,
      "person_4_1time": person_4_1time,
      "person_5_1time": person_5_1time,
      "person_6_1time": person_6_1time,
      "person_1_2time": person_1_2time,
      "person_2_2time": person_2_2time,
      "person_3_2time": person_3_2time,
      "person_4_2time": person_4_2time,
      "person_5_2time": person_5_2time,
      "person_6_2time": person_6_2time,
    };
  }

  factory CookService.fromMap(Map<String, dynamic> map) => CookService(
        id: map["id"] ?? "",
        serviceName: map["serviceName"] ?? "",
        person_1_1time: map["person_1_1time"] ?? "",
        person_2_1time: map["person_2_1time"] ?? "",
        person_3_1time: map["person_3_1time"] ?? "",
        person_4_1time: map["person_4_1time"] ?? "",
        person_5_1time: map["person_5_1time"] ?? "",
        person_6_1time: map["person_6_1time"] ?? "",
        person_1_2time: map["person_1_2time"] ?? "",
        person_2_2time: map["person_2_2time"] ?? "",
        person_3_2time: map["person_3_2time"] ?? "",
        person_4_2time: map["person_4_2time"] ?? "",
        person_5_2time: map["person_5_2time"] ?? "",
        person_6_2time: map["person_6_2time"] ?? "",
      );
}

class DriverService {
  String? id;
  String? serviceName;
  String? driverSmall;
  String? driverMediumAndSedan;
  String? driverCompactSuv;
  String? driver7Seater;
  String? driverLuxuryCars;

  DriverService({
    this.id,
    this.serviceName,
    this.driverSmall,
    this.driverMediumAndSedan,
    this.driverCompactSuv,
    this.driver7Seater,
    this.driverLuxuryCars,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "serviceName": serviceName,
      "driverSmall": driverSmall,
      "driverMedium": driverMediumAndSedan,
      "driverCompactSuv": driverCompactSuv,
      "driver7Seater": driver7Seater,
      "driverLuxuryCars": driverLuxuryCars,
    };
  }

  factory DriverService.fromMap(Map<String, dynamic> map) => DriverService(
        id: map["id"] ?? "",
        serviceName: map["serviceName"] ?? "",
        driverSmall: map["driverSmall"] ?? "",
        driverMediumAndSedan: map["driverMediumAndSedan"] ?? "",
        driverCompactSuv: map["driverCompactSuv"] ?? "",
        driver7Seater: map["driver7Seater"] ?? "",
        driverLuxuryCars: map["driverLuxuryCars"] ?? "",
      );
}
