class PlumberService {
  String? id;
  String? serviceName;
  String? waste_pipe_leakage_1piece;
  String? waste_pipe_blockge_removal;
  String? wash_basin_installation;
  String? bathroom_tile_gap_filling;
  String? kithen_title_gap_filling;
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
