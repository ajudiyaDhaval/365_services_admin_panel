class ServiceModel {
  String? id;
  String? imageUrl;
  String? serviceName;
  FirstTimeServiceModel? firstTimeServiceModel;
  SecondTimeServiceModel? secondTimeServiceModel;
  CookFirstServiceModel? cookFirstServiceModel;
  CookSecondTimeServiceModel? cookSecondTimeServiceModel;
  DriverModel? driverModel;

  ServiceModel({
    this.id,
    this.imageUrl,
    this.serviceName,
    this.firstTimeServiceModel,
    this.secondTimeServiceModel,
    this.cookFirstServiceModel,
    this.cookSecondTimeServiceModel,
    this.driverModel,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'imageUrl': imageUrl,
      'serviceName': serviceName,
      'firstTimeServiceModel': firstTimeServiceModel?.toMap(),
      'secondTimeServiceModel': secondTimeServiceModel?.toMap(),
      'cookFirstServiceModel': cookFirstServiceModel?.toMap(),
      'cookSecondTimeServiceModel': cookSecondTimeServiceModel?.toMap(),
      'driverModel': driverModel?.toMap(),
    };
  }

  factory ServiceModel.fromMap(Map<String, dynamic> map) {
    return ServiceModel(
      id: map['id'],
      imageUrl: map['imageUrl'],
      serviceName: map['serviceName'] ?? '',
      firstTimeServiceModel: map['firstTimeServiceModel'] == null
          ? null
          : FirstTimeServiceModel.fromMap(map['firstTimeServiceModel']),
      secondTimeServiceModel: map['secondTimeServiceModel'] == null
          ? null
          : SecondTimeServiceModel.fromMap(map['secondTimeServiceModel']),
      cookFirstServiceModel: map['cookFirstServiceModel'] == null
          ? null
          : CookFirstServiceModel.fromMap(map['cookFirstServiceModel']),
      cookSecondTimeServiceModel: map['cookSecondTimeServiceModel'] == null
          ? null
          : CookSecondTimeServiceModel.fromMap(
              map['cookSecondTimeServiceModel']),
      driverModel: map['driverModel'] == null
          ? null
          : DriverModel.fromMap(map['driverModel']),
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

  factory FirstTimeServiceModel.fromMap(Map<String, dynamic> map) =>
      FirstTimeServiceModel(
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

  factory SecondTimeServiceModel.fromMap(Map<String, dynamic> map) =>
      SecondTimeServiceModel(
        bhk1: map["bhk1"] ?? "",
        bhk2: map["bhk2"] ?? "",
        bhk3: map["bhk3"] ?? "",
        bhk4: map["bhk4"] ?? "",
        bhk5: map["bhk5"] ?? "",
      );
}

class CookFirstServiceModel {
  String? firstPerson1;
  String? firstPerson2;
  String? firstPerson3;
  String? firstPerson4;
  String? firstPerson5;
  String? firstPerson6;

  CookFirstServiceModel({
    this.firstPerson1,
    this.firstPerson2,
    this.firstPerson3,
    this.firstPerson4,
    this.firstPerson5,
    this.firstPerson6,
  });

  Map<String, dynamic> toMap() {
    return {
      "firstPerson1": firstPerson1,
      "firstPerson2": firstPerson2,
      "firstPerson3": firstPerson3,
      "firstPerson4": firstPerson4,
      "firstPerson5": firstPerson5,
      "firstPerson6": firstPerson6,
    };
  }

  factory CookFirstServiceModel.fromMap(Map<String, dynamic> map) =>
      CookFirstServiceModel(
        firstPerson1: map["firstPerson1"] ?? "",
        firstPerson2: map["firstPerson2"] ?? "",
        firstPerson3: map["firstPerson3"] ?? "",
        firstPerson4: map["firstPerson4"] ?? "",
        firstPerson5: map["firstPerson5"] ?? "",
        firstPerson6: map["firstPerson6"] ?? "",
      );
}

class CookSecondTimeServiceModel {
  String? secondPerson1;
  String? secondPerson2;
  String? secondPerson3;
  String? secondPerson4;
  String? secondPerson5;
  String? secondPerson6;

  CookSecondTimeServiceModel({
    this.secondPerson1,
    this.secondPerson2,
    this.secondPerson3,
    this.secondPerson4,
    this.secondPerson5,
    this.secondPerson6,
  });

  Map<String, dynamic> toMap() {
    return {
      "secondPerson1": secondPerson1,
      "secondPerson2": secondPerson2,
      "secondPerson3": secondPerson3,
      "secondPerson4": secondPerson4,
      "secondPerson5": secondPerson5,
      "secondPerson6": secondPerson6,
    };
  }

  factory CookSecondTimeServiceModel.fromMap(Map<String, dynamic> map) =>
      CookSecondTimeServiceModel(
        secondPerson1: map["secondPerson1"] ?? "",
        secondPerson2: map["secondPerson2"] ?? "",
        secondPerson3: map["secondPerson3"] ?? "",
        secondPerson4: map["secondPerson4"] ?? "",
        secondPerson5: map["secondPerson5"] ?? "",
        secondPerson6: map["secondPerson5"] ?? "",
      );
}

class DriverModel {
  String? driverSmall;
  String? driverMedium;
  String? driverSuv;
  String? driver7Seater;
  String? driverCars;

  DriverModel({
    this.driverSmall,
    this.driverMedium,
    this.driverSuv,
    this.driver7Seater,
    this.driverCars,
  });

  Map<String, dynamic> toMap() {
    return {
      "driverSmall": driverSmall,
      "driverMedium": driverMedium,
      "driverSuv": driverSuv,
      "driver7Seater": driver7Seater,
      "driverCars": driverCars,
    };
  }

  factory DriverModel.fromMap(Map<String, dynamic> map) => DriverModel(
        driverSmall: map["driverSmall"] ?? "",
        driverMedium: map["driverMedium"] ?? "",
        driverSuv: map["driverSuv"] ?? "",
        driver7Seater: map["driver7Seater"] ?? "",
        driverCars: map["driverCars"] ?? "",
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
