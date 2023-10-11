import 'dart:developer';

import 'package:flutter/material.dart';

import '/common/extensions.dart';
import '/data/pet_type.dart';
import '/data/vaccine_type.dart';
import '/ui/components/icon_radio_widget.dart';
import '/ui/components/registration/checkbox_form_field_widget.dart';
import '/ui/components/registration/form_fields.dart';

class PetRegistrationPageWidget extends StatefulWidget {
  const PetRegistrationPageWidget({super.key});

  @override
  State<PetRegistrationPageWidget> createState() =>
      _PetRegistrationPageWidgetState();
}

class _PetRegistrationPageWidgetState extends State<PetRegistrationPageWidget> {
  final _formKey = GlobalKey<FormState>();
  final double _topPadding = 84;
  final List<VaccineType> _vaccines = [];
  PetType _petType = PetType.values.first;

  final _formFields = const <Widget>[
    TextFormFieldWidget(label: 'Имя питомца'),
    SizedBox(height: 16),
    DateFormFieldWidget(label: 'День рождения питомца'),
    SizedBox(height: 16),
    NumberFormFieldWidget(label: 'Вес, кг'),
    SizedBox(height: 16),
    EmailFormFieldWidget(label: 'Почта хозяина'),
  ];

  bool _isVaccinated(VaccineType vaccineType) =>
      _vaccines.contains(vaccineType);

  void _toggleVaccination(VaccineType vaccineType) {
    setState(() {
      _vaccines.contains(vaccineType)
          ? _vaccines.remove(vaccineType)
          : _vaccines.add(vaccineType);
    });
  }

  void _clearVaccinations(PetType petType) {
    if (petType == PetType.dog || petType == PetType.cat) {
      setState(() {
        _vaccines.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          padding: EdgeInsets.only(left: 24, right: 24, top: _topPadding),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight - _topPadding,
            ),
            child: IntrinsicHeight(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: PetType.values.map((petType) {
                      return IconRadioWidget(
                        value: petType,
                        isSelected: _petType == petType,
                        onChanged: (value) {
                          setState(() {
                            _clearVaccinations(petType);
                            _petType = value;
                          });
                        },
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 24),
                  ..._formFields,
                  const SizedBox(height: 24),
                  AnimatedOpacity(
                    opacity: _petType.isCatOrDog ? 1 : 0,
                    duration: const Duration(milliseconds: 300),
                    child: Visibility(
                      visible: _petType.isCatOrDog,
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Сделаны прививки от:',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            const SizedBox(height: 16),
                            ...VaccineType.values.map((vaccineType) {
                              return CheckboxFormFieldWidget(
                                isVaccinated: _isVaccinated(vaccineType),
                                onChanged: (value) {
                                  if (value != null) {
                                    _toggleVaccination(vaccineType);
                                  }
                                },
                                label: vaccineType.label,
                                child: const DateFormFieldWidget(
                                  label: 'Дата последней прививки',
                                ),
                              );
                            }),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 24,
                      left: 24,
                      right: 24,
                    ),
                    child: ElevatedButton(
                      key: const ValueKey('register-pet-button'),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          log('petType: $_petType');
                          log('formKey: ${_formKey.currentState!.validate()}');
                        } else {
                          log('formKey: ${_formKey.currentState!.validate()}');
                        }
                      },
                      // onPressed: () {
                      //   if (_formKey.currentState!.validate()) {
                      //     ScaffoldMessenger.of(context).showSnackBar(
                      //       const SnackBar(
                      //         content: Text(
                      //           'Питомец добавлен',
                      //         ),
                      //       ),
                      //     );
                      //   } else {
                      //     ScaffoldMessenger.of(context).showSnackBar(
                      //       const SnackBar(
                      //         backgroundColor: AppColors.red,
                      //         content: Text(
                      //           'Питомец не добавлен',
                      //         ),
                      //       ),
                      //     );
                      //   }
                      // },
                      child: const Text(
                        'Добавить',
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
