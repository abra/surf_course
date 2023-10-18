import '/data/pet_type.dart';

extension PetTypeExt on PetType {
  bool get isCatOrDog {
    return this == PetType.dog || this == PetType.cat;
  }
}
