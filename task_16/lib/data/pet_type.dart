enum PetType {
  dog('Собака', 'assets/images/svg/dog.svg'),
  cat('Кошка', 'assets/images/svg/cat.svg'),
  parrot('Попугай', 'assets/images/svg/parrot.svg'),
  hamster('Хомяк', 'assets/images/svg/hamster.svg');

  const PetType(this.petName, this.petSvgIcon);

  final String petName;
  final String petSvgIcon;
}
