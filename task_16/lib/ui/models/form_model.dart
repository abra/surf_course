import 'package:flutter/foundation.dart';

import '/data/pet_type.dart';
import '/data/vaccine_type.dart';

class FormModel with ChangeNotifier {
  final Map<int, bool> formData = {};
  final List<VaccineType> vaccines = [];
  int? hashCodeToRemove;
  bool isSubmitted = false;
  bool _isReadyForSubmit = false;

  void addData(int key, bool value) {
    formData[key] = value;
    isReadyForSubmit = !formData.values.contains(false);
    notifyListeners();
  }

  void removeData(int key) {
    if (formData.containsKey(key)) {
      formData.remove(key);
    }
    isReadyForSubmit = !formData.values.contains(false);
    notifyListeners();
  }

  set isReadyForSubmit(bool value) {
    _isReadyForSubmit = value;
    notifyListeners();
  }

  bool get isReadyForSubmit {
    return _isReadyForSubmit;
  }

  set formSubmitted(bool value) {
    isSubmitted = value;
    notifyListeners();
  }

  bool get formSubmitted {
    return isSubmitted;
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
