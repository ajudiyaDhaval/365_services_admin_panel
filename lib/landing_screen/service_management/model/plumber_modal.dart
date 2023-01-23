class PlumberService {
  String? id;
  String? serviceName;
  String? waste_pipe_leakage_1piece;
  String? waste_pipe_blockge_removal;
  String? wash_basin_installation;
  String? bathroom_tile_gap_filling;
  String? kithen_title_gap_filling;
  String? mirror_fitting_installation;
  String? shower_installation_wallmounted;
  String? shower_installation_celling;
  String? drainage_pipe_blockage_removal;
  String? balcony_drain_blockage_removal;
  String? drain_cover_installation;

  String? flush_tank_repair;
  String? flush_tank_replacement;
  String? flush_tank_repair_pvc;
  String? flush_tank_repair_conceal_in_wall;
  String? western_toilet_installation_Floor;
  String? western_toilet_repair;
  String? floor_mountedwesterntoilet_replacement;
  String? western_toilet_installation_Wall;
  String? wall_western_toilet_replacement;
  String? indian_toilet_installation;
  String? toilet_potblockage_removal;
  String? toilet_seat_cover_replacement;
  String? jetspray_installationrepair;

  String? Hot_coldwater_mixtures_repair;
  String? tap_repair;
  String? tap_replacement;
  String? Hot_coldwater_mixtures_installation;
  String? water_saving_nozzle;
  String? underground_ank_cleaning;
  String? pipeline_leakage_repair;
  String? water_meter_installation;

  String? motor_installation;
  String? motor_replacement;
  String? motorair_cavity_remova;

  String? connection_hose_installation;
  String? washing_machine_inlet_installati;
  String? tap_filter_installation;
  String? shower_filter_installatio;
  String? washing_machine_filter;
  String? shower_filterwall_mounter;
  // BasinAndSink? basinAndSink;
  // Grouting? grouting;

  PlumberService({
    this.id,
    this.serviceName,
    this.waste_pipe_leakage_1piece,
    this.waste_pipe_blockge_removal,
    this.wash_basin_installation,
    this.bathroom_tile_gap_filling,
    this.kithen_title_gap_filling,
    this.mirror_fitting_installation,
    this.shower_installation_wallmounted,
    this.shower_installation_celling,
    this.drainage_pipe_blockage_removal,
    this.balcony_drain_blockage_removal,
    this.drain_cover_installation,
    this.floor_mountedwesterntoilet_replacement,
    this.flush_tank_repair,
    this.flush_tank_repair_conceal_in_wall,
    this.flush_tank_replacement,
    this.flush_tank_repair_pvc,
    this.indian_toilet_installation,
    this.jetspray_installationrepair,
    this.toilet_potblockage_removal,
    this.toilet_seat_cover_replacement,
    this.wall_western_toilet_replacement,
    this.western_toilet_installation_Floor,
    this.western_toilet_installation_Wall,
    this.western_toilet_repair,
    this.Hot_coldwater_mixtures_installation,
    this.Hot_coldwater_mixtures_repair,
    this.pipeline_leakage_repair,
    this.tap_repair,
    this.tap_replacement,
    this.underground_ank_cleaning,
    this.water_meter_installation,
    this.water_saving_nozzle,
    this.motor_installation,
    this.motor_replacement,
    this.motorair_cavity_remova,
    this.connection_hose_installation,
    this.shower_filter_installatio,
    this.shower_filterwall_mounter,
    this.tap_filter_installation,
    this.washing_machine_filter,
    this.washing_machine_inlet_installati,
    // this.basinAndSink,
    // this.grouting,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'serviceName': serviceName,
      'waste_pipe_leakage_1piece': waste_pipe_leakage_1piece,
      'switch_board_installation': waste_pipe_blockge_removal,
      'switch_board_repair': wash_basin_installation,
      'bathroom_tile_gap_filling': bathroom_tile_gap_filling,
      'kithen_title_gap_filling': kithen_title_gap_filling,
      'mirror_fitting_installation': mirror_fitting_installation,
      'shower_installation_wallmounted': shower_installation_wallmounted,
      'shower_installation_celling': shower_installation_celling,
      'drainage_pipe_blockage_removal': drainage_pipe_blockage_removal,
      'balcony_drain_blockage_removal': balcony_drain_blockage_removal,
      'drain_cover_installation': drain_cover_installation,

      'flush_tank_repair': flush_tank_repair,
      'flush_tank_replacement': flush_tank_replacement,
      'flush_tank_repair_pvc': flush_tank_repair_pvc,
      'flush_tank_repair_conceal_in_wall': flush_tank_repair_conceal_in_wall,
      'western_toilet_installation_Floor': western_toilet_installation_Floor,
      'western_toilet_repair': western_toilet_repair,
      'floor_mountedwesterntoilet_replacement':
          floor_mountedwesterntoilet_replacement,
      'western_toilet_installation_Wall': western_toilet_installation_Wall,
      'wall_western_toilet_replacement': wall_western_toilet_replacement,
      'indian_toilet_installation': indian_toilet_installation,
      'toilet_potblockage_removal': toilet_potblockage_removal,
      'toilet_seat_cover_replacement': toilet_seat_cover_replacement,
      'jetspray_installationrepair': jetspray_installationrepair,

      'Hot_coldwater_mixtures_repair': Hot_coldwater_mixtures_repair,
      'tap_repair': tap_repair,
      'tap_replacement': tap_replacement,
      'Hot_coldwater_mixtures_installation':
          Hot_coldwater_mixtures_installation,
      'water_saving_nozzle': water_saving_nozzle,
      'underground_ank_cleaning': underground_ank_cleaning,
      'pipeline_leakage_repair': pipeline_leakage_repair,
      'water_meter_installation': water_meter_installation,

      'motor_installation': motor_installation,
      'motor_replacement': motor_replacement,
      'motorair_cavity_remova': motorair_cavity_remova,

      'connection_hose_installation': connection_hose_installation,
      'washing_machine_inlet_installati': washing_machine_inlet_installati,
      'tap_filter_installation': tap_filter_installation,
      'shower_filter_installatio': shower_filter_installatio,
      'washing_machine_filter': washing_machine_filter,
      'shower_filterwall_mounter': shower_filterwall_mounter,
      // 'basinAndSink': basinAndSink?.toMap(),
      // 'grouting': grouting?.toMap(),
    };
  }

  factory PlumberService.fromMap(Map<String, dynamic> map) {
    return PlumberService(
      id: map['id'],
      serviceName: map['serviceName'] ?? '',
      waste_pipe_leakage_1piece: map['waste_pipe_leakage_1piece'],
      waste_pipe_blockge_removal: map['waste_pipe_blockge_removal'],
      wash_basin_installation: map['wash_basin_installation'],
      bathroom_tile_gap_filling: map['bathroom_tile_gap_filling'],
      kithen_title_gap_filling: map['kithen_title_gap_filling'],
      mirror_fitting_installation: map['mirror_fitting_installation'],
      shower_installation_wallmounted: map['shower_installation_wallmounted'],
      shower_installation_celling: map['shower_installation_celling'],
      drainage_pipe_blockage_removal: map['drainage_pipe_blockage_removal'],
      balcony_drain_blockage_removal: map['balcony_drain_blockage_removal'],
      drain_cover_installation: map['drain_cover_installation'],

      flush_tank_repair: map['flush_tank_repair'],
      flush_tank_replacement: map['flush_tank_replacement'],
      flush_tank_repair_pvc: map['flush_tank_repair_pvc'],
      flush_tank_repair_conceal_in_wall:
          map['flush_tank_repair_conceal_in_wall'],
      western_toilet_installation_Floor:
          map['western_toilet_installation_Floor'],
      western_toilet_repair: map['western_toilet_repair'],
      floor_mountedwesterntoilet_replacement:
          map['floor_mountedwesterntoilet_replacement'],
      western_toilet_installation_Wall: map['western_toilet_installation_Wall'],
      wall_western_toilet_replacement: map['wall_western_toilet_replacement'],
      indian_toilet_installation: map['indian_toilet_installation'],
      toilet_potblockage_removal: map['toilet_potblockage_removal'],
      toilet_seat_cover_replacement: map['toilet_seat_cover_replacement'],
      jetspray_installationrepair: map['jetspray_installationrepair'],

      Hot_coldwater_mixtures_repair: map['Hot_coldwater_mixtures_repair'],
      tap_repair: map['tap_repair'],
      tap_replacement: map['tap_replacement'],
      Hot_coldwater_mixtures_installation:
          map['Hot_coldwater_mixtures_installation'],
      water_saving_nozzle: map['water_saving_nozzle'],
      underground_ank_cleaning: map['underground_ank_cleaning'],
      pipeline_leakage_repair: map['pipeline_leakage_repair'],
      water_meter_installation: map['water_meter_installation'],

      motor_installation: map['motor_installation'],
      motor_replacement: map['motor_replacement'],
      motorair_cavity_remova: map['motorair_cavity_remova'],

      connection_hose_installation: map['connection_hose_installation'],
      washing_machine_inlet_installati: map['washing_machine_inlet_installati'],
      tap_filter_installation: map['tap_filter_installation'],
      shower_filter_installatio: map['shower_filter_installatio'],
      washing_machine_filter: map['washing_machine_filter'],
      shower_filterwall_mounter: map['shower_filterwall_mounter'],
      // basinAndSink: map['basinAndSink'] == {}
      //     ? null
      //     : BasinAndSink.fromMap(map['basinAndSink']),
      // grouting: map['fan'] == null ? null : Grouting.fromMap(map['grouting']),
    );
  }
}

class BasinAndSink {
  String? waste_pipe_leakage_1piece;
  String? waste_pipe_blockge_removal;
  String? wash_basin_installation;

  BasinAndSink({
    this.waste_pipe_leakage_1piece,
    this.waste_pipe_blockge_removal,
    this.wash_basin_installation,
  });

  Map<String, dynamic> toMap() {
    return {
      'waste_pipe_leakage_1piece': waste_pipe_leakage_1piece,
      'switch_board_installation': waste_pipe_blockge_removal,
      'switch_board_repair': wash_basin_installation,
    };
  }

  factory BasinAndSink.fromMap(Map<String, dynamic> map) {
    return BasinAndSink(
      waste_pipe_leakage_1piece: map['waste_pipe_leakage_1piece'],
      waste_pipe_blockge_removal: map['waste_pipe_blockge_removal'],
      wash_basin_installation: map['wash_basin_installation'],
    );
  }
}

class Grouting {
  String? bathroom_tile_gap_filling;
  String? kithen_title_gap_filling;

  Grouting({
    this.bathroom_tile_gap_filling,
    this.kithen_title_gap_filling,
  });

  Map<String, dynamic> toMap() {
    return {
      'bathroom_tile_gap_filling': bathroom_tile_gap_filling,
      'kithen_title_gap_filling': kithen_title_gap_filling,
    };
  }

  factory Grouting.fromMap(Map<String, dynamic> map) {
    return Grouting(
      bathroom_tile_gap_filling: map['bathroom_tile_gap_filling'],
      kithen_title_gap_filling: map['kithen_title_gap_filling'],
    );
  }
}
