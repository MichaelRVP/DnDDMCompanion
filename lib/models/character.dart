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
        icon: 'assets/images/playerIcons/player3.png');
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

    //get full possible vision box
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

    for (final Coordinate cord in visionSquare) {
      final int xSquared = (cord.x - xCord) * (cord.x - xCord);
      final int ySquared = (cord.y - yCord) * (cord.y - yCord);
      final int visionSqured = (visionRadius * visionRadius).toInt();
      if (xSquared + ySquared <= visionSqured) {
        visionCircle.add(Coordinate(x: cord.x, y: cord.y));
      }
    }

    //get vision map minus wall blockage
    //get line fomula for origin to input cord
    double m = (inputX - xCord) / (inputY - yCord);
    double b = (inputY - (m * inputX));

    //get all coords in the line of vision
    List<Coordinate> visionVectorList = [];

    for (final Coordinate cord in visionCircle) {
      //if it is an equality then add to the vector
      if (cord.y == (m * cord.x) + b) {
        visionVectorList.add(Coordinate(x: cord.x, y: cord.y));
      }
    }

    //travel through vision vector till obstruction (origin is current coords)
    List<Coordinate> bufferVision1 = [];
    List<Coordinate> bufferVision2 = [];
    bool bufferRemoval1 = false;
    bool bufferRemoval2 = false;

    Map<Coordinate, bool> wallMapCoordinate = wallMap.map((index, wallBool) {
      double xCord = index % totalWidth;
      int yCord = index ~/ totalWidth;

      return MapEntry(Coordinate(x: xCord.toInt(), y: yCord), wallBool);
    });

    //check from first to last
    for (final Coordinate cord in visionVectorList) {
      //if you pass origin stop checking
      if (cord.x >= xCord && cord.y >= yCord) {
        break;
      }

      //if there is a wall in the vector make buffere removal true
      //if not just add in the bufer vision
      if (cord.x == 6) {
        print(cord.y);
        if (cord.y == 31) {
          print('here');
        }
        print('here');
      }

      Coordinate wallCord = wallMapCoordinate.keys.firstWhere(
        (element) => element.x == cord.x && element.y == cord.y,
        orElse: () => const Coordinate(x: 9999, y: 9999),
      );

      var wallValue = wallMapCoordinate.values;

      if (wallCord.x != 9999 && wallCord.y != 9999) {
        //if wall value is true don't add in buffer list
        print(wallMapCoordinate[cord]);
        if (wallMapCoordinate[cord]!) {
          bufferRemoval1 = true;
          break;
        } else {
          bufferVision1.add(cord);
        }
      } else {
        bufferVision1.add(cord);
      }
    }

    //check from last to first
    for (final Coordinate cord in visionVectorList.reversed) {
      //if you pass origin stop checking
      if (cord.x <= xCord && cord.y <= yCord) {
        break;
      }

      //if there is a wall in the vector make buffere removal true
      //if not just add in the bufer vision
      if (wallMapCoordinate.containsKey(cord)) {
        //if wall value is true don't add in buffer list
        if (wallMapCoordinate[cord]!) {
          bufferRemoval2 = true;
          break;
        } else {
          bufferVision2.add(cord);
        }
      } else {
        bufferVision2.add(cord);
      }
    }

    //if the either buffer vision is true and it contains this cord
    if (bufferRemoval1) {
      for (final Coordinate cord in bufferVision1) {
        visionCircle.removeWhere((element) => element == cord);
      }
    }

    if (bufferRemoval2) {
      for (final Coordinate cord in bufferVision2) {
        visionCircle.removeWhere((element) => element == cord);
      }
    }

    int index = visionCircle
        .indexWhere((element) => element.x == inputX && element.y == inputY);

    if (index != -1) {
      return true;
    } else {
      return false;
    }
  }
}
