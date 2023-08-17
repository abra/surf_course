void main() {
  final player1 = Player(30, 'Michael', 'Jordan', Role.pointGuard, 62, 30.1);
  final player2 = Player(30, 'Dennis', 'Rodman', Role.powerForward, 57, 20.8);
  final player3 = Player(30, 'Scottie', 'Pippen', Role.pointGuard, 63, 10.4);
  final coach = Coach(55, 'Phil', 'Jackson', 3);
  final team = Team(
    teamName: 'Chicago Bulls',
    players: [player1, player2, player3],
    coach: coach,
  );
  print(team);
}

abstract class Person {
  int age;
  String firstName;
  String lastName;

  Person(this.age, this.firstName, this.lastName);

  @override
  String toString() {
    return 'Имя: $firstName $lastName, Возраст: $age';
  }
}

class Team {
  String teamName;
  List<Player> players;
  Coach coach;

  Team({
    required this.teamName,
    required this.players,
    required this.coach,
  });

  @override
  String toString() {
    String info = 'Команда: $teamName\n';
    info += 'Тренер: $coach\n';
    info += 'Игроки:\n${players.join("\n")}';
    return info;
  }
}

enum Role {
  pointGuard,
  shootingGuard,
  center,
  powerForward,
  smallForward,
}

class Player extends Person {
  Role role;
  int gamesPlayed;
  double averagePoints;

  Player(
    int age,
    String firstName,
    String lastName,
    this.role,
    this.gamesPlayed,
    this.averagePoints,
  ) : super(age, firstName, lastName);

  @override
  String toString() {
    return '${super.toString()}, Роль: $role, Среднее кол-во очков: $averagePoints, Сыграно матчей: $gamesPlayed';
  }
}

class Coach extends Person {
  int trophiesWon;

  Coach(
    int age,
    String firstName,
    String lastName,
    this.trophiesWon,
  ) : super(age, firstName, lastName);

  @override
  String toString() {
    return '${super.toString()}, Выиграно трофеев: $trophiesWon';
  }
}
