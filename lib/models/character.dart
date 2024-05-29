class Character {
  String firstName;
  String lastName;
  int strength;
  int dexterity;
  int constitution;
  int intelligence;
  int wisdom;
  int charisma;
  int vision;
  int speed;
  int initiative;
  int armorClass;
  String? iconLocation;
  int xCord;
  int yCord;
  int id;

  Character({
    this.firstName = '',
    this.lastName = '',
    this.strength = 0,
    this.dexterity = 0,
    this.constitution = 0,
    this.intelligence = 0,
    this.wisdom = 0,
    this.charisma = 0,
    this.vision = 30,
    this.speed = 0,
    this.initiative = 0,
    this.armorClass = 0,
    this.iconLocation,
    this.xCord = 0,
    this.yCord = 0,
    this.id = 0,
  });

  //copy with
  Character copyWith({
    String? firstName,
    String? lastName,
    int? strength,
    int? dexterity,
    int? constitution,
    int? intelligence,
    int? wisdom,
    int? charisma,
    int? vision,
    int? speed,
    int? initiative,
    int? armorClass,
    String? iconLocation,
    int? xCord,
    int? yCord,
    int? id,
  }) {
    return Character(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      strength: strength ?? this.strength,
      dexterity: dexterity ?? this.dexterity,
      constitution: constitution ?? this.constitution,
      intelligence: intelligence ?? this.intelligence,
      wisdom: wisdom ?? this.wisdom,
      charisma: charisma ?? this.charisma,
      vision: vision ?? this.vision,
      speed: speed ?? this.speed,
      initiative: initiative ?? this.initiative,
      armorClass: armorClass ?? this.armorClass,
      iconLocation: iconLocation ?? this.iconLocation,
      xCord: xCord ?? this.xCord,
      yCord: yCord ?? this.yCord,
      id: id ?? this.id,
    );
  }

  Character defaultCharacter() {
    return Character(
      firstName: 'test',
      lastName: 'character',
      strength: 10,
      armorClass: 14,
      charisma: 8,
      constitution: 12,
      dexterity: 10,
      initiative: 0,
      intelligence: 14,
      speed: 30,
      vision: 30,
      wisdom: 12,
      iconLocation: 'assets/images/playerIcons/player1.png',
      xCord: 0,
      yCord: 0,
      id: 0,
    );
  }

  Character decouple(Character inputCharacter) {
    return Character(
      firstName: inputCharacter.firstName,
      lastName: inputCharacter.lastName,
      strength: inputCharacter.strength,
      armorClass: inputCharacter.armorClass,
      charisma: inputCharacter.charisma,
      constitution: inputCharacter.constitution,
      dexterity: inputCharacter.dexterity,
      initiative: inputCharacter.initiative,
      intelligence: inputCharacter.intelligence,
      speed: inputCharacter.speed,
      vision: inputCharacter.vision,
      wisdom: inputCharacter.wisdom,
      iconLocation: inputCharacter.iconLocation,
      xCord: inputCharacter.xCord,
      yCord: inputCharacter.yCord,
      id: inputCharacter.id,
    );
  }

  //to json
  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'strength': strength,
      'dexterity': dexterity,
      'constitution': constitution,
      'intelligence': intelligence,
      'wisdom': wisdom,
      'charisma': charisma,
      'vision': vision,
      'speed': speed,
      'initiative': initiative,
      'armorClass': armorClass,
      'icon': iconLocation,
      'xCord': xCord,
      'yCord': yCord,
      'id': id,
    };
  }

  //from json
  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      firstName: json['firstName'],
      lastName: json['lastName'],
      strength: json['strength'],
      dexterity: json['dexterity'],
      constitution: json['constitution'],
      intelligence: json['intelligence'],
      wisdom: json['wisdom'],
      charisma: json['charisma'],
      vision: json['vision'],
      speed: json['speed'],
      initiative: json['initiative'],
      armorClass: json['armorClass'],
      iconLocation: json['icon'],
      xCord: json['xCord'],
      yCord: json['yCord'],
      id: json['id'],
    );
  }

  Character jillian() {
    return Character(
        firstName: 'Gwenlyn',
        iconLocation: 'assets/images/playerIcons/Gwenlyn.png');
  }

  Character gabby() {
    return Character(
        firstName: 'Elynwe',
        iconLocation: 'assets/images/playerIcons/Elynwe.png');
  }

  Character greg() {
    return Character(
        firstName: 'Valandil',
        iconLocation: 'assets/images/playerIcons/Valandil.png');
  }

  Character thom() {
    return Character(
        firstName: 'Lothren',
        iconLocation: 'assets/images/playerIcons/lothren.png');
  }

  Character james() {
    return Character(
        firstName: 'Todaphel',
        iconLocation: 'assets/images/playerIcons/todaphel.png');
  }

  Character tim() {
    return Character(
        firstName: 'Rory', iconLocation: 'assets/images/playerIcons/rory.png');
  }

  Character npc() {
    return Character(
        firstName: 'NPC', iconLocation: 'assets/images/playerIcons/NPC.png');
  }
}
