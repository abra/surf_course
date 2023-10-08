import 'dart:developer';

import 'package:flutter/material.dart';

import '../components/pet_icon_radio_widget.dart';
import '../components/pet_registration/date_form_field_widget.dart';
import '../components/pet_registration/email_form_field_widget.dart';
import '../components/pet_registration/number_form_field_widget.dart';
import '../components/pet_registration/text_form_field_widget.dart';

enum PetType {
  dog('Собака', 'assets/images/svg/dog.svg'),
  cat('Кошка', 'assets/images/svg/cat.svg'),
  parrot('Попугай', 'assets/images/svg/parrot.svg'),
  hamster('Хомяк', 'assets/images/svg/hamster.svg');

  const PetType(this.petName, this.petSvgIcon);

  final String petName;
  final String petSvgIcon;
}

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
                      return PetIconRadioWidget(
                        value: petType,
                        isSelected: _petType == petType,
                        onChanged: (value) {
                          setState(() {
                            _petType = value;
                          });
                        },
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 24),
                  const TextFormFieldWidget(
                    label: 'Имя питомца',
                  ),
                  const SizedBox(height: 16),
                  const DateFormFieldWidget(
                    label: 'День рождения питомца',
                  ),
                  const SizedBox(height: 16),
                  const NumberFormFieldWidget(
                    label: 'Вес, кг',
                  ),
                  const SizedBox(height: 16),
                  const EmailFormFieldWidget(
                    label: 'Почта хозяина',
                  ),
                  const Spacer(),
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 16,
                      bottom: 24,
                      left: 24,
                      right: 24,
                    ),
                    child: ElevatedButton(
                      key: ValueKey('addPet'),
                      onPressed: null,
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
                      child: Text(
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
