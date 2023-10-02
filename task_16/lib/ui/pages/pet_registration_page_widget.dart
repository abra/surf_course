import 'package:flutter/material.dart';

import '../components/pet_type_icon_widget.dart';

class PetRegistrationPageWidget extends StatefulWidget {
  const PetRegistrationPageWidget({super.key});

  @override
  State<PetRegistrationPageWidget> createState() =>
      _PetRegistrationPageWidgetState();
}

class _PetRegistrationPageWidgetState extends State<PetRegistrationPageWidget> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 18, right: 18, top: 120),
      child: SizedBox(
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 100,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    PetTypeIconWidget(
                      petSvgIcon: 'assets/images/svg/dog.svg',
                      petType: 'Собака',
                      isSelected: true,
                    ),
                    PetTypeIconWidget(
                      petSvgIcon: 'assets/images/svg/cat.svg',
                      petType: 'Кот',
                      isSelected: false,
                    ),
                    PetTypeIconWidget(
                      petSvgIcon: 'assets/images/svg/parrot.svg',
                      petType: 'Попугай',
                      isSelected: false,
                    ),
                    PetTypeIconWidget(
                      petSvgIcon: 'assets/images/svg/hamster.svg',
                      petType: 'Хомяк',
                      isSelected: false,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
