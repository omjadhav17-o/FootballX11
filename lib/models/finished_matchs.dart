class Area {
  final int id;
  final String name;
  final String code;
  final String flag;

  Area({
    required this.id,
    required this.name,
    required this.code,
    required this.flag,
  });

  factory Area.fromJson(Map<String, dynamic> json) {
    return Area(
        id: json['id'],
        name: json['name'],
        code: json['code'],
        flag: json['flag']);
  }
}

//competiion class
class Competition {
  final int id;
  final String name;
  final String code;
  final String type;
  final String emblem;

  Competition({
    required this.id,
    required this.name,
    required this.code,
    required this.type,
    required this.emblem,
  });

  factory Competition.fromJson(Map<String, dynamic> json) {
    return Competition(
      id: json['id'],
      name: json['name'],
      code: json['code'],
      type: json['type'],
      emblem: json['emblem'],
    );
  }
}

// season_model.dart

class Season {
  final int id;
  final String startDate;
  final String endDate;
  final int currentMatchday;
  final dynamic winner; // You might want to define a Winner class if needed

  Season({
    required this.id,
    required this.startDate,
    required this.endDate,
    required this.currentMatchday,
    required this.winner,
  });

  factory Season.fromJson(Map<String, dynamic> json) {
    return Season(
      id: json['id'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      currentMatchday: json['currentMatchday'],
      winner: json[
          'winner'], // Handle this field appropriately based on its potential types
    );
  }
}

// score_model.dart

class Score {
  final String winner;
  final String duration;
  final Map<String, int> fullTime;
  final Map<String, int> halfTime;

  Score({
    required this.winner,
    required this.duration,
    required this.fullTime,
    required this.halfTime,
  });

  factory Score.fromJson(Map<String, dynamic> json) {
    return Score(
      winner: json['winner'],
      duration: json['duration'],
      fullTime: Map<String, int>.from(json['fullTime']),
      halfTime: Map<String, int>.from(json['halfTime']),
    );
  }
}

// team_model (home and away)

class Team {
  final int id;
  final String name;
  final String shortName;
  final String tla;
  final String crest;

  Team({
    required this.id,
    required this.name,
    required this.shortName,
    required this.tla,
    required this.crest,
  });

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      id: json['id'],
      name: json['name'],
      shortName: json['shortName'],
      tla: json['tla'],
      crest: json['crest'],
    );
  }
}

//referee model

class Referee {
  final int id;
  final String name;
  final String type;
  final String nationality;

  Referee({
    required this.id,
    required this.name,
    required this.type,
    required this.nationality,
  });

  factory Referee.fromJson(Map<String, dynamic> json) {
    return Referee(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      nationality: json['nationality'],
    );
  }
}

//match model compile all model in this as this is main and also create list of this to display

class MatchA {
  final Area area;
  final Competition competition;
  final Season season;
  final int id;
  final String utcDate;
  final String status;
  final int matchday;
  final String stage;
  final String group;
  final String lastUpdated;
  final Team homeTeam; //both of team imp
  final Team awayTeam;
  final Score score;
  final Map<String, dynamic>
      odds; // Handle this field appropriately based on its structure
  final List<Referee> referees;
  MatchA({
    required this.area,
    required this.competition,
    required this.season,
    required this.id,
    required this.utcDate,
    required this.status,
    required this.matchday,
    required this.stage,
    required this.group,
    required this.lastUpdated,
    required this.homeTeam,
    required this.awayTeam,
    required this.score,
    required this.odds,
    required this.referees,
  });
  factory MatchA.fromJson(Map<String, dynamic> json) {
    //call for nested json data then return
    var areaJson = json['area'];
    var competitionJson = json['competition'];
    var seasonJson = json['season'];
    var homeTeamJson = json['homeTeam'];
    var awayTeamJson = json['awayTeam'];
    var scoreJson = json['score'];
    var oddsJson = json['odds'];
    var refereesJson = json['referees'] as List;

    return MatchA(
      area: Area.fromJson(areaJson),
      competition: Competition.fromJson(competitionJson),
      season: Season.fromJson(seasonJson),
      id: json['id'],
      utcDate: json['utcDate'],
      status: json['status'],
      matchday: json['matchday'],
      stage: json['stage'],
      group: json['group'],
      lastUpdated: json['lastUpdated'],
      homeTeam: Team.fromJson(homeTeamJson),
      awayTeam: Team.fromJson(awayTeamJson),
      score: Score.fromJson(scoreJson),
      odds: oddsJson, // Handle this field appropriately based on its structure
      referees:
          refereesJson.map((referee) => Referee.fromJson(referee)).toList(),
    );
  }
}

// filters_model.dart

class Filters {
  final Map<String, dynamic> season;
  final List<String> status;

  Filters({
    required this.season,
    required this.status,
  });

  factory Filters.fromJson(Map<String, dynamic> json) {
    var seasonJson = json['season'];

    return Filters(
      season: seasonJson,
      status: List<String>.from(json['status']),
    );
  }
}

// resultset_model.dart

class ResultSet {
  final int count;
  final String first;
  final String last;
  final int played;

  ResultSet({
    required this.count,
    required this.first,
    required this.last,
    required this.played,
  });

  factory ResultSet.fromJson(Map<String, dynamic> json) {
    return ResultSet(
      count: json['count'],
      first: json['first'],
      last: json['last'],
      played: json['played'],
    );
  }
}
