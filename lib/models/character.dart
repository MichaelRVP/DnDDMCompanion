import 'dart:math';

import 'package:dnddmcompanion/models/attribute.dart';
import 'package:dnddmcompanion/models/coordinate.dart';

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
  String? icon;
  int xCord;
  int yCord;

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
    this.icon,
    this.xCord = 0,
    this.yCord = 0,
  });

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
        icon: 'assets/images/playerIcons/player1.png');
  }

  Character decouple(Character inputCharater) {
    return Character(
      firstName: inputCharater.firstName,
      lastName: inputCharater.lastName,
      strength: inputCharater.strength,
      armorClass: inputCharater.armorClass,
      charisma: inputCharater.charisma,
      constitution: inputCharater.constitution,
      dexterity: inputCharater.dexterity,
      initiative: inputCharater.initiative,
      intelligence: inputCharater.intelligence,
      speed: inputCharater.speed,
      vision: inputCharater.vision,
      wisdom: inputCharater.wisdom,
      icon: inputCharater.icon,
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
      'icon': icon,
      'xCord': xCord,
      'yCord': yCord,
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
      icon: json['icon'],
      xCord: json['xCord'],
      yCord: json['yCord'],
    );
  }

  Character jillian() {
    return Character(
        firstName: 'Gwenlyn', icon: 'assets/images/playerIcons/Gwenlyn.png');
  }

  Character gabby() {
    return Character(
        firstName: 'Elynwe', icon: 'assets/images/playerIcons/Elynwe.png');
  }

  Character greg() {
    return Character(
        firstName: 'Valandil', icon: 'assets/images/playerIcons/Valandil.png');
  }

  Character thom() {return Character(
    firstName: 'Lothren', icon: 'assets/images/playerIcons/lothren.png');
  }

  Character james() {return Character(
    firstName: 'Todaphel', icon: 'assets/images/playerIcons/todaphel.png');
  }

  Character tim() {return Character(
    firstName: 'Rory', icon: 'assets/images/playerIcons/rory.png');
  }

  Character bear() {
    return Character(
        firstName: 'Bear', icon: 'assets/images/enemyIcons/bear.png');
  } 

  Character treant() {
    return Character(
        firstName: 'Treant', icon: 'assets/images/enemyIcons/treant.png');
  }

  Character npc() {
    return Character(
        firstName: 'NPC', icon: 'assets/images/playerIcons/NPC.png');
  }

  // Character goodDwarf() {
  //   return Character(
  //       firstName: 'DwarfGood',
  //       icon: 'assets/images/enemyIcons/rock_dwarf_recluse_good.png');
  // }

  // Character badDwarf() {
  //   return Character(
  //       firstName: 'DwarfBad',
  //       icon: 'assets/images/enemyIcons/rock_dwarf_recluse_bad.png');
  // }

  // Character kingDwarf() {
  //   return Character(
  //       firstName: 'DwarfKing',
  //       icon: 'assets/images/enemyIcons/rock_dwarf_recluse_king.png');
  // }

  // Character mimicDwarf() {
  //   return Character(
  //       firstName: 'Mimic',
  //       icon: 'assets/images/enemyIcons/rock_dwarf_recluse_mimic.png');
  // }

  // Character barrelCrab() {
  //   return Character(
  //       firstName: 'BarrelCrab',
  //       icon: 'assets/images/enemyIcons/barrel_crab.png');
  // }

  // Character bandit() {
  //   return Character(
  //       firstName: 'Bandit', icon: 'assets/images/enemyIcons/bandit_1.png');
  // }

  Character direWolf() {
    return Character(
        firstName: 'Dire Wolf', icon: 'assets/images/enemyIcons/dire_wolf.png');
  }

  // Character archer() {
  //   return Character(
  //       firstName: 'archer', icon: 'assets/images/enemyIcons/archer.png');
  // }

  // Character general() {
  //   return Character(
  //       firstName: 'general', icon: 'assets/images/enemyIcons/general.png');
  // }

  // Character kingsKnight() {
  //   return Character(
  //       firstName: 'King Knight',
  //       icon: 'assets/images/enemyIcons/kings-knight.png');
  // }

  // Character knight() {
  //   return Character(
  //       firstName: 'Knight', icon: 'assets/images/enemyIcons/knight.png');
  // }

  List<Attribute> getAttributeList(Character inputCharater) {
    List<Attribute> returnList = [];
    returnList.add(
      Attribute(
        name: 'STR',
        value: inputCharater.strength,
      ),
    );
    returnList.add(
      Attribute(
        name: 'DEX',
        value: inputCharater.dexterity,
      ),
    );
    returnList.add(
      Attribute(
        name: 'CON',
        value: inputCharater.constitution,
      ),
    );
    returnList.add(
      Attribute(
        name: 'INT',
        value: inputCharater.intelligence,
      ),
    );
    returnList.add(
      Attribute(
        name: 'WIS',
        value: inputCharater.wisdom,
      ),
    );
    returnList.add(
      Attribute(
        name: 'CHA',
        value: inputCharater.charisma,
      ),
    );

    return returnList;
  }

  List<Coordinate> visionCircle() {
    final int visionRadius = vision ~/ 5;

    List<Coordinate> visionSquare = [];

    for (int xI = 0; xI < (visionRadius * 2); xI++) {
      for (int yI = 0; yI < (visionRadius * 2); yI++) {
        visionSquare.add(Coordinate(
            x: ((xCord - visionRadius) + xI).toInt(),
            y: ((yCord - visionRadius) + yI).toInt()));
      }
    }

    //get vision circle
    List<Coordinate> visionCircle = [];

    for (final Coordinate coord in visionSquare) {
      //get disance between origin and input
      int xSquared = (coord.x - xCord) * (coord.x - xCord);
      int ySquared = (coord.y - yCord) * (coord.y - yCord);

      double distance = sqrt(xSquared + ySquared);

      if (distance <= visionRadius) {
        visionCircle.add(coord);
      }
    }

    return visionCircle;
  }

  bool isInSight(
      int inputX, int inputY, Map<int, bool> wallMap, double totalWidth) {
    final Coordinate checkCord = Coordinate(x: inputX, y: inputY);

    Map<Coordinate, bool> wallMapCoordinate = wallMap.map((index, wallBool) {
      int mapXCord = (index % totalWidth).round();
      int mapYCord = -(index ~/ totalWidth);

      return MapEntry(Coordinate(x: mapXCord, y: mapYCord), wallBool);
    });

    //get all cords between origin and coord
    List<Coordinate> cordList = [];

    for (final Coordinate coord in visionCircle()) {
      //get disance between origin and input
      int xSquared = (coord.x - xCord) * (coord.x - xCord);
      int ySquared = (coord.y - yCord) * (coord.y - yCord);
      int totalSquared = (xSquared + ySquared);
      int distance = int.parse(sqrt(totalSquared).ceil().toStringAsFixed(0));

      int distanceIterator = distance * 2;
      double xValueIterator = (coord.x - xCord) / distanceIterator;
      double yValueIterator = (coord.y - yCord) / distanceIterator;

      //first loop for centered view coords
      for (double i = 0; i <= distanceIterator; i = i + 1) {
        Coordinate iteratedCoord = Coordinate(
            x: (xCord + (xValueIterator * i)).round(),
            y: (yCord + (yValueIterator * i)).round());

        //if any cords are in wall map coords then break
        if (wallMapCoordinate.containsKey(iteratedCoord)) {
          if (wallMapCoordinate[iteratedCoord] == true) {
            break;
          }
        }

        cordList.add(iteratedCoord);
      }

      //second loop for bi-angulation coords
      for (double i = 0; i <= distanceIterator; i = i + 1) {
        Coordinate iteratedCoord = Coordinate(
            x: ((xCord + .5) + (xValueIterator * i)).round(),
            y: ((yCord - .5) + (yValueIterator * i)).round());

        //if any cords are in wall map coords then break
        if (wallMapCoordinate.containsKey(iteratedCoord)) {
          if (wallMapCoordinate[iteratedCoord] == true) {
            break;
          }
        }

        cordList.add(iteratedCoord);
      }
    }

    int returnIndex = cordList.indexWhere((element) =>
        Coordinate(x: checkCord.x, y: checkCord.y).compareCords(element));

    if (returnIndex != -1) {
      return true;
    } else {
      return false;
    }
  }
}
