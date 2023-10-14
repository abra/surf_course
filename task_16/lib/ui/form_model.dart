import 'package:flutter/foundation.dart';

import '/data/pet_type.dart';
import '/data/vaccine_type.dart';

class FormModel with ChangeNotifier {
  final Map<int, bool> formData = {};
  final List<VaccineType> vaccines = [];
  int? hashCodeToRemove;

  void addData(int key, bool value) {
    formData[key] = value;
    notifyListeners();
  }

  void removeData(int key) {
    if (formData.containsKey(key)) {
      formData.remove(key);
    }
    notifyListeners();
  }

  bool get isReadyForSubmit {
    if (formData.isEmpty) {
      return false;
    }
    return !formData.values.contains(false);
  }

  void toggleVaccination(VaccineType vaccineType) {
    if (vaccines.contains(vaccineType)) {
      vaccines.remove(vaccineType);
    } else {
      vaccines.add(vaccineType);
    }
    notifyListeners();
  }

  void clearVaccinations(PetType petType) {
    if (petType == PetType.dog || petType == PetType.cat) {
      vaccines.clear();
    }
    notifyListeners();
  }

  bool isVaccinated(VaccineType vaccineType) {
    return vaccines.contains(vaccineType);
  }

  @override
  void dispose() {
    formData.clear();
    vaccines.clear();
    super.dispose();
  }
}
