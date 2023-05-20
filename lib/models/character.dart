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

  Character shannon() {
    return Character(
        firstName: 'Evelyna',
        icon: 'assets/images/playerIcons/shannon_export.png');
  }

  Character tori() {
    return Character(
        firstName: 'Yuzo', icon: 'assets/images/playerIcons/tori_export.png');
  }

  Character jackson() {
    return Character(
        firstName: 'Ilofyr',
        icon: 'assets/images/playerIcons/jackson_export.png');
  }

  Character thomas() {
    return Character(
        firstName: 'Cain', icon: 'assets/images/playerIcons/thomas_export.png');
  }

  Character jillian() {
    return Character(
        firstName: 'jillian',
        icon: 'assets/images/playerIcons/jillian_export.png');
  }

  Character box() {
    return Character(
        firstName: 'Cain', icon: 'assets/images/playerIcons/black_box.png');
  }

  Character goodDwarf() {
    return Character(
        firstName: 'DwarfGood',
        icon: 'assets/images/enemyIcons/rock_dwarf_recluse_good.png');
  }

  Character badDwarf() {
    return Character(
        firstName: 'DwarfBad',
        icon: 'assets/images/enemyIcons/rock_dwarf_recluse_bad.png');
  }

  Character kingDwarf() {
    return Character(
        firstName: 'DwarfKing',
        icon: 'assets/images/enemyIcons/rock_dwarf_recluse_king.png');
  }

  Character mimicDwarf() {
    return Character(
        firstName: 'Mimic',
        icon: 'assets/images/enemyIcons/rock_dwarf_recluse_mimic.png');
  }

  Character barrelCrab() {
    return Character(
        firstName: 'BarrelCrab',
        icon: 'assets/images/enemyIcons/barrel_crab.png');
  }

  Character bandit() {
    return Character(
        firstName: 'Bandit', icon: 'assets/images/enemyIcons/bandit_1.png');
  }

  Character direWolf() {
    return Character(
        firstName: 'Dire Wolf', icon: 'assets/images/enemyIcons/dire_wolf.png');
  }

  Character archer() {
    return Character(
        firstName: 'archer', icon: 'assets/images/enemyIcons/archer.png');
  }

  Character general() {
    return Character(
        firstName: 'general', icon: 'assets/images/enemyIcons/general.png');
  }

  Character kingsKnight() {
    return Character(
        firstName: 'King Knight',
        icon: 'assets/images/enemyIcons/kings-knight.png');
  }

  Character knight() {
    return Character(
        firstName: 'Knight', icon: 'assets/images/enemyIcons/knight.png');
  }

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

  bool isInSight(
      int inputX, int inputY, Map<int, bool> wallMap, double totalWidth) {
    final int visionRadius = vision ~/ 5;
    final Coordinate originCord = Coordinate(x: xCord, y: yCord);
    final Coordinate checkCord = Coordinate(x: inputX, y: inputY);

    //get full possible vision box
    List<Coordinate> visionSquare = [];

    for (int xI = 0; xI < (visionRadius * 2); xI++) {
      for (int yI = 0; yI < (visionRadius * 2); yI++) {
        visionSquare.add(Coordinate(
            x: ((originCord.x - visionRadius) + xI).toInt(),
            y: ((originCord.y - visionRadius) + yI).toInt()));
      }
    }

    //get vision circle
    List<Coordinate> visionCircle = [];

    for (final Coordinate cord in visionSquare) {
      final int xSquared = (cord.x - originCord.x) * (cord.x - originCord.x);
      final int ySquared = (cord.y - originCord.y) * (cord.y - originCord.y);
      final int totalSquared = (xSquared + ySquared);
      final double totalRooted = sqrt(totalSquared);
      if (totalRooted <= visionRadius) {
        visionCircle.add(Coordinate(x: cord.x, y: cord.y));
      }
    }

    List<Coordinate> areaVision = [];

    Map<Coordinate, bool> wallMapCoordinate = wallMap.map((index, wallBool) {
      int mapXCord = (index % totalWidth).round();
      int mapYCord = -(index ~/ totalWidth);

      return MapEntry(Coordinate(x: mapXCord, y: mapYCord), wallBool);
    });

    //get all cords between origin and coord
    List<Coordinate> cordList = [];

    for (final Coordinate coord in visionCircle) {
      //get disance between origin and input
      int xSquared = (coord.x - originCord.x) * (coord.x - originCord.x);
      int ySquared = (coord.y - originCord.y) * (coord.y - originCord.y);
      int totalSquared = (xSquared + ySquared);
      int distance = int.parse(sqrt(totalSquared).ceil().toStringAsFixed(0));

      int distanceIterator = distance * 2;
      double xValueIterator = (coord.x - originCord.x) / distanceIterator;
      double yValueIterator = (coord.y - originCord.y) / distanceIterator;

      //first loop for centered view coords
      for (double i = 0; i <= distanceIterator; i = i + 1) {
        Coordinate iteratedCoord = Coordinate(
            x: (originCord.x + (xValueIterator * i)).round(),
            y: (originCord.y + (yValueIterator * i)).round());

        //if any cords are in wall map coords then break
        if (wallMapCoordinate.containsKey(iteratedCoord)) {
          if (wallMapCoordinate[iteratedCoord] == true) {
            break;
          }
        }

        cordList.add(iteratedCoord);
      }

      //second loop for biangulation coords
      for (double i = 0; i <= distanceIterator; i = i + 1) {
        Coordinate iteratedCoord = Coordinate(
            x: ((originCord.x + .5) + (xValueIterator * i)).round(),
            y: ((originCord.y - .5) + (yValueIterator * i)).round());

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
