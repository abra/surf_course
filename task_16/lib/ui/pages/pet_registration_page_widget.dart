import 'package:flutter/material.dart';

import '../components/pet_icon_radio_widget.dart';
import '../components/pet_text_field_widget.dart';
import '../themes/app_colors.dart';

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
  PetType? _petType;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 70),
        child: SizedBox(
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PetType.dog,
                    PetType.cat,
                    PetType.parrot,
                    PetType.hamster,
                  ].map((petType) {
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
                const SizedBox(
                  height: 24,
                  width: double.infinity,
                ),
                const SizedBox(height: 16),
                PetTextFieldWidget(
                  label: 'Имя питомца',
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    value = value!.trim();
                    if (value.isEmpty ||
                        value.length < 3 ||
                        value.length >= 20) {
                      return 'Укажите имя питомца от 3 до 20 символов';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                PetTextFieldWidget(
                  label: 'День рождения питомца',
                  keyboardType: TextInputType.datetime,
                  validator: (value) {
                    if (value != null) {
                      final datePattern = RegExp(r'^\d{2}\.\d{2}\.\d{4}$');
                      if (datePattern.hasMatch(value)) {
                        return null;
                      } else {
                        return 'Укажите дату рождения питомца';
                      }
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                PetTextFieldWidget(
                  label: 'Вес, кг',
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    value = value?.trim() ?? '';
                    final number = double.tryParse(value) ?? 0;
                    if (number <= 0) {
                      return 'Укажите вес, больше 0 кг';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                PetTextFieldWidget(
                  label: 'Почта хозяина',
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value != null) {
                      final emailAddressPattern =
                          RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                      if (emailAddressPattern.hasMatch(value)) {
                        return null;
                      } else {
                        return 'Укажите почту хозяина';
                      }
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate() && _petType != null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Питомец добавлен',
                          ),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: AppColors.red,
                          content: Text(
                            'Питомец не добавлен',
                          ),
                        ),
                      );
                    }
                  },
                  child: const Text(
                    'Добавить',
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
