import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/common/extensions.dart';
import '/data/pet_type.dart';
import '/data/vaccine_type.dart';
import '/ui/components/icon_radio_widget.dart';
import '/ui/components/pet_registration_form/checkbox_form_field_widget.dart';
import '/ui/components/pet_registration_form/form_fields.dart';
import '/ui/components/pet_registration_form/submit_form_button_widget.dart';
import '/ui/models/form_model.dart';

class PetRegistrationPageWidget extends StatefulWidget {
  const PetRegistrationPageWidget({super.key});

  @override
  State<PetRegistrationPageWidget> createState() =>
      _PetRegistrationPageWidgetState();
}

class _PetRegistrationPageWidgetState extends State<PetRegistrationPageWidget> {
  final _formKey = GlobalKey<FormState>();
  final double _topPadding = 84;

  PetType _petType = PetType.values.first;

  @override
  Widget build(BuildContext context) {
    final formModel = context.watch<FormModel>();

    return Form(
      key: _formKey,
      child: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          padding: EdgeInsets.only(
            left: 24,
            right: 24,
            top: _topPadding,
          ),
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
                          formModel.clearVaccinations(petType);
                          setState(() {
                            _petType = value;
                          });
                        },
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 24),
                  const TextFormFieldWidget(label: 'Имя питомца'),
                  const SizedBox(height: 16),
                  const DateFormFieldWidget(label: 'День рождения питомца'),
                  const SizedBox(height: 16),
                  const NumberFormFieldWidget(label: 'Вес, кг'),
                  const SizedBox(height: 16),
                  const EmailFormFieldWidget(label: 'Почта хозяина'),
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
                                isVaccinated: formModel.isVaccinated(
                                  vaccineType,
                                ),
                                onChanged: (value) {
                                  if (value != null) {
                                    formModel.toggleVaccination(vaccineType);
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
                    padding: const EdgeInsets.only(bottom: 34),
                    child: SubmitFormButtonWidget(
                      formKey: _formKey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
