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
      final int visionSqured = (visionRadius * visionRadius).toInt();
      if (xSquared + ySquared <= visionSqured) {
        visionCircle.add(Coordinate(x: cord.x, y: cord.y));
      }
    }

    //get vision map minus wall blockage

    List<Coordinate> visionVectorList = [];

    List<Coordinate> areaVision = [];

    if (const Coordinate(x: 3, y: 29).compareCords(checkCord)) {
      print('here');
      //print("${cord.y} == $mxplusb");
    }

    //get line fomula for origin to input cord
    //can't divide by zero
    if ((originCord.x - checkCord.x) != 0) {
      double m = ((originCord.y - checkCord.y) / (originCord.x - checkCord.x))
          .roundToDouble();
      double b = (checkCord.y - (m * checkCord.x)).roundToDouble();

      //get all coords in the line of vision

      for (final Coordinate cord in visionCircle) {
        int mxplusb = ((m * cord.x) + b).round();

        //if it is an equality then add to the vector
        if (cord.y == mxplusb) {
          visionVectorList.addAll([Coordinate(x: cord.x, y: cord.y)]);
        }
      }
    } else {
      //this will give all cords above and below you
      for (final Coordinate cord in visionCircle) {
        if (cord.x == originCord.x) {
          visionVectorList.addAll([Coordinate(x: cord.x, y: cord.y)]);
        }
      }
    }

    //travel through vision vector till obstruction (origin is current coords)
    bool wall1 = false;
    bool wall2 = false;

    Map<Coordinate, bool> wallMapCoordinate = wallMap.map((index, wallBool) {
      int mapXCord = (index % totalWidth).round();
      int mapYCord = index ~/ totalWidth;

      return MapEntry(Coordinate(x: mapXCord, y: mapYCord), wallBool);
    });

    //check from mid to last
    for (final Coordinate cord in visionVectorList) {
      //if you pass origin stop checking
      if (cord.x < originCord.x) {
        continue;
      }

      if (cord.x == originCord.x && cord.y <= originCord.y) {
        continue;
      }

      ///looks through the wall map and makes buffer removal true which
      ///will make the loop break thus cutting off vision
      wallMapCoordinate.entries.firstWhere(
        (MapEntry<Coordinate, bool> element) {
          if (cord.compareCords(element.key)) {
            if (element.value) {
              wall1 = true;
              return true;
            } else {
              return false;
            }
          } else {
            return false;
          }
        },
        orElse: () => const MapEntry(Coordinate(x: 99999, y: 99999), false),
      );

      //if wall value is true don't add in buffer list
      if (wall1) {
        break;
      } else {
        areaVision.add(cord);
      }
    }

    //check from first to mid (via reversed list)
    for (final Coordinate cord in visionVectorList.reversed) {
      //if you pass origin stop checking
      if (cord.x > originCord.x) {
        continue;
      }

      if (cord.x == originCord.x && cord.y >= originCord.y) {
        continue;
      }

      ///looks through the wall map and makes buffer removal true which
      ///will make the loop break thus cutting off vision
      wallMapCoordinate.entries.firstWhere(
        (MapEntry<Coordinate, bool> element) {
          if (cord.compareCords(element.key)) {
            if (element.value) {
              wall2 = true;
              return true;
            } else {
              return false;
            }
          } else {
            return false;
          }
        },
        orElse: () => const MapEntry(Coordinate(x: 99999, y: 99999), false),
      );

      //if wall value is true don't add in buffer list
      if (wall2) {
        break;
      } else {
        areaVision.add(cord);
      }
    }

    //if the either buffer vision is true and it contains this cord
    // if (bufferRemoval1) {
    //   for (final Coordinate cord in bufferVision1) {
    //     visionCircle.removeWhere((element) => cord.compareCords(element));
    //   }
    // }

    // if (bufferRemoval2) {
    //   for (final Coordinate cord in bufferVision2) {
    //     visionCircle.removeWhere((element) => cord.compareCords(element));
    //   }
    // }

    int index = areaVision.indexWhere((element) =>
        Coordinate(x: checkCord.x, y: checkCord.y).compareCords(element));

    if (index != -1) {
      return true;
    } else {
      return false;
    }
  }
}
