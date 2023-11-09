import 'package:flutter/material.dart';

import '../common/colors.dart';
import '../common/sort_type.dart';

class SortButtonWidget extends StatelessWidget {
  const SortButtonWidget({
    super.key,
    required VoidCallback onTap,
    required SortType sortType,
  })  : _sortType = sortType,
        _onTap = onTap;

  final VoidCallback _onTap;
  final SortType _sortType;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(6),
        ),
        child: GestureDetector(
          onTap: _onTap,
          child: Stack(
            alignment: Alignment.center,
            children: [
              const Icon(
                Icons.sort_rounded,
                color: lightGrey,
              ),
              if (_sortType != SortType.unsorted)
                const Positioned(
                  right: 4,
                  bottom: 4,
                  child: Icon(
                    Icons.circle,
                    color: lightGreen,
                    size: 8,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
