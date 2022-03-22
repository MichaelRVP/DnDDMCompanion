import 'package:dnddmcompanion/models/attribute.dart';

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

  Character({
    this.firstName = '',
    this.lastName = '',
    this.strength = 0,
    this.dexterity = 0,
    this.constitution = 0,
    this.intelligence = 0,
    this.wisdom = 0,
    this.charisma = 0,
    this.vision = 0,
    this.speed = 0,
    this.initiative = 0,
    this.armorClass = 0,
    this.icon,
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
        vision: 60,
        wisdom: 12,
        icon: 'images/playerIcons/player3.png');
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
}
