enum VaccineType {
  rabies('бешенства'),
  covid('ковида'),
  malaria('малярии');

  const VaccineType(this.label);

  final String label;
}
