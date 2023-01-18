class ElectricianService {
  String? id;
  String? serviceName;
  String? acswitch_box_installation;
  String? switch_board_installation;
  String? switch_board_repair;
  String? celling_regulator_fan_replacement;
  String? decorative_celling_fan_installation;
  String? celling_fan_installation;
  String? switch_or_socket_replacement;
  String? switch_box_15Amp;

  // SwitchAndSocket? switchAndSocket;
  // FAN? fan;
  // CookFirstServiceModel? cookFirstServiceModel;
  // CookSecondTimeServiceModel? cookSecondTimeServiceModel;
  // DriverModel? driverModel;

  ElectricianService({
    this.id,
    this.serviceName,
    this.acswitch_box_installation,
    this.switch_board_installation,
    this.switch_board_repair,
    this.celling_regulator_fan_replacement,
    this.decorative_celling_fan_installation,
    this.celling_fan_installation,
    this.switch_or_socket_replacement,
    this.switch_box_15Amp,
    // this.switchAndSocket,
    // this.fan,
    // this.cookFirstServiceModel,
    // this.cookSecondTimeServiceModel,
    // this.driverModel,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'serviceName': serviceName,
      'acSwitchBoxInstallation': acswitch_box_installation,
      'switch_board_installation': switch_board_installation,
      'switch_board_repair': switch_board_repair,
      'acSwitchBoxInstallation': acswitch_box_installation,
      'switch_board_installation': switch_board_installation,
      'switch_board_repair': switch_board_repair,
      'switch_or_socket_replacement': switch_or_socket_replacement,
      'switch_box_15Amp': switch_box_15Amp,

      // 'switchAndSocket': switchAndSocket?.toMap(),
      // 'fan': fan?.toMap(),
      // 'cookFirstServiceModel': cookFirstServiceModel?.toMap(),
      // 'cookSecondTimeServiceModel': cookSecondTimeServiceModel?.toMap(),
      // 'driverModel': driverModel?.toMap(),
    };
  }

  factory ElectricianService.fromMap(Map<String, dynamic> map) {
    return ElectricianService(
      id: map['id'],
      serviceName: map['serviceName'] ?? '',
      acswitch_box_installation: map['acswitch_box_installation'],
      switch_board_installation: map['switch_board_installation'],
      switch_board_repair: map['switch_board_repair'],
      celling_regulator_fan_replacement:
          map['celling_regulator_fan_replacement'],
      decorative_celling_fan_installation:
          map['decorative_celling_fan_installation'],
      celling_fan_installation: map['celling_fan_installation'],
      switch_or_socket_replacement: map['switch_or_socket_replacement'],
      switch_box_15Amp: map['switch_box_15Amp'],

      // switchAndSocket: map['switchAndSocket'] == {}
      //     ? null
      //     : SwitchAndSocket.fromMap(map['switchAndSocket']),
      // fan: map['fan'] == null
      //     ? null
      //     : FAN.fromMap(map['secondTimeServiceModel']),
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

class SwitchAndSocket {
  String? acswitch_box_installation;
  String? switch_board_installation;
  String? switch_board_repair;

  SwitchAndSocket({
    this.acswitch_box_installation,
    this.switch_board_installation,
    this.switch_board_repair,
  });

  Map<String, dynamic> toMap() {
    return {
      'acSwitchBoxInstallation': acswitch_box_installation,
      'switch_board_installation': switch_board_installation,
      'switch_board_repair': switch_board_repair,
    };
  }

  factory SwitchAndSocket.fromMap(Map<String, dynamic> map) {
    return SwitchAndSocket(
      acswitch_box_installation: map['acswitch_box_installation'],
      switch_board_installation: map['switch_board_installation'],
      switch_board_repair: map['switch_board_repair'],
    );
  }
}

class FAN {
  String? celling_regulator_fan_replacement;
  String? decorative_celling_fan_installation;
  String? celling_fan_installation;

  FAN({
    this.celling_regulator_fan_replacement,
    this.decorative_celling_fan_installation,
    this.celling_fan_installation,
  });

  Map<String, dynamic> toMap() {
    return {
      'celling_regulator_fan_replacement': celling_regulator_fan_replacement,
      'decorative_celling_fan_installation':
          decorative_celling_fan_installation,
      'celling_fan_installation': celling_fan_installation,
    };
  }

  factory FAN.fromMap(Map<String, dynamic> map) {
    return FAN(
      celling_regulator_fan_replacement:
          map['celling_regulator_fan_replacement'],
      decorative_celling_fan_installation:
          map['decorative_celling_fan_installation'],
      celling_fan_installation: map['celling_fan_installation'],
    );
  }
}
