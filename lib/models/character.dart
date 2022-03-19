import 'package:flutter/material.dart';

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
  AssetImage? icon;

  Character({
    required this.firstName,
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
}
