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
  String? fan_repair;
  String? fan_replacement;
  String? fan_uninstallation;

  String? bulbs_installation;
  String? bulb_holder_installation;
  String? false_celling_light_installation;
  String? tube_light_installation;
  String? fancy_light_installation;

  String? phase_changeover_switch_installation;
  String? MCB_fuse_replacement;
  String? Single_pole_MCB_installation;
  String? Sub_meter_installation;
  String? Single_phase_phase_panel;

  String? single_battery_inverter_installation;
  String? double_battery_inverter_installation;
  String? inverter_fuse_replacement;
  String? inverter_servicin;
  String? stabilizer_installation;

  ///
  String? TV_installation_up;
  String? TV_installation_above;
  String? TV_uninstallation;
  String? mini_home_theatre_installation;
  String? room_heater_repair;

  String? new_internal_wiring;
  String? new_wiring_with_casing;
  String? new_wiring_without_casing;

  String? doorbell_installation;
  String? doorbell_replacement;

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
    this.fan_repair,
    this.fan_replacement,
    this.fan_uninstallation,
    this.bulb_holder_installation,
    this.bulbs_installation,
    this.false_celling_light_installation,
    this.fancy_light_installation,
    this.tube_light_installation,
    this.MCB_fuse_replacement,
    this.phase_changeover_switch_installation,
    this.Single_phase_phase_panel,
    this.Single_pole_MCB_installation,
    this.Sub_meter_installation,
    this.doorbell_installation,
    this.doorbell_replacement,
    this.double_battery_inverter_installation,
    this.inverter_fuse_replacement,
    this.inverter_servicin,
    this.mini_home_theatre_installation,
    this.new_internal_wiring,
    this.new_wiring_with_casing,
    this.new_wiring_without_casing,
    this.room_heater_repair,
    this.single_battery_inverter_installation,
    this.stabilizer_installation,
    this.TV_installation_above,
    this.TV_installation_up,
    this.TV_uninstallation,
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
      'fan_repair': fan_repair,
      'fan_replacement': fan_replacement,
      'fan_uninstallation': fan_uninstallation,

      'bulbs_installation': bulbs_installation,
      'bulb_holder_installation': bulb_holder_installation,
      'false_celling_light_installation': false_celling_light_installation,
      'tube_light_installation': tube_light_installation,
      'fancy_light_installation': fancy_light_installation,

      'phase_changeover_switch_installation':
          phase_changeover_switch_installation,
      'MCB_fuse_replacement': MCB_fuse_replacement,
      'Single_pole_MCB_installation': Single_pole_MCB_installation,
      'Sub_meter_installation': Sub_meter_installation,
      'Single_phase_phase_panel': Single_phase_phase_panel,

      'single_battery_inverter_installation':
          single_battery_inverter_installation,
      'double_battery_inverter_installation':
          double_battery_inverter_installation,
      'inverter_fuse_replacement': inverter_fuse_replacement,
      'inverter_servicin': inverter_servicin,
      'stabilizer_installation': stabilizer_installation,

      'TV_installation_up': TV_installation_up,
      'TV_installation_above': TV_installation_above,
      'TV_uninstallation': TV_uninstallation,
      'mini_home_theatre_installation': mini_home_theatre_installation,
      'room_heater_repair': room_heater_repair,

      'new_internal_wiring': new_internal_wiring,
      'new_wiring_with_casing': new_wiring_with_casing,
      'new_wiring_without_casing': new_wiring_without_casing,
      'doorbell_installation': doorbell_installation,
      'doorbell_replacement': doorbell_replacement,

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
      fan_repair: map['fan_repair'],
      fan_replacement: map['fan_replacement'],
      fan_uninstallation: map['fan_uninstallation'],

      bulbs_installation: map['bulbs_installation'],
      bulb_holder_installation: map['bulb_holder_installation'],
      false_celling_light_installation: map['false_celling_light_installation'],
      tube_light_installation: map['tube_light_installation'],
      fancy_light_installation: map['fancy_light_installation'],

      phase_changeover_switch_installation:
          map['phase_changeover_switch_installation'],
      MCB_fuse_replacement: map['MCB_fuse_replacement'],
      Single_pole_MCB_installation: map['Single_pole_MCB_installation'],
      Sub_meter_installation: map['Sub_meter_installation'],
      Single_phase_phase_panel: map['Single_phase_phase_panel'],

      single_battery_inverter_installation:
          map['single_battery_inverter_installation'],
      double_battery_inverter_installation:
          map['double_battery_inverter_installation'],
      inverter_fuse_replacement: map['inverter_fuse_replacement'],
      inverter_servicin: map['inverter_servicin'],
      stabilizer_installation: map['stabilizer_installation'],

      TV_installation_up: map['TV_installation_up'],
      TV_installation_above: map['TV_installation_above'],
      TV_uninstallation: map['TV_uninstallation'],
      mini_home_theatre_installation: map['mini_home_theatre_installation'],
      room_heater_repair: map['room_heater_repair'],

      new_internal_wiring: map['new_internal_wiring'],
      new_wiring_with_casing: map['new_wiring_with_casing'],
      new_wiring_without_casing: map['new_wiring_without_casing'],
      doorbell_installation: map['doorbell_installation'],
      doorbell_replacement: map['doorbell_replacement'],

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
