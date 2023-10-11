import '/data/pet_type.dart';

extension DateTimeExt on DateTime {
  bool get isToday {
    final now = DateTime.now();
    return now.day == day && now.month == month && now.year == year;
  }
}

extension PetTypeExt on PetType {
  bool get isCatOrDog {
    return this == PetType.dog || this == PetType.cat;
  }
}
