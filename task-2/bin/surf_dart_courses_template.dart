void main(List<String> args) {
  final electricToyota = ElecticToyota();
  print(electricToyota);

  final polo = VolkswagenPolo();
  print(polo);

  final fuelStation = FuelStation();
  fuelStation.fuelGasolineCar(polo, 100);

  final charger = Charger();
  charger.chargeElectricCar(electricToyota);
}

class Car {
  /// Название модели авто
  final String model;

  /// Год выпуска
  final int year;

  /// Цвет кузова
  String color;

  /// Пробег
  int run;

  /// Кол-во колес
  static const int wheelsQty = 4;

  /// Используемые шины
  final List<Wheel> wheels;

  Car({
    required this.model,
    required this.year,
    required this.wheels,
    this.color = 'white',
    this.run = 0,
  });

  Car.withOptional({
    this.model = 'Unknown',
    this.year = 2000,
    this.wheels = const [],
    this.color = 'white',
    this.run = 0,
  });

  void drive(int kilometers) {
    run = run + kilometers;
  }

  void paint(String newColor) {
    color = newColor;
  }

  @override
  String toString() {
    return '''
Model: ${this.model}
Color: ${this.color}
Year: ${this.year}
Run: ${this.run}
Wheels: ${this.wheels.toList().toString()}''';
  }
}

class Wheel {
  final String brand;
  final int diameter;
  final int tireWidth;
  final int profileThickness;
  final int loadIndex;

  const Wheel({
    required this.brand,
    required this.diameter,
    required this.tireWidth,
    required this.profileThickness,
    required this.loadIndex,
  });

  @override
  String toString() {
    return 'Wheel($brand, $diameter, $tireWidth, $profileThickness, $loadIndex)';
  }
}

abstract interface class VehicleBattery {
  void chargeBattery();
}

abstract interface class VehicleGasoline {
  void fillFuel(int litres);
}

class ElecticToyota extends Car implements VehicleBattery {
  ElecticToyota({
    super.model = 'Toyota E-Road',
    super.year = 2020,
    super.run = 9,
    super.color = 'Yellow',
  }) : super(
          wheels: List.generate(
            4,
            (_) => Wheel(
              brand: 'Hakkapellita',
              diameter: 17,
              tireWidth: 195,
              profileThickness: 50,
              loadIndex: 91,
            ),
          ),
        );

  @override
  void chargeBattery() {
    print('charging...');
  }
}

class VolkswagenPolo extends Car implements VehicleGasoline {
  VolkswagenPolo({
    super.model = 'Volkswagen Polo',
    super.year = 2001,
    super.color = 'Black',
  }) : super(
          wheels: List.generate(
            4,
            (_) => Wheel(
              brand: 'Michelin',
              diameter: 16,
              tireWidth: 180,
              profileThickness: 40,
              loadIndex: 80,
            ),
          ),
        );

  @override
  void fillFuel(int litres) {
    print('filling the tank with $litres litres');
  }
}

class FuelStation {
  void fuelGasolineCar(VehicleGasoline car, int litres) {
    print('> Fueling car \n$car');
    car.fillFuel(litres);
  }
}

class Charger {
  void chargeElectricCar(VehicleBattery car) {
    print('> Charging car \n$car');
    car.chargeBattery();
  }
}
